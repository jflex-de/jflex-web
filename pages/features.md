---
title: JFlex - Features
---

# JFlex Features

----

## Main design goals of JFlex

The main design goals of JFlex are:

-   Full unicode support
-   Fast generated scanners
-   Fast scanner generation
-   Convenient specification syntax
-   Platform independence
-   JLex compatibility

----

## List of JFlex features

The following list is more comprehensive:

-   All features of JLex, and additionally:
-   Faster generated scanners
-   Faster Scanner generation (independent of the input character set)
-   Predefined character classes

-   Comments in all parts of the specification
-   Macro definitions are regular expressions, not just text
-   Cycles in macro definitions are detected and reported at generation
    time
-   Platform independent end of line operator "`$`"
-   Beginning of line operator "`^`" works as expected (not consuming
    newlines)
-   Grouping of rules with same lexical states
-   Comments, character literals and strings in actions are handled
    correctly

-   Builtin support for the CUP parser generator
-   Column counting
-   Standalone scanners (as with C/C++ flex)
-   Debugging support


### New in version 1.1

-   whitespace characters `" "` (space) and `"\t"` (tab) in regular
    expressions
-   flex style repeat expressions `r{n}` and `r{n,m}`
-   switch for case insensitive scanners
-   switch for closing the input stream automatically at the end of file
-   a method for closing the input stream
-   a method for getting the current lexical state
-   a method for rereading matched text
-   backup of files that are overwitten in the generation process



### New in version 1.2

-   command line switches for more customization
-   external scanner skeleton files
-   `<<EOF>>` rules as in lex and flex.
-   `|` action as in flex
-   arbitrary trailing context with the `/` operator
-   `%extends` option for subclassing
-   `%final` and `%abstract` class modifiers
-   more conventient declaration of exceptions



### New in version 1.3

-   empty charclass `[]`
-   any (=negated empty) charclass `[^]`
-   negation operator `!` for regexps
-   upto operator `~` for regexps
-   customizable buffer size with `%buffer`
-   `char yycharat(int)` for efficient access to single characters in
    matched text
-   split up of too large lex tables for even larger scanner sizes
-   external skeleton with support for nested input streams
-   customize for internal error handling in `yy_ScanError`
-   new `resetStream` method for reusing scanner objects
-   [BYacc/J](http://byaccj.sourceforge.net) support (`%byaccj`)
-   include files in lexer specs with `%include`



### New in version 1.4

-   new, very fast minimization algorithm
-   new `--jlex` option for strict compatibility to JLex
-   support for even larger scanners (up to 64K DFA states)
-   faster character classes
-   new %apiprivate switch that causes all generated and skeleton
    methods to be made private
-   allow user defined javadoc class comments
-   optional parameter to %eofclose: "%eofclose false" turns off
    %eofclose if it was turned on previously (e.g. by %cup)
-   some internal changes: jflex build script switched to ant, better
    integration with build tools and IDEs, change scheme for generated
    names to comply with Java naming standard
-   since 1.4.2: general efficient lookahead algorithm



### New in version 1.5

-   JFlex now conforms with [Unicode Regular Expressions
    UTS\#18](http://www.unicode.org/reports/tr18/tr18-17.html) Basic
    Unicode Support - Level 1. Supplementary code points (above the
    Basic Multilingual Plane) are not yet supported.
-   Support for new meta characters \\s, \\S, \\d, \\D, \\w, \\W.
-   Support for nested character sets and new character set operations
    (union, intersection, set difference, symmetric difference).
-   The "." meta character now stands for all non-newline characters.
-   New \\R meta character stands for all newline characters.
-   CUP2 support.
-   Maven build.



### New in version 1.6

-   Version 1.6 further improves Unicode support, including Unicode
    version 7.0.
-   In %unicode mode, supplementary code points are now handled as
    single characters, rather than two code-units/chars.
-   New \\u{…} escape sequence allows code points (and
    whitespace-separated sequences of code points) to be specified as
    1–6 hexadecimal digit values.

