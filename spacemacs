;; -*- mode: emacs-lisp -*-
;; vim: set ft=lisp :
;; Loaded by Spacemacs at startup.
;; It must be stored in your home directory.
;; Quick jump here with SPC f e d (file edit dot)

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/data/settings/spacemaconfigs/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers '(
                                       (git :variables
                                            git-enable-github-support nil) ;; requires github login
                                       ;; This layer is broken see #790: c-c++
                                       '(auto-completion :variables
                                                         auto-completion-use-tab-instead-of-enter t)
                                       better-defaults
                                       csharp
                                       golden-ratio
                                       markdown
                                       org
                                       python
                                       ;; TODO: p4
                                       syntax-checking
                                       visual-regexp
                                       visual-regexp-steroids
                                       '((c-c++ :variables
                                                c-c++-default-mode-for-headers 'c++-mode
                                                ;;c-c++-enable-clang-support t
                                                ))
                                       ;; ----------------------------------------------------------------
                                       ;; Example of useful layers you may want to use right away.
                                       ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
                                       ;; <M-m f e R> (Emacs style) to install them.
                                       ;; ----------------------------------------------------------------
                                       emacs-lisp
                                       ;; spell-checking
                                       ;; version-control
                                       ;; (shell :variables
                                       ;;        shell-default-height 30
                                       ;;        shell-default-position 'bottom)
                                       )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
                                      ;; Github example from spacemacs packages.el: (evil-indent-textobject :location (recipe :fetcher github :repo "TheBB/evil-indent-textobject"))

                                      ;; Not yet in melpa. evil-textobj-word-column ;; https://github.com/noctuid/evil-textobj-word-column
                                      ;; This doesn't seem to work either.
                                      ;;(evil-textobj-word-column
                                      ;; :location (recipe
                                      ;;            :fetcher github
                                      ;;            :repo "noctuid/evil-textobj-word-column"))
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    ace-jump-mode
                                    evil-escape
                                    )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   ;;dotspacemacs-themes '(spacemacs-dark
   ;;                      spacemacs-light)
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
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; This looks terrible.
   ;; dotspacemacs-default-font '("ProggyCleanTT"
   ;;                             :size 12
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key "\\"
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 50
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ))





;; This is supposed to be defined somewhere in spacemacs.
;; via http://emacs.stackexchange.com/a/12303/8283
(defmacro evil-map (state key seq)
  "Map for a given STATE a KEY to a sequence SEQ of keys.
Can handle recursive definition only if KEY is the first key of SEQ.
Example: (evil-map visual \"<\" \"<gv\")"
  (let ((map (intern (format "evil-%S-state-map" state))))
    `(define-key ,map ,key
       (lambda ()
         (interactive)
         ,(if (string-equal key (substring seq 0 1))
              `(progn
                 (call-interactively ',(lookup-key evil-normal-state-map key))
                 (execute-kbd-macro ,(substring seq 1)))
            (execute-kbd-macro ,seq))))))

(defsubst evil-leader-nbind (key command)
  "evil-leader-nbind is a convenience function to bind normal mode leader keys
    to emacs functions."
  (evil-leader/set-key key command))

(defsubst evil-bind (mode key command)
  "evil-bind is a convenience function to bind keys to emacs functions.

    See also evil-map to do vim-like remappings of keys."
  (define-key mode (kbd key) command))

(defsubst evil-vbind (key command)
  (evil-bind evil-visual-state-map key command))

(defsubst evil-nbind (key command)
  (evil-bind evil-normal-state-map key command)
  (evil-bind evil-motion-state-map key command))

(defsubst evil-ibind (key command)
  (evil-bind evil-insert-state-map key command))


(defun evil-david-paste-from-clipboard ()
  (interactive)
  (evil-paste-from-register "*"))

;; Act like my vim Ctrl-L
(defun evil-david-clear-screen ()
  (interactive)
  (evil-normal-state)
  (evil-search-highlight-persist-remove-all)
  (redraw-display))

;; shutdown emacs server instance. Used from bash aliases.
(defun david-server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server.
    Used from bash aliases to kill or restart emacs."
  (interactive)
  (let
      ;; Ensure we use gui prompts for confirmation.
      ;; via http://stackoverflow.com/a/2270603/79125
      ((last-nonmenu-event nil))
    (save-buffers-kill-emacs)))

(defun evil-get-word-column-region ()
  "Look at the symbol at point, search backward and place the point before a
symbol, and search forward and place the mark after a symbol such that all lines
have identical symbols at identical goal columns as the symbol at point."
  ;; Source: https://www.reddit.com/r/emacs/comments/3vz6lx/command_to_rectangle_select_a_column_of_text/cxs5vfn
  ;; With tweaks from: https://github.com/noctuid/evil-textobj-word-column
  (evil-normal-state)
  (interactive)
  (let (upper-pt lower-pt (next-line-add-newlines t))
    (save-excursion
      (let ((target (format "%s" (symbol-at-point))))
        (while (looking-back "\\(\\sw\\|\\s_\\)" 1)
          (backward-char 1))
        (with-no-warnings
          (save-excursion
            (next-line 1)
            (while (looking-at target)
              (setf lower-pt (point))
              (next-line 1)))
          (save-excursion
            (next-line -1)
            (while (looking-at target)
              (setf upper-pt (point))
              (next-line -1))))))
    (when (or upper-pt lower-pt)
      (let ((upper-pt (or upper-pt (point)))
            (lower-pt (or lower-pt (point))))
        (goto-char lower-pt)
        (while (looking-at "\\(\\sw\\|\\s_\\)")
          (forward-char 1))
        (push-mark nil nil t)
        (goto-char upper-pt)
        (while (looking-back "\\(\\sw\\|\\s_\\)" 1)
          (backward-char 1)))))
  (evil-range
   upper-pt lower-pt 'rectangle))
;; hello
;; hello
;; hello
;; hello

;;(evil-define-text-object evil-textobj-word-column-inner-column
;;  (count &optional beg end type)
;;  "Select a word column.
;;COUNT, BEG, END, and TYPE have no effect. This text object cannot take a count."
;;  (evil-get-word-column-region))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;; Settings

  ;; Show file info instead of emacs info.
  (setq frame-title-format "%b (%f)")

  ;; Use something vertical. bar is also nice.
  (setq powerline-default-separator 'box)

  ;; Follow symlinks automatically.
  (setq vc-follow-symlinks t)

  ;; Persistent undo
  ;; via https://plus.google.com/113859563190964307534/posts/JEF3sqRFHVA
  (setq undo-tree-auto-save-history t
        undo-tree-history-directory-alist `(("." . ,(expand-file-name "~/.emacs-cache/undo/"))))

  ;; Use the same history for query-replace and regexp-search.
  ;; via http://emacs.stackexchange.com/questions/12312/how-to-combine-the-history-of-isearch-and-query-replace
  (setq query-replace-from-history-variable 'regexp-search-ring)
  ;; Could use the same history for replacement too, but that seems less useful.
  ;;(setq query-replace-to-history-variable 'regexp-search-ring)

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

  (defun undo-tree-visualizer-toggle ()
    (interactive)
    (if (get-buffer undo-tree-visualizer-buffer-name)
        (undo-tree-visualizer-quit)
      (undo-tree-visualize)))
  (evil-nbind "<f2>" 'undo-tree-visualizer-toggle)

  ;; Readline support
  (defun backward-kill-line ()
    "Kill from cursor to beginning of line.
        via http://stackoverflow.com/a/3888306/79125"
    (interactive)
    (undo-boundary)
    (kill-line 0))
  (evil-ibind "C-u" 'backward-kill-line)

  ;; I use helm functions below so make sure it's loaded.
  (require 'helm)
  (require 'helm-config)
  (defun david-minibuffer-hook ()
    "Make minibuffer work more like readline and vim."
    ;; Basic readline.
    (local-set-key (kbd "C-w") 'backward-kill-word)
    (local-set-key (kbd "C-u") 'backward-kill-line)

    ;; Vim-like C-r prefix for inserting text.
    ;; TODO: This doesn't work.
    (define-prefix-command 'minibuffer-vimlike-map)
    (local-set-key (kbd "C-r") 'minibuffer-vimlike-map)
    ;; helm-yank-text-at-point is like getting a word
    (define-key minibuffer-vimlike-map (kbd "C-r w") 'helm-yank-text-at-point)
    (define-key minibuffer-vimlike-map (kbd "C-r \"") 'evil-paste-after)
    (define-key minibuffer-vimlike-map (kbd "C-r '") 'evil-paste-after)
    (define-key minibuffer-vimlike-map (kbd "C-r 0") 'evil-paste-yanked-after))

  (add-hook 'minibuffer-setup-hook 'david-minibuffer-hook)

  ;; Kinda like K for documentation.
  (define-key helm-map (kbd "C-k") 'helm-execute-persistent-action)


  ;;TODO: Check out hydra to make helm more like unite:
  ;; http://angelic-sedition.github.io/blog/2015/02/03/a-more-evil-helm/
  ;; http://tuhdo.github.io/helm-intro.html#comment-1837294013


  ;; Map Evil

  ;; More useful double leader.
  (evil-leader-nbind "SPC" 'helm-M-x)


  ;; Navigation
  (define-key evil-motion-state-map (kbd "<M-up>") 'evil-jump-backward)
  (define-key evil-motion-state-map (kbd "<M-down>") 'evil-jump-forward)


  ;; File jumping

  ;; This could be a function if I used and understood lexical-binding.
  (defmacro david-switch-to-buffer (buffername filename)
    "Create a function that will switch to the given buffer
    via http://stackoverflow.com/q/660555/79125"
    (let ((funsymbol (intern (concat "david-switch-to-" buffername))))
      `(defun ,funsymbol ()
         (interactive)
         (find-file ,filename))))

  (evil-leader-nbind "f a" (david-switch-to-buffer "aside" "~/.vim-aside"))
  (evil-leader-nbind "f e t" (david-switch-to-buffer "vimusers-tutorial" "~/data/settings/spacemaconfigs/emacs.d/doc/VIMUSERS.md"))

  (evil-nbind "C-w +" 'maximize-window)
  (evil-ibind "C-SPC" 'completion-at-point)

  ;; vim-vinegar
  ;; via https://github.com/noahfrederick/dots/blob/master/emacs.d/emacs.org
  (autoload 'dired-jump "dired-x"
    "Jump to Dired buffer corresponding to current buffer." t)
  (evil-nbind "-" 'dired-jump)
  (evil-define-key 'normal dired-mode-map "-" 'dired-up-directory)


  ;; vim-surround uses r and a for [] and <>
  (setq-default evil-surround-pairs-alist
                (cons
                 '(?r . ("[" . "]"))
                 evil-surround-pairs-alist))
  (setq-default evil-surround-pairs-alist
                (cons
                 '(?a . ("<" . ">"))
                 evil-surround-pairs-alist))

  ;;(evil-map motion "sr" "s[")

  ;; Vim consistency

  ;; I'm used to c for surround in visual mode.
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
  (evil-define-key 'visual evil-surround-mode-map "c" 'evil-surround-region)

  ;; Formatting without moving cursor
  (evil-nbind "Q" 'evil-fill)


  ;; My vim quirks

  ;; Increment/decrement on double chord. I usually use . to repeat and wanted
  ;; C-a free for select all.
  (evil-nbind "C-x C-s" 'spacemacs/evil-numbers-increase)
  (evil-nbind "C-x C-x" 'spacemacs/evil-numbers-decrease)

  ;; My long-standing confused map. SPC b b does the same thing.
  (evil-nbind "^" 'evil-switch-to-windows-last-buffer)

  ;; CUA for some cases and their remappings.
  (evil-nbind "C-v" 'evil-david-paste-from-clipboard)
  (evil-nbind "C-q" 'evil-visual-block)

  ;; gc selects previously changed text. (|gv| but for modification.)
  ;; via http://juanjoalvarez.net/es/detail/2014/sep/19/vim-emacsevil-chaotic-migration-guide/
  (evil-nbind "g c" 'exchange-point-and-mark)

  ;; Retain * behavior in visual mode and use g* to search for selection.
  ;; TODO: Does search without word boundaries. That's close, but not quite the same.
  (evil-vbind "*" 'evil-search-unbounded-word-forward)
  (evil-vbind "g *" 'evil-visualstar/begin-search-forward)

  ;; Fast replace. Use C-q C-j to insert newlines: http://stackoverflow.com/a/22443616/79125
  ;; Emacs C-q is for literal insertion like vim C-v.
  ;; TODO: Use vim's 'wrapscan' behavior:
  ;; http://unix.stackexchange.com/questions/48289/emacs-m-x-query-replace-wrap-around-the-document
  (evil-nbind "g s" 'vr/query-replace)
  (evil-vbind "g s" 'vr/query-replace)


  (global-unset-key (kbd "C-l")) ;; Remove the old keybinding
  (evil-nbind "C-l" 'evil-david-clear-screen)
  (evil-ibind "C-l" 'evil-david-clear-screen)

  ;; TODO: This doesn't work at all. No idea how to fix it.
  ;; nnoremap <Leaderp "0p
  ;;(defsubst evil-paste-yanked-before (COUNT &optional REGISTER YANK-HANDLER)
  ;;  (evil-paste-before COUNT "0" YANK-HANDLER))
  ;;(defsubst evil-paste-yanked-after (COUNT &optional REGISTER YANK-HANDLER)
  ;;  (evil-paste-after COUNT "0" YANK-HANDLER))
  ;;(evil-leader-nbind "P" 'evil-paste-yanked-before)
  ;;(evil-leader-nbind "p" 'evil-paste-yanked-after)
  ;;(evil-leader-vmap "P" 'evil-paste-yanked-before)
  ;;(evil-leader-vmap "p" 'evil-paste-yanked-after)


  ;; Source Control

  (evil-leader-nbind "g i" 'magit-status)
  ;; Expand diff in status window when committing. (Like verbose commits.)
  (setq magit-expand-staged-on-commit 'full)
  (evil-leader-nbind "g d" 'vc-ediff)
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

  (evil-leader-nbind "w o" 'delete-other-windows)
  (evil-leader-nbind "w q" 'evil-window-delete)
  (evil-nbind "C-w q" 'evil-window-delete) ;; Not sure why this isn't defined already.

  ;; golden-ratio-adjust requires golden ratio to be loaded, so require
  ;; it. Ref syl20bnr/spacemacs#1551.
  (require 'golden-ratio)
  (defsubst david-golden-ratio-adjust ()
    "Invoke golden-ratio with default adjustment ratio."
    (interactive)
    (golden-ratio-adjust golden-ratio-adjust-factor))
  (evil-leader-nbind "w -" 'david-golden-ratio-adjust)
  (evil-nbind "C-w -" 'david-golden-ratio-adjust)

  (evil-leader-nbind "w +" 'maximize-window)
  (evil-nbind "C-w +" 'maximize-window)


  ;; My hacked version (see above).
  ;;(define-key evil-inner-text-objects-map "c" 'evil-textobj-word-column-inner-column)
  (define-key evil-inner-text-objects-map "c" 'evil-get-word-column-region)


  ;; TODO: some of my maps are only active if I manually source this file.

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
