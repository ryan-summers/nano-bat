#![no_std]
#![no_main]

use cortex_m;
use cortex_m_rt::entry;
use stm32l4xx_hal as hal;
use ili9341::{
    Ili9341,
    Orientation,
};
use embedded_graphics::{
    prelude::*,
    image::Image,
};
use hal::delay::Delay;
use tinybmp::Bmp;
use ltc2942;

use embedded_hal::spi::{Mode, Polarity, Phase};

use hal::prelude::*;

// pick a panicking behavior
extern crate panic_halt; // you can put a breakpoint on `rust_begin_unwind` to catch panics
// extern crate panic_abort; // requires nightly
// extern crate panic_itm; // logs messages over ITM; requires ITM support
// extern crate panic_semihosting; // logs messages to the host stderr; requires a debugger

#[entry]
fn main() -> ! {

    let cp = cortex_m::Peripherals::take().unwrap();
    let dp = hal::pac::Peripherals::take().unwrap();

    let mut flash = dp.FLASH.constrain();
    let mut rcc = dp.RCC.constrain();

    // Configure system clocks.
    let clocks = rcc.cfgr.hclk(32.mhz())
        .sysclk(64.mhz())
        .pclk2(32.mhz())
        .freeze(&mut flash.acr);

    // Configure the battery monitor.
    let mut gpioa = dp.GPIOA.split(&mut rcc.ahb2);
    let cc_alcc = gpioa.pa8.into_floating_input(&mut gpioa.moder, &mut gpioa.pupdr);
    let cc_scl = {
        let mut scl = gpioa.pa9.into_open_drain_output(&mut gpioa.moder, &mut gpioa.otyper);
        scl.internal_pull_up(&mut gpioa.pupdr, false);
        scl.into_af4(&mut gpioa.moder, &mut gpioa.afrh)
    };
    let cc_sda = {
        let mut sda = gpioa.pa10.into_open_drain_output(&mut gpioa.moder, &mut gpioa.otyper);
        sda.internal_pull_up(&mut gpioa.pupdr, false);
        sda.into_af4(&mut gpioa.moder, &mut gpioa.afrh)
    };

    let cc_i2c = hal::i2c::I2c::i2c1(
        dp.I2C1,
        (cc_scl, cc_sda),
        100.khz(),
        clocks,
        &mut rcc.apb1r1,
    );

    let mut batt_mon = ltc2942::Ltc2942::new(cc_i2c, cc_alcc).unwrap();

    batt_mon.set_sense_resistance(1f32).unwrap();

    // Constrain the reset and clock control system. We need to use this to configure the APB/AHB
    // bus for GPIOB.
    let mut gpiob = dp.GPIOB.split(&mut rcc.ahb2);
    let mut led = gpiob.pb2.into_open_drain_output(&mut gpiob.moder, &mut gpiob.otyper);
    let mut bl_control = gpiob.pb0.into_push_pull_output(&mut gpiob.moder, &mut gpiob.otyper);
    bl_control.set_high().unwrap();

    // Configure SPI for the TFT-LCD display.
    let tft_spi_sck = gpiob.pb13.into_af5(&mut gpiob.moder, &mut gpiob.afrh);
    let tft_spi_miso = gpiob.pb14.into_af5(&mut gpiob.moder, &mut gpiob.afrh);
    let tft_spi_mosi = gpiob.pb15.into_af5(&mut gpiob.moder, &mut gpiob.afrh);

    let tft_spi = hal::spi::Spi::spi2(
        dp.SPI2,
        (tft_spi_sck, tft_spi_miso, tft_spi_mosi),
        Mode{
            phase: Phase::CaptureOnFirstTransition,
            polarity: Polarity::IdleLow,
        },
        16.mhz(),
        clocks,
        &mut rcc.apb1r1,
    );

    // TODO: User a timer so that clocks are not consumed.
    let mut timer = Delay::new(cp.SYST, clocks);

    // Configure the LCD display.
    let tft_cs_n = gpiob.pb12.into_push_pull_output(&mut gpiob.moder, &mut gpiob.otyper);
    let tft_d_cx_n = gpiob.pb10.into_push_pull_output(&mut gpiob.moder, &mut gpiob.otyper);
    let tft_rst = gpiob.pb11.into_push_pull_output(&mut gpiob.moder, &mut gpiob.otyper);

    let mut display = Ili9341::new_spi(
            tft_spi,
            tft_cs_n,
            tft_d_cx_n,
            tft_rst,
            &mut timer).unwrap();

    display.set_orientation(Orientation::Portrait).unwrap();

    let bmp = Bmp::from_slice(include_bytes!("assets/vertigo-logo.bmp")).unwrap();
    Image::new(&bmp, Point::new(30, 70)).draw(&mut display).unwrap();

    loop {
        timer.delay_ms(100 as u32);
        led.set_low().unwrap();
        timer.delay_ms(100 as u32);
        led.set_high().unwrap();
    }
}
