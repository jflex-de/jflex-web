---
title: Installing
---

Installing and Running JFlex {#Installing}
============================

Installing JFlex
----------------

### Windows

To install JFlex on Windows, follow these three steps:

1.  Unzip the file you downloaded into the directory you want JFlex in. 
    If you unzipped it to say `C:\`, the following directory structure
    should be generated:
    
```
    C:\jflex-$VERSION\ 
        +--bin\                        (start scripts) 
        +--doc\                        (FAQ and manual) 
        +--examples\ 
            +--byaccj\                 (calculator example for BYacc/J) 
            +--cup-maven\              (calculator example for cup and maven) 
            +--interpreter\            (interpreter example for cup) 
            +--java\                   (Java lexer specification) 
            +--simple-maven\           (example scanner built with maven) 
            +--standalone-maven\       (a simple standalone scanner, 
                                        built with maven) 
            +--zero-reader\            (Readers that return 0 characters) 
        +--lib\                        (precompiled classes) 
        +--src\ 
            +--main\ 
                +--config\             (PMD source analyzer configuration) 
                +--cup\                (JFlex parser spec) 
                +--java\ 
                    +--jflex\          (source code of JFlex) 
                        +--anttask\    (source code of JFlex Ant Task) 
                        +--gui\        (source code of JFlex UI classes) 
                        +--unicode\    (source code for Unicode properties) 
                +--jflex\              (JFlex scanner spec) 
                +--resources\          (messages and default skeleton file) 
            +--test\                   (unit tests)
```

2.  Edit the file **`bin\jflex.bat`** (in the example it’s
    `C:\jflex-$VERSION\bin\jflex.bat`) such that

    -   **`JAVA_HOME`** contains the directory where your Java JDK is
        installed (for instance `C:\java`) and

    -   **`JFLEX_HOME`** the directory that contains JFlex (in the
        example: `C:\jflex-$VERSION`)

3.  Include the `bin\` directory of JFlex in your path. (the one that
    contains the start script, in the example: `C:\jflex-$VERSION\bin`).


### Mac/Unix with tar

To install JFlex on a Mac or Unix system, follow these two steps:

-   Decompress the archive into a directory of your choice with GNU tar,
    for instance to `/usr/share`:

    `tar -C /usr/share -xvzf jflex-$VERSION.tar.gz`

    (The example is for site wide installation. You need to be root for
    that. User installation works exactly the same way — just choose a
    directory where you have write permission)

-   Make a symbolic link from somewhere in your binary path to
    `bin/jflex`, for instance:

    `ln -s /usr/share/jflex-$VERSION/bin/jflex /usr/bin/jflex`

    If the Java interpreter is not in your binary path, you need to
    supply its location in the script `bin/jflex`.

You can verify the integrity of the downloaded file with the SHA1 checksum
available on the [JFlex download page](http://jflex.de/download.html). If you
put the checksum file in the same directory as the archive, and run:

`shasum --check jflex-$VERSION.tar.gz.sha1`

it should tell you

`jflex-$VERSION.tar.gz: OK`


Running JFlex
-------------

You run JFlex with:

`jflex <options> <inputfiles>`

It is also possible to skip the start script in `bin/` and include the
file `lib/jflex-$VERSION.jar` in your `CLASSPATH` environment
variable instead.

Then you run JFlex with:

`java jflex.Main <options> <inputfiles>`

or with:

`java -jar jflex-$VERSION.jar <options> <inputfiles>`

The input files and options are in both cases optional. If you don’t
provide a file name on the command line, JFlex will pop up a window to
ask you for one.

JFlex knows about the following options:

`-d <directory>`\
writes the generated file to the directory `<directory>`

`--encoding <name>`\
uses the character encoding `<name>` (e.g. `utf-8`) to read lexer
specifications and write java files.

`--skel <file>`\
uses external skeleton `<file>`. This is mainly for JFlex maintenance
and special low level customisations. Use only when you know what you
are doing! JFlex comes with a skeleton file in the `src` directory that
reflects exactly the internal, pre-compiled skeleton and can be used
with the `-skel` option.

`--nomin`\
skip the DFA minimisation step during scanner generation.

`--jlex`\
tries even harder to comply to JLex interpretation of specs.

`--dot`\
generate graphviz dot files for the NFA, DFA and minimised DFA. This
feature is still in alpha status, and not fully implemented yet.

`--dump`\
display transition tables of NFA, initial DFA, and minimised DFA

`--legacydot`\
dot (`.`) meta character matches `[^\n]` instead of\
`[^\n\r\u000B\u000C\u0085\u2028\u2029]`

`--verbose` or `-v`\
display generation progress messages (enabled by default)

`--quiet` or `-q`\
display error messages only (no chatter about what JFlex is currently
doing)

`--warn-unused`\
warn about unused macros (by default true in verbose mode and false in
quiet mode)

`--no-warn-unused`\
do not warn about unused macros (by default true in verbose mode and
false in quiet mode)

`--time`\
display time statistics about the code generation process (not very
accurate)

`--version`\
print version number

`--info`\
print system and JDK information (useful if you’d like to report a
problem)

`--unicodever <ver>`\
print all supported properties for Unicode version `<ver>`

`--help` or `-h`\
print a help message explaining options and usage of JFlex.


JFlex Ant Task
--------------

JFlex can easily be integrated with the [Ant](http://ant.apache.org/)
build tool. To use JFlex with Ant, simply copy the `lib/jflex-$VERSION.jar`
file to the `$ANT_HOME/lib/` directory or explicitly set the path to
`lib/jflex-$VERSION.jar` in the task definition (see example below).

The JFlex Ant Task invokes JFlex on a grammar file.

To use the JFlex task, place the following line in the Ant build file:

    <taskdef classname="jflex.anttask.JFlexTask" name="jflex" />

Or, setting the path to the JFlex jar explicitly:

    <taskdef classname="jflex.anttask.JFlexTask" name="jflex"
             classpath="path-to-jflex.jar" />

The JFlex task requires the `file` attribute to be set to the source
grammar file (`*.flex`). Unless the target directory is specified with
the `destdir` option, the generated class will be saved to the same
directory where the grammar file resides. Like `javac`, the JFlex task
creates subdirectories in `destdir` according to the generated class
package.

This task only invokes JFlex if the grammar file is newer than the
generated files.

### Parameters

The following attributes are available for invoking the JFlex task.

-  `file="file"`\
    The grammar file to process. This attribute is required.

-  `destdir="dir"`\
    The directory to write the generated files to. If not set, the files are
    written to the directory containing the grammar file. Note that unlike
    JFlex's `-d` command line option, `destdir` causes the generated file to
    be written to `{destdir}/`**`{packagename}`**. This behaviour is similar
    to `javac -d dir.

-  `outdir="dir"`\   
    The directory to write the generated files to. If not set, the files are
    written to the directory containing the grammar file. This options works
    exactly like JFlex's `-d` command line option, it causes the output file
    to be written to `dir` regardless of the package name.

-  `verbose` (default `"off"`)\
    Display generation process messages.                     

-  `encoding` (if unset uses the JVM default encoding)\
    The character encoding to use when reading lexer specifications and writing java files.

-  `dump` (default `"off"`)\           
    Dump character classes, NFA and DFA tables.                           

-  `time` or `timeStatistics` (default `"off"`)\
    Display generation time statistics.

-  `nomin` or `skipMinimization` (default `"off"`)\
    Skip DFA minimisation step.                  

-  `skel="file"` or `skeleton="file"`\
    Use external skeleton file.                        

-  `dot` or `generateDot` (default `"off"`)\
    Write graphviz `.dot` files for the generated automata.

-  `nobak` (default `"off"`)\
    Do not make a backup if the generated file exists.

-   `jlex` (default `"off"`)\
    Use JLex compatibility mode.

-  `legacydot` (default `"off"`)\
    The dot `.` meta-character matches `[^\n]` instead of `[^\n\r\u000B\u000C\u0085\u2028\u202 9]`

-  `unusedwarning` (default `"true"`)\
    Warn about unused macro definitions in the lexer specification.


### Example

After the task definition, the `<jflex ..>` task is available in Ant. For
example:

     <jflex
         file="src/parser/Parser.flex"
         destdir="build/generated/"
     />

JFlex generates the scanner for `src/parser/Scanner.flex` and
saves the result to `build/generated/parser/`, providing `Scanner.flex`
is declared to be in package `parser`.

     <jflex
         file="src/parser/Scanner.flex"
         destdir="build/generated/"
     />
     <javac
         srcdir="build/generated/"
         destdir="build/classes/"
     />

The same as above plus compile generated classes to `build/classes`

