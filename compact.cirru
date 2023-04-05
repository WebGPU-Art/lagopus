
{} (:package |lagopus)
  :configs $ {} (:init-fn |lagopus.main/main!) (:reload-fn |lagopus.main/reload!) (:version |0.0.3)
    :modules $ [] |memof/ |quaternion/
  :entries $ {}
  :files $ {}
    |lagopus.alias $ {}
      :defs $ {}
        |buffer-format $ quote
          defn buffer-format (format)
            case-default format
              if (string? format) format $ do (js/console.warn "\"Unknown format" format) "\"float32"
              :float32 "\"float32"
              :float32x2 "\"float32x2"
              :float32x3 "\"float32x3"
              :float32x4 "\"float32x4"
              :uint32 "\"uint32"
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
        |expand-attr $ quote
          defn expand-attr (x)
            if (tuple? x)
              {}
                :field $ &tuple:nth x 1
                :format $ &tuple:nth x 0
              , x
        |group $ quote
          defn group (a & children) (lagopus/group nil & children)
        |object $ quote
          defn object (options)
            let
                attrs-list $ map (&map:get options :attrs-list) expand-attr
                data $ &map:get options :data
                vertices-size $ count-recursive data
                indices $ &map:get options :indices
                buffers $ js-array &
                  map attrs-list $ fn (attr)
                    let
                        buffer $ newBufferFormatLength
                          buffer-format $ &map:get attr :format
                          , vertices-size
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
                -> (&map:get options :shader) (.!replace "\"{{simplex}}" wgsl-simplex) (.!replace "\"{{perspective}}" wgsl-perspective) (.!replace "\"{{colors}}" wgsl-colors) (.!replace "\"{{rand}}" wgsl-rand)
                turn-string $ &map:get options :topology
                to-js-data attrs-list
                , vertices-size buffers nil $ if (some? indices)
                  u32buffer $ let
                      *arr $ js-array
                      collect! $ fn (x) (.!push *arr x )
                    collect-array! indices collect!
                    , *arr
        |wgsl-colors $ quote
          def wgsl-colors $ inline-shader "\"lagopus-colors"
        |wgsl-perspective $ quote
          def wgsl-perspective $ inline-shader "\"lagopus-perspective"
        |wgsl-rand $ quote
          def wgsl-rand $ inline-shader "\"lagopus-rand"
        |wgsl-simplex $ quote
          def wgsl-simplex $ inline-shader "\"lagopus-simplex"
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
        |comp-city $ quote
          defn comp-city () $ object
            {} (:shader city-wgsl)
              :topology $ do :line-strip :triangle-list
              :attrs-list $ [] (:: :float32x2 :position) (:: :float32 :normal-idx) (:: :float32 :idx)
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
                :axis $ comp-axis
                  {} (:n 20) (:unit 20)
                :mountains $ memof1-call comp-mountains
                :city $ memof1-call comp-city
                :bends $ group nil
                :cube $ comp-cube
                :ribbon $ comp-ribbon
                :necklace $ comp-necklace
        |comp-cube $ quote
          defn comp-cube () $ object
            {} (:shader cube-wgsl)
              :topology $ do :line-strip :triangle-list
              :attrs-list $ []
                {} (:field :position) (:format "\"float32x3")
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
        |comp-mountains $ quote
          defn comp-mountains () $ object
            {} (:shader mountains-wgsl)
              :topology $ do :line-strip :triangle-list
              :attrs-list $ []
                {} (:field :position) (:format "\"float32x2")
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
        |comp-necklace $ quote
          defn comp-necklace () $ comp-spots
            {} (; :topology :line-strip) (:radius 6) (:vertex-count 8) (:shift 12)
              :points $ -> (range 80)
                map $ fn (idx)
                  let
                      r $ * idx 4
                    [] r
                      * r $ cos (* 0.1129 idx)
                      * r $ sin (* 0.123 idx)
        |comp-ribbon $ quote
          defn comp-ribbon () $ comp-curves
            {} (; :topology :line-strip)
              :curves $ []
                -> (range 400)
                  map $ fn (idx)
                    let
                        angle $ * 0.1 idx
                        r 40
                      {}
                        :position $ []
                          * r $ cos angle
                          * 0.6 idx
                          * r $ sin angle
                        :width 2
        |comp-tabs $ quote
          defn comp-tabs () $ group nil
            comp-button
              {}
                :position $ [] 0 260 0
                :color $ [] 0.5 0.5 0.9 1
                :size 20
              fn (e d!) (d! :tab :axis)
            comp-button
              {}
                :position $ [] 40 260 0
                :color $ [] 0.9 0.4 0.5 1
                :size 20
              fn (e d!) (d! :tab :mountains)
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
            comp-button
              {}
                :position $ [] 160 260 0
                :color $ [] 0.8 0.0 0.9 1
                :size 20
              fn (e d!) (d! :tab :ribbon)
            comp-button
              {}
                :position $ [] 200 260 0
                :color $ [] 0.2 0.9 0.6 1
                :size 20
              fn (e d!) (d! :tab :necklace)
      :ns $ quote
        ns lagopus.comp.container $ :require
          lagopus.alias :refer $ group object
          "\"../shaders/mountains.wgsl" :default mountains-wgsl
          "\"../shaders/city.wgsl" :default city-wgsl
          "\"../shaders/cube.wgsl" :default cube-wgsl
          lagopus.comp.button :refer $ comp-button
          lagopus.comp.curves :refer $ comp-curves comp-axis
          lagopus.comp.spots :refer $ comp-spots
          memof.once :refer $ memof1-call
          quaternion.core :refer $ c+
    |lagopus.comp.curves $ {}
      :defs $ {}
        |build-curve-points $ quote
          defn build-curve-points (points curve-ratio)
            let
                size $ count points
              ->
                range $ dec size
                map $ fn (idx)
                  let
                      idx+1 $ inc idx
                      p-raw $ nth points idx
                      q-raw $ nth points idx+1
                      q2-raw $ nth points (inc idx+1)
                      p $ &map:get p-raw :position
                      q $ &map:get q-raw :position
                      q2 $ if (some? q2-raw) (&map:get q2-raw :position)
                      direction $ &v- q p
                      direction2 $ if (some? q2) (&v- q2 q) direction
                      p-width $ either (&map:get p-raw :width) 1
                      q-width $ either (&map:get q-raw :width) 1
                      ratio $ &/ idx size
                      ratio+1 $ &/ idx+1 size
                    []
                      {} (:position p) (:brush 0) (:direction direction) (:curve_ratio curve-ratio) (:color_index idx) (:width p-width)
                      {} (:position q) (:brush 0) (:direction direction2) (:curve_ratio curve-ratio) (:color_index idx+1) (:width q-width)
                      {} (:position p) (:brush 1) (:direction direction) (:curve_ratio curve-ratio) (:color_index idx) (:width p-width)
                      {} (:position q) (:brush 0) (:direction direction2) (:curve_ratio curve-ratio) (:color_index idx+1) (:width q-width)
                      {} (:position q) (:brush 1) (:direction direction2) (:curve_ratio curve-ratio) (:color_index idx+1) (:width q-width)
                      {} (:position p) (:brush 1) (:direction direction) (:curve_ratio curve-ratio) (:color_index idx) (:width p-width)
        |comp-axis $ quote
          defn comp-axis (? options)
            let
                n $ either (get options :n) 20
                unit $ either (get options :unit) 20
              comp-curves $ {} (; :topology :line-strip)
                :curves $ []
                  -> (range-bothway n)
                    map $ fn (n)
                      {}
                        :position $ [] (* n unit) 0 0
                        :width 2
                  -> (range-bothway n)
                    map $ fn (n)
                      {}
                        :position $ [] 0 (* n unit) 0
                        :width 2
                  -> (range-bothway n)
                    map $ fn (n)
                      {}
                        :position $ [] 0 0 (* n unit)
                        :width 2
        |comp-curves $ quote
          defn comp-curves (options)
            let
                curves $ either (&map:get options :curves) ([])
              object $ {}
                :shader $ either (&map:get options :shader) curves-wgsl
                :topology $ either (&map:get options :topology) :triangle-list
                :attrs-list $ [] (:: :float32x3 :position) (:: :uint32 :brush) (:: :float32x3 :direction) (:: :float32 :curve_ratio) (:: :uint32 :color_index) (:: :float32 :width)
                :data $ let
                    size $ count curves
                  map-indexed curves $ fn (idx c)
                    build-curve-points c $ &/ idx size
      :ns $ quote
        ns lagopus.comp.curves $ :require
          lagopus.config :refer $ inline-shader
          lagopus.alias :refer $ object
          quaternion.core :refer $ &v+ v-cross v-scale v-dot &v-
          "\"../shaders/curves.wgsl" :default curves-wgsl
    |lagopus.comp.spots $ {}
      :defs $ {}
        |comp-spots $ quote
          defn comp-spots (options)
            let
                points $ either (&map:get options :points) ([])
                color $ either (&map:get options :color) ([] 0.8 0.8 1)
                radius $ either (&map:get options :radius) 12
                shift $ either (&map:get options :shift) 40
                vertex-count $ &max 3
                  either (&map:get options :vertex-count) 8
              object $ {}
                :shader $ either (&map:get options :shader) spots-wgsl
                :topology $ either (&map:get options :topology) :triangle-list
                :attrs-list $ [] (:: :float32x3 :base) (:: :float32x3 :color) (:: :float32 :radius) (:: :uint32 :vertex-count) (:: :uint32 :angle-idx) (:: :float32 :shift) (:: :uint32 :spot-idx)
                :data $ -> points
                  map-indexed $ fn (spot-idx base)
                    ->
                      range $ - vertex-count 2
                      map $ fn (angle-idx)
                        []
                          {} (:base base) (:color color) (:radius radius) (:vertex-count vertex-count) (:shift shift) (:spot-idx spot-idx) (:angle-idx 0)
                          {} (:base base) (:color color) (:radius radius) (:vertex-count vertex-count) (:shift shift) (:spot-idx spot-idx)
                            :angle-idx $ + 1 angle-idx
                          {} (:base base) (:color color) (:radius radius) (:vertex-count vertex-count) (:shift shift) (:spot-idx spot-idx)
                            :angle-idx $ + 2 angle-idx
      :ns $ quote
        ns lagopus.comp.spots $ :require
          lagopus.config :refer $ inline-shader
          lagopus.alias :refer $ object
          quaternion.core :refer $ &v+ v-cross v-scale v-dot &v-
          "\"../shaders/spots.wgsl" :default spots-wgsl
    |lagopus.config $ {}
      :defs $ {}
        |dev? $ quote
          def dev? $ &= "\"dev" (get-env "\"mode" "\"release")
        |inline-shader $ quote
          defmacro inline-shader (name)
            let
                shader $ if (blank? calcit-dirname) (str "\"shaders/" name "\".wgsl")
                  let
                      dir $ if (.ends-with? calcit-dirname "\"/") calcit-dirname (str calcit-dirname "\"/")
                    str dir "\"shaders/" name "\".wgsl"
              println "\"reading shader file:" shader
              read-file shader
      :ns $ quote
        ns lagopus.config $ :require
          lagopus.$meta :refer $ calcit-dirname
    |lagopus.main $ {}
      :defs $ {}
        |*store $ quote
          defatom *store $ {} (:tab :ribbon)
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
        |main! $ quote
          defn main! () (hint-fn async)
            if dev? $ load-console-formatter!
            js-await $ initializeContext
            reset-clear-color! $ {} (:r 0.4) (:g 0.4) (:b 0.4) (:a 1)
            render-app!
            renderControl
            startControlLoop 10 onControlEvent
            set! js/window.__lagopusHandleCompilationInfo handle-compilation
            set! js/window.onresize $ fn (e) (resetCanvasHeight canvas) (paintLagopusTree)
            resetCanvasHeight canvas
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
          "\"@triadica/lagopus" :refer $ setupMouseEvents onControlEvent paintLagopusTree renderLagopusTree initializeContext resetCanvasHeight
          "\"@triadica/touch-control" :refer $ renderControl startControlLoop
          lagopus.config :refer $ dev?
          lagopus.util :refer $ handle-compilation reset-clear-color!
          "\"bottom-tip" :default hud!
          "\"./calcit.build-errors" :default build-errors
          memof.once :refer $ reset-memof1-caches!
    |lagopus.util $ {}
      :defs $ {}
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
        |reset-clear-color! $ quote
          defn reset-clear-color! (color)
            .!reset atomClearColor $ to-js-data color
      :ns $ quote
        ns lagopus.util $ :require ("\"bottom-tip" :default hud!)
          "\"@triadica/lagopus/lib/global" :refer $ atomClearColor
