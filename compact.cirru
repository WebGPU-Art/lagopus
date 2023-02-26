
{} (:package |app)
  :configs $ {} (:init-fn |app.main/main!) (:reload-fn |app.main/reload!) (:version |0.0.1)
    :modules $ []
  :entries $ {}
  :files $ {}
    |app.comp.container $ {}
      :defs $ {}
        |comp-container $ quote
          defn comp-container () $ group (js-object)
            object $ w-js-log
              js-object (:shader triangle-wgsl) (:topology "\"triangle-list")
                :attrsList $ js-array
                  js-object (:field "\"position") (:format "\"float32x4") (:size 4)
                  js-object (:field "\"color") (:format "\"float32x4") (:size 4)
                :data $ js-array
                  js-object
                    :position $ js-array -100 -100 0.3 1
                    :color $ js-array 1 0 0 1
                  js-object
                    :position $ js-array 0 100 100 1
                    :color $ js-array 1 1 0 1
                  js-object
                    :position $ js-array 100 -100 -100 1
                    :color $ js-array 0 0 1 1
      :ns $ quote
        ns app.comp.container $ :require
          "\"@triadica/lagopus/lib/alias.mjs" :refer $ group object
          "\"../shaders/triangle.wgsl" :default triangle-wgsl
    |app.main $ {}
      :defs $ {}
        |main! $ quote
          defn main! () (hint-fn async)
            js-await $ initializeContext
            render-app!
            paintApp
            renderControl
            startControlLoop 10 onControlEvent
            set! js/window.onresize $ fn () (paintApp)
        |reload! $ quote
          defn reload! () (paintApp) (println "\"Reloaded.")
        |render-app! $ quote
          defn render-app! () $ let
              tree $ comp-container
            .!reset atomLagopusTree tree
      :ns $ quote
        ns app.main $ :require
          app.comp.container :refer $ comp-container
          "\"@triadica/lagopus/lib/global.mjs" :refer $ atomLagopusTree
          "\"@triadica/lagopus/lib/render.mjs" :refer $ initializeContext
          "\"@triadica/lagopus/lib/control.mjs" :refer $ paintApp onControlEvent
          "\"@triadica/touch-control" :refer $ renderControl startControlLoop
