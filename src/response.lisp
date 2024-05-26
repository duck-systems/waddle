;;;;
;;;; Response processing
;;;;
(in-package #:systems.duck.waddle)

(defun %set-response-status-code (code)
  "Sets a response status code"
  (setf (lack.response:response-status ningle:*response*) code))

(defun %set-response-content-type (type)
  "Sets a response content type"
  (setf type (case type
               (:json "application/json")
               (:xml "application/xml")
               (:html "text/html")
               (:plain "text/plain")
               (:octet "application/octet-stream")
               (otherwise type)))
  (setf (lack.response:response-headers ningle:*response*)
        (append (lack.response:response-headers ningle:*response*)
                (list :content-type type))))

(defun %set-response-header (name value)
  "Sets a response header. Name should be a known keyword"
  (setf (lack.response:response-headers ningle:*response*)
        (append (lack.response:response-headers ningle:*response*)
                (list name value))))
