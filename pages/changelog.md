---
title: Changelog
---

## JFlex 1.6.1
(March 16, 2015)

- JFlex development, wiki, and issue tracker moved to [Github](https://github.com/jflex-de/)
- Fixed issue #130, "in caseless mode, chars in regexps not accepted caselessly":
  Caseless option works again as intended.
- Fixed issue #131, "re-enable scanning interactively or from a network byte stream":
  JFlex now throws an `IOException` when a `Reader` returns 0 characters.
- New example, shows how to deal with `Readers` that return 0 characters.
- Command line scripts work again in repository version (contributed by Emma Strubell)
- New options `--warn-unused` and `--no-warn-unused` that control warnings about
  unused macros.
- Fixed issue #125: `%apiprivate` and `%cup2` switches now no longer incompatible
- Fix issue #133, "Error in `skeleton.nested`":
  Empty-string matches were taking precedence over `EOF` and caused non-termination.
  Now `EOF` is counted as the highest-priority empty match.
- New warning when an expression matches the empty string (can lead to non-termination).

## JFlex 1.6.0
(Jun 21, 2014)

- Further improves Unicode support,
  including Unicode version 7.0.
- In `%unicode mode`, supplementary code points are now handled properly.
  * Regular expressions are now code-point based, rather than code-unit/
    char based.
  * Input streams are read as code point sequences - properly paired
    surrogate code units are read as a single character.
  * All supported Unicode properties now match supplementary characters
    when Unicode 3.0 or above is specified, or when no version is
    specified, causing the default Unicode version, Unicode 7.0 in this
    release, to be used.
- New `\u{...}` escape sequence allows code points (and whitespace-separated
  sequences of code points) to be specified as 1-6 hexadecimal digit values.
- Characters in matches printed in `%debug` mode are now Unicode escaped
  (`\uXXXX`) when they are outside the range 32..127.
- fixed bug #128, detect javadoc class comment when followed by annotation(s)
- removed the `switch` and `table` code generation options
- By default no InputStream constructor is included in the generated
  scanner.  The capability to include one is deprecated and will be
  removed in JFlex 1.7.
  
## JFlex 1.5.1
(Mar 21, 2014)

- fixed bug #127, problem calling `./jflex` start scripts
- fixed bug #126, minor documentation flaws
- further documentation and website updates
- JFlex now reports the correct version string 
- added support for CUP2 with `%cup2` switch, based on patch by Andreas Wenger

## JFlex 1.5.0
(Jan 21, 2014)

- the JFlex license has been changed from GPL to BSD.
- updated JFlex to CUP version 0.11a. 
- JFlex now conforms with [Unicode Regular Expressions
  UTS&num;18](http://www.unicode.org/reports/tr18/tr18-17.html) Basic
  Unicode Support - Level 1. Supplementary code points (above the
  Basic Multilingual Plane) are not yet supported.
- new character set operations supported: union (e.g. `[A||B]`), intersection (e.g.
  `[A&&B]`), set-difference (e.g. `[A—B]`), and symmetric difference (e.g. `[A~~B]`).
- The `.` meta character now stands for all non-newline characters.
  The meaning of the dot (".") meta character has been changed from `[^\n]` to 
  `[^\n\r\u000B\u000C\u0085\u2028\u2029]`. Use the new `--legacydot` option to
  cause "." to be interpreted as `[^\n]`.
- New `\R` meta character stands for all newline characters
  `"\r\n" | [\n\r\u000B\u000C\u0085\u2028\u2029]`
- new meta characters supported: `\s, \S, \d, \D, \w, \W`.
- new option `—noinputstreamctor` to not include an InputStream
  constructor in the generated scanner.
- `%include <file>` can now be used in the rules section (bug #117)
- fixed bug #107 and #108 (`yychar` and `zzAtBOL` should be reset for nested input streams)
- fixed bug #109 (could not match input for empty string matches.)
- fixed bug #112 and #119 (properly update `zzFin` when reallocating `zzBuffer`)
- fixed bug #115 (noncompileable scanner generation when default locale is Turkish)
- fixed bug #114 (zzEOFDone not included with pushed nested stream state)
- fixed bug #105 (can't build `examples/java/`)
- fixed bug #106 (impossible char class range should trigger syntax error)
- the `switch` and `table` code generation options are deprecated
  and will be removed in JFlex 1.6
- changed the build from Ant to Maven.

  
## JFlex 1.4.3
(Jan 31, 2009)

- fixed bug #100 (lookahead syntax error)
- fixed bug #97 (min_int in Java example scanner)
- fixed bug #96 (zzEOFDone not reset in yyreset(Reader))
- fixed bug #95 (%type and %int at the same time should produce error msg)

## JFlex 1.4.2
(May 27, 2008)

- implemented feature request #75:
  Now supports generics syntax for %type, %extends, etc
- implemented feature request #156:
  Provided %ctorarg option to add arguments to constructor
- fixed bug #80 (Reader.read might return 0)
- fixed bug #57 (Ambiguous error message in macro expansion)
- fixed bug #89 (Syntax error in input may cause NullPointerException)
- fixed bug #85 (Need to defend against path blanks in jflex bash script)
- fixed bug #82 (EOF actions may be ignored for same lex state)
- fixed bug #81 (syntax error in generated ZZ_CMAP)
- fixed bug #77 (lookahead and "|" actions)
- fixed bug #74 (yytext() longer than expected with lookahead)
- fixed bug #73 (OS/2 Java 1.1.8 Issues)
- fixed bug #40 (dangerous lookahead check may fail)   

## JFlex 1.4.1
(November 7, 2004)

- merged in patch by Don Brown (fixes #70 Uses Old JUnit method assertFalse)
- merged in patch by Don Brown (fixes #62 buffer expansion bug in yy_refill())
  Thanks to Binesh Bannerjee for providing a simpler test case for this problem.
- fixed bug #69 (ArrayIndexOutOfBounds in IntCharSet)
- fixed bug #68 (Cannot use lookahead with ignorecase)
- converted dangerous lookahead error to warning
- print info for EOF actions as well in `%debug` mode
- fixed line number count for EOF actions
- internal: removed unused methods in LexScan.flex and IntCharSet

## JFlex 1.4
(April 12, 2004)

- new, very fast minimization algorithm (also fixes memory issues)
- general efficient lookahead algorithm
- new `--jlex` option for strict compatibility to JLex.
  Currently it changes `%ignorecase` to JLex semantics, that is, character classes 
  are interpreted in a caseless way, too.  
  (fixes bus #59, `%ignorecase` ignored by char classes).
  Thanks to Edward D. Willink for spotting the incompatibility.
- support for even larger scanners (up to 64K DFA states)
  Thanks to Karin Vespoor.
- implemented faster character classes (feature request #143).
  Expressions like `[a-z] | [A-Z]` are interpreted as one atomic class
  `[a-zA-Z]`, reducing NFA states and generation time significantly
  for some specifications. This affects the generation process only,
  generated scanners remain the same.
- new `%apiprivate` switch that causes all generated and skeleton
  methods to be made private
- allow user defined javadoc class comments
- optional parameter to `%eofclose`: `%eofclose false` turns off
  `%eofclose` if it was turned on previously (e.g. by `%cup`) (Fixes bug #63)
- removed eclipse compiler warnings for generated classes
  (feature request #144)
- new `%apiprivate` switch (feature request #141/1) that causes all 
  generated and skeleton methods to be made private. Exceptions to this
  are user defined functions and the constructor. Thanks to Stephen 
  Ostermiller for the suggestion.
- allow user defined javadoc class comments (feature request #141/2)
  If the user code section ends with a javadoc comment, JFlex takes this
  instead of the generated comment. Thanks to Stephen Ostermiller for 
  the suggestion.  
- fixed bug #50 (undefined macros in complement expressions do 
  not throw exception in generator). Thanks to Stephen Ostermiller
  for the bug report.
- fixed bug #51 (yypushStream/yypopStream in skeleton.nested 
  work as advertised)
- fixed bug #57 (no wrong macro warnings on regexp negation)
- fixed bug #58 (%cupsym now also affects %cupdebug)
  Thanks to Eric Schweitz for the fix.
- fixed bug #52 (single-line %initthrow works now 
  in case of extra whitespace before newline)
- `yyreset()` does no longer close the associated reader (use yyclose() 
  explicitly for that). Makes some reader objects reusable (feature
  request #140). Thanks to Stephen Ostermiller for the suggestion.  
- fixed modifier order in generated code, removes jikes compiler warnings
  Thanks to Michael Wildpaner for the fix.
- ant task now also works with ant >= 1.4 (fixes bug #54)
- `yyreset()` does not declare an execption any more (fixes bug #65)
- `%cup` does not include %eofclose in JLex mode (`—jlex`). (Fixes bug #63)
- some internal changes: jflex build script switched to ant, better
  integration with build tools and IDEs, change scheme for generated
  names to comply with Java naming standard
- internal: change naming scheme for generated internal variables from 
  `yy_` to `zz` to comply with Java naming standard. Thanks to Max Gilead 
  for the patch.


## JFlex 1.3.5
(October 8, 2001)

- fixed all bugs reported for version 1.3.4. Thanks to
  Amin Ahmad and Fred Wehrhahn for their excellent bug reports.
- implemented feature request #137: vim syntax file.  
  Thanks to Michael Brailsford for his help and suggestions.
- JFlex should run with JDK 1.1 out-of-the-box again.


## JFlex 1.3.4
(October 1, 2001)

- fixed all bugs reported for version 1.3.3. Thanks to Mike Akerman
  for his excellent bug reports and his help.
- implemented feature request #138: exclusive start states.
  Thanks to Ed Beroset for the suggestion.
- introduced `%s` and `%x` shorthands for state declarations


## JFlex 1.3.3
(September 21, 2001)

- fixed all reported bugs except #40 (lookahead check at generation
  time may fail).  Thanks to Axel Schwolow, Karl Meissner, Angelo
  Borsotti, and Paolo Di Francesco for their excellent bug reports.
- enhanced %debug output. JFlex scanners in debug mode now print line,
  column, matched text, and executed action (with line number in spec)
  for each processed token.  Thanks to Karl Meissner for the suggestion.  
- introduced %cupdebug directive for readable CUP debugging. Generated
  scanners print line, column, matched text, and CUP symbol name for
  each returned token. Again thanks to Karl Meissner for tips and
  contributed Java reflection code.
- new `%cupsym` to customize CUP generated symbols class name. Thanks 
  to Karl Meissner and Paolo Di Francesco.
- new `%throws` as shorthand for `%yylexthrow`
- code generation now customizable at command line with `—table`,
  `—pack`, and `—switch` 
- command line switch `—info` prints system and JVM information (useful
  for bug reports) 
- command line switch `—nobak` for not generating backup files
- an Ant task for the Ant build tool http://jakarta.apache.org/ant/
  contributed by Rafal Mantiuk. Many thanks to him.
- better error message for missing ] in char class. Thanks to Karl
  Meissner.
- performance enhancements in the runtime system. The engine is now
  10%-50% faster. These are only the first implementations of a few of
  the many suggestions from Angelo Borsotti. Thanks to Angelo for many
  insights, tips, and fruitful discussions.
- a new warning if a rule can never be matched 
- macros and regular expression can now span multiple lines (note
  that `|` at the end of a line in a rule is a special action, 
  not the `|` operator)
- updated the manual to contain more information about the generated
  class, clarified the description of lexical states. Thanks to Michael 
  Binz, Angelo Borsotti, Vasily Karyaev and  for the suggestions.
- Simplified java example lexer, and allow // style comments at EOF.
  Thanks to Thomas Mulcahy.
- Byacc/J example updated to version 1.1
- New interpreter example using CUP. Thanks to Bernhard Rumpe for
  the code.
  
  
## JFlex 1.3.2
(February 24, 2001)

- fixed bug #31 (this time for real). Thanks to Thilo Goetz for 
  his quick report.
- updated the binary scanning example with the more comprehensive and 
  usable class StraightStreamReader by Stephen Ostermiller. Thanks go to
  him for his contribution. The original version of this class is at
  http://www.smo.f2s.com/utils/
- added a link to a Japanese translation of the JFlex manual (it's in Japanese
  Shift_JIS encoding). The translation is for an older release (1.1.2), but
  most of the text still applies to the current version. See the change log
  for the differences between 1.1.2 and the current version. Many thanks to
  Yuichi Nakajima, Yukio Ikeda, Katsuhiko Yamazaki, and Koji Ooya for
  their efforts.
  If you would like to translate the JFlex manual into another language, or
  if you already have done so, please let me know. I will include a link to
  it on the documentation page. I can also give you access to the latex
  sources of the manual, so that printable versions of your translation can
  be generated, too.
  
  
## JFlex 1.3.1
(February 20, 2001) 

- fixed all JFlex bugs reported for 1.3 (bugs #31-#35)
  Thanks to Hans Kratz, Vasily Karyaev, Alexey Yakovets, and Tom Moog for
  their excellent reports.
- added two new example scanners:
  . a demonstration how to scan binary files
  . a small calculator example for Cup, based on the example in the Linux
    Gazette by Richard A. Sevenich and Christopher Lopes. See also
    http://www.linuxgazette.com/issue39/sevenich.html
    http://www.linuxgazette.com/issue41/sevenich.html
    http://www.linuxgazette.com/issue41/lopes/lopes.html
- manual section about encodings, platforms and Unicode.
  Thanks to Stephen Ostermiller for his valuable input.
- `switch` for skipping the minimization step in DFA generation (--nomin). 
  This feature is still in alpha status and not yet extensively tested. It
  might be useful when you have very large scanners and not much memory
  available.
- `switch` for generating graphviz dot files for graphical representation (ps
  or gif) of generated NFA, DFA and minimized DFA (--dot). Might be useful for
  teaching. This feature is also still in alpha status and not fully finished
  yet. It is included as preview, comments are welcome, please try it out and
  tell me what you think. For information on graphviz see
  http://www.research.att.com:80/sw/tools/graphviz/
- changed to `—style` long command line switches (single - still recognized).
- moved part of the project to http://sourceforge.net/projects/jflex/


## JFlex 1.3
(October 21, 2000) 

- Fixed all bugs reported for 1.2.2 (bugs #20-#28). 
- empty charclass `[]`
- any (=negated empty) charclass `[^]`
- new negation operator `!` for regexps
- new upto operator `~` for regexps
- customizable buffer size with `%buffer`
- `char yycharat(int)` for efficient access to single characters in
  matched text
- split up of too large lex tables for even larger scanner sizes
- external skeleton with support for nested input streams
- customize for internal error handling in `yy_ScanError`
- new `resetStream` method for reusing scanner objects
- [BYacc/J](http://byaccj.sourceforge.net) support (`%byaccj`)
- include files in lexer specs with `%include`
- Better start script for Linux. 
- JLex compatibility: BOL ^ and EOL $ use [unicode line separators]( 
  http://www.unicode.org/unicode/reports/tr18/tr18-5.1.html). 
- New `--dump` switch for a dump of the generated charclasses, NFA, DFA,
  and minimized DFA tables. 

  
## JFlex 1.2.2
(August 23, 1999)

- Updated JFlex to the new CUP version 0.10j. 
- Eliminated some remaining platform dependent newlines in the generated source code 
  (affecting the readabilty of the generated code only, no functional changes). 
- Minor improvements in error reporting (out of memory). 
- Added a `—version` command line option for printing the current jflex version. 
- Updated the Java 1.2 lexer/parser example to CUP 0.10j. 

  
## JFlex 1.2.1
(June 25, 1999)

- Fixed all bugs reported for version 1.2 (#17-#19). 
- Webpage redesigned and moved to [jflex.de](http://www.jflex.de/). 
- Example java lexer/parser switched to Java 1.2. 

  
## JFlex 1.2
(March 21, 1999)

- Fixed all bugs for 1.1.2.
- external scanner skeleton files
- `<<EOF>>` rules as in lex and flex.
- `|` action as in flex
- arbitrary trailing context with the `/` operator
- `%extends` option for subclassing
- `%final` and `%abstract` class modifiers
- more conventient declaration of exceptions
- `%pack` now uses string packing, 
- `%pack` now default code generation method, 
- new `%switch` directive for old default code generation method, 
- more convenient declaration of exceptions, 
- new `%int` switch, 
- Significant Unicode optimizations in scanning and generation performance, 
- changed the empty string match wrt. EOF behavior to the one that is commonly expected. 
- better error messages
- better generation speed
- better generation memory efficiency
- JFlex now works again with Solaris JIT. 
- command line switches for more customization
- new GUI without any console output
- uses jar file
- included makefile for JFlex, 
- manual now written in latex, available as html and in printable .ps.gz and pdf file formats. 

  
## JFlex 1.1.2
- All bugs reported for version 1.1.1 (#8-#10) have been fixed. 
  
  
## JFlex 1.1.1
- All bugs reported for version 1.1 (i.e. bug #7 and feature request #6) have been fixed. 
- Scanning speed was optimized further. 
  
  
## JFlex 1.1
- Revised directory structure. 
- Fixed all reported bugs (#1-#5 and some unreported ones). 
- Fixed thousands of typos in the manual. 
-   whitespace characters `" "` (space) and `"\t"` (tab) in regular
    expressions
-   flex style repeat expressions `r{n}` and `r{n,m}`
- `%caseless` switch for case insensitive scanners
- `%eofclose` switch for closing the input stream automatically at the end of file, 
- method for closing the input stream, 
- method for getting the current lexical state, 
- method for rereading matched text, 
- backup of files that are overwitten in the generation process, 
- improved error reporting, 
- graphical UI when no filename is provided on the commandline 
  
  
