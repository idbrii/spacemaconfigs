;;; packages.el --- visual-regexp Layer packages File for Spacemacs
;;
;; Copyright (c) 2015 idbrii
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar visual-regexp-packages
  '(
    visual-regexp
    visual-regexp-steroids
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar visual-regexp-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function visual-regexp/init-<package-visual-regexp>

(defun visual-regexp/init-visual-regexp ()
  (use-package visual-regexp
    :defer t
    :config
    :init
    ))

(defun visual-regexp/init-visual-regexp-steroids ()
  (use-package visual-regexp-steroids
    :defer t
    :config
    :init
    (evil-leader/set-key
      "gs" 'vr/query-replace
      ;;"rr" 'vr/replace
      )
    ))

;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
