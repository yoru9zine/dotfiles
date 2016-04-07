(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

                                        ;あああ
                                        ;aaaaaa
;(set-face-attribute 'default nil :family "Menlo" :height 80)
;(set-fontset-font (frame-parameter nil 'font)
;                  'japanese-jisx0208
;                  (font-spec :family "Hiragino Maru Gothic ProN" :size 14))

(when (display-graphic-p)
  (set-face-attribute 'default nil :family "Monaco" :height 75)
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0208
                    (font-spec :family "Hiragino Maru Gothic ProN" :size 12))
  (set-fontset-font (frame-parameter nil 'font)
                    'japanese-jisx0212
                    (font-spec :family "Hiragino Maru Gothic ProN" :size 12))
  (set-fontset-font (frame-parameter nil 'font)
                    'katakana-jisx0201
                    (font-spec :family "Hiragino Maru Gothic ProN" :size 12))
  (add-to-list 'face-font-rescale-alist
               '(".*Hiragino Maru Gothic ProN.*" . 1.2))
  )

;(set-face-attribute 'default nil
;                    :family "Ricty Discord"
;                    :height 90)
;(set-fontset-font (frame-parameter nil 'font)
;                  'japanese-jisx0208
;                  (cons "Ricty Discord" "iso10646-1"))
;(set-fontset-font (frame-parameter nil 'font)
;                  'japanese-jisx0212
;                  (cons "Ricty Discord" "iso10646-1"))
;(set-fontset-font (frame-parameter nil 'font)
;                  'katakana-jisx0021
;                  (cons "Ricty Discord" "iso10646-1"))


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

(keyboard-translate ?\C-h ?\C-?)
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

;; workaround for jump cursor in scroll
(setq scroll-step 1)
(setq scroll-conservatively 100000)
(setq auto-window-vscroll nil)

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

;; whitespace
;; whitespace
;; 全角スペース タブ trailing-spacesを目立たせる
(require 'whitespace)
;; space-markとtab-mark、それからspacesとtrailingを対象とする
(setq whitespace-style '(space-mark tab-mark face spaces trailing))
(setq whitespace-display-mappings
      '(
        ;; (space-mark   ?\     [?\u00B7]     [?.]) ; space - centered dot
        (space-mark   ?\xA0  [?\u00A4]     [?_]) ; hard space - currency
        (space-mark   ?\x8A0 [?\x8A4]      [?_]) ; hard space - currency
        (space-mark   ?\x920 [?\x924]      [?_]) ; hard space - currency
        (space-mark   ?\xE20 [?\xE24]      [?_]) ; hard space - currency
        (space-mark   ?\xF20 [?\xF24]      [?_]) ; hard space - currency
        (space-mark ?\u3000 [?\u25a1] [?_ ?_]) ; full-width-space - square
        ;; NEWLINE is displayed using the face `whitespace-newline'
        ;; (newline-mark ?\n    [?$ ?\n])  ; eol - dollar sign
        ;; (newline-mark ?\n    [?\u21B5 ?\n] [?$ ?\n]) ; eol - downwards arrow
        ;; (newline-mark ?\n    [?\u00B6 ?\n] [?$ ?\n]) ; eol - pilcrow
        ;; (newline-mark ?\n    [?\x8AF ?\n]  [?$ ?\n]) ; eol - overscore
        ;; (newline-mark ?\n    [?\x8AC ?\n]  [?$ ?\n]) ; eol - negation
        ;; (newline-mark ?\n    [?\x8B0 ?\n]  [?$ ?\n]) ; eol - grade
        ;;
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t]) ; tab - left quote mark
        ))
;; whitespace-spaceの定義を全角スペースにし、色をつけて目立たせる
(setq whitespace-space-regexp "\\(\u3000+\\)")
(set-face-foreground 'whitespace-space "cyan")
(set-face-background 'whitespace-space 'nil)
;; whitespace-trailingを色つきアンダーラインで目立たせる
(set-face-underline  'whitespace-trailing t)
(set-face-foreground 'whitespace-trailing "cyan")
(set-face-background 'whitespace-trailing 'nil)
(global-whitespace-mode 1)
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
(setq auto-save-buffers-enhanced-interval 0.5)
(auto-save-buffers-enhanced t)

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
(setq escreen-prefix-char (kbd "C-z"))
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
