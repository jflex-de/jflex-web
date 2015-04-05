---
title: JFlex - The Fast Scanner Generator for Java
---

<div class="container front"><div class="row">
<div class="col-sm-4"><img src="jflex-black.png" alt="JFlex Logo" width=221 height=180/></div>
<div class="col-sm-8">  
# JFlex 1.6.1

The current stable version is [JFlex 1.6.1](download.html) released on Mar 16, 2015

The current maven jflex plugin is [version 1.6.1](download.html).
</div>
</div></div>

----------------------------

## News

**2015-03-16:** JFlex 1.6.1 released! See <a href="#notes">below</a> for release notes.

**2015-02-28:** JFlex [code repository][0] and [issue tracker][1] have moved to [github][2]!

**2014-06-20:** JFlex 1.6 released. See below for release notes.

**2014-03-21:** JFlex 1.5.1 released.

**2014-01-21:** It's been a long time coming: JFlex 1.5 is out!

**2009-01-31:** JFlex 1.4.3 released. 

**2007-10-29:** There now exists a [JFlex Maven plugin][3], contributed by
R&eacute;gis D&eacute;camps. It integrates JFlex into the [Maven][4] software
project management tool.


<a name="about"></a>

----------------------------

## What is it?

JFlex is a lexical analyzer generator (also known as scanner generator) for
Java, written in Java. It is also a rewrite of the very useful tool [JLex][5]
which was developed by Elliot Berk at Princeton University. As Vern Paxson
states for his C/C++ tool flex: They do not share any code though.

JFlex is designed to work together with the LALR parser generator [CUP][6] by
Scott Hudson, and the Java modification of Berkeley [Yacc BYacc/J][7] by Bob
Jamison. It can also be used together with other parser generators like
[ANTLR][8] or as a standalone tool.

[Features of JFlex](features.html).


----------------------------

## Is it free?
Yes. It is released under a permissive open-source BSD-style license and available for [download](download.html). See also [Copyright, License & Warranty](copying.html). 

----------------------------

<a name="notes"></a>

## What's new in version 1.6.1?

Version 1.6.1 is a maintenance release. It fixes all known defects of version 1.6.0.

 * Fixed issue #130, "in caseless mode, chars in regexps not accepted caselessly": Caseless option works again as intended.
 * Fixed issue #131, "re-enable scanning interactively or from a network byte stream": JFlex now throws an IOException when a Reader returns 0 characters.
 * New example, shows how to deal with Readers that return 0 characters.
 * Command line scripts work again in repository version (contributed by Emma Strubell)
 * New options `--warn-unused` and `--no-warn-unused` that control warnings about unused macros.
 * Fixed issue #125: `%apiprivate` and `%cup2` switches now no longer incompatible
 * Fix issue #133, "Error in skeleton.nested": Empty-string matches were taking precedence over `EOF` and caused non-termination. Now `EOF` is counted as the highest-priority empty match.
 * New warning when an expression matches the empty string (can lead to non-termination).

----------------------------


## What's new in version 1.6?

Version 1.6 further improves Unicode support, including Unicode version 7.0.
Further high-level changes are:

 * In `%unicode` mode, supplementary code points are now handled as single characters, rather than two code-units/chars.
 * New `\u{…}` escape sequence allows code points (and whitespace-separated sequences of code points) to be specified as 1--6 hexadecimal digit values.
 * By default no `InputStream` constructor is included in the generated scanner. The capability to include one is deprecated and will be removed in JFlex 1.7.


See also the [change log](history.html) file for the complete list of changes.


----------------------------

## What platforms does JFlex support?

JFlex should run on any platform that supports a JRE/JDK 1.5 or above.


[0]: https://github.com/jflex-de/jflex/
[1]: https://github.com/jflex-de/jflex/issues/
[2]: https://github.com/jflex-de/
[3]: http://jflex.sourceforge.net/jflex-maven-plugin/
[4]: http://maven.apache.org/
[5]: http://www.cs.princeton.edu/~appel/modern/java/JLex/
[6]: http://www.cs.princeton.edu/~appel/modern/java/CUP/
[7]: http://byaccj.sourceforge.net
[8]: http://www.antlr.org
