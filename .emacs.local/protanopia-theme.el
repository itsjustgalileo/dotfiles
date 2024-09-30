(deftheme protanopia
  "A theme for people with protanopia.")

(let ((class '((class color) (min-colors 89)))
      (fg "#c9d1d9")
      (bg "#0d1117")
      (bg-alt "#010409")
      (gray "#8b949e")
      (blue "#58a6ff")
      (orange "#d69a00")
      (yellow "#d29922")
      (red "#c38000")
      (cyan "#39c5cf")
      (green "#42a0ff")
      (purple "#d2a8ff")
      (highlight "#6e768166")
      (cursor "#58a6ff")
      (border "#30363d")
      (comment "#8b949e"))

  (custom-theme-set-faces
   'protanopia

   ;; Basic coloring
   `(default ((,class (:background ,bg :foreground ,fg))))
   `(cursor ((,class (:background ,cursor))))
   `(fringe ((,class (:background ,bg))))
   `(region ((,class (:background ,highlight))))
   `(highlight ((,class (:background ,highlight))))
   `(link ((,class (:foreground ,blue :underline t))))
   `(link-visited ((,class (:foreground ,purple :underline t))))
   `(shadow ((,class (:foreground ,gray))))

   ;; Minibuffer
   `(minibuffer-prompt ((,class (:foreground ,blue :weight bold))))

   ;; Mode line and powerline
   `(mode-line ((,class (:background ,bg-alt :foreground ,gray :box (:line-width -1 :style released-button)))))
   `(mode-line-inactive ((,class (:background ,bg-alt :foreground ,gray :box (:line-width -1 :style released-button)))))
   `(mode-line-buffer-id ((,class (:foreground ,blue :weight bold))))

   ;; Header line
   `(header-line ((,class (:background ,bg-alt :foreground ,gray :box nil))))

   ;; Font lock (syntax highlighting)
   `(font-lock-builtin-face ((,class (:foreground ,blue))))
   `(font-lock-comment-face ((,class (:foreground ,comment :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,purple))))
   `(font-lock-function-name-face ((,class (:foreground ,orange))))
   `(font-lock-keyword-face ((,class (:foreground ,yellow))))
   `(font-lock-string-face ((,class (:foreground ,green))))
   `(font-lock-type-face ((,class (:foreground ,yellow))))
   `(font-lock-variable-name-face ((,class (:foreground ,orange))))
   `(font-lock-warning-face ((,class (:foreground ,red :weight bold))))

   ;; Line numbers
   `(line-number ((,class (:foreground ,gray :background ,bg))))
   `(line-number-current-line ((,class (:foreground ,fg :background ,bg))))

   ;; Whitespace
   `(whitespace-space ((,class (:foreground ,border))))
   `(whitespace-tab ((,class (:foreground ,border))))
   `(whitespace-newline ((,class (:foreground ,border))))

   ;; Org mode
   `(org-level-1 ((,class (:foreground ,blue :weight bold))))
   `(org-level-2 ((,class (:foreground ,purple :weight bold))))
   `(org-level-3 ((,class (:foreground ,yellow :weight bold))))
   `(org-level-4 ((,class (:foreground ,green :weight bold))))
   `(org-todo ((,class (:foreground ,red :weight bold))))
   `(org-done ((,class (:foreground ,green :weight bold))))
   ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'protanopia)
