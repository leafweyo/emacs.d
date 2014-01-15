(require-package 'evil)
(require-package 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ";")
(require-package 'key-chord)
(setq key-chord-two-keys-delay 1)
(setq key-chord-one-keys-delay 1)
(key-chord-mode 1)
(require-package 'evil-nerd-commenter)
(evilnc-default-hotkeys)
(evil-mode 1)

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
;; (define-key evil-normal-state-map ";f" 'save-buffer)


(define-key evil-normal-state-map (kbd "SPC") 'evil-ex)
;;(define-key evil-insert-state-map )
(key-chord-define evil-insert-state-map ";f" (lambda () (interactive) (progn (save-buffer) (evil-normal-state))))
(key-chord-define evil-insert-state-map ";s" 'switch-window)
(evil-leader/set-key "f" 'save-buffer)
(evil-leader/set-key
  ;; "b" 'switch-to-buffer
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
  "s" 'switch-window
  ;; "sl" 'split-window-right
  ;; "sj" 'split-window-below
  )
(global-set-key (kbd "C-;") 'smex)
(defalias 'list-buffers 'ibuffer)
(defun evil-symsearch () (interactive) (setq evil-symbol-word-search t))
(provide 'init-evil)
