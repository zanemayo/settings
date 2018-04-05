(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Put temp files in the system temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; 80 columns as default meta-q in org mode to reflow
(setq-default fill-column 80)

;; Remove gui bits
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
;; Add a scrollbar replacement to the modelin
(sml-modeline-mode 1)

;; Font
;;(setq my-font "Source Code Pro for Powerline")
;;(setq my-font "Roboto Mono Light for Powerline")
(setq my-font "Fira Mono for Powerline")
;;(setq my-font "Hack")
(when (member my-font (font-family-list))
  (set-face-attribute 'default nil :font my-font))

;; Ido for fuzzy things ;; useful shortcuts M-f for find file
;; (require 'flx-ido)
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-filename-at-point 'guess)
;; (setq ido-create-new-buffer 'always)
;; (ido-mode 1)
;; (flx-ido-mode 1)
;; ;; disable ido faces to see flx highlights.
;; (setq ido-use-faces nil)

;; Helm
;; (require 'helm)
;; (helm-mode 1)

;; Ivy - like helm
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(global-set-key (kbd "C-c r") 'ivy-resume)
(setq ivy-wrap 1)
(setq ivy-re-builders-alist
      '((read-file-name-internal . ivy--regex-fuzzy)
        ;;        (t . ivy--regex-plus)))
         (swiper . ivy--regex-plus)
         (t . ivy--regex-fuzzy)))

;; Avy - jump to char
(global-set-key (kbd "C-;") 'avy-goto-char)
(setq avy-keys (number-sequence ?a ?z))

;; Indium - javascript IDE
;; indium-run-node ~/dev/primary-issuance-administration/node_modules/.bin/ts-node  ~/dev/primary-issuance-administration/node_modules/ava-ts/profile.js homepage.test.tsx
;;(insert (buffer-name))))

;; dired group directories first
(setq dired-listing-switches "-laGh --group-directories-first")

;; Projectile
(projectile-global-mode)
(define-key projectile-mode-map (kbd "C-t") 'counsel-projectile-find-file)
(setq local-function-key-map (delq '(kp-tab . [9]) local-function-key-map))
(define-key projectile-mode-map (kbd "C-z") 'counsel-projectile-ag)
(define-key projectile-mode-map (kbd "C-c m") 'projectile-vc)
(setq projectile-completion-system 'ivy)

;; Switch windows with S-arrows
(windmove-default-keybindings)

;; Auto complete with Company
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-.") 'company-complete)

;; Smooth scrolling
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(setq smooth-scroll-margin 5)
(setq mouse-wheel-scroll-amount '(0.07))
(setq mouse-wheel-progressive-speed nil)


;; Multiple cursors
(global-set-key (kbd "C-M-m") 'mc/mark-all-dwim)
(global-set-key (kbd "<M-down>") 'mc/mark-next-like-this)
(global-set-key (kbd "<M-up>") 'mc/mark-previous-like-this)
(global-set-key (kbd "<M-left>") 'mc/unmark-next-like-this)
(global-set-key (kbd "<M-right>") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-'") 'mc-hide-unmatched-lines-mode)

;; Javascript ------------------------

;; load tern
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;; repl
(add-hook 'js-mode-hook
          (lambda ()
            (define-key js-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-expression)
            (define-key js-mode-map (kbd "C-c C-j") 'nodejs-repl-send-line)
            (define-key js-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
            (define-key js-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
            (define-key js-mode-map (kbd "C-c C-b") 'nodejs-repl-send-buffer)
            (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))

;; ----- linting -----
;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; ;; disable jshint since we prefer eslint checking
;; (setq-default flycheck-disabled-checkers
;;   (append flycheck-disabled-checkers
;;     '(javascript-jshint)))

;; use eslint with web-mode for jsx files
;; (flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
;; (setq-default flycheck-temp-prefix ".flycheck")

;; ----- end linting -----

;; js2-refactor
;; (require 'js2-refactor)
;; (add-hook 'js2-mode-hook #'js2-refactor-mode)
;; (js2r-add-keybindings-with-prefix "C-c C-m")

;; End Javascript ---------------------

;; Typescript ------------------------

(setq tide-format-options '(:insertSpaceAfterFunctionKeywordForAnonymousFunctions t :indentSize 2 :convertTabsToSpaces: t :tabSize 2 :insertSpaceBeforeFunctionParenthesis t :insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis t :insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets t))

;; TS
(setq typescript-indent-level 2
      typescript-expr-indent-offset 0)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (setq indent-line-function 'indent-relative) ;; get rid of broken typescript indent
  (setq-local indent-line-function 'indent-relative)
  (setq tide-tsserver-executable "node_modules/typescript/bin/tsserver")
  (company-mode +1))

(add-hook 'typescript-mode-hook
          (lambda ()
            (define-key typescript-mode-map (kbd "C-c C-r") 'tide-rename-symbol)
            (define-key typescript-mode-map (kbd "C-c C-f") 'tide-references)))

(add-hook 'web-mode-hook
          (lambda ()
            (define-key web-mode-map (kbd "C-c C-r") 'tide-rename-symbol)
            (define-key web-mode-map (kbd "C-c C-f") 'tide-references)
	    (define-key web-mode-map [f5] (lambda () (interactive) (indium-run-node (concat "~/dev/primary-issuance-administration/node_modules/.bin/ts-node  ~/dev/primary-issuance-administration/node_modules/ava-ts/profile.js " (buffer-name)))))))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; TSX
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
(setq web-mode-enable-auto-indentation nil)
;; enable typescript-tslint checker
;; (flycheck-add-mode 'typescript-tslint 'web-mode)

;; ;; JS
;; (add-hook 'js2-mode-hook #'setup-tide-mode)
;; ;; configure javascript-tide checker to run after your default javascript checker
;; (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)

;; ;; JSX
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (string-equal "js" (file-name-extension buffer-file-name))
;;               (setup-tide-mode))))
;; ;; configure jsx-tide checker to run after your default jsx checker
;; (flycheck-add-mode 'javascript-eslint 'web-mode)
;; (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

;; End Typescript --------------------

;; Lisp ------------------------------
;; (define-key inferior-scheme-mode-map "\C-c\C-d"
;;   (lambda () (interactive) (insert "(debug)")))
;; (define-key inferior-scheme-mode-map "\C-c\C-e"
;;   (lambda () (interactive) (insert "(exit)")))
;; (define-key inferior-scheme-mode-map "\C-c\C-r"
;;   (lambda () (interactive) (insert "(restart 1)")))

;; End Lisp --------------------------

;; General

;; Remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Page up/down all the way to the end of the file
(setq scroll-error-top-bottom t)

;; Show column numbers
(setq column-number-mode t)

;; Use spaces, not tabs
(setq-default indent-tabs-mode nil)

;; End General

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("53f97243218e8be82ba035ae34c024fd2d2e4de29dc6923e026d5580c77ff702" "5e52ce58f51827619d27131be3e3936593c9c7f9f9f9d6b33227be6331bf9881" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "f456bd6f1158ef20b922cbe26a30ac35feadfea8c535058435fc011b2aaec238" default)))
 '(global-yascroll-bar-mode t)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "dist" "node_modules")))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
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
 '(inhibit-startup-screen t)
 '(js-indent-align-list-continuation nil)
 '(js-indent-level 2)
 '(js2-bounce-indent-p nil)
 '(js2-mode-show-strict-warnings nil)
 '(js2-strict-missing-semi-warning nil)
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (rainbow-delimiters graphviz-dot-mode avy indium counsel-projectile counsel ivy ein smooth-scrolling slack sml-modeline monokai-theme solarized-theme zenburn-theme ag tern flx-ido projectile nodejs-repl company geiser racket-mode tide js2-refactor magit flycheck web-mode js2-mode)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(safe-local-variable-values (quote ((geiser-scheme-implementation quote mit))))
 '(scheme-program-name "scheme -heap 365360 -stack 16536 --option-summary")
 '(send-mail-function (quote mailclient-send-it))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sml-modeline-mode t)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(typescript-auto-indent-flag nil)
 '(typescript-expr-indent-offset 0 t)
 '(typescript-indent-level 0 t)
 '(vc-annotate-background-mode nil)
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
 )
