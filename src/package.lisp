;;;;
;;;; Waddle package
;;;;
(defpackage #:systems.duck.waddle
  (:use #:cl)
  (:local-nicknames (#:a #:alexandria))
  ;; Status codes
  (:export #:+status-200-ok+
           #:+status-201-created+
           #:+status-204-no-content+
           #:+status-400-bad-request+
           #:+status-404-not-found+
           #:+status-409-conflict+
           #:+status-422-unprocessable+)
  ;; Apps, Controllers, Actions
  (:export #:app
           #:*app*
           #:controller
           #:find-controller
           #:process-action-output
           #:define-action))
