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
;; 5. Languages Configuration
;;    5.1 C/C++ Mode Settings
;;    5.2 Haskell Mode Settings
;;    5.3 Additional Modes and Packages
;;    5.4 LaTeX support
;; 6. Auto-Generated Custom Settings
;; ========================================

;; ========================================
;; ========================================

;; ========================================
;; 1. Package Management
;; ========================================
(package-initialize)

(add-to-list 'load-path "~/.emacs.local/")

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
;; (rc/require-theme 'gruber-darker) ;; Load the Gruber Darker theme

;; 2.4 Font Size
;; (set-frame-font "Comic Code 14" nil t)
;; (set-frame-font "IBM Plex Mono 14" nil t)

;; 2.5 Word Wrap in Markdown
(defun rc/enable-word-wrap ()
  (interactive)
  (toggle-word-wrap 1))

(add-hook 'markdown-mode-hook 'rc/enable-word-wrap)

;; ========================================
;; 3. User Experience (UX) Enhancements
;; ========================================

;; 3.1 Backup File Settings
(setq backup-directory-alist `(("." . "~/.emacs.d/backups"))) ;; Backup location
(setq backup-by-copying t)     ;; Always copy files when creating backups
(setq delete-old-versions t)   ;; Automatically delete old backup versions
(setq version-control t)       ;; Enable version control for backups

;; Ensure backup directory exists
(unless (file-exists-p "~/.emacs.d/backups")
  (make-directory "~/.emacs.d/backups" t))

;; 3.2 Auto-Refresh Buffers
(electric-pair-mode 1)         ;; Enable automatic pairing of brackets
(global-auto-revert-mode 1)    ;; Automatically refresh buffers when files change on disk

;; Auto-refresh dired buffers
(defun my-dired-auto-revert ()
  "Automatically refresh dired buffers when the underlying files change."
  (when (derived-mode-p 'dired-mode)
    (revert-buffer)))

(add-hook 'dired-mode-hook 'auto-revert-mode)
(setq auto-revert-interval 1)  ;; Set auto-revert interval to 5 seconds

;; 3.3 Magit Integration
(rc/require 'cl-lib)            ;; Require cl-lib for Magit
(rc/require 'magit)             ;; Require Magit
(rc/require 'git-gutter)   ;; Require Git Gutter Plus

(global-git-gutter-mode)  ;; global git gutter mode

(setq magit-auto-revert-mode nil) ;; Disable auto-revert mode in Magit

(global-set-key (kbd "C-x g") 'git-gutter-mode) ;; Turn on/off in the current buffer
(global-set-key (kbd "C-x G") 'global-git-gutter-mode) ;; Turn on/off globally
(global-set-key (kbd "C-c m s") 'magit-status) ;; Keybinding for Magit status
(global-set-key (kbd "C-c m l") 'magit-log)    ;; Keybinding for Magit log

;; 3.4 Multiple Cursors
(rc/require 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

;; 3.5 Autocompletion with Company
(rc/require 'company)
(require 'company)

(global-company-mode)

;; Disable company mode in OCaml Tuareg mode
(add-hook 'tuareg-mode-hook
          (lambda ()
            (interactive)
            (company-mode 0)))

;; 3.6 Moving Text
(rc/require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

;; 3.8 Snippets
(rc/require 'yasnippet)

(require 'yasnippet)

(setq yas/triggers-in-field nil)
(setq yas-snippet-dirs '("~/.emacs.snippets/"))

(yas-global-mode 1)

;; 3.9 autoformatting with clang format
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
(global-set-key [f9] 'gdb)     ;; Debug with F9
(global-set-key [f6] 'eshell)  ;; Open Eshell with F6

;; 4.4 Compilation Command Settings
(require 'compile)

compilation-error-regexp-alist-alist

(add-to-list 'compilation-error-regexp-alist
             '("\\([a-zA-Z0-9\\.]+\\)(\\([0-9]+\\)\\(,\\([0-9]+\\)\\)?) \\(Warning:\\)?"
               1 2 (4) (5)))


;; ========================================
;; 5. C/C++ Configuration
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

;; 5.3 Additional Modes and Packages
(rc/require
 'scala-mode
 'd-mode
 'yaml-mode
 'glsl-mode
 'tuareg
 'lua-mode
 'less-css-mode
 'graphviz-dot-mode
 'clojure-mode
 'cmake-mode
 'rust-mode
 'csharp-mode
 'nim-mode
 'jinja2-mode
 'markdown-mode
 'purescript-mode
 'nix-mode
 'dockerfile-mode
 'toml-mode
 'nginx-mode
 'kotlin-mode
 'go-mode
 'php-mode
 'racket-mode
 'qml-mode
 'ag
 'elpy
 'typescript-mode
 'rfc-mode
 'sml-mode
 )

;; 5.4 LaTeX supprt
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


;; ========================================
;; 6. Auto-Generated Custom Settings
;; ========================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("127a0540c92d2dbd2aee38aa14d1d7f76fc195ba01343510f919800b8157e52a" default))
 '(package-selected-packages
   '(git-gutter-plus clang-format ido-completing-read+ smex sml-mode rfc-mode typescript-mode elpy ag qml-mode racket-mode php-mode go-mode kotlin-mode nginx-mode toml-mode dockerfile-mode nix-mode purescript-mode markdown-mode jinja2-mode nim-mode rust-mode cmake-mode clojure-mode graphviz-dot-mode lua-mode tuareg glsl-mode yaml-mode d-mode scala-mode move-text company multiple-cursors magit gruber-darker-theme org-cliplink dash-functional dash)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
