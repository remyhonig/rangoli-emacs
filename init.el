;;; Straight bootstrap
;; https://github.com/raxod502/straight.el

(setq straight-repository-branch "develop"
      straight-enable-use-package-integration nil)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; Features

(add-to-list 'load-path (concat user-emacs-directory "features/"))

;; You /will/ need these
(require 'rangoli-core)
(require 'rangoli-config)
(require 'rangoli-keybindings)
(require 'rangoli-ui)

;; You /may/ need these
(require 'rangoli-org)
(require 'rangoli-markdown)
;; (require 'rangoli-git)
;; (require 'rangoli-projects)
;; (require 'rangoli-programming)
;; (require 'rangoli-pdf)
;; (require 'rangoli-python)
;; (require 'rangoli-swift)
;; (require 'rangoli-java)
;; (require 'rangoli-timer)
;; (require 'rangoli-websearch)
;; (require 'rangoli-emoji)

;;; Personalization

(let ((rangoli-personal-config (f-expand "~/.rangoli-emacs-personal/init.el")))
  (when (f-exists? rangoli-personal-config)
    (load rangoli-personal-config)))