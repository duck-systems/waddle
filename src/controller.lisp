;;;;
;;;; Controllers - for grouping actions
;;;;
(in-package #:systems.duck.waddle)

(defclass controller ()
  ()
  (:documentation "A grouper for actions"))

(defun find-controller (name)
  "Looks up a controller from the symbol NAME"
  (etypecase name
    (controller name)
    (symbol (get name 'controller))
    (null nil)))
