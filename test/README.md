# BrightScript syntax test

This channel is just a test to make sure that the syntax test prepared for SublimeText is actually a valid code
that's accepted on Roku devices.


## Requirements

You'll need a Roku device with developer utils enabled.


## Usage (manual)

Copy `syntax_test_BrightScript.brs` to `source/main.brs`.
Create a ZIP with `manifest` and `source/main.brs` files in it.
Telnet to your Roku device to observe potential error output and then sideload created ZIP to the device.


## Usage (CLI with [roku-dev-container](https://github.com/ahwayakchih/roku-dev-container))

To build and test channel, use following command:

```sh
make
```
