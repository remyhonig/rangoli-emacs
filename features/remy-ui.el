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
(set-face-attribute 'default nil
                    :family "Ubuntu Mono"
                    :height 160
                    :weight 'normal
                    :width 'normal)


(straight-use-package 'doom-modeline)
(doom-modeline-mode 1)

(straight-use-package 'dashboard)
(straight-use-package 'page-break-lines)

(setq dashboard-items '((recents  . 5)
                        (projects . 5)
                        (bookmarks . 5)))

(setq dashboard-center-content t)

(setq dashboard-banner-logo-title "Remy's Emacs")
(setq dashboard-startup-banner 'logo)
(setq dashboard-set-footer nil)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-navigator t)
(setq dashboard-navigator-buttons
      `(;; line1
        ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
         "Github"
         "Browse source"
         (lambda (&rest _) (browse-url "https://github.com/remyhonig/rangoli-emacs")))
         (,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
          "Linkedin"
          ""
          (lambda (&rest _) (browse-url "https://www.linkedin.com/in/remyhonig/")))
         )
        ))

(setq dashboard-set-init-info nil)

(add-hook 'dashboard-mode (lambda () (setq truncate-lines t)))
(dashboard-setup-startup-hook)
(set-fontset-font "fontset-default"
                  (cons page-break-lines-char page-break-lines-char)
                  (face-attribute 'default :family))

(setq initial-frame-alist
      '(
        (width . 102) ; character
        (height . 80) ; lines
        ))

(setq default-frame-alist
      '(
        (width . 102) ; character
        (height . 80) ; lines
        ))

(provide 'remy-ui)
