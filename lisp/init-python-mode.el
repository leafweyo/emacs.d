;; (require-package 'elpy)
(require-package 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method nil)

(defun zx-use-ipython (&optional ipython)
  "Set defaults to use IPython instead of the standard interpreter.
With prefix arg, prompt for the command to use."
  (interactive (list (when current-prefix-arg
                       (read-file-name "IPython command: "))))
  (when (not ipython)
    (setq ipython "ipython"))

    ;; This is from the python.el commentary.
    ;; Settings for IPython 0.11:
    (setq python-shell-interpreter
          ;; ipython
          "D:\\hdevtools\\Anaconda\\python.exe"
          python-shell-interpreter-args
          ;; "console --pylab=qt"
          "-i D:\\hdevtools\\Anaconda\\Scripts\\ipython-script.py console"
          python-shell-prompt-regexp "In \\[[0-9]+\\]: "
          python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
          python-shell-completion-setup-code
          "from IPython.core.completerlib import module_completion"
          python-shell-completion-module-string-code
          "';'.join(module_completion('''%s'''))\n"
          python-shell-completion-string-code
          "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))

(defun zx-run-ipython ()
  (interactive)
  (zx-use-ipython)
  (run-python (python-shell-parse-command) nil t))

;; (elpy-enable)
;; (add-hook 'python-mode-hook 'smartparens-mode)
;; (add-hook 'inferior-python-mode-hook 'smartparens-mode)
(provide 'init-python-mode)
