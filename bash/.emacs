(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized/")
;;(load-theme 'dark-emacs t)
(load-theme 'solarized-dark t)

;; ESS Mode (.R file)
(put 'upcase-region 'disabled nil)
(require 'ess-site)
(global-set-key [C-tab] 'other-window)'
(define-key comint-mode-map [C-up] 'comint-previous-matching-input-from-input)
(define-key comint-mode-map [C-down] 'comint-next-matching-input-from-input)

(define-key ess-mode-map "\C-l" 'ess-eval-line-and-step)
(define-key ess-mode-map "\C-p" 'ess-eval-function-or-paragraph-and-step)
(define-key ess-mode-map "\C-r" 'ess-eval-region)

;; markdown http://jblevins.org/projects/markdown-mode/
(add-to-list 'load-path "~/.emacs.d/markdown-mode/")
(autoload 'markdown-mode "markdown-mode"
             "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
