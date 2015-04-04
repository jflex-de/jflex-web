---
title: JFlex - Frequently Asked Questions
---

# JFlex FAQ


#### Can I use my old JLex specifications with JFlex?

Yes. You usually can use them unchanged. See section [[porting from
JLex]](manual.html#Porting) of the manual for more information on that topic.

#### Where can I get the latest version of JFlex? 

Check out the [JFlex website](http://www.jflex.de/). There is an
[announcement mailing list](http://www.jflex.de/mailing.html) for
announcements for new JFlex releases.

#### What platforms does JFlex support? 

JFlex and the code it produces should run on any platform that supports JRE/JDK
1.5 or above.

#### Can I use CUP and JFlex together? 

You can. See section [[Working together: JFlex and CUP]](manual.html#CUPWork)
of the manual on how to do it.

#### Can I use the generated code of my JFlex specification commercially?

You can use your generated code without restriction. See the file
[copyright](COPYRIGHT) for more information.

#### My Scanner throws an "IOException: Reader returned 0 characters. See JFlex examples for workaround." What now?

Short answer: wrap the reader that returns 0 characters in one that blocks
instead. Long answer: See the
[README](https://github.com/jflex-de/jflex/blob/master/jflex/examples/zero-reader/README.md) and example solution in the example
[zero-reader](https://github.com/jflex-de/jflex/blob/master/jflex/examples/zero-reader/).

#### I want my scanner to read from a network byte stream or from interactive stdin. Can I do this with JFlex?

This actually depends on the syntax of the input you want to read. The problem
is, that for some expressions the scanner needs one character of lookahead to
decide which action to execute. For interactive use and network streams this is
very inconvenient, because the stream doesn't send an EOF (or any other data)
when the user stops typing while the scanner just waits for the next character
and doesn't return a symbol. Since version 1.1.1 of JFlex this problem can be
avoided because of a little more analysis at generation time. Take a look at
these three rules:

      a
      a*
      ";"

When the scanner has read one `a`, an additional input character is needed to
decide, if this matches rule 1 (just one `a`) or rule two (when the next
character is another `a`). With input `aaa` the scanner also has to read one
additional character, because it is supposed to return the longest match (so if
there comes another `a`, the match is `aaaa` and not only `aaa`). But: When the
scanner reads a "`;`", it does not need an additional character and can
immediatly execute the action for rule number 3. This is the case for all rules
that are not prefixes of any other rules in the specification and that have a
fixed length end (so `(a* b)` is ok but `(a b*)` is not).

For your application this means: if all commands (or whatever units of input
you have) are terminated by some delimiter (for instance "`;`" or LF or
"`end`") reading from a network bytestream or an interactive stream works fine
with JFlex.

#### How can I let my scanner read its input from a string?

    String myString = "some input";
    Scanner myScanner = new Scanner( new java.io.StringReader(myString) );

#### Why do standalone scanners have a different standard return type (`int` instead of `Yytoken`)?

That's because `int` is a predefined
type in Java and `Yytoken` is not. If a scanner generated with
`%standalone` option would have return type `Yytoken`, you would have to
provide this class for every standalone scanner you write. In most cases
you don't want to do that, because the scanner wouldn't be really
*standalone* then. The standard `Yytoken` for non standalone cases stems
from JLex and is only kept for compatibility (it's rarely used anyway).
If you still *really* want `Yytoken` as return type in a standalone
scanner, you can always explicitly specify it with `%type Yytoken`. If
you just want to test your scanner scanner and see what it does without
a parser attached, use `%debug` instead of `%standalone`. 

#### The expression `![a]` seems to match "aa". Is negation broken? 

The semantics of the negation of an expression `r` is a literal everything not
matched by `r`. The expression `[a]` matches strings that contain exactly one
character (namely `"a"`). The string `"aa"` is not matched by this expression,
hence it should be matched by `![a]`.

#### I use `%8bit` and get an Exception, but I know my platform only uses 8 bit. Is `%8bit` broken? 

Short answer: not broken, use `%unicode`. Long answer:
Most probably this is an encoding problem. Java uses Unicode internally
and converts the bytes it reads from files (or somewhere else) to
Unicode first. The 8 bit value of your platform may not be 8 bit anymore
when converted to Unicode. On many Windozes for instance Cp1252
(Windows-Latin-1) is used as standard encoding, and there the character
"single right quotation mark" has code `\x92` but after conversion to
Unicode it's `\u2019` which is not 8 bit any more. See also the section
on [Encodings, platforms, and Unicode](manual.html#sec:encodings) of the
JFlex manual for more information. 

#### My scanner needs to read a file that is not in my platforms standard encoding, but in encoding XYZ. How?

Since the scanner reads Java Unicode characters, it is independent of the
actual character encoding a file or a string uses. The transformation
byte-stream to Java characters for files usually happens in the
`java.io.InputStreamReader` object connected with the input stream. Class
`java.io.FileReader` uses the platforms default encoding automatically. If you
would like to explicitly specify another encoding, for instance UTF-8, you
could do something like

    Reader r = new InputStreamReader(new FileInputStream(file), "UTF8");

Now you have a Reader `r` that can be passed to the scanner's constructor in
the usual way. For more information on encodings see also Sun's JDK
documentation, especially in *Guide to Features - Java Platform* item
*Internationalization* and there the *FAQ* and *Supported Encodings*.
