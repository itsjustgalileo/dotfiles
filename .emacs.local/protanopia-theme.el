;; THIS NEEDS MAJOR UPDATE BUT IS WORKING AS INTENDEND SO FAR
(deftheme protanopia
  "A theme for people with protanopia.")

(let ((class '((class color) (min-colors 89)))
      (protanopia-fg "#c9d1d9")
      (protanopia-bg "#0d1117")
      (protanopia-bg-alt "#010409")
      (protanopia-gray "#8b949e")
      (protanopia-blue "#79C0FF")
      (protanopia-dark-orange "#B54019")
      (protanopia-orange "#AE8134")
      (protanopia-red "#c38000")
      (protanopia-cyan "#39c5cf")
      (protanopia-green "#42a0ff")
      (protanopia-purple "#d2a8ff")
      (protanopia-region "#0d4566")
      (protanopia-highlight "#0d2227")
      (protanopia-cursor "#58a6ff")
      (protanopia-border "#30363d")
      (protanopia-comment "#8b949e")
      (protanopia-seafoam "#8DBDA5")
      (protanopia-warning "#f5e400")
      )

  (custom-theme-set-faces
   'protanopia

   ;; Basic coloring
   `(default ((,class (:background ,protanopia-bg :foreground ,protanopia-fg))))
   `(cursor ((,class (:background ,protanopia-cursor))))
   `(fringe ((,class (:background ,protanopia-bg))))
   `(region ((,class (:background ,protanopia-region))))
   `(highlight ((,class (:background ,protanopia-highlight))))
   `(link ((,class (:foreground ,protanopia-blue :underline t))))
   `(link-visited ((,class (:foreground ,protanopia-purple :underline t))))
   `(shadow ((,class (:foreground ,protanopia-gray))))

   ;; Completion
   `(completions-annotations ((t (:inherit 'shadow))))

   ;; Ido
   `(ido-first-match ((t (:foreground ,protanopia-orange :bold nil))))
   `(ido-only-match ((t (:foreground ,protanopia-dark-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,protanopia-purple :weight bold))))

   ;; Message
   `(message-header-name ((t (:foreground ,protanopia-blue))))
   
   ;; Minibuffer
   `(minibuffer-prompt ((,class (:foreground ,protanopia-dark-orange :weight bold))))

   ;; Mode line and powerline
   `(mode-line ((,class (:background ,protanopia-bg-alt :foreground ,protanopia-gray :box (:line-width -1 :style released-button)))))
   `(mode-line-inactive ((,class (:background ,protanopia-bg-alt :foreground ,protanopia-gray :box (:line-width -1 :style released-button)))))
   `(mode-line-buffer-id ((,class (:foreground ,protanopia-orange :weight bold))))

   ;; Header line
   `(header-line ((,class (:background ,protanopia-bg-alt :foreground ,protanopia-gray :box nil))))

   ;; Font lock (syntax highlighting)
   `(font-lock-builtin-face ((,class (:foreground ,protanopia-purple))))
   `(font-lock-comment-face ((,class (:foreground ,protanopia-comment :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,protanopia-comment))))
   `(font-lock-constant-face ((,class (:foreground ,protanopia-blue))))
   `(font-lock-function-name-face ((,class (:foreground ,protanopia-purple))))
   `(font-lock-function-call-face ((,class (:foreground ,protanopia-purple))))
   `(font-lock-keyword-face ((,class (:foreground ,protanopia-dark-orange))))
   `(font-lock-number-face ((,class (:foreground ,protanopia-blue))))
   `(font-lock-operator-face ((,class (:foreground ,protanopia-fg))))
   `(font-lock-preprocessor-face ((t (:foreground ,protanopia-orange))))
   `(font-lock-string-face ((,class (:foreground ,protanopia-seafoam))))
   `(font-lock-comment-doc-face ((,class (:foreground ,"#ff0000")))) ;; FIX ME
   `(font-lock-comment-doc-string-face ((,class (:foreground ,"#ff0000")))) ;; FIX ME
   `(font-lock-type-face ((,class (:foreground ,protanopia-orange))))
   `(font-lock-reference-face ((,class (:foreground ,"#ff00ff")))) ;; FIX ME
   `(font-lock-variable-name-face ((,class (:foreground ,protanopia-fg))))
   `(font-lock-warning-face ((,class (:foreground ,protanopia-warning :weight bold))))

   ;; Line numbers
   `(line-number ((,class (:foreground ,protanopia-orange :background ,protanopia-bg))))
   `(line-number-current-line ((,class (:foreground ,protanopia-dark-orange :background ,protanopia-bg))))

   ;; Whitespace
   `(whitespace-space ((,class (:foreground ,protanopia-border))))
   `(whitespace-tab ((,class (:foreground ,protanopia-border))))
   `(whitespace-newline ((,class (:foreground ,protanopia-border))))

   ;; Org mode
   `(org-level-1 ((,class (:foreground ,protanopia-blue :weight bold))))
   `(org-level-2 ((,class (:foreground ,protanopia-purple :weight bold))))
   `(org-level-3 ((,class (:foreground ,protanopia-orange :weight bold))))
   `(org-level-4 ((,class (:foreground ,protanopia-green :weight bold))))
   `(org-todo ((,class (:foreground ,protanopia-red :weight bold))))
   `(org-done ((,class (:foreground ,protanopia-green :weight bold))))
   ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'protanopia)
