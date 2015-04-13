---
title: JFlex mode for XEmacs
---

This page describes the XEmacs major mode for JFlex.

It currently supports the following features:

-   **Syntax highlighting** (with font-lock) for JFlex keywords and Java  actions
-   **Automatic indentation** during typing (with TAB)

This version is somewhat preliminary (only one level of highlighting in
actions, some indentation may not work yet, no customizations possible yet). It
is ancient by now, and was tested with XEmacs 21.1 and 21.4, but it should
also run with more recent versions of XEmacs (FSF Emacs might work, too, but I
haven't tried).


-----

## Download

The mode consists of a single Emacs Lisp file: [jflex-mode.el](jflex-mode.el)

-----

## Installation

1.  Put the source file into your load path. That is: 
    (a) Put the file `jflex-mode.el` into the directory `~/.xemacs/lisp`. 
    (b) Compile the file using <kbd>M-x</kbd> `byte-compile-file` <kbd>RET</kbd> `~/.xemacs/lisp/jflex-mode.el` <kbd>RET</kbd>.
2.  Put the following code into your XEmacs init file. That is, open (or
    create) the file `~/.emacs` and insert the following lines:

```
    (autoload 'jflex-mode "jflex-mode" nil t)
    (setq auto-mode-alist (cons '("\\(\\.flex\\|\\.jflex\\)\\'" . jflex-mode) auto-mode-alist))
```

3.  Restart XEmacs.

-----

Syntax highlighting is also available for [vim](vim.html).
