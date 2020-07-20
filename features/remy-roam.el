;; remy-roam.el --- personal roam configuration -*- lexical-binding: t; -*-

(straight-use-package 'org-download)
(straight-use-package 'org-roam)
(straight-use-package 'org-roam-server)
(straight-use-package 'org-journal)
(straight-use-package 'use-package)

(require 'org-roam-protocol)

(use-package org-journal
  :custom
  (org-journal-dir org-directory)
  (org-journal-date-prefix "#+title: ")
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-date-format "%A, %d %B %Y"))

(use-package org-roam
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory org-directory)
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n j" . org-roam-jump-to-index)
               ("C-c n b" . org-roam-switch-to-buffer)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))))


(straight-use-package 'company-org-roam)
(add-to-list 'company-backends #'company-org-roam)
(add-hook 'after-init-hook 'global-company-mode)

(straight-use-package 'org-download)
(use-package org-download
  :after org
  :custom
  (org-download-screenshot-method "xclip -selection clipboard -t image/png -o > %s")
  (org-agenda-files (list org-directory)))


(setq org-roam-server-host "127.0.0.1"
      org-roam-server-port 8888
      org-roam-server-export-inline-images t
      org-roam-server-authenticate nil
      org-roam-server-network-arrows nil
      org-roam-server-network-label-truncate t
      org-roam-server-network-label-truncate-length 60
      org-roam-server-network-label-wrap-length 20)

(server-start)

(provide 'remy-roam)
