set mem inaccessible-by-default off
set architecture arm
target extended-remote /dev/ttyS9
monitor swdp_scan
attach 1
load
compare-sections
