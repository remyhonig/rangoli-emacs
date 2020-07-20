;; remy-ui.el --- personal ui configuration -*- lexical-binding: t; -*-

(setq rangoli/default-theme-light 'tango)
(setq rangoli/default-theme-dark 'gruvbox)

(straight-use-package 'beacon)
(straight-use-package 'ace-jump-mode)
(straight-use-package 'use-package)

(use-package ace-jump-mode
  :init
  (global-set-key (kbd "M-;") 'ace-jump-mode))

(use-package beacon
  :init
  (beacon-mode 1)
  (setq beacon-color "#23DF2F")
  (setq beacon-blink-duration 0.4)
  (setq beacon-blink-when-point-moves-vertically 1)
  (setq beacon-blink-when-point-moves-horizontally 1)
  (setq beacon-size 20))

(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)
(set-frame-font "Jetbrains Mono 14" nil t)

(straight-use-package 'doom-modeline)
(doom-modeline-mode 1)

(provide 'remy-ui)
