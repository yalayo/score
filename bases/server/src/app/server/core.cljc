(ns app.server.core
  (:require
   [promesa.core :as p]
   [sitefox.web :as web]))

(defonce server (atom nil))

(defn setup-routes [app]
  (web/reset-routes app)
  (web/static-folder app "/" "public"))

(defn main! []
  (p/let [[app host port] (web/start)]
    (reset! server app)
    (setup-routes app)
    (println "Serving on" (str "http://" host ":" port))))

(defn ^:dev/after-load reload []
  (js/console.log "Reloading.")
  (setup-routes @server))