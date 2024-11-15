(ns app.server.core
  (:require ["express" :as express]))

(def app (express))
(def port 3000)

(. app get "/"
   (fn [_ res]
     (. res send "Hello world")))

(defn main! []
  (. app listen port 
     (fn []
       (println "Listening on port: " port))))

(comment
  (main!)
  )