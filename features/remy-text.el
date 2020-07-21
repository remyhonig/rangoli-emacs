;; remy-text.el --- text editing configuration -*- lexical-binding: t; -*-

;; Multiple cusors are a must. Make <return> insert a newline; multiple-cursors-mode can still be disabled with C-g.
(straight-use-package 'multiple-cursors)
(use-package multiple-cursors
  :config
  (setq mc/always-run-for-all 1)
  (global-set-key (kbd "M-j") 'mc/mark-next-like-this)
  (global-set-key (kbd "M-J") 'mc/mark-all-dwim)
  (define-key mc/keymap (kbd "<return>") nil))

;; =Move-text= allows moving lines around with meta-up/down.
(straight-use-package 'move-text)
(use-package move-text
  :config
  (move-text-default-bindings))

;; Join lines whether you're in a region or not.
(defun smart-join-line (beg end)
  "If in a region, join all the lines in it. If not, join the current line with the next line."
  (interactive "r")
  (if mark-active
      (join-region beg end)
      (top-join-line)))

(defun top-join-line ()
  "Join the current line with the next line."
  (interactive)
  (delete-indentation 1))

(defun join-region (beg end)
  "Join all the lines in the region."
  (interactive "r")
  (if mark-active
      (let ((beg (region-beginning))
            (end (copy-marker (region-end))))
        (goto-char beg)
        (while (< (point) end)
          (join-line 1)))))

(global-set-key (kbd "C-S-j") 'smart-join-line)
(global-set-key (kbd "C-s") 'save-buffer)              ;; save
(global-set-key (kbd "C-S-s") 'write-file)              ;; save as
(cua-mode)

(defun delete-current-line ()
 "Deletes the current line"
 (interactive)
 (forward-line 0)
 (delete-char (- (line-end-position) (point)))
 (delete-blank-lines))

(global-set-key (kbd "C-y") 'delete-current-line)

(straight-use-package 'crux)
(use-package crux
  :config
  (global-set-key (kbd "C-d") 'crux-duplicate-current-line-or-region)
  (global-set-key (kbd "C-S-r") 'crux-rename-file-and-buffer))

(global-set-key (kbd "C-S-n") 'projectile-find-file)
(global-set-key (kbd "C-<tab>") 'counsel-switch-buffer)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-f") 'swiper)
(global-set-key (kbd "C-S-f") 'counsel-rg)


(provide 'remy-text)
