;;; protanopia-theme.el --- A dark theme designed for protanopia users -*- lexical-binding: t; -*-

;; Author: Galileo
;; Version: 1.1
;; Description: A carefully tuned theme for readability under protanopia
;; Keywords: faces, theme, accessibility, colorblind
;; License: Public Domain

;;; Commentary:
;; A dark, high-contrast theme preserving hue distinction for protanopia.
;; Updated for directory emphasis, safer mode-line contrast, and semantic clarity.

;;; Code:

(deftheme protanopia
  "A dark theme designed for users with protanopia (red-blind color vision).")

(let ((class '((class color) (min-colors 89)))

      ;; ─── Core Palette ─────────────────────────────────────────────────────
      (protanopia-fg          "#C9D1D9")
      (protanopia-bg          "#0D1117")
      (protanopia-bg-alt      "#010409")
      (protanopia-gray        "#8B949E")
      (protanopia-blue        "#74B8FF")
      (protanopia-cyan        "#39C5CF")
      (protanopia-green       "#5EB1FF")  ;; replaced green hues with cool blue tones
      (protanopia-orange      "#C69E4B")
      (protanopia-dark-orange "#C27D36")
      (protanopia-red         "#E3A61E")  ;; amber – visible under protanopia
      (protanopia-purple      "#D2A8FF")
      (protanopia-seafoam     "#9FD0B3")
      (protanopia-region      "#14324A")
      (protanopia-highlight   "#0D2227")
      (protanopia-cursor      "#58A6FF")
      (protanopia-border      "#30363D")
      (protanopia-warning     "#D7C000")
      (protanopia-dir         "#E6B450"))

  (custom-theme-set-faces
   'protanopia

   ;; ─── Basic Interface ────────────────────────────────────────────────────
   `(default ((,class (:background ,protanopia-bg :foreground ,protanopia-fg))))
   `(cursor ((,class (:background ,protanopia-cursor))))
   `(fringe ((,class (:background ,protanopia-bg))))
   `(region ((,class (:background ,protanopia-region :distant-foreground ,protanopia-fg))))
   `(highlight ((,class (:background ,protanopia-highlight))))
   `(hl-line ((,class (:background "#0F141B"))))
   `(link ((,class (:foreground ,protanopia-blue :underline t))))
   `(link-visited ((,class (:foreground ,protanopia-purple :underline t))))
   `(shadow ((,class (:foreground ,protanopia-gray))))

   ;; ─── Completion ─────────────────────────────────────────────────────────
   `(completions-annotations ((,class (:inherit shadow))))

   ;; ─── Ido / Dired ────────────────────────────────────────────────────────
   `(ido-first-match ((,class (:foreground ,protanopia-orange :weight bold))))
   `(ido-only-match ((,class (:foreground ,protanopia-dark-orange :weight bold))))
   `(ido-subdir ((,class (:foreground ,protanopia-dir :weight bold))))
   `(dired-directory ((,class (:foreground ,protanopia-dir :weight bold))))
   `(dired-symlink ((,class (:foreground ,protanopia-cyan :slant italic))))

   ;; ─── Messaging and Prompts ──────────────────────────────────────────────
   `(message-header-name ((,class (:foreground ,protanopia-blue))))
   `(minibuffer-prompt ((,class (:foreground ,protanopia-dark-orange :weight bold))))

   ;; ─── Mode Line ──────────────────────────────────────────────────────────
   `(mode-line ((,class (:background "#161B22" :foreground ,protanopia-fg
                                     :box (:line-width -1 :color ,protanopia-border)))))
   `(mode-line-inactive ((,class (:background ,protanopia-bg-alt :foreground ,protanopia-gray
                                              :box (:line-width -1 :color ,protanopia-border)))))
   `(mode-line-buffer-id ((,class (:foreground ,protanopia-orange :weight bold))))
   `(header-line ((,class (:background ,protanopia-bg-alt :foreground ,protanopia-gray :box nil))))

   ;; ─── Syntax Highlighting ────────────────────────────────────────────────
   `(font-lock-builtin-face ((,class (:foreground ,protanopia-purple))))
   `(font-lock-comment-face ((,class (:foreground ,protanopia-gray :slant italic))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,protanopia-gray))))
   `(font-lock-comment-doc-face ((,class (:foreground "#9CDCF0" :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,protanopia-blue))))
   `(font-lock-function-name-face ((,class (:foreground ,protanopia-blue))))
   `(font-lock-keyword-face ((,class (:foreground ,protanopia-dark-orange))))
   `(font-lock-preprocessor-face ((,class (:foreground ,protanopia-orange))))
   `(font-lock-string-face ((,class (:foreground ,protanopia-seafoam))))
   `(font-lock-type-face ((,class (:foreground ,protanopia-orange))))
   `(font-lock-variable-name-face ((,class (:foreground ,protanopia-fg))))
   `(font-lock-reference-face ((,class (:foreground "#5DBFFF" :weight bold))))
   `(font-lock-warning-face ((,class (:foreground ,protanopia-warning :weight bold))))

   ;; ─── Line Numbers and Whitespace ────────────────────────────────────────
   `(line-number ((,class (:foreground ,protanopia-orange :background ,protanopia-bg))))
   `(line-number-current-line ((,class (:foreground ,protanopia-dark-orange :background ,protanopia-bg))))
   `(whitespace-space ((,class (:foreground ,protanopia-border))))
   `(whitespace-tab ((,class (:foreground ,protanopia-border))))
   `(whitespace-newline ((,class (:foreground ,protanopia-border))))

   ;; ─── Org Mode ───────────────────────────────────────────────────────────
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

;;; protanopia-theme.el ends here
