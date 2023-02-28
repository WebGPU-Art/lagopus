
{} (:package |lagopus)
  :configs $ {} (:init-fn |lagopus.main/main!) (:reload-fn |lagopus.main/reload!) (:version |0.0.1)
    :modules $ []
  :entries $ {}
  :files $ {}
    |lagopus.alias $ {}
      :defs $ {}
        |convert-records-data $ quote
          defn convert-records-data (data fields write!)
            if (list? data)
              &doseq (x data) (convert-records-data x fields write!)
              &doseq (k fields)
                let
                    item $ &record:get data k
                  if (list? item)
                    &doseq (x item) (write! x)
                    write! item
        |count-recursive $ quote
          defn count-recursive (xs)
            if (list? xs)
              reduce xs 0 $ fn (acc y)
                &+ acc $ count-recursive y
              , 1
        |group $ quote
          defn group (a & children) (alias-js/group nil & children)
        |object $ quote
          defn object (options)
            let
                attrs-list $ &map:get options :attrs-list
                fields $ map attrs-list
                  fn (o) (&map:get o :field)
                data $ &map:get options :data
                vertices-size $ count-recursive data
                buffer-size $ &*
                  reduce attrs-list 0 $ fn (acc x)
                    &+ acc $ &map:get x :size
                  , vertices-size
                vertices $ new js/Float32Array buffer-size
                *idx $ atom 0
                write! $ fn (x)
                  let
                      idx @*idx
                    aset vertices idx x
                    swap! *idx inc
              convert-records-data (&map:get options :data) fields write!
              assert (&= buffer-size @*idx) "\"buffer size guessed correctly"
              createRenderer (&map:get options :shader) (&map:get options :topology) (to-js-data attrs-list) vertices-size vertices
      :ns $ quote
        ns lagopus.alias $ :require ("\"@triadica/lagopus/lib/alias.mjs" :as alias-js)
          "\"@triadica/lagopus/lib/render.mjs" :refer $ createRenderer
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
    |lagopus.config $ {}
      :defs $ {}
        |dev? $ quote
          def dev? $ &= "\"dev" (get-env "\"mode" "\"release")
      :ns $ quote (ns lagopus.config)
    |lagopus.main $ {}
      :defs $ {}
        |main! $ quote
          defn main! () (hint-fn async)
            if dev? $ load-console-formatter!
            js-await $ initializeContext
            render-app!
            paintApp
            renderControl
            startControlLoop 10 onControlEvent
            set! js/window.onresize $ fn (e) (paintApp)
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
          lagopus.config :refer $ dev?
