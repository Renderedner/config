(defalias 'find-pdf-page 'find-pdftools-page)

;; Para que os hyperlinks sejam case sensitive
(setq-default case-fold-search nil)


;; Criando mais facilmente variáveis locais para que eeklf e eeklfs
;; funcionem.
(defun brnm-create-local-variable-for-eev (name)
  (interactive "sQual o nome pra essa pasta?")
  "This function create a local dir variable for automatic eev codecd'ing"
  (shell-command
   (concat "echo \"((nil . ((ee-preferred-c . \\\""
	   name
	   "\\\"))))\" >> .dir-locals.el"))
  (let ((my-code-cd (ee-wrap-code-c-d name default-directory)))
    (ee-eval-string my-code-cd)
    (kill-new my-code-cd))
  (save-window-excursion
    (find-eevcfile "code-c-ds.el" 0 '(goto-char (point-max)))
    (evil-paste-after 1)
    (save-buffer)))

(defvar brnm-file-to-add-eejump-through-bcee nil
  "Name of file where entry of eejump will be added if not nil")

(defun brnm-toggle-this-file-as-eejump-bceee-target ()
  (interactive)
  "If the value of brnm-file-toadd-eejump-through-bcee is equivalent to the full path to the visited
   file, set this variable as nil. Otherwise set the variable as the fullpath name to this file."
    (if (string= (buffer-file-name) brnm-file-to-add-eejump-through-bcee)
	(setq brnm-file-to-add-eejump-through-bcee nil)
      (setq brnm-file-to-add-eejump-through-bcee (buffer-file-name))))

(defun brnm-create-eejump-to-string-hyperlink (number)
  (interactive "P")
  (if mark-active
      (eeklfs)
    (eeklf))
  (with-temp-buffer
    (insert (concat "(defun eejump-" (number-to-string number) " () "))
    (evil-paste-after 1)
    (goto-char (- (point-max) 1))
    (insert ")")
    (evil-yank (point-min) (point-max))
    (ee-eval-sexp-eol))
  (if brnm-file-to-add-eejump-through-bcee
      (save-window-excursion
	(find-file brnm-file-to-add-eejump-through-bcee)
	(goto-char (point-max))
	(evil-paste-after 1)
	(save-buffer)
	(kill-buffer)
	)))
(defalias 'bcee 'brnm-create-eejump-to-string-hyperlink)

(defun brnm-set-default-eejump-values ()
  (interactive)
  (defun eejump-1 () (find-fline "~/.config/emacs/init.el"))
  (defun eejump-2 () (mfdf))


  (defun eejump-101 () (set-frame-font "Iosevka  1" nil t))
  (defun eejump-102 () (set-frame-font "Iosevka  2" nil t))
  (defun eejump-103 () (set-frame-font "Iosevka  3" nil t))
  (defun eejump-104 () (set-frame-font "Iosevka  4" nil t))
  (defun eejump-105 () (set-frame-font "Iosevka  5" nil t))
  (defun eejump-106 () (set-frame-font "Iosevka  6" nil t))
  (defun eejump-107 () (set-frame-font "Iosevka  7" nil t))
  (defun eejump-108 () (set-frame-font "Iosevka  8" nil t))
  (defun eejump-109 () (set-frame-font "Iosevka  9" nil t))
  (defun eejump-110 () (set-frame-font "Iosevka 10" nil t))
  (defun eejump-111 () (set-frame-font "Iosevka 11" nil t))
  (defun eejump-112 () (set-frame-font "Iosevka 12" nil t))
  (defun eejump-114 () (set-frame-font "Iosevka 14" nil t))
  (defun eejump-116 () (set-frame-font "Iosevka 16" nil t))
  (defun eejump-118 () (set-frame-font "Iosevka 18" nil t))
  (defun eejump-120 () (set-frame-font "Iosevka 20" nil t)))

(brnm-set-default-eejump-values)

(defvar brnm-eejump-save-file nil "File where config of eejump will be saved and loaded")
(setq brnm-eejump-save-file "~/eejump-save-file.el")
(defun brnm-save-current-eejump-settings ()
  (interactive)
  (save-window-excursion
   (find-eejumps)
   (let ((eejump-content (buffer-substring-no-properties (point-min) (point-max))))
     (find-file brnm-eejump-save-file)
     (erase-buffer)
     (insert eejump-content)
     (save-buffer))))

(defun brnm-load-eejump-settings-from-file ()
  (interactive)
  (load brnm-eejump-save-file))


;; Customizando o eejump mais facilmente
(defun brnm-find-bcee-file-on-this-git-repo ()
  (interactive)
  "This function will find the file meta/eejump-targets.el located in the root of the current git repository."
  (shell-command "git rev-parse --show-toplevel")
  (let ((local-root-dir (with-current-buffer shell-command-buffer-name
			  (concat (buffer-substring-no-properties (point-min) (- (point-max) 1)) "/"))))
    (find-file (concat local-root-dir "meta/eejump-targets.el"))))
(defalias 'fbcee 'brnm-find-bcee-file-on-this-git-repo)
(advice-add 'fbcee :after (lambda () () (setq brnm-file-to-add-eejump-through-bcee (buffer-file-name))))

;; (load-file "templates.el")		;

;; ;; Fixing eev-avadj-mode-map for evil.
;; (evil-define-key 'normal eev-avadj-mode-map (kbd "M--") 'ee-time-from-bol-shift-)
;; (evil-define-key 'normal eev-avadj-mode-map (kbd "M-=") 'ee-time-from-bol-shift)
;; (evil-define-key 'normal eev-avadj-mode-map (kbd "M-+") 'ee-time-from-bol-shift)
;; (evil-define-key 'normal eev-avadj-mode-map (kbd "M-p") 'ee-time-from-bol-rerun)

;; (find-evariable 'ee-hyperlink-prefix)
(setq ee-hyperlink-prefix "")


;; (find-brxxx-intro)
(code-brurl 'find-chromium  :remote 'brg  :local 'brgl  :dired 'brgd)
;; (find-eev "eev-plinks.el" "find-googlechrome")
(defvar ee-chromium-program "chromium")
(defun find-chromium (url) (find-bgprocess `(,ee-chromium-program ,url)))


;; (advice-add 'to :before (lambda (fodasi) (push-mark)))
;; (advice-remove 'to (lambda (fodasi) (push-mark)))

;; (find-efunction 'mc-meta-file-follow-link)
(advice-add 'mc-meta-file-follow-link :before (lambda (fodasi) (push-mark)))

;; <eewrap-html2pdf>
;; Skel: (find-eewrap-links "H" "html2pdf" "c url")
;; Test: (find-eewraptest-links "html2pdf" "c url")
(defun  eewrap-html2pdf () (interactive)
  (ee-this-line-wrapn 2 'ee-wrap-html2pdf))
(defun ee-wrap-html2pdf (c url)
  "An internal function used by `eewrap-html2pdf'."
  (ee-template0 "\
{(ee-HS `(find-html2pdf-links ,c ,url))}"))
(define-key eev-mode-map "\M-H" 'eewrap-html2pdf)

;; <eewrap-pyinspect>
;; Skel: (find-eewrap-links "Y" "pyinspect" "var")
;; Test: (find-eewraptest-links "pyinspect" "var")
(defun  eewrap-pyinspect () (interactive)
  (ee-this-line-wrapn 1 'ee-wrap-pyinspect))
(defun ee-wrap-pyinspect (var)
  "An internal function used by `eewrap-pyinspect'."
  (let ((ee-hyperlink-prefix "# "))
  (ee-template0 "\
{(ee-HS `(find-pyinspect-links ,var))}")))
(define-key eev-mode-map "\M-Y" 'eewrap-pyinspect)
