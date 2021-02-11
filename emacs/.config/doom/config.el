(load "~/.config/doom/mail-ids")
(setq user-full-name "Chinmay Dalal")
(setq user-mail-address (personal-mail))

(setq org-directory "~/org/")

(setq doom-theme 'doom-dark+)

(setq display-line-numbers-type 'relative)

;(setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;      doom-variable-pitch-font (font-spec :family "sans" :size 13))

(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 15 :style "Regular")
      doom-unicode-font (font-spec :family "FontAwesome 5 Free" :size 12)
      doom-serif-font (font-spec :family "C059" :size 15 :style "Roman")
      doom-big-font (font-spec :family "Fira Sans" :size 19))

(require 'smtpmail)

(use-package mu4e
  :init
  (add-load-path! "/usr/share/emacs/site-lisp/mu4e")
  :config
  (progn (setq mail-user-agent 'mu4e-user-agent
               sendmail-program "/usr/bin/msmtp"
               mu4e-get-mail-command "offlineimap"
               message-send-mail-function 'smtpmail-send-it
               message-sendmail-f-is-evil t
               message-sendmail-extra-arguments '("--read-envelope-from")
               message-send-mail-function 'message-send-mail-with-sendmail
               mu4e-sent-messages-behavior 'delete)

         (setq mu4e-headers-date-format "%d-%m-%Y %H:%M"
               mu4e-headers-fields '((:human-date . 20)
                                     (:flags . 6)
                                     (:from . 22)
                                     (:maildir . 8)
                                     (:subject)))

         (setq mu4e-contexts
               `( ,(make-mu4e-context
                    :name "Personal"
                    :match-func (lambda (msg) (when msg
                                                (string-prefix-p "/GMail" (mu4e-message-field msg :maildir))))
                    :vars `(
                            (mu4e-refile-folder           . "/GMail/[Gmail].Archive")
                            (mu4e-drafts-folder           . "/GMail/[Gmail].Drafts")
                            (mu4e-sent-folder             . "/GMail/[Gmail].Sent Mail")
                            (mu4e-trash-folder            . "/GMail/Trash")
                            (smtpmail-stream-type         . tls)
                            (smtpmail-default-smtp-server . "smtp.gmail.com")
                            (smtpmail-smtp-server         . "smtp.gmail.com")
                            (smtpmail-smtp-service        . 587)
                            (smtpmail-smtp-user           . ,(personal-mail))
                            (user-mail-address            . ,(personal-mail))))
                  ,(make-mu4e-context
                    :name "BITS"
                    :match-func (lambda (msg) (when msg
                                                (string-prefix-p "/BITS" (mu4e-message-field msg :maildir))))
                    :vars `(
                            (mu4e-refile-folder           . "/BITS/[Gmail].Archive")
                            (mu4e-drafts-folder           . "/BITS/[Gmail].Drafts")
                            (mu4e-sent-folder             . "/BITS/[Gmail].Sent Mail")
                            (mu4e-trash-folder            . "/BITS/Trash")
                            (smtpmail-stream-type         . tls)
                            (smtpmail-default-smtp-server . "smtp.gmail.com")
                            (smtpmail-smtp-server         . "smtp.gmail.com")
                            (smtpmail-smtp-service        . 587)
                            (user-mail-address            . ,(college-mail))
                            (smtpmail-smtp-user           . ,(college-mail))))))))

(require 'org-mu4e)
;;store link to message if in header view, not to header query
(setq org-mu4e-link-query-in-headers-mode nil)
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/org/todo.org" "Tasks")
         "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")))

(defun increment-clojure-cookbook ()
  "When reading the Clojure cookbook, find the next section, and
close the buffer. If the next section is a sub-directory or in
the next chapter, open Dired so you can find it manually."
  (interactive)
  (let* ((cur (buffer-name))
         (split-cur (split-string cur "[-_]"))
         (chap (car split-cur))
         (rec (car (cdr split-cur)))
         (rec-num (string-to-number rec))
         (next-rec-num (1+ rec-num))
         (next-rec-s (number-to-string next-rec-num))
         (next-rec (if (< next-rec-num 10)
                       (concat "0" next-rec-s)
                     next-rec-s))
         (target (file-name-completion (concat chap "-" next-rec) "")))
    (progn
      (if (equal target nil)
          (dired (file-name-directory (buffer-file-name)

        (find-file target))))
      (kill-buffer cur))))
(map! :map adoc-mode-map "M-+" #'increment-clojure-cookbook)

(use-package tree-sitter
  :config
  (progn (require 'tree-sitter-langs)
         (global-tree-sitter-mode)
         (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
         (load "~/.config/doom/queries.el")))

(setq oj-home-dir "~/cp-contests/oj")

;(use-package dap-gdb-lldb
;  :config (dap-gdb-lldb-setup))
