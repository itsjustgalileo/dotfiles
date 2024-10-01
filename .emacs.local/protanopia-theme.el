;; THIS NEEDS MAJOR UPDATE BUT IS WORKING AS INTENDEND SO FAR
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
      (region "#0d4566")
      (highlight "#0d2227")
      (cursor "#58a6ff")
      (border "#30363d")
      (comment "#8b949e"))

  (custom-theme-set-faces
   'protanopia

   ;; Basic coloring
   `(default ((,class (:background ,bg :foreground ,fg))))
   `(cursor ((,class (:background ,cursor))))
   `(fringe ((,class (:background ,bg))))
   `(region ((,class (:background ,region))))
   `(highlight ((,class (:background ,highlight))))
   `(link ((,class (:foreground ,blue :underline t))))
   `(link-visited ((,class (:foreground ,purple :underline t))))
   `(shadow ((,class (:foreground ,gray))))

   ;; Minibuffer
   `(minibuffer-prompt ((,class (:foreground ,"#ff00ff" :weight bold))))

   ;; Mode line and powerline
   `(mode-line ((,class (:background ,bg-alt :foreground ,gray :box (:line-width -1 :style released-button)))))
   `(mode-line-inactive ((,class (:background ,bg-alt :foreground ,gray :box (:line-width -1 :style released-button)))))
   `(mode-line-buffer-id ((,class (:foreground ,blue :weight bold))))

   ;; Header line
   `(header-line ((,class (:background ,bg-alt :foreground ,gray :box nil))))

   ;; Font lock (syntax highlighting)
   `(font-lock-builtin-face ((,class (:foreground ,"#1B64D2"))))
   `(font-lock-comment-face ((,class (:foreground ,comment :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,comment))))
   `(font-lock-comment-doc-face ((,class (:foreground ,"#ff0000")))) ;; FIX ME
   `(font-lock-comment-doc-string-face ((,class (:foreground ,"#ff0000")))) ;; FIX ME
   `(font-lock-constant-face ((,class (:foreground ,"#1B64D2"))))
   `(font-lock-function-name-face ((,class (:foreground ,"#D2A8FF"))))
   `(font-lock-function-call-face ((,class (:foreground ,"#D2A8FF"))))
   `(font-lock-keyword-face ((,class (:foreground ,"#B54019"))))
   `(font-lock-number-face ((,class (:foreground ,"#1B64D2"))))
   `(font-lock-operator-face ((,class (:foreground ,"#1B64D2"))))
   `(font-lock-preprocessor-face ((t (:foreground ,"#AE8134"))))
   `(font-lock-string-face ((,class (:foreground ,"#8DBDA5"))))
   `(font-lock-type-face ((,class (:foreground ,"#AE8134")))) 
   `(font-lock-reference-face ((,class (:foreground ,"#ff0000")))) ;; FIX ME
   `(font-lock-variable-name-face ((,class (:foreground ,fg)))) ;; FIX ME
   `(font-lock-warning-face ((,class (:foreground ,"#ff00ff" :weight bold))))

   ;; Line numbers
   `(line-number ((,class (:foreground ,"#AE8134" :background ,bg))))
   `(line-number-current-line ((,class (:foreground ,"#B54019" :background ,bg))))

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
