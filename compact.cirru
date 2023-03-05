
{} (:package |lagopus)
  :configs $ {} (:init-fn |lagopus.main/main!) (:reload-fn |lagopus.main/reload!) (:version |0.0.1)
    :modules $ [] |memof/
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
                    item $ &map:get data k
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
          defn group (a & children) (lagopus/group nil & children)
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
        ns lagopus.alias $ :require
          "\"@triadica/lagopus" :refer $ createRenderer
          "\"@triadica/lagopus" :as lagopus
          lagopus.config :refer $ inline-shader
    |lagopus.comp.button $ {}
      :defs $ {}
        |comp-button $ quote
          defn comp-button (props on-click)
            compButton (to-js-data props) on-click
      :ns $ quote
        ns lagopus.comp.button $ :require
          "\"@triadica/lagopus" :refer $ compButton
    |lagopus.comp.container $ {}
      :defs $ {}
        |color-default $ quote
          def color-default $ [] 1 0 0 1
        |comp-container $ quote
          defn comp-container (store)
            group nil (memof1-call comp-tabs)
              case-default (:tab store) (group nil)
                :mountains $ memof1-call comp-mountains
                :bends $ group nil
        |comp-mountains $ quote
          defn comp-mountains () $ object
            {} (:shader triangle-wgsl)
              :topology $ do :line-strip :triangle-list
              :attrs-list $ []
                {} (:field :position) (:format "\"float32x4") (:size 4)
                {} (:field :color) (:format "\"float32x4") (:size 4)
              :data $ let
                  size 80
                  d 32
                -> (range-bothway size)
                  map $ fn (x)
                    -> (range-bothway size)
                      map $ fn (y)
                        let
                            x0 $ &* d x
                            x1 $ &+ x0 d
                            y0 $ &* d y
                            y1 $ &+ y0 d
                          []
                            []
                              {}
                                :position $ [] x0 0 y0 1
                                :color color-default
                              {}
                                :position $ [] x1 0 y0 1
                                :color color-default
                              {}
                                :position $ [] x1 0 y1 1
                                :color color-default
                            []
                              {}
                                :position $ [] x0 0 y0 1
                                :color color-default
                              {}
                                :position $ [] x1 0 y1 1
                                :color color-default
                              {}
                                :position $ [] x0 0 y1 1
                                :color color-default
        |comp-tabs $ quote
          defn comp-tabs () $ group nil
            comp-button
              {}
                :position $ [] 40 260 0
                :color $ [] 0.9 0.4 0.5 1
                :size 20
              fn (e d!) (d! :tab :mountains)
            comp-button
              {}
                :position $ [] 0 260 0
                :color $ [] 0.5 0.5 0.9 1
                :size 20
              fn (e d!) (d! :tab :bends)
      :ns $ quote
        ns lagopus.comp.container $ :require
          lagopus.alias :refer $ group object
          "\"../shaders/triangle.wgsl" :default triangle-wgsl
          lagopus.comp.button :refer $ comp-button
          memof.once :refer $ memof1-call
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
        |*store $ quote
          defatom *store $ {} (:tab :mountains)
        |canvas $ quote
          def canvas $ js/document.querySelector "\"canvas"
        |dispatch! $ quote
          defn dispatch! (op data)
            if dev? $ js/console.log op data
            let
                store @*store
                next-store $ case-default op
                  do (js/console.warn ":unknown op" op data) store
                  :tab $ assoc store :tab data
              if (not= next-store store) (reset! *store next-store)
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
            renderControl
            startControlLoop 10 onControlEvent
            set! js/window.__lagopusHandleCompilationInfo handle-compilation
            set! js/window.onresize $ fn (e) (paintLagopusTree)
            add-watch *store :change $ fn (next store) (render-app!)
            setupMouseEvents canvas
        |reload! $ quote
          defn reload! () $ if (nil? build-errors)
            do (render-app!) (remove-watch *store :change)
              add-watch *store :change $ fn (next store) (render-app!)
              println "\"Reloaded."
              hud! "\"ok~" "\"OK"
            hud! "\"error" build-errors
        |render-app! $ quote
          defn render-app! () $ let
              tree $ comp-container @*store
            renderLagopusTree tree dispatch!
      :ns $ quote
        ns lagopus.main $ :require
          lagopus.comp.container :refer $ comp-container
          "\"@triadica/lagopus" :refer $ setupMouseEvents onControlEvent paintLagopusTree renderLagopusTree initializeContext
          "\"@triadica/touch-control" :refer $ renderControl startControlLoop
          lagopus.config :refer $ dev?
          "\"bottom-tip" :default hud!
          "\"./calcit.build-errors" :default build-errors
