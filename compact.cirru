
{} (:package |lagopus)
  :configs $ {} (:init-fn |lagopus.main/main!) (:reload-fn |lagopus.main/reload!) (:version |0.0.1)
    :modules $ [] |memof/ |quaternion/
  :entries $ {}
  :files $ {}
    |lagopus.alias $ {}
      :defs $ {}
        |collect-array! $ quote
          defn collect-array! (indices collect!)
            if (list? indices)
              &doseq (x indices) (collect-array! x collect!)
              collect! indices
        |collect-from-records! $ quote
          defn collect-from-records! (data field write!)
            if (list? data)
              &doseq (x data) (collect-from-records! x field write!)
              let
                  xs $ &map:get data field
                if (list? xs)
                  &doseq (x xs) (write! x )
                  write! xs
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
                data $ &map:get options :data
                vertices-size $ count-recursive data
                indices $ &map:get options :indices
                buffers $ js-array &
                  map attrs-list $ fn (attr)
                    let
                        buffer $ newBufferFormatLength (&map:get attr :format) vertices-size
                        *idx $ atom 0
                        field $ &map:get attr :field
                        write! $ fn (x)
                          let
                              idx @*idx
                            aset buffer idx x
                            swap! *idx inc
                      collect-from-records! data field write! 
                      ; js/console.log @*idx $ .-length buffer
                      ; assert
                        &= @*idx $ .-length buffer
                        , "\"buffer size guessed correctly"
                      , buffer
              ; js/console.log vertices-size buffers
              createRenderer
                -> (&map:get options :shader) (.!replace "\"{{simplex}}" wgsl-simplex) (.!replace "\"{{perspective}}" wgsl-perspective)
                turn-string $ &map:get options :topology
                to-js-data attrs-list
                , vertices-size buffers nil $ if (some? indices)
                  u32buffer $ let
                      *arr $ js-array
                      collect! $ fn (x) (.!push *arr x )
                    collect-array! indices collect!
                    , *arr
        |wgsl-perspective $ quote
          def wgsl-perspective $ inline-shader "\"perspective"
        |wgsl-simplex $ quote
          def wgsl-simplex $ inline-shader "\"simplex"
      :ns $ quote
        ns lagopus.alias $ :require
          "\"@triadica/lagopus" :refer $ createRenderer u32buffer newBufferFormatLength
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
        |comp-bube $ quote
          defn comp-bube () $ object
            {} (:shader cube-wgsl)
              :topology $ do :line-strip :triangle-list
              :attrs-list $ []
                {} (:field :position) (:format "\"float32x3") (:size 3)
              :data $ []
                {} $ :position ([] 0 0 0)
                {} $ :position ([] 0 100 0)
                {} $ :position ([] 0 100 100)
                {} $ :position ([] 0 0 100)
                {} $ :position ([] 100 0 0)
                {} $ :position ([] 100 100 0)
                {} $ :position ([] 100 100 100)
                {} $ :position ([] 100 0 100)
              :indices $ [] ([] 0 1 2 0 2 3 ) ([] 0 1 5 0 4 5) ([] 1 2 6 1 6 5) ([] 2 3 6 3 6 7) ([] 0 3 4 3 4 7) ([] 4 5 6 4 6 7)
        |comp-city $ quote
          defn comp-city () $ object
            {} (:shader city-wgsl)
              :topology $ do :line-strip :triangle-list
              :attrs-list $ []
                {} (:field :position) (:format "\"float32x2") (:size 2)
                {} (:field :normal-idx) (:format "\"float32") (:size 1)
                {} (:field :idx) (:format "\"float32") (:size 1)
              :data $ let
                  size 40
                  d 160
                -> (range-bothway size)
                  map $ fn (x)
                    -> (range-bothway size)
                      map $ fn (y)
                        let
                            x0 $ &* d x
                            y0 $ &* d y
                            p0 $ [] x0 y0
                          []
                            []
                              {} (:position p0) (:normal-idx 0) (:idx 0)
                              {} (:position p0) (:normal-idx 0) (:idx 1)
                              {} (:position p0) (:normal-idx 0) (:idx 2)
                            []
                              {} (:position p0) (:normal-idx 0) (:idx 0)
                              {} (:position p0) (:normal-idx 0) (:idx 2)
                              {} (:position p0) (:normal-idx 0) (:idx 3)
                            []
                              {} (:position p0) (:normal-idx 1) (:idx 0)
                              {} (:position p0) (:normal-idx 1) (:idx 1)
                              {} (:position p0) (:normal-idx 1) (:idx 5)
                            []
                              {} (:position p0) (:normal-idx 1) (:idx 0)
                              {} (:position p0) (:normal-idx 1) (:idx 5)
                              {} (:position p0) (:normal-idx 1) (:idx 4)
                            []
                              {} (:position p0) (:normal-idx 2) (:idx 1)
                              {} (:position p0) (:normal-idx 2) (:idx 2)
                              {} (:position p0) (:normal-idx 2) (:idx 6)
                            []
                              {} (:position p0) (:normal-idx 2) (:idx 1)
                              {} (:position p0) (:normal-idx 2) (:idx 6)
                              {} (:position p0) (:normal-idx 2) (:idx 5)
                            []
                              {} (:position p0) (:normal-idx 3) (:idx 2)
                              {} (:position p0) (:normal-idx 3) (:idx 3)
                              {} (:position p0) (:normal-idx 3) (:idx 6)
                            []
                              {} (:position p0) (:normal-idx 3) (:idx 3)
                              {} (:position p0) (:normal-idx 3) (:idx 7)
                              {} (:position p0) (:normal-idx 3) (:idx 6)
                            []
                              {} (:position p0) (:normal-idx 4) (:idx 0)
                              {} (:position p0) (:normal-idx 4) (:idx 3)
                              {} (:position p0) (:normal-idx 4) (:idx 4)
                            []
                              {} (:position p0) (:normal-idx 4) (:idx 3)
                              {} (:position p0) (:normal-idx 4) (:idx 4)
                              {} (:position p0) (:normal-idx 4) (:idx 7)
                            []
                              {} (:position p0) (:normal-idx 5) (:idx 4)
                              {} (:position p0) (:normal-idx 5) (:idx 5)
                              {} (:position p0) (:normal-idx 5) (:idx 6)
                            []
                              {} (:position p0) (:normal-idx 5) (:idx 4)
                              {} (:position p0) (:normal-idx 5) (:idx 6)
                              {} (:position p0) (:normal-idx 5) (:idx 7)
        |comp-container $ quote
          defn comp-container (store)
            group nil (memof1-call comp-tabs)
              case-default (:tab store) (group nil)
                :mountains $ memof1-call comp-mountains
                :city $ memof1-call comp-city
                :bends $ group nil
                :cube $ comp-bube
        |comp-mountains $ quote
          defn comp-mountains () $ object
            {} (:shader mountains-wgsl)
              :topology $ do :line-strip :triangle-list
              :attrs-list $ []
                {} (:field :position) (:format "\"float32x2") (:size 2)
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
                              {} $ :position ([] x0 y0)
                              {} $ :position ([] x1 y0)
                              {} $ :position ([] x1 y1)
                            []
                              {} $ :position ([] x0 y0)
                              {} $ :position ([] x1 y1)
                              {} $ :position ([] x0 y1)
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
            comp-button
              {}
                :position $ [] 80 260 0
                :color $ [] 0.8 0.9 0.2 1
                :size 20
              fn (e d!) (d! :tab :city)
            comp-button
              {}
                :position $ [] 120 260 0
                :color $ [] 0.3 0.9 0.2 1
                :size 20
              fn (e d!) (d! :tab :cube)
      :ns $ quote
        ns lagopus.comp.container $ :require
          lagopus.alias :refer $ group object
          "\"../shaders/mountains.wgsl" :default mountains-wgsl
          "\"../shaders/city.wgsl" :default city-wgsl
          "\"../shaders/cube.wgsl" :default cube-wgsl
          lagopus.comp.button :refer $ comp-button
          memof.once :refer $ memof1-call
          quaternion.core :refer $ c+
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
          defatom *store $ {} (:tab :cube)
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
            do (reset-memof1-caches!) (render-app!) (remove-watch *store :change)
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
          memof.once :refer $ reset-memof1-caches!
