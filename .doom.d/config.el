;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one
      doom-font (font-spec :family "Iosevka Term SS04" :size 19 :weight 'light)
      doom-big-font (font-spec :family "Iosevka Term SS04":size 36)
      default-directory "/home/giovanni"
      display-line-numbers-type t
      mac-command-modifier 'meta
      dired-dwim-target t
      org-ellipsis " ▾ "
      org-bullets-bullet-list '("·")
      org-tags-column -80
      css-indent-offset 2
      org-refile-targets (quote ((nil :maxlevel . 1)))
      )
;;This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(after! org
  (setq org-directory "~/org/")
  (setq org-log-done 'time)
  (setq org-agenda-files '("~/org/agenda.org"))
   (setq org-todo-keywords
         '((sequence "TODO(t)" "PROJ(p)" "EXAM(e)" "STUDY(s)" "WAIT(w)" "|" "DONE(d)" "CANCELLED(c)")
           (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")
           )
         )
)

;; (after! latex
;;   (add-hook 'doc-view-mode-hook 'auto-revert-mode)
;;   (setq TeX-source-correlate-mode t)
;;   (setq TeX-source-correlate-start-server t)
;;   (setq TeX-source-correlate-method 'synctex)
;;   (setq TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
;;   (setq TeX-view-program-selection '((output-pdf "PDF Tools")))
;;   (add-hook 'LaTeX-mode-hook #'display-line-numbers-mode)
;;   (add-hook 'LaTeX-mode-hook #'turn-on-auto-fill)
;;   (setq reftex-plug-into-AUCTeX t)
;;   (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;;   )

(use-package tex
  :ensure auctex
  :defer t
  :init
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-save-query nil)
  (setq TeX-PDF-mode t))

(setq TeX-view-program-selection '((output-pdf "Okular")))
(setq TeX-view-program-list
      '(("Okular" "okular --unique %o#src:%n%b")))

(load "auctex.el" nil t t)

(with-eval-after-load 'tex
  (define-key TeX-mode-map (kbd "C-c C-a") 'TeX-command-run-all))
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
