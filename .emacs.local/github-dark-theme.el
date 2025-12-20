(deftheme github-dark
  "GitHub Dark Default color theme for Emacs.")

(let ((class '((class color) (min-colors 89)))
      ;; GitHub Dark Default palette
      (bg        "#0d1117")
      (fg        "#c9d1d9")
      (cursor    "#58a6ff")
      (comment   "#8b949e")
      (keyword   "#ff7b72")
      (func      "#d2a8ff")
      (str       "#a5d6ff")
      (type      "#79c0ff")
      (const     "#ffa657")
      (var       "#e3b341")
      (builtin   "#f0883e")
      (region    "#1f6feb")
      (hl-line   "#161b22")
      (fringe    "#0d1117")
      (link      "#58a6ff")
      (warning   "#ffa657")
      (error     "#f85149"))

  (custom-theme-set-faces
   'github-dark

   ;; Basics
   `(default ((,class (:background ,bg :foreground ,fg))))
   `(cursor ((,class (:background ,cursor))))
   `(region ((,class (:background ,region :distant-foreground ,fg))))
   `(highlight ((,class (:background ,hl-line))))
   `(fringe ((,class (:background ,fringe))))
   `(minibuffer-prompt ((,class (:foreground ,link :weight bold))))
   `(link ((,class (:foreground ,link :underline t))))
   `(error ((,class (:foreground ,error :weight bold))))
   `(warning ((,class (:foreground ,warning))))
   `(success ((,class (:foreground ,type :weight bold))))

   ;; Font lock
   `(font-lock-builtin-face ((,class (:foreground ,builtin))))
   `(font-lock-comment-face ((,class (:foreground ,comment :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,const))))
   `(font-lock-function-name-face ((,class (:foreground ,func))))
   `(font-lock-keyword-face ((,class (:foreground ,keyword :weight semi-bold))))
   `(font-lock-string-face ((,class (:foreground ,str))))
   `(font-lock-type-face ((,class (:foreground ,type))))
   `(font-lock-variable-name-face ((,class (:foreground ,var))))
   `(font-lock-warning-face ((,class (:foreground ,warning :weight bold))))
   `(font-lock-number-face ((,class (:foreground ,const))))

   ;; UI
   `(mode-line ((,class (:background "#161b22" :foreground ,fg :box (:line-width -1 :color "#30363d")))))
   `(mode-line-inactive ((,class (:background "#0d1117" :foreground ,comment :box (:line-width -1 :color "#21262d")))))
   `(vertical-border ((,class (:foreground "#21262d"))))
   `(line-number ((,class (:foreground "#484f58" :background ,bg))))
   `(line-number-current-line ((,class (:foreground ,fg :background ,bg :weight bold))))
   `(show-paren-match ((,class (:background "#1f6feb" :foreground "#ffffff" :weight bold))))

   ;; Org / markup
   `(org-level-1 ((,class (:foreground ,func :weight bold))))
   `(org-level-2 ((,class (:foreground ,keyword))))
   `(org-level-3 ((,class (:foreground ,str))))
   `(org-level-4 ((,class (:foreground ,type))))
   `(org-code ((,class (:foreground ,const))))
   `(org-block ((,class (:background "#161b22" :extend t))))
   `(org-block-begin-line ((,class (:foreground ,comment :background "#161b22" :extend t))))
   `(org-block-end-line ((,class (:foreground ,comment :background "#161b22" :extend t))))

   ;; Dired
   `(dired-directory ((,class (:foreground ,link :weight bold))))
   `(dired-flagged ((,class (:foreground ,error :weight bold))))
   `(dired-header ((,class (:foreground ,func :weight bold))))
   `(dired-mark ((,class (:foreground ,keyword :weight bold))))
   `(dired-marked ((,class (:foreground ,const :weight bold))))
   `(dired-perm-write ((,class (:foreground ,warning))))
   `(dired-symlink ((,class (:foreground ,type :underline t))))))

(provide-theme 'github-dark)
