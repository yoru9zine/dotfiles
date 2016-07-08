
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq column-number-mode t)
                                        ;ああああ
                                        ;aaaaaaaa
(defun font-monaco()
  (interactive)
  (set-face-attribute 'default nil
                      :family "Monaco" ;; font
                      :height 75)
  )
(defun font-ricty()
  (interactive)
(set-face-attribute 'default nil
                    :family "Ricty" ;; font
                    :height 90)
)
(font-ricty)
                                        ;(set-face-attribute 'default nil
;                    :family "Ricty Discord" ;; font
;                    :height 80)    ;; font size

;(set-face-attribute 'default nil
;                    :family "Source Han Code JP M" ;; font
;                    :height 75)    ;; font size

(when (display-graphic-p)
;rendering speed が落ちるので見送り中
;; (set-face-attribute 'default nil :family "Monaco" :height 75)
;; (set-fontset-font (frame-parameter nil 'font)
;;                   'japanese-jisx0208
;;                   (font-spec :family "Hiragino Kaku Gothic Pro" :size 12))
;; (set-fontset-font (frame-parameter nil 'font)
;;                   'japanese-jisx0212
;;                   (font-spec :family "Hiragino Kaku Gothic Pro" :size 12))
;; (set-fontset-font (frame-parameter nil 'font)
;;                   'katakana-jisx0201
;;                   (font-spec :family "Hiragino Kaku Gothic Pro" :size 12))
;; (add-to-list 'face-font-rescale-alist
;;              '(".*Hiragino Kaku Gothic Pro.*" . 1.2))

;; (set-face-attribute 'default nil
;;                     :family "Ricty Discord"
;;                     :height 90)
;; (set-fontset-font (frame-parameter nil 'font)
;;                   'japanese-jisx0208
;;                   (cons "Ricty Discord" "iso10646-1"))
;; (set-fontset-font (frame-parameter nil 'font)
;;                   'japanese-jisx0212
;;                   (cons "Ricty Discord" "iso10646-1"))
;; (set-fontset-font (frame-parameter nil 'font)
;;                   'katakana-jisx0201
;;                   (cons "Ricty Discord" "iso10646-1"))


;(set-face-attribute 'default nil
;                    :family "Source Han Code JP M"
;                    :height 70)
;(set-fontset-font (frame-parameter nil 'font)
;                  'japanese-jisx0208
;                  (cons "Source Han Code JP M" "iso10646-1"))
;(set-fontset-font (frame-parameter nil 'font)
;                  'japanese-jisx0212
;                  (cons "Source Han Code JP M" "iso10646-1"))
;(set-fontset-font (frame-parameter nil 'font)
;                  'katakana-jisx0201
;                  (cons "Source Han Code JP M" "iso10646-1"))
  )

(keyboard-translate ?\C-h ?\C-?)
;; stop window close when C-[...
(global-set-key (kbd "M-ESC ESC") 'keyboard-quit)
(electric-indent-mode +1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(setq solarized-distinct-fringe-background t)
(setq solarized-use-variable-pitch nil)
(setq solarized-high-contrast-mode-line t)
(setq solarized-height-minus-1 1.0)
(setq solarized-height-plus-1 1.0)
(setq solarized-height-plus-2 1.0)
(setq solarized-height-plus-3 1.0)
(setq solarized-height-plus-4 1.0)
(load-theme 'solarized-light t)

;; workaround for jump cursor in scroll (scrolling performance issue)
(setq scroll-step 1)
(setq scroll-conservatively 100000)
(setq auto-window-vscroll nil)
(setq redisplay-dont-pause t)
(setq jit-lock-defer-time 0.05)
(setq-default cache-long-line-scans t)
(setq line-move-visual nil)

;; clipboard
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)

;; windmove
(global-set-key (kbd "C-S-h")  'windmove-left)
(global-set-key (kbd "C-S-j")  'windmove-down)
(global-set-key (kbd "C-S-k")    'windmove-up)
(global-set-key (kbd "C-S-l") 'windmove-right)

;; misc
(defun my-end-of-line ()
  (interactive)
  (end-of-line)
  (if (eq last-command this-command)
      (delete-horizontal-space)))
(global-set-key "\C-e" 'my-end-of-line)

(defun my-move-beginning-of-line ()
  (interactive)
  (if (bolp)
      (back-to-indentation)
      (beginning-of-line)))

(global-set-key "\C-a" 'my-move-beginning-of-line)

(blink-cursor-mode 0)
(show-paren-mode 1)
(global-hl-line-mode t)
(setq-default tab-width 4 indent-tabs-mode nil)
(set-default 'truncate-lines t)
;
; whitespace
;; 全角スペース タブ trailing-spacesを目立たせる
(require 'whitespace)
;; space-markとtab-mark、それからspacesとtrailingを対象とする
(setq whitespace-style '(space-mark tab-mark face spaces trailing newline newline-mark))
(setq whitespace-display-mappings
      '(
        ;(space-mark   ?\      [?\u00B7]     [?.])    ; space - centered dot
        (space-mark   ?\u2001 [?\u00B7]     [?.])    ; space - centered dot
        (space-mark   ?\u2003 [?\u00B7]     [?.])    ; space - centered dot
        (space-mark   ?\xA0   [?\u00A4]     [?_])    ; hard space - currency
        (space-mark   ?\x8A0  [?\x8A4]      [?_])    ; hard space - currency
        (space-mark   ?\x920  [?\x924]      [?_])    ; hard space - currency
        (space-mark   ?\xE20  [?\xE24]      [?_])    ; hard space - currency
        (space-mark   ?\xF20  [?\xF24]      [?_])    ; hard space - currency
        (space-mark   ?\u3000 [?\u25a1]     [?_ ?_]) ; full-width-space - square
        ;; NEWLINE is displayed using the face `whitespace-newline'
        ;(newline-mark ?\n    [?$ ?\n])  ; eol - dollar sign
        (newline-mark ?\n    [?\u21B5 ?\n] [?$ ?\n]) ; eol - downwards arrow
        ;(newline-mark ?\n    [?\u00B6 ?\n] [?$ ?\n]) ; eol - pilcrow
        ;(newline-mark ?\n    [?\x8AF ?\n]  [?$ ?\n]) ; eol - overscore
        ;(newline-mark ?\n    [?\x8AC ?\n]  [?$ ?\n]) ; eol - negation
        ;(newline-mark ?\n    [?\x8B0 ?\n]  [?$ ?\n]) ; eol - grade
        ;;
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t]) ; tab - left quote mark
        ))
;; whitespace-spaceの定義を全角スペースにし、色をつけて目立たせる
;; (setq whitespace-space-regexp "\\( |　+| | |\u3000+\\)")
(set-face-foreground 'whitespace-space "LightGrey")
(set-face-background 'whitespace-space 'nil)

(set-face-foreground 'whitespace-hspace "LightGrey")
(set-face-background 'whitespace-hspace 'nil)

(set-face-foreground 'whitespace-tab "LightGrey")
(set-face-background 'whitespace-tab 'nil)

(set-face-foreground 'whitespace-newline  "LightGrey")
(set-face-background 'whitespace-newline 'nil)

(set-face-foreground 'whitespace-trailing "LightGrey")
(set-face-background 'whitespace-trailing 'nil)

(set-face-foreground 'whitespace-line "LightGrey")
(set-face-background 'whitespace-line nil)
(set-face-foreground 'whitespace-space-before-tab "LightGrey")
(set-face-background 'whitespace-space-before-tab nil)
(set-face-foreground 'whitespace-indentation "LightGrey")
(set-face-background 'whitespace-indentation nil)
(set-face-foreground 'whitespace-empty "LightGrey")
(set-face-background 'whitespace-empty nil)
(set-face-foreground 'whitespace-space-after-tab "LightGrey")
(set-face-background 'whitespace-space-after-tab nil)

(set-face-underline  'whitespace-trailing t)

;; whitespace-trailingを色つきアンダーラインで目立たせる
(global-whitespace-mode t)

;; 保存前に自動でクリーンアップ
;(setq whitespace-action '(auto-cleanup))

;; git
(require 'git-gutter-fringe)
(global-git-gutter-mode +1)

;; linum
(global-nlinum-mode t)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-display-errors-delay 0.3)

;; auto-complete
(ac-config-default)

;; go
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(with-eval-after-load 'go-mode
;  '(require 'flymake-go)
;  '(require 'golint)
  (require 'go-autocomplete)
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (define-key go-mode-map (kbd "M-.") 'godef-jump)
  (define-key go-mode-map (kbd "M-*") 'pop-tag-mark))


;; neotree
(setq neo-theme 'ascii)

;; recentf
;; 自動保存
(require 'sync-recentf)
(when (require 'recentf-ext nil t)
  (setq recentf-max-saved-items 10000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1))
;; キーバインド
(global-set-key (kbd "C-x C-r") 'recentf-open-files)


;; auto-save
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 5)
(auto-save-buffers-enhanced t)

;; save on focus lose
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

;; ido
(require 'ido)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode 'buffers) ;; only use this line to turn off ido for file names!
(setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
                           "*Messages*" "Async Shell Command"))
(ido-mode 1)
;;; 縦に並べる
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-vertical-show-count t)

;; completing-readをido化
(ido-ubiquitous-mode 1)
;;; M-xをido化
(when (fboundp 'smex)
  (global-set-key (kbd "M-x") 'smex))

(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
(interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(global-set-key (kbd "C-x C-r") 'recentf-ido-find-file)

;; undo
(require 'undohist)
(undohist-initialize)
(setq undohist-ignored-files
      (append '("COMMIT_EDITMSG" "NOTES_EDITMSG" "MERGE_MSG" "TAG_EDITMSG")
              undohist-ignored-files))
(global-undo-tree-mode t)

;; smartparens-mode
(smartparens-global-mode t)

;; escreen
(define-key global-map (kbd "C-z") nil)
(setq escreen-prefix-char (kbd "C-t"))
(require 'escreen)
(setq escreen-mode-line-format '(escreen-number-mode ("[" escreen-current-screen-string "]")))
(escreen-install)
(add-hook 'escreen-goto-screen-hook
          'escreen-enable-number-mode-if-more-than-one-screen)

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:special-display-config '(
                                      ("*Gofmt Errors*" :noselect t)
                                      ))

;; anzu-mode
(global-anzu-mode +1)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; yas
(yas-global-mode 1)
(setq-default yas-snippet-dirs '("~/.emacs.d/snippets"))

;; yascroll
(require 'yascroll)
(global-yascroll-bar-mode 1)

;; persistent-scratch
(persistent-scratch-setup-default)
(persistent-scratch-autosave-mode 1)


;; jump parensis
(defun close-paren-at-point-p ()
  "Check closed paren at point."
  (let ((s (char-to-string (char-after (point)))))
    (s-contains? s ")]}")))
(defun not-paren-matching-at-point-p ()
  "Check not matching paren at point."
  (let ((s (char-to-string (char-after (point)))))
    (not (s-contains? s "{}[]()"))))
(defun goto-matching-paren ()
  "Jump to matching paren."
  (interactive)
  (cond ((close-paren-at-point-p)
         (forward-char)
         (-if-let (p (show-paren--default))
             (goto-char (nth 2 p))
           (backward-char)))
        ((not-paren-matching-at-point-p)
         (when (search-forward-regexp "[(\\[\[{)}]" (point-at-eol) t 1)
           (backward-char)))
        (t
         (-if-let (p (show-paren--default))
             (goto-char (nth 2 p))))))
(global-set-key (kbd "C-%") 'goto-matching-paren)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (bbdb yasnippet yascroll web-mode use-package undohist undo-tree sync-recentf solarized-theme smex smartparens recentf-ext projectile prodigy popwin persistent-scratch pallet nyan-mode nlinum neotree multiple-cursors markdown-mode magit ido-vertical-mode ido-ubiquitous idle-highlight-mode htmlize golint go-rename go-errcheck go-eldoc go-autocomplete git-gutter-fringe flycheck-cask expand-region exec-path-from-shell escreen drag-stuff auto-save-buffers-enhanced anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; change modeline by focus
(add-hook 'focus-out-hook
      (lambda ()
        (copy-face 'mode-line '--mode-line-backup)
        (copy-face 'mode-line-inactive 'mode-line)))
(add-hook 'focus-in-hook
      (lambda ()
        (copy-face '--mode-line-backup 'mode-line)))

;; save cursor position
(require 'saveplace)
(setq-default save-place t)

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
(flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
(add-hook 'js2-jsx-mode-hook 'flycheck-mode)
(setq-default js2-strict-missing-semi-warning nil)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'js2-jsx-mode)


;; open-junk-file
(require 'open-junk-file)
(setq open-junk-file-format "junk/%Y-%m-%d-%H%M%S.")


;; markdown
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
