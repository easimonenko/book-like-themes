;;; book-like-themes.el --- Book like grayscale themes -*- lexical-binding: t; -*-

;; Copyright (c) 2025 Evgeny Simonenko

;; Author: Evgeny Simonenko <easimonenko@gmail.com>
;; Keywords: themes faces
;; Version: 0.1.0
;; Package-Requires: ((emacs "26.1"))
;; Created: August 2025
;; URL: https://github.com/easimonenko/book-like-themes
;; Repository: https://github.com/easimonenko/book-like-themes

;;; License:
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Book like grayscale themes.

;;; Code:

;;;###autoload
(defun book-like-light-load ()
  "Load `book-like-light' and disable `book-like-dark'."
  (interactive)
  (disable-theme 'book-like-dark)
  (load-theme 'book-like-light))

;;;###autoload
(defun book-like-dark-load ()
  "Load `book-like-dark' and disable `book-like-light'."
  (interactive)
  (disable-theme 'book-like-light)
  (load-theme 'book-like-dark))

;;;###autoload
(defun book-like-themes--toggle-prompt ()
  "Helper for `book-like-themes-toggle'."
  (let ((theme (intern (completing-read "Load Book Like theme: "
                                        '(book-like-light book-like-dark)
                                        nil t))))
    (mapc #'disable-theme custom-enabled-themes)
    (pcase theme
      ('book-like-light (book-like-light-load))
      ('book-like-dark (book-like-dark-load)))))

;;;###autoload
(defun book-like-themes-toggle ()
  "Toggle between the light and dark versions of `book-like-themes'."
  (interactive)
  (pcase (car custom-enabled-themes)
    ('book-like-light (book-like-dark-load))
    ('book-like-dark (book-like-light-load))
    (_ (book-like-themes--toggle-prompt))))

(provide 'book-like-themes)
;;; book-like-themes.el ends here
