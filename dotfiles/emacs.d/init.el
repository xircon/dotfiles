(package-initialize)

;;(setq desktop-restore-eager 10)

(setq frame-resize-pixelwise t)

(set-cursor-color "lightgreen")

(set-default 'truncate-lines t)

;; (setq package-archives
;;         '(("Elpa"     . "https://elpa.gnu.org/packages/")
;;           ("Melpa Stable" . "https://stable.melpa.org/packages/")
;;           ("Melpa"        . "https://melpa.org/packages/")
;;           ("marmalade" . "http://marmalade-repo.org/packages/"))
;;         package-archive-priorities
;;         '(("MELPA Stable" . 10)
;;           ("GNU ELPA"     . 5)
;;           ("MELPA"        . 0)))

;;(add-to-list 'default-frame-alist '(background-color . "#000000"))
(ryo-modal-mode -1)

(require 'iy-go-to-char)

;;(add-hook 'buffer-list-update-hook 'ryo-mod-off)

;;(require 'org-wiki)
;;(setq org-wiki-location "~/org-wiki")

(defun minibuffer-bg ()
  (set (make-local-variable 'face-remapping-alist)
       '((default :background "#232959"))))

(defun my-kill-emacs ()
  ;; "Set kill-emacs-query-functions , confirm-kill-emacs , and kill-emacs-hook to nil to quit emacs without any pesky prompts (except to save buffers)."
  (let (kill-emacs-query-functions confirm-kill-emacs kill-emacs-hook)
    (save-buffers-kill-emacs)))

(org-babel-load-file "~/dotfiles/emacs.d/config.org")


;; (if (display-graphic-p)
;;     (progn
;;       ;; if graphic
;;       (org-babel-load-file "~/dotfiles/emacs.d/config.org"))

;;   ;;****else (optional)****

;;   ;;(org-babel-load-file "~/dotfiles/emacs.d/config-term.org")
;;   (org-babel-load-file "~/dotfiles/emacs.d/config.org")
;;   (set-face-background 'mode-line "#0000ff")
;;   (set-face-foreground 'mode-line "#ffffff")
;; ;;(add-to-list 'default-frame-alist '(background-color . "#000000"))
;;   (add-hook 'minibuffer-setup-hook 'minibuffer-bg)
;;   ;(require 'init-ligatures)
;;   ;;(setq ivy-display-style 'fancy)
;;   )

(set-face-background 'mode-line "#0000ff")
(message "ryo off!!")
(ryo-modal-mode -1)
;;(shell-command "notify-send 'Emacs Loaded'")
