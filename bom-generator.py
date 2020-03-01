#!/usr/bin/python3
"""
Automated BOM Generation Tool

Author: Ryan Summers
Date: 11-16-2016

This script will take in a netlists and export it to a CSV file. Mutliples of each netlist can be
specified to order multiple copies of a board.
"""

import argparse
import sys

from bs4 import BeautifulSoup

# Create an empty tuple list for storing components.
bom = {}


def main():
    parser = argparse.ArgumentParser(description='Generate a CSV '
            'Bill-Of-Materials (BOM) from a KiCAD XML netlist.')
    parser.add_argument('netlist', help='The KiCAD netlist in XML format.')
    parser.add_argument('export', help='The file where the BOM should be saved')
    parser.add_argument('--quantity', help='Multiples of the board to order.')
    parser.add_argument('--consolidate', action='store_true')

    args = parser.parse_args()

    if args.quantity:
        multiple = int(args.quantity)
    else:
        multiple = 1

    # Read in the XML file into a BeautifulSoup Python object.
    with open(args.netlist, 'r') as f:
        soup = BeautifulSoup(f)

    # Iterate through each of the components within the XML tree.
    for comp in soup.components.findAll('comp'):

        # Reset variables to ensure that components without listed
        # parameters do not inherit the previous components properties.
        reference = None
        part_number = None
        value = None
        footprint = None

        # Extract the component reference from the XML node.
        try:
            reference = comp['ref']
        except:
            print('FATAL: Failed to extract component reference.')
            sys.exit(-1)

        try:
            for field in comp.fields.findAll('field'):
                if field['name'] == 'Part':
                    part_number = str(field.contents[0])
        except:
            print('WARN: Failed to find part number for component {}'.format(reference))

        try:
            value = comp.value.contents[0]
        except:
            print('WARN: Failed to find value for component {}'.format(reference))
            value = 'Unknown'

        try:
            footprint = comp.footprint.contents[0]
        except:
            print('FATAL: Failed to find footprint for component {}'.format(reference))
            sys.exit(-1)

        if part_number is not None:
            # If the part number already exists, increment the count.
            if part_number in bom:
                bom[part_number]['quantity'] += multiple
                bom[part_number]['references'] += ' ' + str(reference)
            else:
                added = False

                # Search for components with identical value and footprints.
                if args.consolidate:
                    for key in bom:
                        if bom[key]['value'] == value and \
                           bom[key]['value'] != 'Unknown' and \
                           bom[key]['footprint'] == footprint:
                            print('Consolidating {} with part number {}.'.format(reference, key))
                            bom[key]['quantity'] += multiple
                            bom[key]['references'] += ' ' + str(reference)
                            added = True

                # If no identical footprint and part value was found, add a new
                # entry to the BOM.
                if not added:
                    bom[part_number] = {
                        'quantity': multiple,
                        'footprint': str(footprint),
                        'references': str(reference),
                        'value': str(value)}


    output_file_name = args.export + '.csv'
    with open(output_file_name, 'w') as output_file:

        output_file.write('Part Number, Quantity, References\n')
        for part_key in bom:
            output_file.write('{}, {}, {}\n'.format(
                str(part_key),
                int(bom[part_key]['quantity']),
                bom[part_key]['references']))

    print('BOM written to {}'.format(output_file_name))


if __name__ == '__main__':
    main()
