;;;;
;;;; Request processing
;;;;
(in-package #:systems.duck.waddle)

(defun parse-json-from-body ()
  (let* ((x (make-array (lack.request:request-content-length ningle:*request*))))
    (read-sequence x (lack.request:request-raw-body ningle:*request*) :start 0)
    (let* ((bodystring (flexi-streams:octets-to-string x :external-format :utf8))
           (body (shasht:read-json bodystring)))
      body)))

(defun parse-query-params ()
  (let ((query-params (lack.request:request-query-parameters ningle:*request*))
        (query-hash (make-hash-table :test #'equalp)))
    (loop for (key . value) in query-params
          do (setf (gethash key query-hash) value))
    query-hash))

(defun parse-body-params ()
  (let ((body-params (lack.request:request-body-parameters ningle:*request*))
        (body-hash (make-hash-table :test #'equalp)))
    (loop for (key . value) in body-params
          do (setf (gethash key body-hash) value))
    body-hash))

(defun get-session ()
  "Gets the current request session object"
  (getf (lack.request:request-env ningle:*request*) :lack.session))
