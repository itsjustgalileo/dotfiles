;; protanopia.el --- Protanopia theme inspired by GitHub's Protanopia Theme

(deftheme protanopia "Protanopia color theme inspired by GitHub for color blindness (protanopia) accessibility.")

(let ((class '((class color) (min-colors 89)))
      ;; Define your color palette
      (fg "#e0e0e0") ; Light foreground
      (bg "#1b1f23") ; Dark background
      (cursor "#528bff") ; Blue cursor
      (blue "#79c0ff") ; Blue
      (green "#7ee787") ; Green
      (yellow "#e3b341") ; Yellow
      (red "#f85149") ; Red
      (magenta "#b392f0") ; Magenta
      (cyan "#39c5cf") ; Cyan
      (orange "#ffa657") ; Orange
      (gray "#768390") ; Gray
      (light-gray "#c9d1d9") ; Light Gray
      (dark-gray "#2d333b") ; Dark Gray
      (comment "#6a737d")) ; Comment color

  ;; Set faces
  (custom-theme-set-faces
   'protanopia

   ;; Default colors
   `(default ((,class (:foreground ,fg :background ,bg))))
   `(cursor ((,class (:background ,cursor))))
   `(region ((,class (:background ,dark-gray))))
   `(highlight ((,class (:background ,dark-gray))))
   `(shadow ((,class (:foreground ,gray))))
   `(minibuffer-prompt ((,class (:foreground ,blue))))
   `(vertical-border ((,class (:foreground ,dark-gray))))

   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground ,orange))))
   `(font-lock-comment-face ((,class (:foreground ,comment :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,cyan))))
   `(font-lock-function-name-face ((,class (:foreground ,blue))))
   `(font-lock-keyword-face ((,class (:foreground ,magenta))))
   `(font-lock-string-face ((,class (:foreground ,green))))
   `(font-lock-type-face ((,class (:foreground ,yellow))))
   `(font-lock-variable-name-face ((,class (:foreground ,orange))))
   `(font-lock-warning-face ((,class (:foreground ,red :weight bold))))

   ;; Mode line
   `(mode-line ((,class (:background ,dark-gray :foreground ,fg))))
   `(mode-line-inactive ((,class (:background ,gray :foreground ,light-gray))))

   ;; Search
   `(isearch ((,class (:background ,yellow :foreground ,bg))))
   `(lazy-highlight ((,class (:background ,cyan :foreground ,bg))))

   ;; Whitespace
   `(whitespace-space ((,class (:foreground ,dark-gray))))
   `(whitespace-tab ((,class (:foreground ,dark-gray))))

   ;; Line numbers
   `(line-number ((,class (:foreground ,gray :background ,bg))))
   `(line-number-current-line ((,class (:foreground ,fg :background ,dark-gray))))
   
   ;; Org mode
   `(org-level-1 ((,class (:foreground ,blue :weight bold))))
   `(org-level-2 ((,class (:foreground ,cyan :weight bold))))
   `(org-level-3 ((,class (:foreground ,green :weight bold))))
   `(org-level-4 ((,class (:foreground ,yellow :weight bold))))
   `(org-link ((,class (:foreground ,blue :underline t))))
   
   ;; Other UI elements
   `(show-paren-match ((,class (:background ,cyan :foreground ,bg))))
   `(show-paren-mismatch ((,class (:background ,red :foreground ,bg))))
   ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'protanopia)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; protanopia.el ends here
