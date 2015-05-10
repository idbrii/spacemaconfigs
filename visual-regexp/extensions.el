;;; extensions.el --- visual-regexp Layer extensions File for Spacemacs
;;
;; Copyright (c) 2015 idbrii
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar visual-regexp-pre-extensions
  '(
    ;; pre extension visual-regexps go here
    )
  "List of all extensions to load before the packages.")

(defvar visual-regexp-post-extensions
  '(
    ;; post extension visual-regexps go here
    )
  "List of all extensions to load after the packages.")

;; For each extension, define a function visual-regexp/init-<extension-visual-regexp>
;;
;; (defun visual-regexp/init-my-extension ()
;;   "Initialize my extension"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
