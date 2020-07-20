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
  (setq beacon-color "#23FF2F")
  (setq beacon-blink-duration 0.4)
  (setq beacon-blink-when-point-moves-vertically 1)
  (setq beacon-blink-when-point-moves-horizontally 1)
  (setq beacon-size 20))

(provide 'remy-ui)
