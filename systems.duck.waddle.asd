;;;;
;;;; Waddle System Definition
;;;;
(asdf:defsystem "systems.duck.waddle"
  :description "A web framework for Common Lisp"
  :depends-on ("alexandria"
               "flexi-streams"
               "lack"
               "ningle"
               "shasht")
  :pathname "src"
  :components ((:file "package")
               (:file "status-codes" :depends-on ("package"))
               (:file "request" :depends-on ("package"))
               (:file "response" :depends-on ("package"))
               (:file "app" :depends-on ("package"))
               (:file "controller" :depends-on ("package"))
               (:file "action" :depends-on ("package"
                                            "app"
                                            "controller"
                                            "request"
                                            "response"))))

(asdf:defsystem "systems.duck.waddle/example"
  :description "An example of waddle"
  :depends-on ("systems.duck.waddle"
               "clack")
  :pathname "example"
  :components ((:file "example")))
