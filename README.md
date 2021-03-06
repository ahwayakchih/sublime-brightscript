## BrightScript syntax for SublimeText 3 and 4

This is reimplementation of BrightScript syntax for [SublimeText](https://www.sublimetext.com/).

It started as a change to syntax file provided by [Roku](https://github.com/rokudev/sublimetext-package),
but after converting format and rewriting whole thing to add some basic, opinionated syntax checking,
not much was left from the original.

![Screenshot from 2022-06-10 16-25-13](https://user-images.githubusercontent.com/39827/173090357-fe2e4321-58a8-4310-88fd-9408bf507397.png)


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

![Screenshot from 2022-06-10 16-24-37](https://user-images.githubusercontent.com/39827/173090325-18a27a63-c5b9-4586-9084-70d492a61ed1.png)


## Installation (manual)

Use menu "Preferences" -> "Browse Packages..." to open packages directory. Enter `User` subdirectory and copy
`BrightScript.sublime-syntax` and `BrightScript_comments.tmPreferences` files there.

If you want to modify the syntax, it might help to also copy `syntax_test_BrightScript.brs` file to the same directory.


## Installation (Package Control)

TODO: make this a proper SublimeText package so it can be installed with Package Control.
