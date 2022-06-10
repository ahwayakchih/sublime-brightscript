## BrightScript syntax for SublimeText 3 and 4

This is reimplementation of BrightScript syntax for [SublimeText](https://www.sublimetext.com/).

It started as a change to syntax file provided by [Roku](https://github.com/rokudev/sublimetext-package),
but after converting format and rewriting whole thing to add some basic, opinionated syntax checking,
not much was left from the original.


## Features

- very basic checks for common mistakes:
	- opinionated: `function` should have return type declared, `sub` cannot
	- inline `functions` and `sub` cannot have names
	- variable name alone in line is an error
- errors are highlighted
- supports new optional chaining operators
- marks syntax with additional (compared to original) Sublimes' classes,
  which enables code folding and other built-in features
- drops support for `bs` file extension, because it was taken by BrighterScript which is not supported (at least for now)


## Installation (manual)

Use menu "Preferences" -> "Browse Packages..." to open packages directory. Enter `User` subdirectory and copy
`BrightScript.sublime-syntax` and `BrightScript_comments.tmPreferences` files there.

If you want to modify the syntax, it might help to also copy `syntax_test_BrightScript.brs` file to the same directory.


## Installation (Package Control)

TODO: make this a proper SublimeText package so it can be installed with Package Control.
