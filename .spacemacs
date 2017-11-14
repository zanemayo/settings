;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     python
;;     php
     lua
     csv
     ruby
     go
     yaml
     html
     javascript
     react
     typescript
     racket
     scheme
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (auto-completion
      :variables auto-completion-tab-key-behavior nil
      :disabled-for org git)
     ;; better-defaults
     ;; tabbar
     emacs-lisp
     git
     markdown
     org
     csharp
     haskell
     rust
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     themes-megapack
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(ujelly-theme
                                      base16-theme
                                      paredit
                                      evil-lispy)
                                      ;;rjsx-mode)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(highlight-parentheses)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(tango-plus
                         ujelly
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         anti-zeburn
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Hack"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; Cursor
  (setq-default cursor-type 'box)

  (setq avy-keys (number-sequence ?A ?Z)) (setq avy-translate-char-function #'upcase)

  (spacemacs|use-package-add-hook org
    :pre-init
    (package-initialize)
    )
  (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  (push '(helm . "melpa-stable") package-pinned-packages)
  (setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  (setq scroll-conservatively 101) ;; move minimum when cursor exits view, instead of recentering
  (setq mouse-wheel-scroll-amount '(1)) ;; mouse scroll moves 1 line at a time, instead of 5 lines
  (setq mouse-wheel-progressive-speed nil) ;; on a long mouse scroll keep scrolling by 1 line
  ;; (setq-default evil-escape-key-sequence "jk")
  (setq-default js2-basic-offset 2
                js-indent-level 2
                css-indent-offset 2
                web-mode-markup-indent-offset 2
                web-mode-css-indent-offset 2
                web-mode-code-indent-offset 2
                web-mode-attr-indent-offset 2
                js2-strict-missing-semi-warning)
  (setq-default typescript-indent-level 2)
  ;; (setq omnisharp-server-executable-path "/home/zane/dev/omnisharp/Omnisharp")
  ;; (setq mc/cmds-to-run-for-all
  ;;       '(
  ;;         electric-newline-and-maybe-indent
  ;;         evil-backward-char
  ;;         evil-delete-char
  ;;         evil-escape-emacs-state
  ;;         evil-escape-insert-state
  ;;         evil-exit-emacs-state
  ;;         evil-forward-char
  ;;         evil-insert
  ;;         evil-next-line
  ;;         evil-normal-state
  ;;         evil-previous-line
  ;;         evil-append-line
  ;;         forward-sentence
  ;;         kill-sentence
  ;;         org-self-insert-command
  ;;         sp-backward-delete-char
  ;;         sp-delete-char

  ;;         sp-remove-active-pair-overlay
  ;;         ))

  ;; (setq mc/cmds-to-run-once
  ;;       '(
  ;;         helm-M-x
  ;;         spacemacs/default-pop-shell
  ;;         ))
  (require 'uniquify)
  (setq uniquify-buffer-name-style 'reverse)
  (setq flycheck-display-errors-delay 0.5)
  (setq flycheck-pos-tip-timeout 10)
  ;; (global-set-key (kbd "TAB") 'hippie-expand)
  (setq-default dotspacemacs-configuration-layers
                '((auto-completion :variables
                                   auto-completion-enable-snippets-in-popup t)))
  (with-eval-after-load 'ox-latex
    (setq-default org-format-latex-options (plist-put org-format-latex-options :scale 1.5))
      (add-to-list 'org-latex-classes
                   '("mathtools")))

  ;; (setq golden-ratio-adjust-factor 4
  ;;       golden-ratio-wide-adjust-factor .8)

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;;(define-key evil-normal-state-map (kbd <tab>) 'other-window)
  (require 'helm-bookmark)
  (setq js-indent-align-list-continuation nil)
  (setq-default js2-indent-hook (lambda (list index)
                                  (debug)
                                  (message "logging ZANE ..........!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ")
                                  nil))

  (spacemacs/set-leader-keys "<tab>" 'other-window)
  ;;(xclip-mode 1)
  ;;(turn-on-xclip)
  ;; (golden-ratio-mode 1)
  ;;  (global-hl-line-mode -1)

  ;; VIM
  (defun other-window-backwards () (interactive) (other-window -1))
  (defun other-and-maximize-window () (interactive) (other-window 1) (spacemacs/enlarge-window-horizontally 1000))
  (defun other-backwards-and-maximize-window () (interactive) (other-window-backwards) (spacemacs/enlarge-window-horizontally 1000))

  (define-key evil-normal-state-map (kbd "<backtab>") 'other-backwards-and-maximize-window)
  (define-key evil-normal-state-map (kbd "<C-tab>") 'other-window)
  (define-key evil-normal-state-map (kbd "<tab>") 'other-and-maximize-window)
  (define-key evil-normal-state-map (kbd "C-k") (kbd "7k"))
  (define-key evil-normal-state-map (kbd "C-j") (kbd "7j"))
  (define-key evil-motion-state-map "j" 'evil-next-visual-line)
  (define-key evil-motion-state-map "k" 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "s") 'evil-avy-goto-char)
  ;((js2-mode
  ;  (flycheck-checker . javascript-standard)))
  (define-key evil-normal-state-map (kbd "C-n") 'mc/mark-next-like-this-word)
  (define-key evil-normal-state-map (kbd "C-x") 'mc/skip-to-next-like-this)
  ;; (define-key evil-motion-state-map (kbd "]]") 'tabbar-forward)
  ;; (define-key evil-motion-state-map (kbd "[[") 'tabbar-backward)

  (add-hook 'smartparens-enabled-hook #'spacemacs/toggle-smartparens-off)
  (add-hook 'smartparens-enabled-hook #'turn-off-show-smartparens-mode)
  (spacemacs/toggle-smartparens-globally-off)
  (define-key evil-normal-state-map (kbd ", w") 'save-buffer)
  (define-key evil-normal-state-map (kbd ", q") 'kill-buffer-and-window)
  (evil-leader/set-key
    "q q" 'spacemacs/frame-killer)


  ;; (global-company-mode)
  ;; (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  ;; (setq company-selection-wrap-around t)
  ;; (with-eval-after-load "company"
    ;; (global-set-key (kbd "C-SPC") 'company-complete))

  ;; We want 2 space indent everywhere
  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

  (defun flycheck-pos-tip-error-messages (errors)
    "Display ERRORS, using a graphical tooltip on GUI frames."
    (when errors
      (if (display-graphic-p)
          (let ((message (mapconcat #'flycheck-error-format-message-and-id
                                    errors "\n\n"))
                (line-height (car (window-line-height))))
            (pos-tip-show message nil nil nil flycheck-pos-tip-timeout
                          nil nil
                          ;; Add a little offset to the tooltip to move it away
                          ;; from the corresponding text in the buffer.  We
                          ;; explicitly take the line height into account because
                          ;; pos-tip computes the offset from the top of the line
                          ;; apparently.
                          15 (-  30)))
        (funcall flycheck-pos-tip-display-errors-tty-function errors))))
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*Flycheck errors*" eos)
                 (display-buffer-reuse-window
                  display-buffer-in-side-window)
                 (reusable-frames . visible)
                 (side            . bottom)
                 (window-height   . 0.1)))
  (evil-leader/set-key-for-mode 'typescript-mode
    "d" 'tide-jump-to-definition
    "b" 'tide-jump-back
    "mhd" 'tide-documentation-at-point
    "f" 'tide-references
    "mgn" 'tide-find-next-reference
    "mgp" 'tide-find-previous-reference
    "msr" 'tide-restart-server
                                        ;"rr" 'tide-rename-symbol
    )

  ;; Org Mode
  ;; (evil-leader/set-key-for-mode 'org-mode
  ;;   "<tab>" 'org-cycle)

  ;; js indent fix
;;   (eval-after-load "js"
;; '(defun js--proper-indentation (parse-status)
;;    "Return the proper indentation for the current line."
;;    (debug)
;;   (save-excursion
;;     (back-to-indentation)
;;     (cond ((nth 4 parse-status)    ; inside comment
;;            (js--get-c-offset 'c (nth 8 parse-status)))
;;           ((nth 3 parse-status) 0) ; inside string
;;           ((eq (char-after) ?#) 0)
;;           ((save-excursion (js--beginning-of-macro)) 4)
;;           ;; Indent array comprehension continuation lines specially.
;;           ((let ((bracket (nth 1 parse-status))
;;                  beg)
;;              (and bracket
;;                   (not (js--same-line bracket))
;;                   (setq beg (js--indent-in-array-comp bracket))
;;                   ;; At or after the first loop?
;;                   (>= (point) beg)
;;                   (js--array-comp-indentation bracket beg))))
;;           ((js--ctrl-statement-indentation))
;;           ((js--multi-line-declaration-indentation))
;;           ((nth 1 parse-status)
;; 	   ;; A single closing paren/bracket should be indented at the
;; 	   ;; same level as the opening statement. Same goes for
;; 	   ;; "case" and "default".
;;            (let ((same-indent-p (looking-at "[]})]"))
;;                  (switch-keyword-p (looking-at "default\\_>\\|case\\_>[^:]"))
;;                  (continued-expr-p (js--continued-expression-p)))
;;              (goto-char (nth 1 parse-status)) ; go to the opening char
;;              (if (or t (looking-at "[({[]\\s-*\\(/[/*]\\|$\\)"))
;;                  (progn ; nothing following the opening paren/bracket
;;                    (skip-syntax-backward " ")
;;                    (when (eq (char-before) ?\)) (backward-list))
;;                    (back-to-indentation)
;;                    (let* ((in-switch-p (unless same-indent-p
;;                                          (looking-at "\\_<switch\\_>")))
;;                           (same-indent-p (or same-indent-p
;;                                              (and switch-keyword-p
;;                                                   in-switch-p)))
;;                           (indent
;;                            (cond (same-indent-p
;;                                   (current-column))
;;                                  (continued-expr-p
;;                                   (+ (current-column) (* 2 js-indent-level)
;;                                      js-expr-indent-offset))
;;                                  (t
;;                                   (+ (current-column) js-indent-level
;;                                      (pcase (char-after (nth 1 parse-status))
;;                                        (?\( js-paren-indent-offset)
;;                                        (?\[ js-square-indent-offset)
;;                                        (?\{ js-curly-indent-offset)))))))
;;                      (if in-switch-p
;;                          (+ indent js-switch-indent-offset)
;;                        indent)))
;;                ;; If there is something following the opening
;;                ;; paren/bracket, everything else should be indented at
;;                ;; the same level.
;;                (unless same-indent-p
;;                  (forward-char)
;;                  (skip-chars-forward " \t"))
;;                (current-column))))

;;           ((js--continued-expression-p)
;;            (+ js-indent-level js-expr-indent-offset))
;;           (t 0)))))

  ;; Keys
  (global-set-key (kbd "C-+") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)
  (global-set-key (kbd "C-0") 'text-scale-mode)
  (global-set-key (kbd "M-n")
                  (lambda () (interactive) (forward-line  7)))
  (global-set-key (kbd "M-p")
                  (lambda () (interactive) (forward-line -7)))
  ;;  (global-set-key (kbd "C-t") 'helm-projectile-find-file)
  ;;  (global-set-key (kbd "C-*") (kbd "M-s . C-s"))
  (global-set-key (kbd "C-*") 'evil-search-word-forward)
  (bind-keys*
   ("C-t" . helm-projectile-find-file)
   ("C-o" . other-window)
   ("C-;" . avy-goto-char)
;;   ("<backtab>" . indent-rigidly-left)
;;   ("<tab>" . indent-rigidly-right)
   ("<f6>" . profiler-start)
   ("<f7>" . profiler-report))

  ;; ----------------------------------
  ;; Remap the menu key to be a leader:
  ;; on Linux, the menu/apps key syntax is <menu>
  ;; on Windows, the menu/apps key syntax is <apps>
  ;; make the syntax equal
  (define-key key-translation-map (kbd "<apps>") (kbd "<menu>"))

  (progn
    ;; define set of key sequences
    (define-prefix-command 'my-leader-key-map)
    ;; ----------------------------------

    ;; Some custom
    (define-key my-leader-key-map (kbd "<tab>") 'other-window)

    ;; Some defaults, i'll see if I ever use them
    (define-key my-leader-key-map (kbd "RET") 'execute-extended-command)
    (define-key my-leader-key-map (kbd "<menu>") 'exchange-point-and-mark)
    (define-key my-leader-key-map (kbd "7") 'dired-jump)
    (define-key my-leader-key-map (kbd "9") 'ispell-word)
    (define-key my-leader-key-map (kbd "a") 'mark-whole-buffer)
    (define-key my-leader-key-map (kbd "b") 'end-of-buffer)
    (define-key my-leader-key-map (kbd "d") 'mc/mark-more-like-this-extended)
    (define-key my-leader-key-map (kbd "f") 'mc/mark-all-like-this-dwim)
    (define-key my-leader-key-map (kbd "t") 'spacemacs/helm-project-smart-do-search)
    (define-key my-leader-key-map (kbd "p") 'query-replace))

  ;; make the menu key as leader key
  (global-set-key (kbd "<menu>") 'my-leader-key-map)
  ;; ----------------------------------

  (define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char)

  (defadvice isearch-search (after isearch-no-fail activate)
    (unless isearch-success
      (ad-disable-advice 'isearch-search 'after 'isearch-no-fail)
      (ad-activate 'isearch-search)
      (isearch-repeat (if isearch-forward 'forward))
      (ad-enable-advice 'isearch-search 'after 'isearch-no-fail)
      (ad-activate 'isearch-search)))
)

;; Do not write anything past this comment. This is where Emacs will
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-face-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(beacon-color "#F8BBD0")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("ecf7415335ef82a868c4e5f82909344cc72af8d9f2adfdbb7121e4d21910d9a2" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(evil-emacs-state-cursor (quote ("#D50000" hbar)) t)
 '(evil-insert-state-cursor (quote ("#D50000" bar)) t)
 '(evil-normal-state-cursor (quote ("#F57F17" box)) t)
 '(evil-visual-state-cursor (quote ("#66BB6A" box)) t)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-character-color "#192028")
 '(fci-rule-color "#eee8d5" t)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(gnus-logo-colors (quote ("#0d7b72" "#adadad")))
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #358d8d\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(hl-paren-colors (quote ("#ecf0f1" "#ecf0f1" "#c0392b")))
 '(hl-sexp-background-color "#efebe9")
 '(js-indent-align-list-continuation t)
 '(js2-mode-assume-strict t)
 '(js2-strict-trailing-comma-warning nil)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-download-edit-cmd "pinta %s")
 '(package-selected-packages
   (quote
    (web-completion-data helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag helm helm-core zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toml-mode toc-org tide tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme restart-emacs request rbenv rake rainbow-delimiters railscasts-theme racket-mode racer pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pastels-on-dark-theme paredit paradox orgit organic-green-theme org-projectile org-present org-pomodoro org-download org-bullets open-junk-file omtose-phellack-theme omnisharp oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme less-css-mode json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme intero inkpot-theme info+ indent-guide hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-guru go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md geiser gandalf-theme fuzzy flycheck-rust flycheck-pos-tip flycheck-haskell flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lispy evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dracula-theme django-theme diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme csv-mode company-web company-tern company-statistics company-go company-ghci company-ghc company-cabal company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme clean-aindent-mode chruby cherry-blossom-theme cargo busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme base16-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-link ace-jump-helm-line ac-ispell)))
 '(pdf-view-midnight-colors (quote ("#232333" . "#c7c7c7")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-delay 0)
 '(show-paren-mode t)
 '(show-smartparens-global-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(typescript-auto-indent-flag nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(show-paren-match ((t (:foreground "#d33682" :underline nil :background nil :weight bold))))
 '(sp-show-pair-match-face ((t (:foreground "#d33682" :background nil :weight bold))))
 '(term ((t (:inherit default :background "#000000" :foreground "#ffffff")))))
