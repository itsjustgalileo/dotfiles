;;; ada-simple-mode.el --- Minimal Ada major mode -*- lexical-binding: t; -*-

;; This is a deliberately small, self-contained Ada major mode.
;; It avoids the complexity (and fragility) of the historical GNU Ada mode.
;; Coverage: comments, strings, keywords, types, numbers, basic indentation.

(require 'prog-mode)

(defgroup ada-simple nil
  "Minimal Ada editing mode."
  :group 'languages)

;; --------------------
;; Syntax table
;; --------------------
(defvar ada-simple-mode-syntax-table
  (let ((st (make-syntax-table)))
    ;; comments
    (modify-syntax-entry ?- ". 12" st)
    (modify-syntax-entry ?\n ">" st)
    ;; strings
    (modify-syntax-entry ?\" "\"" st)
    ;; identifiers
    (modify-syntax-entry ?_ "w" st)
    st))

;; --------------------
;; Keywords and faces
;; --------------------

(defconst ada-simple-keywords
  '("abort" "abs" "abstract" "accept" "access" "aliased"
    "all" "and" "array" "at" "begin" "body" "case" "constant"
    "declare" "delay" "delta" "digits" "do" "else" "elsif"
    "end" "entry" "exception" "exit" "for" "function" "generic"
    "goto" "if" "in" "interface" "is" "limited" "loop"
    "mod" "new" "not" "null" "of" "or" "others" "out"
    "overriding" "package" "pragma" "private" "procedure" "protected"
    "raise" "range" "record" "rem" "renames" "requeue"
    "return" "reverse" "select" "separate" "subtype" "synchronized"
    "tagged" "task" "terminate" "then" "type" "until" "use"
    "when" "while" "with" "xor"))

(defconst ada-simple-types
  '("Boolean" "Character" "Duration" "Float" "Integer"
    "Long_Float" "Long_Integer" "Natural" "Positive"
    "Short_Float" "Short_Integer" "String"))

(defconst ada-simple-font-lock-keywords
  `((,(regexp-opt ada-simple-keywords 'symbols) . font-lock-keyword-face)
    (,(regexp-opt ada-simple-types 'symbols)    . font-lock-type-face)
    ;; character literals: 'A', ''''
    ("'\\(.\\|''\\)'" . font-lock-constant-face)
    ;; attributes: 'Range, 'Length, etc.
    ("'[A-Za-z_][A-Za-z0-9_]*" . font-lock-builtin-face)
    ;; numbers
    ("\\_<[0-9]+\\(\\.[0-9]+\\)?\\([eE][+-]?[0-9]+\\)?\\_>"
     . font-lock-constant-face)))

;; --------------------
;; Indentation
;; --------------------

(defcustom ada-simple-indent-offset 3
  "Basic indentation step for Ada blocks."
  :type 'integer
  :group 'ada-simple)

(defun ada-simple--block-start-p ()
  (save-excursion
    (back-to-indentation)
    (looking-at-p
     (regexp-opt '("begin" "loop" "then" "record" "case" "declare"
                   "is" "do") 'symbols))))

(defun ada-simple--block-end-p ()
  (save-excursion
    (back-to-indentation)
    (looking-at-p (regexp-opt '("end" "else" "elsif" "when") 'symbols))))

(defun ada-simple--previous-indentation ()
  (save-excursion
    (forward-line -1)
    (while (and (not (bobp)) (looking-at "^[[:space:]]*$"))
      (forward-line -1))
    (current-indentation)))

(defun ada-simple-indent-line ()
  "Indent current line according to a simple Ada block heuristic."
  (interactive)
  (let ((col (current-column))
        (base (ada-simple--previous-indentation)))
    (indent-line-to
     (max 0
          (+ base
             (cond
              ((ada-simple--block-end-p) (- ada-simple-indent-offset))
              ((save-excursion
                 (forward-line -1)
                 (ada-simple--block-start-p)) ada-simple-indent-offset)
              (t 0)))))
    (when (> col (current-indentation))
      (move-to-column col))))

;; --------------------
;; Mode definition
;; --------------------

;;;###autoload
(define-derived-mode ada-simple-mode prog-mode "Ada"
  "Minimal Ada major mode."
  :syntax-table ada-simple-mode-syntax-table
  (setq-local font-lock-defaults '(ada-simple-font-lock-keywords))
  (setq-local comment-start "-- ")
  (setq-local comment-end "")
  (setq-local indent-line-function #'ada-simple-indent-line)
  (setq-local tab-width 3)
  (setq-local electric-indent-chars nil))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.ad[abs]\\'" . ada-simple-mode))

(provide 'ada-simple-mode)

;;; ada-simple-mode.el ends here
