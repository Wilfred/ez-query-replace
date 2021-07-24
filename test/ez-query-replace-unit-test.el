(require 'ez-query-replace)
(require 'with-simulated-input)
(require 'dash)

(ert-deftest ez-query-replace ()
  "Basic smoke test for `ez-query-replace'."
  (with-temp-buffer
    (insert " foo bar")
    (goto-char (point-min))

    (with-simulated-input "foo RET boo RET y RET"
      (ez-query-replace))

    (should (equal (buffer-string) " boo bar"))))

(ert-deftest ez-query-replace-history ()
  "Check that history is well-formed."
  (with-temp-buffer
    (insert " foo bar")
    (goto-char (point-min))

    (with-simulated-input "foo RET bar RET y RET"
      (ez-query-replace))

    (should
     (equal
      (-first-item ez-query-replace/history)
      (list "foo -> bar" "foo" "bar")))))
