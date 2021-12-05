;;; editor/meow/init.el -*- lexical-binding: t; -*-

;; Rewriting the doom-localleader-key! macro to add support for meow mode
(until (featurep! :editor meow +keypad)
       (defmacro define-localleader-key! (&rest args)
         `(general-define-key
           :keymaps '(meow-normal-state-keymap meow-motion-state-keymap)
           :major-modes t
           :prefix doom-localleader-key
           ,@args)
         `(general-define-key
           :keymaps 'meow-insert-state-keymap
           :major-modes t
           :prefix doom-localleader-alt-key
           ,@args)))
