;; Always use newest init.el file
(setq load-prefer-newer t)
;; Disable startup screen
(setq inhibit-startup-message t)

;; Disable unneeded UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)

;; Annoying stuff
(setq
 make-backup-files nil ; Stop creating backup files `init.el~`
 auto-save-default nil ; Disable autosave
 initial-scratch-message nil ; Don't open *scratch* with text in it
 custom-file "/dev/null" ; Don't save customizations
 help-window-select t ; Move to help window when opening it
 )

;; Theme and font
(load-theme 'wombat t)
(set-face-attribute 'default nil :font "JetBrains Mono" :height 120) ; 120 => 12.0pt

;; -------------------
;; ----- Options -----
;; -------------------

;; Flash when the bell rings
(setq
 visible-bell t ; Flash when the bell rings
 cursor-in-non-selected-windows nil ; Only show cursor in selected window
 )

;; Display line numbers
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(setq-default
 display-line-numbers-type 'relative
 display-line-numbers-widen t
 display-line-numbers-current-absolute t
 )

;; Blinking cursor when idle
(blink-cursor-mode 1)

;; Remember where cursor was in closed file
(save-place-mode 1)

;; Auto-load buffers on external change
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; List recent files
(recentf-mode 1)
(setq recentf-max-saved-items nil) ; Save entire recent files list
(global-set-key (kbd "C-x C-h") 'recentf-open-files)

;; --------------------
;; ----- Packages -----
;; --------------------

;; Enable packages and MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; EVIL Mode
(use-package evil
  :ensure t
  :init ; Before plugin load
  (setq evil-want-C-u-scroll t) ; Scroll up using C-u
  
  :config ; After plugin load
  (evil-mode 1)
  (setq evil-insert-state-cursor 'box) ; Cursor is always box
  (evil-global-set-key 'motion (kbd "C-f") nil) ; Unbind C-f to use for fuzzy file finding
  (evil-global-set-key 'normal (kbd "<TAB>") 'completion-at-point)
  ;; TODO: does not work
  (evil-global-set-key 'insert (kbd "<TAB>") 'indent-for-tab-command)
  )

;; Better completion backend for Emacs
(use-package ivy
  :ensure t
  :defer t
  :config
  (ivy-mode 1) 
  )
;; Replace builtin Emacs functions to use Ivy
(use-package counsel
  :ensure t
  :bind (("C-f" . counsel-find-file))
  )
;; Better interface for Ivy and Counsel
(use-package ivy-rich
  :ensure t
  :config
  (ivy-rich-mode 1)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (setq
   ;; ivy-initial-inputs-alist nil
   ivy-re-builders-alist '((t . ivy--regex-ignore-order))
   ivy-rich-path-style 'abbrev)
  )

;; Completion window
(use-package corfu
  :ensure t
  :bind
  (:map corfu-map
        ("C-y" . corfu-insert))

  :init
  (global-corfu-mode t)

  :config
  (keymap-unset corfu-map "RET")
  )

;; Move lines and regions up and down
(use-package move-text
  :ensure t
  :pin "melpa-stable"
  :bind
  (("M-k" . move-text-up)
   ("M-j" . move-text-down))
  )

;; -------------------
;; ----- Keymaps -----
;; -------------------

(global-set-key (kbd "C-c C-c") 'comment-line)
(global-set-key (kbd "C-s") 'save-buffer)
