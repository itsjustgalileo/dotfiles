;; ========================================
;; Emacs Configuration File
;; ========================================
;; Description: Personal Emacs configuration to enhance IDE capabilities.
;; A lot of this has been inspired by rexim (tsoding) and customized for personal use.
;; ========================================

;; ========================================
;; INDEX
;; ========================================
;; 1. Package Management
;; 2. User Interface (UI) Configuration
;;    2.1 Basic UI Tweaks
;;    2.2 Line Numbers and Highlighting
;;    2.3 Theme Configuration
;;    2.4 Font Size
;;    2.5 Word Wrap in Markdown
;; 3. User Experience (UX) Enhancements
;;    3.1 Backup File Settings
;;    3.2 Auto-Refresh Buffers
;;    3.3 Magit Integration
;;    3.4 Multiple Cursors
;;    3.5 Autocompletion with Company
;;    3.6 Moving Text
;;    3.7 Additional Modes and Packages
;;    3.9 Snippets
;; 4. Emacs Setup and Customization
;;    4.1 Ido Mode and Smex Integration
;;    4.2 Dired Configuration
;;    4.3 Custom Keybindings
;;    4.4 Compilation Command Settings
;;    4.5 Paredit
;;    4.6 Whitespace mode
;; 5. Languages Configuration
;;    5.1 C/C++ Mode Settings
;;    5.2 Haskell Mode Settings
;;    5.3 eldocs mode
;;    5.4 LaTeX support
;;    5.5 Additional Modes and Packages
;; ========================================

;; ========================================
;; ========================================

;; ========================================
;; 1. Package Management
;; ========================================
(setq custom-file "~/.emacs.custom.el")
(package-initialize)

(add-to-list 'load-path "~/.emacs.local/")
(add-to-list 'custom-theme-load-path "~/.emacs.local/")

(load "~/.emacs.rc/rc.el")
(load "~/.emacs.rc/misc.rc")
(load "~/.emacs.rc/org-mode.rc")

;; ========================================
;; 2. User Interface (UI) Configuration
;; ========================================

;; 2.1 Basic UI Tweaks
(menu-bar-mode 0)               ;; Disable menu bar
(tool-bar-mode 0)               ;; Disable tool bar
(scroll-bar-mode 0)             ;; Disable scroll bar
(column-number-mode 1)          ;; Display column number in mode line
(show-paren-mode 1)             ;; Highlight matching parentheses

;; 2.2 Line Numbers and Highlighting
(global-display-line-numbers-mode) ;; Enable line numbers
(setq display-line-numbers-type 'relative) ;; Use relative line numbers
(global-hl-line-mode t)         ;; Highlight current line

;; 2.3 Theme Configuration
(load-theme 'protanopia t)        ;; Main protanopia theme

;; 2.4 Font Size
;; (set-frame-font "Comic Code 14" nil t)
(set-face-attribute 'default nil
                    :font "BlexMono Nerd Font-12")

;; 2.5 Word Wrap in Markdown
(defun rc/enable-word-wrap ()
  (interactive)
  (toggle-word-wrap 1))

(add-hook 'markdown-mode-hook 'rc/enable-word-wrap)

;; ========================================
;; 3. User Experience (UX) Enhancements
;; ========================================

;; 3.1 Magit Integration
(rc/require 'magit)             ;; Require Magit
(rc/require 'git-gutter)   ;; Require Git Gutter Plus

(global-git-gutter-mode)  ;; global git gutter mode

(setq magit-auto-revert-mode nil) ;; Disable auto-revert mode in Magit

(global-set-key (kbd "C-x g") 'git-gutter-mode) ;; Turn on/off in the current buffer
(global-set-key (kbd "C-x G") 'global-git-gutter-mode) ;; Turn on/off globally
(global-set-key (kbd "C-c m s") 'magit-status) ;; Keybinding for Magit status
(global-set-key (kbd "C-c m l") 'magit-log)    ;; Keybinding for Magit log

;; 3.2 Autocompletion with Company
(rc/require 'company)
(require 'company)

(global-company-mode)

;; 3.3 Snippets
(rc/require 'yasnippet)

(require 'yasnippet)

(setq yas/triggers-in-field nil)
(setq yas-snippet-dirs '("~/.emacs.snippets/"))

(yas-global-mode 1)

;; 3.4 autoformatting with clang format
(rc/require 'clang-format)

(defun clang-format-save-hook-for-this-buffer ()
  "Create a buffer local save hook."
  (add-hook 'before-save-hook
            (lambda ()
              (when (locate-dominating-file "." ".clang-format")
                (clang-format-buffer))
              ;; Continue to save.
              nil)
            nil
            ;; Buffer local hook.
            t))

;; Run this for each mode you want to use the hook.
(add-hook 'c-mode-hook (lambda () (clang-format-save-hook-for-this-buffer)))
(add-hook 'c++-mode-hook (lambda () (clang-format-save-hook-for-this-buffer)))
(add-hook 'glsl-mode-hook (lambda () (clang-format-save-hook-for-this-buffer)))

;; ========================================
;; 4. Emacs Setup and Customization
;; ========================================

;; 4.1 Ido Mode and Smex Integration
(rc/require 'smex 'ido-completing-read+)

(require 'ido-completing-read+)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; 4.2 Dired Configuration
(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")
(setq dired-mouse-drag-files t)

;; 4.3 Custom Keybindings
(global-set-key [f5] 'compile) ;; Compile with F5
(global-set-key [f6] 'eshell)  ;; Open Eshell with F6
(global-set-key [f9] 'gdb)     ;; Debug with F9

;; 4.4 Compilation Command Settings
(require 'compile)

compilation-error-regexp-alist-alist

(add-to-list 'compilation-error-regexp-alist
             '("\\([a-zA-Z0-9\\.]+\\)(\\([0-9]+\\)\\(,\\([0-9]+\\)\\)?) \\(Warning:\\)?"
               1 2 (4) (5)))

;; 4.5 Backup File Settings
(setq backup-directory-alist `(("." . "~/.emacs.d/backups"))) ;; Backup location
(setq backup-by-copying t)     ;; Always copy files when creating backups
(setq delete-old-versions t)   ;; Automatically delete old backup versions
(setq version-control t)       ;; Enable version control for backups

;; Ensure backup directory exists
(unless (file-exists-p "~/.emacs.d/backups")
  (make-directory "~/.emacs.d/backups" t))

;;; tramp
;;; http://stackoverflow.com/questions/13794433/how-to-disable-autosave-for-tramp-buffers-in-emacs
(setq tramp-auto-save-directory "/tmp")

;; 4.6 Auto-Refresh Buffers
(electric-pair-mode 1)         ;; Enable automatic pairing of brackets
(global-auto-revert-mode 1)    ;; Automatically refresh buffers when files change on disk

;; Auto-refresh dired buffers
(defun my-dired-auto-revert ()
  "Automatically refresh dired buffers when the underlying files change."
  (when (derived-mode-p 'dired-mode)
    (revert-buffer)))

(add-hook 'dired-mode-hook 'auto-revert-mode)
(setq auto-revert-interval 1)  ;; Set auto-revert interval to 5 seconds

;; 4.7 Moving Text
(rc/require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;; 4.8 Multiple Cursors
(rc/require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;; ========================================
;; 5. Languages Configuration
;; ========================================

;; 5.1 C Mode Settings
(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))

(add-hook 'c-mode-hook (lambda ()
                         (interactive)
                         (c-toggle-comment-style -1)))

;;; 5.2 Haskell mode
(rc/require 'haskell-mode)

(setq haskell-process-type 'cabal-new-repl)
(setq haskell-process-log t)

(add-hook 'haskell-mode-hook 'haskell-indent-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-doc-mode)

;; 5.3 LaTeX support
(rc/require 'auctex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(rc/require 'pdf-tools)
(pdf-tools-install)
(setq TeX-PDF-mode t)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-view-program-selection
  '((output-pdf "Zathura")))
(setq TeX-command-extra-options "-shell-escape -synctex=1")


;;; 5.4 eldoc mode
(defun rc/turn-on-eldoc-mode ()
  (interactive)
  (eldoc-mode 1))

(add-hook 'emacs-lisp-mode-hook 'rc/turn-on-eldoc-mode)

;;; Emacs lisp
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c C-j")
                            (quote eval-print-last-sexp))))
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))

;; 5.5 Additional Modes and Packages
(rc/require
 'yaml-mode
 'glsl-mode
 'tuareg
 'lua-mode
 'less-css-mode
 'graphviz-dot-mode
 'clojure-mode
 'cmake-mode
 'rust-mode
 'nim-mode
 'markdown-mode
 'dockerfile-mode
 'toml-mode
 'go-mode
 'php-mode
 'racket-mode
 'qml-mode
 'hindent
 'elpy
 'typescript-mode
 'rainbow-mode
 'proof-general
 'elixir-mode
 )

;; Personal modes
;; FreeBasic mode
(require 'fb-mode) ;; https://github.com/rversteegen/fb-mode
(autoload 'basic-generic-mode "basic-mode" "Major mode for editing BASIC code." t)
(add-to-list 'auto-mode-alist '("\\.bas\\'" . basic-generic-mode))

;; Lisp mode
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;; Doxygen
(require 'gendoxy)

;; Elixir
;; Highlights *.elixir2 as well
(add-to-list 'auto-mode-alist '("\\.elixir2\\'" . elixir-mode))
;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

;; ========================================
;; ========================================

(load-file custom-file)
