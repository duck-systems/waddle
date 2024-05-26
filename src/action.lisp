;;;;
;;;; Actions
;;;;
(in-package #:systems.duck.waddle)

(defgeneric process-action-output (app controller action request response body-fn)
  (:documentation "Calls BODY-FN and creates an output response")
  (:method (app controller action request response body-fn)
    "Base action output method. Invokes BODY-FN"
    (funcall body-fn)))

(defmacro define-action (route method
                         (&rest options
                          &key json query block body-params session name controller
                          &allow-other-keys)
                         params
                         &body body)
  "Defines an action"
  (setf options (a:remove-from-plist options :json :query :block :body-params :session
                                                   :name :controller))
  (let ((params-var (gensym))
        (controller-var (gensym)))
    `(let ((,controller-var (find-controller ,controller)))
       (setf (ningle:route *app* ,route :method ,method ,@options)
             #'(lambda (,params-var)
                 ,@(when (null params) `((declare (ignore ,params-var))))
                 (let ,(loop for p in params
                             collecting `(,p (cdr
                                              (assoc
                                               ,(intern (symbol-name p) :keyword)
                                               ,params-var))))
                   (flet ((body-fn ()
                            (block ,block
                              (let (,@(when json `((,json (parse-json-from-body))))
                                    ,@(when query `((,query (parse-query-params))))
                                    ,@(when body-params `((,body-params (parse-body-params))))
                                    ,@(when session `((,session (get-session)))))
                                ,@body))))
                     (process-action-output *app*
                                            ,controller-var
                                            ,name
                                            ningle:*request*
                                            ningle:*response*
                                            #'body-fn))))))))
