
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
              ; js/console.log vertices-size buffer-size vertices
              createRenderer
                -> (&map:get options :shader) (.!replace "\"{{simplex}}" wgsl-simplex) (.!replace "\"{{perspective}}" wgsl-perspective)
                turn-string $ &map:get options :topology
                to-js-data attrs-list
                , vertices-size vertices
        |wgsl-perspective $ quote
          def wgsl-perspective $ inline-shader "\"perspective"
        |wgsl-simplex $ quote
          def wgsl-simplex $ inline-shader "\"simplex"
      :ns $ quote
        ns lagopus.alias $ :require ("\"@triadica/lagopus/lib/alias.mjs" :as alias-js)
          "\"@triadica/lagopus/lib/render.mjs" :refer $ createRenderer
          lagopus.config :refer $ inline-shader
    |lagopus.comp.button $ {}
      :defs $ {}
        |comp-button $ quote
          defn comp-button (props on-click)
            compButton (to-js-data props) on-click
      :ns $ quote
        ns lagopus.comp.button $ :require
          "\"@triadica/lagopus/lib/comp/bottom.mjs" :refer $ compButton
    |lagopus.comp.container $ {}
      :defs $ {}
        |Vertex $ quote (defrecord Vertex :position :color)
        |comp-container $ quote
          defn comp-container () $ group nil
            object $ {} (:shader triangle-wgsl)
              :topology $ do :line-strip :triangle-list
              :attrs-list $ []
                {} (:field :position) (:format "\"float32x4") (:size 4)
                {} (:field :color) (:format "\"float32x4") (:size 4)
              :data $ let
                  size 200
                  d 32
                -> (range-bothway size)
                  map $ fn (x)
                    -> (range-bothway size)
                      map $ fn (y)
                        let
                            x0 (* d x) 
                            x1 (+ x0 d) 
                            y0 (* d y) 
                            y1 $ + y0 d
                          []
                            []
                              %{} Vertex
                                :position $ [] x0 0 y0 1
                                :color $ [] 1 0 0 1
                              %{} Vertex
                                :position $ [] x1 0 y0 1
                                :color $ [] 1 0 0 1
                              %{} Vertex
                                :position $ [] x1 0 y1 1
                                :color $ [] 1 0 0 1
                            []
                              %{} Vertex
                                :position $ [] x0 0 y0 1
                                :color $ [] 1 0 0 1
                              %{} Vertex
                                :position $ [] x1 0 y1 1
                                :color $ [] 1 0 0 1
                              %{} Vertex
                                :position $ [] x0 0 y1 1
                                :color $ [] 1 0 0 1
            comp-button
              {}
                :position $ [] 0 60 0
                :color $ [] 0.6 0.6 0.9 1
              fn (e d!) (println "\"Click")
      :ns $ quote
        ns lagopus.comp.container $ :require
          lagopus.alias :refer $ group object
          "\"../shaders/triangle.wgsl" :default triangle-wgsl
          lagopus.comp.button :refer $ comp-button
    |lagopus.config $ {}
      :defs $ {}
        |dev? $ quote
          def dev? $ &= "\"dev" (get-env "\"mode" "\"release")
        |inline-shader $ quote
          defmacro inline-shader (path)
            read-file $ str "\"shaders/" path "\".wgsl"
      :ns $ quote (ns lagopus.config)
    |lagopus.main $ {}
      :defs $ {}
        |canvas $ quote
          def canvas $ js/document.querySelector "\"canvas"
        |dispatch! $ quote
          defn dispatch! (op data) (js/console.warn "\"TODO dispatch" op)
        |handle-compilation $ quote
          defn handle-compilation (info code)
            if-let
              error $ -> info .-messages .-0
              let
                  line-num $ .-lineNum error
                  line-pos $ .-linePos error
                  lines $ .split-lines code
                  message $ str line-num "\" "
                    nth lines $ dec line-num
                    , &newline
                      .join-str
                        repeat "\" " $ +
                          count $ str line-num
                          , line-pos
                        , "\""
                      , "\"^ " (.-message error)
                js/console.error $ str "\"WGSL Error:" &newline message
                hud! "\"error" $ str "\"WGSL Errors:" &newline message
        |main! $ quote
          defn main! () (hint-fn async)
            if dev? $ load-console-formatter!
            js-await $ initializeContext
            render-app!
            paintApp
            renderControl
            startControlLoop 10 onControlEvent
            set! js/window.__lagopusHandleCompilationInfo handle-compilation
            set! js/window.onresize $ fn (e) (paintApp)
            setupMouseEvents canvas
        |reload! $ quote
          defn reload! () $ if (nil? build-errors)
            do (render-app!) (paintApp) (println "\"Reloaded.") (hud! "\"ok~" "\"OK")
            hud! "\"error" build-errors
        |render-app! $ quote
          defn render-app! () $ let
              tree $ comp-container
            .!reset atomLagopusTree tree
            .!reset atomObjectsTree tree
            .!reset atomProxiedDispatch dispatch!
      :ns $ quote
        ns lagopus.main $ :require
          lagopus.comp.container :refer $ comp-container
          "\"@triadica/lagopus/lib/global.mjs" :refer $ atomLagopusTree atomProxiedDispatch atomObjectsTree
          "\"@triadica/lagopus/lib/render.mjs" :refer $ initializeContext
          "\"@triadica/lagopus/lib/control.mjs" :refer $ paintApp onControlEvent
          "\"@triadica/lagopus/lib/events.mjs" :refer $ setupMouseEvents
          "\"@triadica/touch-control" :refer $ renderControl startControlLoop
          lagopus.config :refer $ dev?
          "\"bottom-tip" :default hud!
          "\"./calcit.build-errors" :default build-errors
