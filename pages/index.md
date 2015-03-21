---
title: JFlex - The Fast Scanner Generator for Java
---

# JFlex 1.6.1

The current stable version is [JFlex 1.6.1](download.html) released on Mar 16, 2015

The current maven plugin ...

----------------------------

## News

**2015-03-16:** JFlex 1.6.1 released! See <a href="#notes">below</a> for release notes.

**2015-02-28:** JFlex <a href="https://github.com/jflex-de/jflex/">code repository</a> and <a href="https://github.com/jflex-de/jflex/issues/">issue tracker</a> have moved to <a href="https://github.com/jflex-de/">github</a>!

**2014-06-20:** JFlex 1.6 released! See below for release notes.

**2014-03-21:** JFlex 1.5.1 released.

**2014-01-21:** It's been a long time coming: JFlex 1.5 is out!

**2009-01-31:** JFlex 1.4.3 released. 

**2007-10-29:** There now exists a 
<a href="http://jflex.sourceforge.net/jflex-maven-plugin/">JFlex Maven plugin</a>, contributed by R&eacute;gis D&eacute;camps. 
It integrates JFlex into the <a href="http://maven.apache.org/">Maven</a> 
software project management tool.

----------------------------

## What is it?

JFlex is a lexical analyzer generator (also known as scanner generator)
for Java<SUP><A HREF="#JavaTM">(tm)</A></SUP>, written in Java<SUP><A HREF="#JavaTM">(tm)</A></SUP>.
It is also a rewrite of the very useful tool <A HREF="http://www.cs.princeton.edu/~appel/modern/java/JLex/">JLex</A>
which was developed by Elliot Berk at Princeton University. As Vern Paxson
states for his C/C++ tool flex: They do not share any code though. 

JFlex is designed to work together with the LALR parser generator
<a href="http://www.cs.princeton.edu/~appel/modern/java/CUP/">CUP</a> by Scott Hudson, and
the Java modification of Berkeley Yacc <a href="http://byaccj.sourceforge.net">BYacc/J</a> by Bob Jamison.
It can also be used together with other parser generators like <a href="http://www.antlr.org">ANTLR</a> or as a standalone tool.

[Features of JFlex](features.html).


----------------------------

##Is it free?
Yes. It is released under a permissive open-source BSD-style license and available for
free <a href="download.html">download</a>. See also <a
href="copying.html">Copyright, License &amp; Warranty</a>. 

----------------------------

<a name="notes"></a>

## What's new in version 1.6.1?

<p>Version 1.6.1 is a maintenance release. It fixes all known defects of version 1.6.0.</p> 
<ul>
<li>Fixed issue #130, &quot;in caseless mode, chars in regexps not accepted caselessly&quot;: Caseless option works again as intended.</li>
<li>Fixed issue #131, &quot;re-enable scanning interactively or from a network byte stream&quot;: JFlex now throws an IOException when a Reader returns 0 characters.</li>
<li>New example, shows how to deal with Readers that return 0 characters.</li>
<li>Command line scripts work again in repository version (contributed by Emma Strubell)</li>
<li>New options <code>--warn-unused</code> and <code>--no-warn-unused</code> that control warnings about unused macros.</li>
<li>Fixed issue #125: <code>%apiprivate</code> and <code>%cup2</code> switches now no longer incompatible</li>
<li>Fix issue #133, &quot;Error in skeleton.nested&quot;: Empty-string matches were taking precedence over <code>EOF</code> and caused non-termination. Now <code>EOF</code> is counted as the highest-priority empty match.</li>
<li>New warning when an expression matches the empty string (can lead to non-termination).</li>
</ul>

----------------------------


## What's new in version 1.6?

Version 1.6 further improves Unicode support, including Unicode version 7.0. Further high-level changes are:
<ul>
<li>In %unicode mode, supplementary code points are now handled as single characters, rather than two code-units/chars.</li>
<li>New \u{&#8230;} escape sequence allows code points (and whitespace-separated
 sequences of code points) to be specified as 1&#8211;6 hexadecimal digit values.</li>
<li>By default no InputStream constructor is included in the generated
 scanner. The capability to include one is deprecated and will be
 removed in JFlex 1.7.</li>
</ul>

<p>See also the <a href="history.html">change log</a> file for the complete
list of changes. <P>


----------------------------

## What platforms does JFlex support?
JFlex should run on any platform that supports a JRE/JDK 1.5 or above.

