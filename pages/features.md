---
title: JFlex - Features
---

# JFlex Features

See also [release history](changelog.html)

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




