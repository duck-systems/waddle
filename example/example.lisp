;;;;
;;;; An example Waddle app
;;;;
(defpackage #:systems.duck.waddle.example
  (:use #:cl)
  (:local-nicknames (#:waddle #:systems.duck.waddle))
  (:export #:start))

(in-package #:systems.duck.waddle.example)

(waddle:define-action "/hello-world" :get () ()
  "A basic action that returns just text"
  "Hello, world!")

(defun start ()
  (clack:clackup waddle:*app* :port 8080 :address "0.0.0.0"))
