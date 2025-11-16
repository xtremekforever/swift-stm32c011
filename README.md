# Swift Library for STM32C011

This library contains the swift-mmio register definitions and helpers for the STM32C011 along with support files such as the linker scripts, Makefile, and more.

## SVD

This directory also contains `stm32c011.svd.patched`, which is the SVD reference file that was patched
as part of the [stm32-rs](https://stm32-rs.github.io/stm32-rs/) project. Other SVD files can be found
there, but we include only the one for the STM32C011 here.

In order to generate MMIO register block structures from the SVD file, the `SVD2Swift` utility must be used.
This is included as part of the [swift-mmio](https://github.com/apple/swift-mmio) package, and can be
compiled and run as a product of this repo:

```bash
swift build --product SVD2Swift
```

Run the `SVD2Swift` utility as follows to generate new register definitions:

```bash
.build/debug/SVD2Swift \
    --input ./Scripts/stm32c011.svd.patched \
    --output ./Sources/STM32C011/Registers \
    --access-level public
```

A few notes on this:

- This library is built in Swift 6 language mode, so the `Sendable` attribute will need to added to all register definitions to fix compilation errors.
- The `GPIOA`, `GPIOB`, `GPIOC`, `GPIOD`, and `GPIOF` peripherals are identical on the STM32C011 but the SVD2Swift plugin does not pick up on this, so this repo collapses them into a single `GPIO` struct and simply modifies `Device.swift` to point to each GPIOs address using the single struct.
