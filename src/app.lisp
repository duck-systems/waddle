;;;;
;;;; Apps - a grouper for controllers
;;;;
(in-package #:systems.duck.waddle)

(defclass app (ningle:app)
  ()
  (:documentation "A waddle app"))

(defvar *app* (make-instance 'app) "The app")
