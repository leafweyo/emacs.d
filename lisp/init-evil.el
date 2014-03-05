(require-package 'ace-jump-buffer)
(require 'ace-jump-buffer)
(require-package 'evil)
(require-package 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ";")
;; (require-package 'key-chord)
(require 'key-chord)
(setq key-chord-two-keys-delay 0.5)
(setq key-chord-one-keys-delay 1)
(key-chord-mode 1)
(require-package 'evil-nerd-commenter)
(evilnc-default-hotkeys)
(evil-mode 1)

(global-set-key (kbd "C-s") (lambda () (interactive) (progn (save-buffer) (evil-normal-state))))
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
  ;; "<" 'paredit-backward-slurp-sexp
  ;; ">" 'paredit-forward-slurp-sexp
  "<" 'sp-backward-slurp-sexp
  ">" 'sp-forward-slurp-sexp
  "i" 'imenu
  "kw" 'delete-window
  "ko" 'delete-other-windows
  "s" 'switch-window
  ;; "sl" 'split-window-right
  ;; "sj" 'split-window-below
  )

(evil-leader/set-key-for-mode 'clojure-mode "ef" 'cider-eval-defun-at-point)
(evil-leader/set-key-for-mode 'clojure-mode "eb" 'cider-load-current-buffer)
(evil-leader/set-key-for-mode 'python-mode "ef" 'python-shell-send-defun)
(evil-leader/set-key-for-mode 'python-mode "eb" 'python-shell-send-buffer)
;; (evil-leader/set-key-for-mode 'python-mode "eb" 'elpy-shell-send-region-or-buffer)

(global-set-key (kbd "C-;") 'smex)
(defalias 'list-buffers 'ibuffer)
(defun evil-symsearch () (interactive) (setq evil-symbol-word-search t))

(defvar my-keys-mode-map (make-keymap) "my-keys-minor-mode keymap.")
(define-key my-keys-mode-map (kbd "C-j") 'ace-jump-buffer)
(define-minor-mode my-keys-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)
;; (defun my-minibuffer-setup-hook ()
;;   (my-keys-minor-mode 0))
;; (add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)
(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-mode))
      (let ((mykeys (assq 'my-keys-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)
(my-keys-mode 1)

(defun vi-open-line-below ()
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(global-set-key (kbd "M-o") 'vi-open-line-below)
(global-set-key (kbd "M-l") 'right-char)



(provide 'init-evil)
