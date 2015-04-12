---
title: JFlex - The Fast Scanner Generator for Java
---

<div class="container front"><div class="row">
<div class="col-sm-4"><img src="jflex-black.png" alt="JFlex Logo" width=221 height=180/></div>
<div class="col-sm-8">

# JFlex

The current stable version is [JFlex 1.6.1][9] released on Mar 16, 2015

The current maven jflex plugin is [version 1.6.1][9].

See the [changelog](changelog.html).
</div></div></div>

## What is it?

JFlex is a lexical analyzer generator (also known as scanner generator) for
Java, written in Java.

A [lexical analyzer](https://en.wikipedia.org/wiki/Lexical_analysis)
generator takes as input a specification with a set of
regular expressions and corresponding actions. It generates a program (a
*lexer*) that reads input, matches the input against the regular expressions in
the spec file, and runs the corresponding action if a regular expression
matched. Lexers usually are the first front-end step in compilers, matching
keywords, comments, operators, etc, and generating an input token stream for
parsers. Lexers can also be used for many other purposes.

JFlex lexers are based on deterministic finite automata (DFAs).
They are fast, without expensive backtracking.

JFlex is designed to work together with the LALR parser generator
[CUP](http://www.cs.princeton.edu/~appel/modern/java/CUP/) by Scott Hudson, 
and the Java modification of Berkeley Yacc
[BYacc/J](http://byaccj.sourceforge.net/) by Bob Jamison.
It can also be used together with other parser generators like
[ANTLR](http://www.antlr.org/) or as a standalone tool.

----------------------------

## News

**2015-04-06:** New website design. Enjoy!

**2015-03-16:** [JFlex 1.6.1 released](changelog.html#jflex-1.6.1).

**2015-02-28:** JFlex [code repository][1] and [issue tracker][2] have moved to [github][0]!

**2014-06-20:** [JFlex 1.6 released](changelog.html#jflex-1.6.0).

**2014-03-21:** [JFlex 1.5.1 released](changelog.html#jflex-1.5.1).

**2014-01-21:** It's been a long time coming: [JFlex 1.5 released](changelog.html#jflex-1.5.0)!

**2009-01-31:** [JFlex 1.4.3 released](jflex-1.4.3). 

**2007-10-29:** A new [JFlex Maven plugin][3] allows to generate the
   lexer during the `generate-sources` phase of
   [Maven](http://maven.apache.org/).   


----------------------------

## JFlex is free

JFLex is released under a permissive open-source BSD-style license and available for [download](download.html). See also [Copyright, License & Warranty](copying.html). 



## What platforms does JFlex support?

JFlex generates the scanner on platform that supports JDK 6 or above.

The generated scanner runs with JRE 5 or above.


[0]: https://github.com/jflex-de/
[1]: https://github.com/jflex-de/jflex/
[2]: https://github.com/jflex-de/jflex/issues/
[3]: http://jflex.sourceforge.net/jflex-maven-plugin/
[9]: /download.html
