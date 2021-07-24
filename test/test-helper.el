;;; test-helper.el --- Helper for tests              -*- lexical-binding: t; -*-

;; Copyright (C) 2021 Wilfred Hughes

;; Author:  <me@wilfred.me.uk>

;;; Code:

(require 'ert)
(require 'f)

(let ((ez-query-replace-dir (f-parent (f-dirname (f-this-file)))))
  (add-to-list 'load-path ez-query-replace-dir))

(require 'undercover)
(undercover "ez-query-replace.el" (:exclude "*-test.el"))

;;; test-helper.el ends here
