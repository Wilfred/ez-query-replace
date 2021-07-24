(require 'ez-query-replace)
(require 'with-simulated-input)

(ert-deftest ez-query-replace ()
  "Basic smoke test for `ez-query-replace'."
  (with-temp-buffer
    (insert " foo bar")
    (goto-char (point-min))

    (with-simulated-input "foo RET foo RET y RET"
      (ez-query-replace))

    (should (equal (buffer-string) " foo bar"))))
