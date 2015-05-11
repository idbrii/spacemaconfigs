;; -*- mode: dotspacemacs -*-
;; vim: set ft=lisp :
;; Loaded by Spacemacs at startup.
;; It must be stored in your home directory.
;; Quick jump here with SPC f e d (file edit dot)

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/data/settings/spacemaconfigs/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers '(
                                       (git :variables
                                            git-enable-github-support nil) ;; requires github login
                                       ;; This layer is broken see #790: c-c++
                                       auto-completion
                                       better-defaults
                                       csharp
                                       golden-ratio
                                       markdown
                                       org
                                       python
                                       syntax-checking
                                       visual-regexp
                                       visual-regexp-steroids
                                       )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    ace-jump-mode
                                    evil-escape
                                    )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Specify the startup banner. If the value is an integer then the
   ;; banner with the corresponding index is used, if the value is `random'
   ;; then the banner is chosen randomly among the available banners, if
   ;; the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'random
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn
                         monokai
                         solarized-dark
                         solarized-light
                         leuven
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`
   dotspacemacs-major-mode-leader-key "\\"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 50
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil)
  ;; User initialization goes here
  )

(defsubst evil-leader-nmap (key command)
  (evil-leader/set-key key command))

(defsubst evil-map (mode key command)
  (define-key mode (kbd key) command))

(defsubst evil-vmap (key command)
  (evil-map evil-visual-state-map key command))

(defsubst evil-nmap (key command)
  (evil-map evil-normal-state-map key command)
  (evil-map evil-motion-state-map key command))

(defsubst evil-imap (key command)
  (evil-map evil-insert-state-map key command))


(defun evil-copy-to-end-of-line ()
  "From http://mattbriggs.net/blog/2012/02/27/awesome-emacs-plugins-evil-mode/"
  (interactive)
  (evil-yank (point) (point-at-eol)))

(defun evil-david-paste-from-clipboard ()
  (interactive)
  (evil-paste-from-register "*"))

;; Act like my vim Ctrl-L
(defun evil-david-clear-screen ()
  (interactive)
  (evil-normal-state)
  (evil-search-highlight-persist-remove-all)
  (redraw-display))

(defun dotspacemacs/config ()
  "Configuration function.
  This function is called at the very end of Spacemacs initialization after
  layers configuration."

  ;; Settings

  ;; Show file info instead of emacs info.
  (setq frame-title-format "%b (%f)")

  ;; Use something vertical. bar is also nice.
  (setq powerline-default-separator 'box)

  ;; Follow symlinks automatically.
  (setq vc-follow-symlinks t)

  (defun nox/show-startup-time ()
    "Show Emacs's startup time in the minibuffer
    via https://github.com/noahfrederick/dots/blob/master/emacs.d/emacs.org"
    (message "Startup time: %s seconds."
             (emacs-uptime "%s")))
  (add-hook 'emacs-startup-hook 'nox/show-startup-time 'append)

  ;; I never want to use emacs-style i-search. C-s is too valuable when I can
  ;; use evil and keeping it around is too confusing.
  (global-unset-key (kbd "C-r")) ;; necessary for helm remapping
  (global-unset-key (kbd "C-s"))

  ;; Vim-style no clipboard modification
  ;;(setq x-select-enable-clipboard nil)

  ;; Map config

  ;; I want to use C-l, but I don't think that's supported. I've disabled evil-escape.
  ;;(setq-default evil-escape-key-sequence "C-l")

  ;; Map plugins

  (defun david-minibuffer-hook ()
    "Make minibuffer work more like readline and vim."
    (define-key helm-map (kbd "C-w") 'backward-kill-word)
    (define-key helm-map (kbd "C-u") 'backward-kill-paragraph)
    ;; helm-yank-text-at-point is like getting a word
    ;; (local-unset-key (kbd "C-r")) ;; Remove the old keybinding to prevent prefix errors
    ;; (define-key helm-map (kbd "C-r") nil)
    ;; (define-key helm-map (kbd "C-r w") 'helm-yank-text-at-point)
    ;; TODO: These probably need an association with helm-map.
    (define-prefix-command 'minibuffer-vimlike-map)
    ;;(global-set-key (kbd "C-r") 'minibuffer-vimlike-map)
    ;;(define-key minibuffer-vimlike-map (kbd "C-r w") 'helm-yank-text-at-point)
    ;;(define-key minibuffer-vimlike-map (kbd "C-r \"") 'evil-paste-after)
    ;;(define-key minibuffer-vimlike-map (kbd "C-r '") 'evil-paste-after)
    ;;(define-key minibuffer-vimlike-map (kbd "C-r 0") 'evil-paste-yanked-after)
    )
  (add-hook 'minibuffer-setup-hook 'david-minibuffer-hook)

  ;; Map Evil

  ;; More useful double leader.
  (evil-leader-nmap "SPC" 'helm-M-x)


  ;; File jumping

  ;; This could be a function if I used and understood lexical-binding.
  (defmacro david-switch-to-buffer (buffername filename)
    "Create a function that will switch to the given buffer
    via http://stackoverflow.com/q/660555/79125"
    (let ((funsymbol (intern (concat "david-switch-to-" buffername))))
      `(defun ,funsymbol ()
         (interactive)
         (find-file ,filename))))

  (evil-leader-nmap "f a" (david-switch-to-buffer "aside" "~/.vim-aside"))
  (evil-leader-nmap "f e t" (david-switch-to-buffer "vimusers-tutorial" "~/data/settings/spacemaconfigs/emacs.d/doc/VIMUSERS.md"))


  ;; vim-vinegar
  ;; via https://github.com/noahfrederick/dots/blob/master/emacs.d/emacs.org
  (autoload 'dired-jump "dired-x"
    "Jump to Dired buffer corresponding to current buffer." t)
  (evil-nmap "-" 'dired-jump)
  (evil-define-key 'normal dired-mode-map "-" 'dired-up-directory)


  ;; Vim consistency

  ;; I'm used to c for surround in visual mode.
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
  (evil-define-key 'visual evil-surround-mode-map "c" 'evil-surround-region)

  ;; nnoremap Y y$
  (evil-nmap "Y" 'evil-copy-to-end-of-line)

  ;; Formatting without moving cursor
  (evil-nmap "Q" 'evil-fill)


  ;; My vim quirks

  ;; My long-standing confused map. SPC b b does the same thing.
  (evil-nmap "^" 'evil-switch-to-windows-last-buffer)

  ;; CUA for some cases and their remappings.
  (evil-nmap "C-v" 'evil-david-paste-from-clipboard)
  (evil-nmap "C-q" 'evil-visual-block)

  ;; Retain * behavior in visual mode and use g* to search for selection.
  ;; TODO: Does search without word boundaries. That's close, but not quite the same.
  (evil-vmap "*" 'evil-search-unbounded-word-forward)
  (evil-vmap "g *" 'evil-visualstar/begin-search-forward)

  ;; Fast replace. Use C-q C-j to insert newlines: http://stackoverflow.com/a/22443616/79125
  ;; Emacs C-q is for literal insertion like vim C-v.
  ;; TODO: Use vim's 'wrapscan' behavior:
  ;; http://unix.stackexchange.com/questions/48289/emacs-m-x-query-replace-wrap-around-the-document
  (evil-nmap "g s" 'vr/query-replace)
  (evil-vmap "g s" 'vr/query-replace)


  (global-unset-key (kbd "C-l")) ;; Remove the old keybinding
  (evil-nmap "C-l" 'evil-david-clear-screen)
  (evil-imap "C-l" 'evil-david-clear-screen)


  ;; Source Control

  ;; TODO: Make commits verbose by default
  ;; Howto that causes me errors: http://emacs.stackexchange.com/questions/3893/how-can-i-make-verbose-flag-be-enabled-by-default-in-magit-commit-screen
  (evil-leader-nmap "g i" 'magit-status)
  (evil-leader-nmap "g d" 'vc-ediff)
  ;; Split ediff windows based on window size.
  (setq ediff-split-window-function 'split-window-sensibly)
  ;; Top/bottom split doesn't work without multiframe.
  (setq ediff-window-setup-function 'ediff-setup-windows-multiframe)

  ;; Use jk to move up and down and hl to copy text left and right.
  ;; via http://oremacs.com/2015/01/17/setting-up-ediff/
  (defun david-ediff-hook ()
    (define-key ediff-mode-map "j" 'ediff-next-difference)
    (define-key ediff-mode-map "k" 'ediff-previous-difference)
    (define-key ediff-mode-map "l" 'ediff-copy-A-to-B)
    (define-key ediff-mode-map "h" 'ediff-copy-B-to-A))
  (add-hook 'ediff-keymap-setup-hook 'david-ediff-hook)

  ;; Window management

  (evil-leader-nmap "w o" 'delete-other-windows)
  (evil-leader-nmap "w q" 'evil-window-delete)
  (evil-nmap "C-w q" 'evil-window-delete) ;; Not sure why this isn't defined already.

  ;; golden-ratio-adjust requires golden ratio to be loaded, so require
  ;; it. Ref syl20bnr/spacemacs#1551.
  (require 'golden-ratio)
  (defsubst david-golden-ratio-adjust ()
    "Invoke golden-ratio with default adjustment ratio."
    (interactive)
    (golden-ratio-adjust golden-ratio-adjust-factor))
  (evil-leader-nmap "w -" 'david-golden-ratio-adjust)
  (evil-nmap "C-w -" 'david-golden-ratio-adjust)

  (evil-leader-nmap "w +" 'maximize-window)
  (evil-nmap "C-w +" 'maximize-window)


  ;; TODO: some of my maps are only active if I manually source this file.

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
