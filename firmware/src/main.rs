#![no_std]
#![no_main]

use cortex_m;
use cortex_m_rt::entry;
use cortex_m_rt;
use stm32l4xx_hal as hal;

use hal::delay::Delay;

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
    let clocks = rcc.cfgr.hclk(8.mhz()).freeze(&mut flash.acr);

    // Constrain the reset and clock control system. We need to use this to configure the APB/AHB
    // bus for GPIOB.
    let mut gpiob = dp.GPIOB.split(&mut rcc.ahb2);
    let mut led = gpiob.pb2.into_open_drain_output(&mut gpiob.moder, &mut gpiob.otyper);
    let mut bl_control = gpiob.pb0.into_push_pull_output(&mut gpiob.moder, &mut gpiob.otyper);

    bl_control.set_high().unwrap();

    let mut timer = Delay::new(cp.SYST, clocks);
    loop {
        timer.delay_ms(100 as u32);
        led.set_low().unwrap();
        timer.delay_ms(100 as u32);
        led.set_high().unwrap();
    }
}
