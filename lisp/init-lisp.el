(require-package 'elisp-slime-nav)
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'elisp-slime-nav-mode))

(require-package 'lively)

(require-package 'pretty-mode)
(autoload 'turn-on-pretty-mode "pretty-mode")

(setq-default initial-scratch-message
              (concat ";; Happy hacking " (or user-login-name "") "!\n\n"))



;; Make C-x C-e run 'eval-region if the region is active

(defun sanityinc/eval-last-sexp-or-region (beg end prefix)
  "Eval region from BEG to END if active, otherwise the last sexp."
  (interactive "r\nP")
  (if (use-region-p)
      (eval-region beg end)
    (pp-eval-last-sexp prefix)))

(after-load 'lisp-mode
  (define-key emacs-lisp-mode-map (kbd "C-x C-e") 'sanityinc/eval-last-sexp-or-region))

;; ----------------------------------------------------------------------------
;; Hippie-expand
;; ----------------------------------------------------------------------------
(defun set-up-hippie-expand-for-elisp ()
  "Locally set `hippie-expand' completion functions for use with Emacs Lisp."
  (make-local-variable 'hippie-expand-try-functions-list)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol t)
  (add-to-list 'hippie-expand-try-functions-list 'try-complete-lisp-symbol-partially t))


;; ----------------------------------------------------------------------------
;; Automatic byte compilation
;; ----------------------------------------------------------------------------

(require-package 'auto-compile)
(auto-compile-on-save-mode 1)
(auto-compile-on-load-mode 1)

;; ----------------------------------------------------------------------------
;; Highlight current sexp
;; ----------------------------------------------------------------------------

(require-package 'hl-sexp)

;; Prevent flickery behaviour due to hl-sexp-mode unhighlighting before each command
(after-load 'hl-sexp
  (defadvice hl-sexp-mode (after unflicker (&optional turn-on) activate)
    (when turn-on
      (remove-hook 'pre-command-hook #'hl-sexp-unhighlight))))



;;; Support byte-compilation in a sub-process, as
;;; required by highlight-cl

(defun sanityinc/byte-compile-file-batch (filename)
  "Byte-compile FILENAME in batch mode, ie. a clean sub-process."
  (interactive "fFile to byte-compile in batch mode: ")
  (let ((emacs (car command-line-args)))
    (compile
     (concat
      emacs " "
      (mapconcat
       'shell-quote-argument
       (list "-Q" "-batch" "-f" "batch-byte-compile" filename)
       " ")))))


;; ----------------------------------------------------------------------------
;; Enable desired features for all lisp modes
;; ----------------------------------------------------------------------------
(require-package 'rainbow-delimiters)
(require-package 'redshank)
(after-load 'redshank
  (diminish 'redshank-mode))


(defun sanityinc/lisp-setup ()
  "Enable features useful in any Lisp mode."
  (rainbow-delimiters-mode t)
  (enable-paredit-mode)
  (turn-on-eldoc-mode)
  (redshank-mode))

(defun sanityinc/emacs-lisp-setup ()
  "Enable features useful when working with elisp."
  (elisp-slime-nav-mode t)
  (set-up-hippie-expand-for-elisp)
  (ac-emacs-lisp-mode-setup))

(defconst sanityinc/elispy-modes
  '(emacs-lisp-mode ielm-mode)
  "Major modes relating to elisp.")

(defconst sanityinc/lispy-modes
  (append sanityinc/elispy-modes
          '(lisp-mode inferior-lisp-mode lisp-interaction-mode))
  "All lispy major modes.")

(require 'derived)

(dolist (hook (mapcar #'derived-mode-hook-name sanityinc/lispy-modes))
  (add-hook hook 'sanityinc/lisp-setup))

(dolist (hook (mapcar #'derived-mode-hook-name sanityinc/elispy-modes))
  (add-hook hook 'sanityinc/emacs-lisp-setup))

(defun sanityinc/maybe-check-parens ()
  "Run `check-parens' if this is a lispy mode."
  (when (memq major-mode sanityinc/lispy-modes)
    (check-parens)))

(add-hook 'after-save-hook #'sanityinc/maybe-check-parens)

(require-package 'eldoc-eval)
(require 'eldoc-eval)

(add-to-list 'auto-mode-alist '("\\.emacs-project\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("archive-contents\\'" . emacs-lisp-mode))

(after-load 'lisp-mode
  (define-key emacs-lisp-mode-map (kbd "C-x C-a") 'pp-macroexpand-last-sexp))

(require-package 'cl-lib-highlight)
(after-load 'lisp-mode
  (cl-lib-highlight-initialize))

;; ----------------------------------------------------------------------------
;; Delete .elc files when reverting the .el from VC or magit
;; ----------------------------------------------------------------------------

;; When .el files are open, we can intercept when they are modified
;; by VC or magit in order to remove .elc files that are likely to
;; be out of sync.

;; This is handy while actively working on elisp files, though
;; obviously it doesn't ensure that unopened files will also have
;; their .elc counterparts removed - VC hooks would be necessary for
;; that.

(defvar sanityinc/vc-reverting nil
  "Whether or not VC or Magit is currently reverting buffers.")

(defadvice revert-buffer (after sanityinc/maybe-remove-elc activate)
  "If reverting from VC, delete any .elc file that will now be out of sync."
  (when sanityinc/vc-reverting
    (when (and (eq 'emacs-lisp-mode major-mode)
               buffer-file-name
               (string= "el" (file-name-extension buffer-file-name)))
      (let ((elc (concat buffer-file-name "c")))
        (when (file-exists-p elc)
          (message "Removing out-of-sync elc file %s" (file-name-nondirectory elc))
          (delete-file elc))))))

(defadvice magit-revert-buffers (around sanityinc/reverting activate)
  (let ((sanityinc/vc-reverting t))
    ad-do-it))
(defadvice vc-revert-buffer-internal (around sanityinc/reverting activate)
  (let ((sanityinc/vc-reverting t))
    ad-do-it))



(require-package 'macrostep)

(after-load 'lisp-mode
  (define-key emacs-lisp-mode-map (kbd "C-c e") 'macrostep-expand))



;; A quick way to jump to the definition of a function given its key binding
(global-set-key (kbd "C-h K") 'find-function-on-key)

(after-load 'lisp-mode
  (setq lisp-imenu-generic-expression
        (list
         (list nil
               (purecopy (concat "^\\s-*("
                                 (eval-when-compile
                                   (regexp-opt
                                    '("cl-defun" "defun" "defun*" "defsubst" "defmacro"
                                      "defadvice" "define-skeleton"
                                      "define-minor-mode" "define-global-minor-mode"
                                      "define-globalized-minor-mode"
                                      "define-derived-mode" "define-generic-mode"
                                      "define-compiler-macro" "define-modify-macro"
                                      "defsetf" "define-setf-expander"
                                      "define-method-combination"
                                      "defgeneric" "defmethod") t))
                                 "\\s-+\\(\\(\\sw\\|\\s_\\)+\\)"))
               2)
         (list (purecopy "Variables")
               (purecopy (concat "^\\s-*("
                                 (eval-when-compile
                                   (regexp-opt
                                    '("defconst" "defconstant" "defcustom"
                                      "defparameter" "define-symbol-macro") t))
                                 "\\s-+\\(\\(\\sw\\|\\s_\\)+\\)"))
               2)
         ;; For `defvar', we ignore (defvar FOO) constructs.
         (list (purecopy "Variables")
               (purecopy (concat "^\\s-*(defvar\\s-+\\(\\(\\sw\\|\\s_\\)+\\)"
                                 "[[:space:]\n]+[^)]"))
               1)
         (list (purecopy "Types")
               (purecopy (concat "^\\s-*("
                                 (eval-when-compile
                                   (regexp-opt
                                    '("defgroup" "deftheme" "deftype" "defstruct"
                                      "defclass" "define-condition" "define-widget"
                                      "defface" "defpackage") t))
                                 "\\s-+'?\\(\\(\\sw\\|\\s_\\)+\\)"))
               2))

        ))


(provide 'init-lisp)
