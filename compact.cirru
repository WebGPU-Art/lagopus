
{} (:package |lagopus)
  :configs $ {} (:init-fn |lagopus.main/main!) (:reload-fn |lagopus.main/reload!) (:version |0.0.1)
    :modules $ []
  :entries $ {}
  :files $ {}
    |lagopus.alias $ {}
      :defs $ {}
        |convert-records-data $ quote
          defn convert-records-data (data fields ? collect!)
            if (some? collect!)
              if (list? data)
                &doseq (x data) (convert-records-data x fields collect!)
                collect! $ let
                    o $ js-object
                  &doseq (k fields)
                    aset o (turn-string k)
                      to-js-data $ &record:get data k
                  , o
              let
                  buffer $ js-array
                  collect! $ fn (y) (.!push buffer y)
                convert-records-data data fields collect!
                , buffer
        |group $ quote
          defn group (a & children) (alias-js/group nil & children)
        |object $ quote
          defn object (options)
            let
                attrs-list $ &map:get options :attrs-list
                fields $ map attrs-list
                  fn (o) (&map:get o :field)
              alias-js/object $ js-object
                :shader $ &map:get options :shader
                :topology $ &map:get options :topology
                :attrsList $ to-js-data attrs-list
                :data $ convert-records-data (&map:get options :data) fields
      :ns $ quote
        ns lagopus.alias $ :require ("\"@triadica/lagopus/lib/alias.mjs" :as alias-js)
    |lagopus.comp.container $ {}
      :defs $ {}
        |Vertex $ quote (defrecord Vertex :position :color)
        |comp-container $ quote
          defn comp-container () $ group nil
            object $ {} (:shader triangle-wgsl) (:topology "\"triangle-list")
              :attrs-list $ []
                {} (:field :position) (:format "\"float32x4") (:size 4)
                {} (:field :color) (:format "\"float32x4") (:size 4)
              :data $ []
                %{} Vertex
                  :position $ [] -100 -100 0.3 1
                  :color $ [] 1 0 0 1
                %{} Vertex
                  :position $ [] 0 100 100 1
                  :color $ [] 1 1 0 1
                %{} Vertex
                  :position $ [] 100 -100 -100 1
                  :color $ [] 0 0 1 1
      :ns $ quote
        ns lagopus.comp.container $ :require
          lagopus.alias :refer $ group object
          "\"../shaders/triangle.wgsl" :default triangle-wgsl
    |lagopus.main $ {}
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
        ns lagopus.main $ :require
          lagopus.comp.container :refer $ comp-container
          "\"@triadica/lagopus/lib/global.mjs" :refer $ atomLagopusTree
          "\"@triadica/lagopus/lib/render.mjs" :refer $ initializeContext
          "\"@triadica/lagopus/lib/control.mjs" :refer $ paintApp onControlEvent
          "\"@triadica/touch-control" :refer $ renderControl startControlLoop
