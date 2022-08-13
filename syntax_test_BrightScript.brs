' SYNTAX TEST "Packages/User/BrightScript.sublime-syntax"
' ^ comment.line.apostrophe.brightscript
'                                                       ^ comment.line.apostrophe.brightscript
' 
' This is a syntaxt text file, as described at
' https://www.sublimetext.com/docs/syntax.html#testing
' 
' It should also be a valid BrightScript file, that compiles OK when uploaded to Roku device.
' 
' <- source.brightscript

rem Another comment
' <- comment.line.rem.brightscript punctuation.definition.comment.rem.brightscript
'^^ comment.line.rem.brightscript punctuation.definition.comment.rem.brightscript
'                 ^ comment.line.rem.brightscript

' line comment
' <- comment.line.apostrophe.brightscript punctuation.definition.comment.apostrophe.brightscript
'            ^ comment.line.apostrophe.brightscript

#const forceInvalid = false
' <- meta.preprocessor keyword.control.brightscript punctuation.definition.keyword
'^^^^^ meta.preprocessor keyword.control.brightscript
'      ^^^^^^^^^^^^ entity.name.constant
'                   ^ keyword.operator.assignment
'                     ^^^^^ constant.language.brightscript

#if forceInvalid
'<- meta.preprocessor keyword.control punctuation.definition.keyword
'^^ meta.preprocessor keyword.control
'   ^^^^^^^^^^^^ entity.name.constant.brightscript
some invalid stuff
'<- invalid.illegal.non-function-or-comment
#else if false
'<- meta.preprocessor keyword.control punctuation.definition.keyword
'^^^^^^^ meta.preprocessor keyword.control
'        ^^^^^ constant.language.brightscript
this will be ignored too
'<- invalid.illegal.non-function-or-comment
#else
'<- meta.preprocessor keyword.control punctuation.definition.keyword
'^^^^ meta.preprocessor keyword.control

sub simplestSub()
' <- keyword.declaration.function
'   ^^^^^^^^^^^ entity.name.function
'              ^ meta.function.parameters punctuation.section.parens.begin.brightscript
'               ^ meta.function.parameters punctuation.section.parens.end.brightscript
'                ^ meta.function.brightscript meta.block.brightscript
end sub
' <- keyword.control
'^^^^^^ keyword.control
'      ^ source.brightscript

#end if
'<- meta.preprocessor keyword.control punctuation.definition.keyword
'^^^^^^ meta.preprocessor keyword.control

function simplestFunction() as dynamic
' <- keyword.declaration.function
'        ^^^^^^^^^^^ entity.name.function
'                        ^ meta.function.parameters punctuation.section.parens.begin.brightscript
'                         ^ meta.function.parameters punctuation.section.parens.end.brightscript
'                          ^^^^^^^^ meta.function.return-type
'                           ^^ keyword.control
'                              ^^^^^^^ keyword.declaration.type
'                                     ^ meta.function meta.block
	return invalid
	' <- meta.function meta.block keyword.control
	'^^^^^ meta.function meta.block keyword.control
	'      ^^^^^^^ meta.function meta.block constant.language
end function
' <- keyword.control
'^^^^^^ keyword.control
'           ^ source.brightscript

#if false
' <- comment.block punctuation.definition.comment
'^^^^^^^^ comment.block punctuation.definition.comment
	BrightScript does not have block comments, but conditional compilation can be used as one.
'^^^^^^^^^^^^^^^ comment.block
#end if
' <- comment.block punctuation.definition.comment
'^^^^^^ comment.block punctuation.definition.comment

function foo (bar as boolean, other = "txt") as dynamic rem inline comment
' <- keyword.declaration.function
'        ^^^ entity.name.function
'            ^ punctuation.section.parens.begin.brightscript
'                 ^^ keyword.control.brightscript
'                    ^^^^^^^ keyword.declaration.type.brightscript
'                                          ^ punctuation.section.parens.end.brightscript
'                                           ^ meta.function.return-type
'                                            ^^ keyword.control
'                                              ^ meta.function.return-type
'                                               ^^^^^^^ keyword.declaration.type
'                                                       ^^^^^^^^^^^^^^^^^^ comment.line.rem.brightscript
	one = 1
	'^^ variable.other.readwrite
	'   ^ keyword.operator.assignment
	'     ^ constant.numeric.integer.decimal
	two = 2

	#const myFlag1 = true
	#const myFlag2 = false
	' #const myFlag3 = forceInvalid

	#if myFlag1
	'<- meta.preprocessor keyword.control
	'   ^^^^^^^ meta.preprocessor entity.name.constant
		hasMyFlag1 = true
		'^^^^^^^^^ variable.other.readwrite
	#else if myFlag2
	'<- meta.preprocessor keyword.control
	'        ^^^^^^^ meta.preprocessor entity.name.constant
		hasMyFlag2 = false
		'^^^^^^^^^ variable.other.readwrite
	#end if
	'<- meta.preprocessor keyword.control

	meaningOfLife = ((42))
	'<- variable.other.readwrite
	'^^^^^^^^^^^^ variable.other.readwrite
	'             ^ keyword.operator.assignment
	'               ^^ punctuation.section.parens.begin
	'                ^^^^ meta.parens
	'                 ^^ constant.numeric.integer.decimal
	'                   ^^ punctuation.section.parens.end

	#if forceInvalid
	illegal
	' <- invalid.illegal.non-code-block-content
	#end if

	myLabel:
	' <- entity.name.label.brightscript
	' ^^^^^ entity.name.label.brightscript
	'      ^ punctuation.separator.colon

	#if forceInvalid
	goto myLabel
	' <- keyword.control.brightscript
	'^^^ keyword.control.brightscript
	'    ^^^^^^^ entity.name.label.brightscript
	'   ^ meta.function.brightscript
	'           ^ meta.function.brightscript
	goto myLabel illegal++
	' <- keyword.control.brightscript
	'^^^ keyword.control.brightscript
	'    ^^^^^^^ entity.name.label.brightscript
	'   ^ meta.function.brightscript
	'           ^^^^^^^^^^ invalid.illegal.content-after-goto-statement
	goto myLabel: one++
	' <- keyword.control.brightscript
	'^^^ keyword.control.brightscript
	'    ^^^^^^^ entity.name.label.brightscript
	'   ^ meta.function.brightscript
	'           ^ punctuation.terminator.brightscript
	'             ^^^ variable.other.readwrite
	'                ^^ keyword.operator.arithmetic.brightscript
	#end if

	myInvalid = invalid
	'           ^^^^^^^ constant.language
	myBool = true
	'        ^^^^ constant.language
	myBool = false
	'        ^^^^^ constant.language
	myInt = 1 ' inline comment
	' <- variable.other.readwrite
	'     ^ keyword.operator.assignment
	'       ^ constant.numeric.integer
	'         ^ comment.line.apostrophe.brightscript
	'                        ^ comment.line.apostrophe.brightscript
	myInt++
	' <- meta.function variable.other.readwrite
	'^^^^ meta.function variable.other.readwrite
	'    ^^ meta.function keyword.operator.arithmetic
	'      ^ meta.function
	myInt% = 1 ' inline comment
	' <- variable.other.readwrite
	'^^^^^ variable.other.readwrite
	'    ^ punctuation.definition.variable
	'     ^ meta.function
	'      ^ keyword.operator.assignment
	'        ^ constant.numeric.integer
	'          ^^^^^^^^^^^^^^^^ comment.line.apostrophe.brightscript
	myInt = 1%
	'      ^ meta.function
	'       ^^ constant.numeric.integer.decimal.brightscript
	'         ^ meta.function
	myHexInt = &h1
	'          ^^^ constant.numeric.integer.hexadecimal.brightscript
	myConstInt = LINE_NUM
	'            ^^^^^^^^ constant.language
	myLongInt = 1&
	'           ^^ constant.numeric.integer.decimal.brightscript
	myLongInt& = 1&
	' <- variable.other.readwrite
	'^^^^^^^^^ variable.other.readwrite
	'        ^ punctuation.definition.variable
	'            ^^ constant.numeric.integer.decimal.brightscript
	myLongHexInt = &h1&
	'              ^^^^ constant.numeric.integer.hexadecimal.brightscript
	myFloat = .1
	'         ^^ constant.numeric.float.brightscript
	myFloat = 1.1
	'         ^^^ constant.numeric.float.brightscript
	myFloat = 1!
	'         ^^ constant.numeric.float.brightscript
	myFloat! = 1!
	' <- variable.other.readwrite
	'^^^^^^^ variable.other.readwrite
	'      ^ punctuation.definition.variable
	'          ^^ constant.numeric.float.brightscript
	myFloat = 1.0E+1
	'         ^^^^^^ constant.numeric.float.brightscript
	myFloat = 1.123456789
	'         ^^^^^^^^^^^ constant.numeric.float.brightscript
	myFloat = 1.123456789!
	'         ^^^^^^^^^^^^ constant.numeric.float.brightscript
	myFloat = 1.123456789E+1
	'         ^^^^^^^^^^^^^^ constant.numeric.float.brightscript
	myDouble = .1#
	'          ^^^ constant.numeric.double.brightscript
	myDouble = 1.1#
	'          ^^^^ constant.numeric.double.brightscript
	myDouble# = 1.1#
	' <- variable.other.readwrite
	'^^^^^^^^ variable.other.readwrite
	'       ^ punctuation.definition.variable
	'           ^^^^ constant.numeric.double.brightscript
	myDouble = 1.1D+1
	'          ^^^^^^ constant.numeric.double.brightscript
	myDouble = 1.1234567899
	'          ^^^^^^^^^^^^ constant.numeric.double.brightscript
	myDouble = 1.1234567899#
	'          ^^^^^^^^^^^^^ constant.numeric.double.brightscript
	myDouble = 1.1234567899D+1
	'          ^^^^^^^^^^^^^^^ constant.numeric.double.brightscript
	myString = "test"
	'          ^ meta.string string.quoted.double.brightscript punctuation.definition.string.begin.brightscript
	'          ^^^^^^ meta.string string.quoted.double.brightscript
	'               ^ meta.string string.quoted.double.brightscript punctuation.definition.string.end.brightscript
	myString$ = "test"
	' <- variable.other.readwrite
	'^^^^^^^^ variable.other.readwrite
	'       ^ punctuation.definition.variable
	'           ^ meta.string string.quoted.double.brightscript punctuation.definition.string.begin.brightscript
	'           ^^^^^^ meta.string string.quoted.double.brightscript
	'                ^ meta.string string.quoted.double.brightscript punctuation.definition.string.end.brightscript

	myFunction = function (one, two as integer, three = 3, four = 4 as integer) as integer
	' <- variable.other.readwrite
	'          ^ keyword.operator.assignment
	'            ^ keyword.declaration.function
		return one + two + three + four
	end function

	mySub = sub ()
	' <- variable.other.readwrite
	'     ^ keyword.operator.assignment
	'       ^ keyword.declaration.function
	end sub

	#if forceInvalid
	myInvalidFunction = function namesAreInvalidForFunctionClosures() as boolean
	'                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ invalid.illegal.missing-parameters
		return false
	end function
	myInvalidSub = sub namesAreInvalidForSubClosures()
	'                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ invalid.illegal.missing-parameters
	end sub
	#end if

	subWithAnyFourParams = sub (one, two, three, four)
	' <- variable.other.readwrite
	'                   ^ meta.function
	'                    ^ keyword.operator.assignment
	'                     ^ meta.function
	'                      ^^^ keyword.declaration.function
	'                         ^ meta.function
	'                           ^^^^^^ meta.function.parameters
	'                             ^^^^^ meta.function meta.function
	end sub
	' <- keyword.control
	'^^^^^^ meta.function meta.function
	'      ^ meta.function

	simplestSub()
	'^^^^^^^^^^ meta.function meta.function-call variable.function
	'          ^^ meta.function meta.function-call meta.parens

	result = myFunction(one, two)' comment
	' <- variable.other.readwrite
	'      ^ keyword.operator.assignment
	'        ^^^^^^^^^^ variable.function
	'                  ^^^^^^^^^^ meta.function meta.function-call meta.parens
	'                            ^ meta.function comment.line

	isFalse = 1 = 2
	'       ^ keyword.operator.assignment
	'           ^ keyword.operator.logical
	isTrue = not isFalse or true
	'        ^^^ keyword.operator.logical
	'            ^^^^^^^ meta.function variable.other.brightscript
	'                    ^^ keyword.operator.logical

	one = -1
	'     ^ keyword.operator.arithmetic
	one = +1
	'     ^ keyword.operator.arithmetic

	one = 1 + 0
	'       ^ keyword.operator.arithmetic
	one = 3 - 2
	'       ^ keyword.operator.arithmetic
	two = 2 * 1
	'       ^ keyword.operator.arithmetic
	two = 2 / 1
	'       ^ keyword.operator.arithmetic
	two = 10 mod 4
	'        ^^^ keyword.operator.arithmetic
	two = 1 << 1
	'       ^^ keyword.operator.bitwise
	two = 2 >> 1
	'       ^^ keyword.operator.bitwise
	three = 7 \ 2
	'         ^ keyword.operator.arithmetic
	four = 2 ^ 2
	'        ^ keyword.operator.arithmetic
	four++
	'   ^^ keyword.operator.arithmetic
	four--
	'   ^^ keyword.operator.arithmetic

	one += 1
	'   ^^ keyword.operator.assignment
	one -= 1
	'   ^^ keyword.operator.assignment
	one *= 1
	'   ^^ keyword.operator.assignment
	one /= 1
	'   ^^ keyword.operator.assignment
	one \= 1
	'   ^^ keyword.operator.assignment
	one <<= 1
	'   ^^^ keyword.operator.assignment
	one >>= 1
	'   ^^^ keyword.operator.assignment

	isTrue = one = 1
	'            ^ keyword.operator.logical
	isTrue = one <> 2
	'            ^^ keyword.operator.logical
	isTrue = not one = 2
	'        ^^^ keyword.operator.logical
	'                ^ keyword.operator.logical
	isTrue = one >= 1
	'            ^^ keyword.operator.logical
	isTrue = one <= 1
	'            ^^ keyword.operator.logical
	isTrue = one > 0
	'            ^ keyword.operator.logical
	isTrue = one < 2
	'            ^ keyword.operator.logical
	isTrue = one > 0 and one < 2
	'                ^^^ keyword.operator.logical
	isTrue = one > 1 or one = 1
	'                ^^ keyword.operator.logical


	' These are not supported by this implementation of BrightScript syntax file,
	' put space between question mark and values.
	?.1
	?("hello")

	? (isFalse or isTrue), "text"; "!" : temp = len("string")
	' <- keyword.control
	'                    ^ punctuation.separator.comma
	'                            ^ punctuation.separator.semicolon
	'                                  ^ punctuation.terminator
	print (isFalse or isTrue), "text"; "!" : temp = len("string")
	' <- keyword.control
	'^^^^ keyword.control
	'                        ^ punctuation.separator.comma
	'                                ^ punctuation.separator.semicolon
	'                                      ^ punctuation.terminator
	print "these" tab(pos(0)+5)"words" tab(pos(0)+5)"are"; tab(pos(0)+5)"evenly" tab(pos(0)+5)"spaced"

	try
	' <- keyword.control
	'^^ keyword.control
		throw "something" + meaningofLife.toStr()
		'^^^^ keyword.control
		'     ^^^^^^^^^^^ meta.string string.quoted.double.brightscript
	catch e
	' <- keyword.control
	'^^^^ keyword.control
	'     ^ variable.other.constant
		print e
		' <- keyword.control
		'     ^ variable.other.brightscript
	endtry
	' <- keyword.control
	'^^^^^ keyword.control


	if temp <> myInvalid or myInvalid <> invalid
	' <- keyword.control.conditional
	'       ^^ keyword.operator.logical
	'                    ^^ keyword.operator.logical
	'                                 ^^ keyword.operator.logical
		print "whatever"
		' <- keyword.control.brightscript
		'^^^ keyword.control.brightscript
	end if
	' <- keyword.control.brightscript
	'^^^^^ keyword.control.brightscript


	xmlElement = createObject("roXMLElement")
	xmlElement.parse("<test testAttribute=""1""></test>")
	testAttr = xmlElement@testAttribute
	'                    ^ punctuation.accessor
	'                     ^^^^^^^^^ variable.other.member
	testOptionalAttr = xmlElement?@testAttribute
	'                            ^^ punctuation.accessor
	'                              ^^^^^^^^^ variable.other.member


	myContentNode = createObject("roSGNode", "ContentNode")
	'               ^^^^^^^^^^^^ support.function

	dim myArray[1,2,3]
	' <- keyword.control
	'   ^^^^^^^ variable.other.readwrite.brightscript
	temp = myArray[1][1 + rnd(1) - meaningOfLife]
	'      ^^^^^^^ variable.other.brightscript
	'             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.brackets
	'             ^ punctuation.section.brackets.begin
	'              ^ meta.brackets constant.numeric.integer.decimal
	'                   ^ keyword.operator.arithmetic
	'                     ^^^ meta.function-call support.function
	'                        ^^^ meta.function-call meta.parens
	'                            ^ keyword.operator.arithmetic
	'                              ^^^^^^^^^^^^^ variable.other
	'                                           ^ punctuation.section.brackets.end

	myArray[0][0] = 0
	'      ^ punctuation.section.brackets.begin
	'       ^ meta.brackets constant.numeric.integer.decimal
	'        ^ punctuation.section.brackets.end
	'         ^ punctuation.section.brackets.begin
	'          ^ meta.brackets constant.numeric.integer.decimal
	'           ^ punctuation.section.brackets.end
	'             ^ keyword.operator.assignment

	if myArray[1].one[0]
		one = 1
	end if

	myObject = {one: {}, two: 2, three: "3"}
	'          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.braces
	'              ^ punctuation.separator.colon
	'                ^^ meta.braces meta.braces
	'                  ^ punctuation.separator.comma

	myObject = {
	'          ^ punctuation.section.braces.begin
		one: {},
		'  ^ punctuation.separator.colon
		'      ^ punctuation.separator.comma
		two: 2
	'^^^^^^^^^^^^^ meta.braces
	}
	' <- punctuation.section.braces.end

	myObject.one.test = {
	' <- meta.function variable.other.brightscript
	'        ^^^ meta.function variable.other.member
	'            ^^^^ meta.function variable.other.member
		one: 1,
		' <- variable.other.member
		two: 2
		' <- variable.other.member
		three: "3"
		' <- variable.other.member
		four: {one: two, value: function() as integer
				return 4
			end function
		}
		five: function (a = 0, b = 0, c = 0, d = 0) as integer
		' <- variable.other.member
			test = 5
			return test
		end function,
		six: myFunction(1, 2, 345 + (23.4 * 2), 4)
		' <- variable.other.member
		seven: ["one liner"]
		' <- variable.other.member
		eight: [
		' <- variable.other.member
			1, 2,
			meaningOfLife
		]
		whatever: meaningOfLife + 2
		' <- variable.other.member
	}

	myObject.five = myObject.one.test.five
	myObject.five()
	'^^^^^^^ variable.other.brightscript
	'       ^ punctuation.accessor.brightscript
	'        ^^^^ variable.function
	'        ^^^^^^ meta.function-call

	temp = myObject?.five?()
	'      ^^^^^^^ variable.other.brightscript
	'              ^^ punctuation.accessor.brightscript
	'                ^^^^ variable.function
	'                ^^^^^^^ meta.function-call

	myObject.one.test.one = myObject.two
	'^^^^^^^ variable.other.brightscript
	'       ^ punctuation.accessor.brightscript
	'        ^^^ variable.other.member
	'                    ^ meta.function
	'                     ^ keyword.operator.assignment
	'                      ^ meta.function
	'                       ^^^^^^^^ variable.other.brightscript
	'                               ^ punctuation.accessor.brightscript
	'                                ^^^ variable.other.member

	if m.top = invalid then m.top = {}

	m.top.id = 1
	' <- variable.language
	'^ punctuation.accessor.brightscript
	' ^^^ variable.language
	'    ^ punctuation.accessor.brightscript
	'     ^^ variable.other.member
	'       ^ meta.function
	'        ^ keyword.operator.assignment
	'         ^ meta.function
	'          ^ constant.numeric.integer
	m.top["id"] = 1
	' <- variable.language
	'^ punctuation.accessor.brightscript
	' ^^^ variable.language
	'    ^ punctuation.section.brackets.begin
	'      ^^ string.quoted.double
	'         ^ punctuation.section.brackets.end
	'          ^ meta.function
	'           ^ keyword.operator.assignment
	'            ^ meta.function
	'             ^ constant.numeric.integer

	myFunction( 0, 3 + myObject.five(m.top.id, 3) )
	' <- meta.function-call variable.function
	'         ^ meta.function-call meta.parens punctuation.section.parens.begin
	'          ^ meta.function-call meta.parens
	'                ^ meta.function-call keyword.operator.arithmetic
	'                  ^^^ meta.function-call meta.parens variable.other
	'                          ^ meta.function-call meta.parens punctuation.accessor
	'                           ^^^^ meta.function-call meta.parens meta.function-call variable.function
	'                               ^^^^^^^^^^^^^ meta.function-call meta.parens meta.function-call meta.parens
	'                                        ^ punctuation.separator.comma
	'                                             ^ meta.function-call meta.parens punctuation.section.parens.end
	'                                              ^ meta.function

	myObject.five( ("3 + 4"), 3, myFunction(1, 2 + myObject.five(meaningOfLife + 4), 4), 3)
	'                                                           ^^^^^^^^^^^^^^^^^^^ meta.function-call meta.parens meta.function-call meta.parens meta.function-call meta.parens
	'               ^^^^^^^ meta.function-call meta.parens meta.string string.quoted.double

	myObject.one.test.five()
	' <- meta.function variable.other.brightscript
	'        ^^^ meta.function variable.other.member
	'            ^^^^ meta.function variable.other.member
	'                 ^^^^ meta.function meta.function-call variable.function

	subWithAnyFourParams(one, 34 + myFunction(three, 4), {one: 1, two: "two", three: myFunction(0, 1) + 1}, ["dsdsds", 232])

	myObject.var = [1, 2,
	'              ^^^^^^ meta.brackets
	'              ^ punctuation.section.brackets.begin
	3, meaningOfLife + 56, 3 * (22+1*((1) + 33)) ]
	' ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.brackets
	'                                            ^ punctuation.section.brackets.end

	#if forceInvalid
	myArray= [1, (22) * 2, "dsds" 4]'
	'        ^^^^^^^^^^^^^^^^^^^^^^^ meta.brackets
	'          ^ punctuation.separator.comma
	'                      ^^^^^^ meta.string
	#end if
	myArray = [1, (22 * 2), myFunction(1 / (2 * (3 + 4 * (1 / 4))), 0), 4]
	'         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.brackets
	'             ^^^^^^^^ meta.parens
	'                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call
	'                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.parens
	'                                      ^^^^^^^^^^^^^^^^^^^^^^^ meta.parens meta.parens
	'                                                    ^^^^^^^ meta.parens meta.parens meta.parens meta.parens
	myArray[2] = "two" + myArray[rnd(myArray.count() - 1) + (2 * one)].toStr()
	'      ^^^ meta.brackets
	'            ^^^^^ meta.string
	'                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.brackets
	'                            ^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call
	'                                        ^^^^^^^ meta.function-call meta.function-call

	myArray = [{one: [{two: 2}]}]

	if one = myArray[myArray[1]] then print meaningOfLife.toStr()
	'<- keyword.control.conditional
	'^ keyword.control.conditional
	'                                                     ^^^^^^ meta.function-call  

	if (one = true)
	'<- keyword.control.conditional
	'^ keyword.control.conditional
		two = 2
		simplestSub()
	' ^^^^^^^^^^^^^^^ meta.block meta.block
	end if

	if(one = true)
	'<- keyword.control.conditional
	'^ keyword.control.conditional
		two = 2
		simplestSub()
	' ^^^^^^^^^^^^^^^ meta.block meta.block
	else
		simplestSub()
	' ^^^^^^^^^^^^^^^ meta.block meta.block
	end if

	if one
	'<- keyword.control.conditional
	'^ keyword.control.conditional
		two = 2
		if two
			three = 3
	' ^^^^^^^^^^^^^^^ meta.block meta.block meta.block
		end if
	end if

	' Spaces after then should be ignored
	if one = 1 then   
	'<- keyword.control.conditional
		two = 2
	else
	'<- keyword.control.conditional
		one = 1
	end if

	if one
		two = 2
		if two
			third = 3
	' ^^^^^^^^^^^^^^^ meta.block meta.block meta.block
		else if third
			fourth = 4
	' ^^^^^^^^^^^^^^^ meta.block meta.block meta.block
		end if
	end if	

	if one = 1
		result = true
	' ^^^^^^^^^^^^^^^ meta.block meta.block
		if simplestFunction() <> invalid
			result = false
	' ^^^^^^^^^^^^^^^ meta.block meta.block meta.block
		else if two >= 3
			result = invalid
	' ^^^^^^^^^^^^^^^ meta.block meta.block meta.block
		else
			result = true
	' ^^^^^^^^^^^^^^^ meta.block meta.block meta.block
		end if
	' ^^^^^^^^^^^^^^^ meta.block meta.block
	else if one = 2
		result = false
	' ^^^^^^^^^^^^^^^ meta.block meta.block
	else
		result = invalid
	' ^^^^^^^^^^^^^^^ meta.block meta.block
	end if

	for each item in myObject
		test = myObject[item]
	' ^^^^^^^^^^^^^^^ meta.block meta.block
		for each i in myArray
			test = 1
	' ^^^^^^^^^^^^^^^ meta.block meta.block meta.block
		end for
	end for

	for i = 1 to 10 step 1
		test = i
	' ^^^^^^^^^^^^^^^ meta.block meta.block
	end for

	for i = 1 to 10
		test = i
	' ^^^^^^^^^^^^^^^ meta.block meta.block
	end for

	three = 0
	while one = 1 and two = 2 and three <> 3
		three++
	' ^^^^^^^^^^^^^^^ meta.block meta.block
	end while

    if type(myArray) = "roArray" AND simplestFunction() = invalid
		for each item in myArray
		' ^^^^^^ meta.block meta.block keyword.control
			if item.toStr() = "needle"
			'^ meta.block meta.block meta.block keyword.control
				found = true
				exit for
				'^^^^^^^ meta.block meta.block meta.block meta.block keyword.control
			end if
			' ^^^^ meta.block meta.block meta.block meta.block keyword.control
		end for
		' ^^^^^ meta.block meta.block meta.block keyword.control

		for i = 1 to 10
		' ^ meta.block meta.block keyword.control
			test = i
		end for
		' ^ meta.block meta.block meta.block keyword.control

		if one
			test = 1
			' ^^ meta.block meta.block meta.block variable.other.readwrite
		else
			test = 2
			simplestSub()
			' ^^^^^^^^^^^ meta.block meta.block meta.block meta.function-call
		end if
		simplestSub()
		' ^^^^^^^^^^^ meta.block meta.block meta.function-call
    end if

	if isTrue = true then one = true

	if one = true or two = true
	' <- keyword.control.conditional.brightscript
	'      ^ keyword.operator.logical
	'             ^^ keyword.operator.logical
	'                    ^ keyword.operator.logical
		three = 33 * (13 + 9)
	elseif one = two
		three = four
	else
		four = five
	end if

	return {
		one: 1,
		two: {
			three: (2 + 1)
			four: myObject
			' ^^ meta.braces meta.braces variable.other.member
		}
		' <- meta.braces meta.braces punctuation.section.braces.end
	}
	' <- meta.braces punctuation.section.braces.end

	return 1
	' <- keyword.control.brightscript
	' ^^^^ keyword.control.brightscript
	'      ^ constant.numeric.integer.decimal

	end
	' <- keyword.control.brightscript
	stop
	' <- keyword.control.brightscript

end function
' <- keyword.control.brightscript
' ^^^^^^^^^^ keyword.control.brightscript

' <- source.brightscript

sub bar ()
' <- keyword.declaration.function
'   ^^^ entity.name.function
'       ^ punctuation.section.parens.begin.brightscript
'        ^ punctuation.section.parens.end.brightscript
'         ^^ meta.function.brightscript

	myFunction = function () as boolean
	' <- variable.other.readwrite
	'          ^ keyword.operator.assignment
	'            ^ keyword.declaration.function
	end function

	mySub = sub ()
	' <- variable.other.readwrite
	'     ^ keyword.operator.assignment
	'       ^ keyword.declaration.function
	end sub

end sub
' <- keyword.control.brightscript
' ^^^^^ keyword.control.brightscript

' <- source.brightscript
sub main()
	foo(true)
end sub
