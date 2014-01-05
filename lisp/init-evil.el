(require-package 'evil)
(require-package 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(require-package 'evil-nerd-commenter)
(evilnc-default-hotkeys)
(evil-mode 1)
(evil-leader/set-key
  ;; "k" 'windmove-up
  ;; "j" 'windmove-down
  ;; "h" 'windmove-left
  ;; "l" 'windmove-right
  "b" 'switch-to-buffer)
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
;; (evil-ex-define-cmd "b " 'find-file)
(define-key evil-ex-map "e " 'find-file)
(define-key evil-ex-map "b " 'ido-switch-buffer)
(define-key evil-normal-state-map ";f" 'save-buffer)
(define-key evil-insert-state-map ";f" (lambda () (interactive) (progn (save-buffer) (evil-normal-state))))
(evil-leader/set-key
  "c" 'evilnc-comment-or-uncomment-lines
  ;; "cl" 'evilnc-comment-or-uncomment-to-the-line
  ;; "cc" 'evilnc-copy-and-comment-lines
  ;; "cp" 'evilnc-comment-or-uncomment-paragraphs
  ;; "cr" 'comment-or-uncomment-region
  "el" 'eval-last-sexp
  "eb" 'eval-buffer
  "ee" 'eval-expression
  "<" 'paredit-backward-slurp-sexp
  ">" 'paredit-forward-slurp-sexp
  "im" 'imenu
  "kw" 'delete-window
  "ko" 'delete-other-windows
  "ss" 'switch-window
  "sl" 'split-window-right
  "sj" 'split-window-below
  )
(global-set-key (kbd "C-;") 'smex)
(defalias 'list-buffers 'ibuffer)
(provide 'init-evil)
