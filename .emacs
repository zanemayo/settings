(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Put temp files in the system temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; Ido for fuzzy things ;; useful shortcuts M-f for find file
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(ido-mode 1)

;; Auto complete with Company
(add-hook 'after-init-hook 'global-company-mode)

;; Javascript ------------------------

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
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; TSX
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (string-equal "tsx" (file-name-extension buffer-file-name))
;;               (setup-tide-mode))))
;; ;; enable typescript-tslint checker
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
(setq geiser-active-implementations '(racket mit chicken guile))
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
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "dist" "node_modules")))
 '(js-indent-align-list-continuation nil)
 '(js-indent-level 2)
 '(js2-bounce-indent-p nil)
 '(js2-mode-show-strict-warnings nil)
 '(js2-strict-missing-semi-warning nil)
 '(package-selected-packages
   (quote
    (company geiser racket-mode tide js2-refactor magit flycheck web-mode js2-mode)))
 '(safe-local-variable-values (quote ((geiser-scheme-implementation quote mit)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
