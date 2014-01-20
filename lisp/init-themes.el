(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)
(require-package 'sublime-themes)


;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(spolsky))


;; (let ( (zenburn-fg   "#dcdccc") (zenburn-bg-1   "#2b2b2b") (zenburn-bg   "#3f3f3f") (zenburn-bg+1   "#4f4f4f")
;;        (zenburn-bg+2   "#5f5f5f") (zenburn-red+1   "#dca3a3") (zenburn-red   "#cc9393") (zenburn-red-1   "#bc8383")
;;        (zenburn-red-2   "#ac7373") (zenburn-red-3   "#9c6363") (zenburn-red-4   "#8c5353") (zenburn-orange  "#dfaf8f")
;;        (zenburn-yellow  "#f0dfaf") (zenburn-yellow-1  "#e0cf9f") (zenburn-yellow-2  "#d0bf8f") (zenburn-green-4   "#2e3330") (zenburn-green-1   "#5f7f5f") (zenburn-green   "#7f9f7f") (zenburn-green+1   "#8fb28f")
;;        (zenburn-green+2   "#9fc59f") (zenburn-green+3   "#afd8af") (zenburn-green+4   "#bfebbf") (zenburn-cyan   "#93e0e3")
;;        (zenburn-blue+1   "#94bff3") (zenburn-blue   "#8cd0d3") (zenburn-blue-1   "#7cb8bb") (zenburn-blue-2   "#6ca0a3")
;;        (zenburn-blue-3   "#5c888b") (zenburn-blue-4   "#4c7073") (zenburn-blue-5   "#366060") (zenburn-magenta  "#dc8cc3"))
;;   (custom-set-faces
;;    `(rainbow-delimiters-depth-1-face ((t (:foreground ,zenburn-cyan))))
;;    `(rainbow-delimiters-depth-2-face ((t (:foreground ,zenburn-yellow))))
;;    `(rainbow-delimiters-depth-3-face ((t (:foreground ,zenburn-blue+1))))
;;    `(rainbow-delimiters-depth-4-face ((t (:foreground ,zenburn-red+1))))
;;    `(rainbow-delimiters-depth-5-face ((t (:foreground ,zenburn-green+1))))
;;    `(rainbow-delimiters-depth-6-face ((t (:foreground ,zenburn-blue-1))))
;;    `(rainbow-delimiters-depth-7-face ((t (:foreground ,zenburn-orange))))
;;    `(rainbow-delimiters-depth-8-face ((t (:foreground ,zenburn-magenta))))
;;    `(rainbow-delimiters-depth-9-face ((t (:foreground ,zenburn-yellow-2))))
;;    `(rainbow-delimiters-depth-10-face ((t (:foreground ,zenburn-green+2))))
;;    `(rainbow-delimiters-depth-11-face ((t (:foreground ,zenburn-blue+1))))
;;    `(rainbow-delimiters-depth-12-face ((t (:foreground ,zenburn-red-4))))))


(let ((class '((class color) (min-colors 89)))
      ;; Palette colors.
      (yellow-1 "#fce94f") (yellow-2 "#ffd700") (yellow-3 "#c4a000") (yellow-4 "#875f00")
      (orange-1 "#ffaf5f") (orange-2 "#ff8700") (orange-3 "#ff5d17") (orange-4 "#d75f00")
      (magenta-1 "#ff7bbb") (magenta-2 "#ff4ea3") (magenta-3 "#ff1f8b")
      (green-1 "#afff00") (green-2 "#a1db00") (green-3 "#5faf00") (green-4 "#008700") (green-5 "#005f00")
      (blue-1 "#729fcf") (blue-2 "#1f5bff") (blue-3 "#005f87") (blue-4 "#005faf") (blue-5 "#0000af")
      (cyan-1 "#87ffff") (cyan-2 "#00ffff") (cyan-3 "#00d7af") (cyan-4 "#5f87af")
      (purple-1 "#d18aff") (purple-2 "#af5fff") (purple-3 "#9a08ff") (purple-4 "#6c0099")
      (red-1 "#ef2929")  (red-2 "#dd0000")  (red-3 "#a40000")
      (white-1 "#c6c6c6") (white-2 "#c6c6c6") (white-3 "#b2b2b2") (LIGHT_BG "#ffffd7") ;;original:(white-1 "#dadada")
      (black-1 "#a8a8a8") (black-2 "#8a8a8a") (black-2-5 "#6c6c6c") (black-3 "#4e4e4e")
      (green-01 "#d7ff00") (green-02 "#87ff87") (white-0 "#ffffff")
      (green-0 "#d7ff5f") (blue-0 "#8cc4ff") (purple-0 "#af87ff") (yellow-0 "#ffff87") (magenta-0 "#ffafff")
      (red-0 "#ff4b4b")  (black-4 "#3a3a3a") (black-5 "#303030") (black-6 "#000000") (orange-0 "#ffaf87")
      (green-00 "#d7ff87") (yellow-00 "#ffffaf") (orange-00 "#ffd787") (blue-00 "#d7d7ff") (purple-00 "#e6a8df"))
  (custom-set-faces
   ;; `(rainbow-delimiters-depth-1-face ((,class (:bold nil :foreground ,blue-1))))
   ;; `(rainbow-delimiters-depth-2-face ((,class (:bold nil :foreground ,green-2))))
   ;; `(rainbow-delimiters-depth-3-face ((,class (:bold nil :foreground ,magenta-2))))
   ;; `(rainbow-delimiters-depth-4-face ((,class (:bold nil :foreground ,cyan-3))))
   ;; `(rainbow-delimiters-depth-5-face ((,class (:bold nil :foreground ,orange-2))))
   ;; `(rainbow-delimiters-depth-6-face ((,class (:bold nil :foreground ,purple-2))))
   ;; `(rainbow-delimiters-depth-7-face ((,class (:bold nil :foreground ,white-1))))
   ;; `(rainbow-delimiters-depth-8-face ((,class (:bold nil :foreground ,yellow-2))))
   ;; `(rainbow-delimiters-depth-9-face ((,class (:bold nil :foreground ,red-2))))
   `(rainbow-delimiters-depth-1-face ((,class (:bold nil :foreground ,white-3))))
   `(rainbow-delimiters-depth-2-face ((,class (:bold nil :foreground ,blue-1))))
   `(rainbow-delimiters-depth-3-face ((,class (:bold nil :foreground ,green-2))))
   `(rainbow-delimiters-depth-4-face ((,class (:bold nil :foreground ,magenta-2))))
   `(rainbow-delimiters-depth-5-face ((,class (:bold nil :foreground ,cyan-3))))
   `(rainbow-delimiters-depth-6-face ((,class (:bold nil :foreground ,orange-2))))
   `(rainbow-delimiters-depth-7-face ((,class (:bold nil :foreground ,purple-2))))
   `(rainbow-delimiters-depth-8-face ((,class (:bold nil :foreground ,white-1))))
   `(rainbow-delimiters-depth-9-face ((,class (:bold nil :foreground ,yellow-2))))
   `(rainbow-delimiters-unmatched-face ((,class (:foreground ,white-0 :background ,red-3 :bold t))))))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(set-cursor-color "#ffffff")

(add-hook 'after-init-hook 'reapply-themes)

(provide 'init-themes)
