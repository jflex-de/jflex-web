---
title: JFlex syntax highlighting for Vim
---

# JFlex syntax highlighting for Vim


This page describes the vim syntax file for JFlex. It exentends vim's syntax
highlighting to JFlex specifications. It recognizes JFlex keywords, macro
definitions, and Java actions.

The vim syntax file is also part of the JFlex distribution (in the `lib/`
directory)

---

## Download


JFLex Vim syntax file: [jflex.vim](jflex.vim)


---

## Installation


1.  Put the file `jflex.vim` into the directory `~/.vim/syntax`.

2.  Put the following code at the end of your vim init file `~/.vimrc`:

         augroup filetype                                                     
           au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex         
         augroup END                                                          
         au Syntax jflex    so ~/.vim/syntax/jflex.vim                        


---

Syntax highlighting is also available for [XEmacs](emacs.html).