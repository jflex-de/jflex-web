---
title: JFlex
subtitle: The Fast Scanner Generator for Java
---

<div class="container front"><div class="row">
<div class="col-sm-4"><img src="jflex-black.png" alt="JFlex Logo" width=221 height=180/></div>
<div class="col-sm-8">

# JFlex

The current stable version is [JFlex 1.9.1][1] released on Mar 11, 2023

The current maven jflex plugin is [version 1.9.1][1].

See the [changelog](changelog.html).
</div></div></div>

----------------------------

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

**2023-03-11:** [JFlex 1.9.1 released](changelog.html#jflex-1.9.1).

**2023-02-05:** [JFlex 1.9.0 released](changelog.html#jflex-1.9.0).

**2020-05-03:** [JFlex 1.8.2 released](changelog.html#jflex-1.8.2).

**2020-02-28:** [JFlex 1.8.1 released](changelog.html#jflex-1.8.1).

**2020-02-26:** [JFlex 1.8.0 released](changelog.html#jflex-1.8.0).

----------------------------

## Stay informed

`jflex-announce` is a mailing-list for notification on new JFlex releases and severe bugs. This list is read only and very low traffic.
Your email address will be kept private.

<div class="container"><div class="row">
<div class="col-md-7 col-md-offset-2">
<div class="mailitems">
* [jflex-announce](https://lists.sourceforge.net/lists/listinfo/jflex-announce)
* <a href="mailto:jflex-announce-request@lists.sourceforge.net?subject=subscribe" class="button">subscribe</a>
* [archive](https://sourceforge.net/p/jflex/mailman/jflex-announce/)
</div></div></div></div>


----------------------------

## JFlex is free

JFLex is released under a permissive open-source BSD-style license and available for [download](download.html). See also [Copyright, License & Warranty](copying.html).


----------------------------

## What platforms does JFlex support?

JFlex supports JDK 1.8 or above.

[1]: /download.html
