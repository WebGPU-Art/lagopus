
{} (:package |lagopus)
  :configs $ {} (:init-fn |lagopus.main/main!) (:reload-fn |lagopus.main/reload!) (:version |0.0.7)
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
        |inject-shader-snippets $ quote
          defn inject-shader-snippets (code)
            -> code (.!replace "\"{{simplex}}" wgsl-simplex) (.!replace "\"{{perspective}}" wgsl-perspective) (.!replace "\"{{colors}}" wgsl-colors) (.!replace "\"{{rand}}" wgsl-rand) (.!replace "\"{{rotation}}" wgsl-rotation)
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
                inject-shader-snippets $ &map:get options :shader
                turn-string $ &map:get options :topology
                to-js-data attrs-list
                , vertices-size buffers nil
                  if (some? indices)
                    u32buffer $ let
                        *arr $ js-array
                        collect! $ fn (x) (.!push *arr x )
                      collect-array! indices collect!
                      , *arr
                  &map:get options :add-uniform
        |wgsl-colors $ quote
          def wgsl-colors $ inline-shader "\"lagopus-colors"
        |wgsl-perspective $ quote
          def wgsl-perspective $ inline-shader "\"lagopus-perspective"
        |wgsl-rand $ quote
          def wgsl-rand $ inline-shader "\"lagopus-rand"
        |wgsl-rotation $ quote
          def wgsl-rotation $ inline-shader "\"lagopus-rotation"
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
                  {}
                    :position $ [] 40 0 0
                    :radius 40
                :ribbon $ comp-ribbon
                :necklace $ comp-necklace
                :sphere $ comp-sphere
                  {} (; :topology :line-strip) (:iteration 4) (:radius 160)
                    :color $ [] 0.6 0.9 0.7
                :plate $ comp-plate
                  {} (; :topology :line-strip) (:iteration 20) (:radius 160)
                    :color $ [] 0.04 0.8 0.6
                    :transformer $ fn (i)
                      v+ i $ [] 0 0 -10
                    ; :x-direction $ [] 1 0 0
                    ; :y-direction $ [] 0 1 0
                    :chromatism 0.14
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
            comp-button
              {}
                :position $ [] 240 260 0
                :color $ [] 0.2 0.9 0.6 1
                :size 20
              fn (e d!) (d! :tab :sphere)
            comp-button
              {}
                :position $ [] 280 260 0
                :color $ [] 0.9 0.4 0.6 1
                :size 20
              fn (e d!) (d! :tab :plate)
      :ns $ quote
        ns lagopus.comp.container $ :require
          lagopus.alias :refer $ group object
          "\"../shaders/mountains.wgsl" :default mountains-wgsl
          "\"../shaders/city.wgsl" :default city-wgsl
          lagopus.comp.button :refer $ comp-button
          lagopus.comp.curves :refer $ comp-curves comp-axis
          lagopus.comp.spots :refer $ comp-spots
          memof.once :refer $ memof1-call
          quaternion.core :refer $ c+ v+
          lagopus.comp.cube :refer $ comp-cube
          lagopus.comp.sphere :refer $ comp-sphere
          lagopus.comp.plate :refer $ comp-plate
    |lagopus.comp.cube $ {}
      :defs $ {}
        |comp-cube $ quote
          defn comp-cube (options)
            let
                base $ either (&map:get options :position) ([] 0 0 0)
                radius $ either (&map:get options :radius) 80
              object $ {} (:shader cube-wgsl)
                :topology $ do :line-strip :triangle-list
                :attrs-list $ [] (:: :float32x3 :position) (:: :float32x3 :metrics)
                :data $ []
                  {}
                    :position $ &v+ base
                      v-scale ([] -1 -1 -1) radius
                    :metrics $ [] -1 -1 -1
                  {}
                    :position $ &v+ base
                      v-scale ([] -1 1 -1) radius
                    :metrics $ [] -1 1 -1
                  {}
                    :position $ &v+ base
                      v-scale ([] -1 1 1) radius
                    :metrics $ [] -1 1 1
                  {}
                    :position $ &v+ base
                      v-scale ([] -1 -1 1) radius
                    :metrics $ [] -1 -1 1
                  {}
                    :position $ &v+ base
                      v-scale ([] 1 -1 -1) radius
                    :metrics $ [] 1 -1 -1
                  {}
                    :position $ &v+ base
                      v-scale ([] 1 1 -1) radius
                    :metrics $ [] 1 1 -1
                  {}
                    :position $ &v+ base
                      v-scale ([] 1 1 1) radius
                    :metrics $ [] 1 1 1
                  {}
                    :position $ &v+ base
                      v-scale ([] 1 -1 1) radius
                    :metrics $ [] 1 -1 1
                :indices $ [] ([] 0 1 2 0 2 3 ) ([] 0 1 5 0 4 5) ([] 1 2 6 1 6 5) ([] 2 3 6 3 6 7) ([] 0 3 4 3 4 7) ([] 4 5 6 4 6 7)
      :ns $ quote
        ns lagopus.comp.cube $ :require
          lagopus.config :refer $ inline-shader
          lagopus.alias :refer $ object
          quaternion.core :refer $ &v+ v-cross v-scale v-dot &v- v+
          "\"../shaders/curves.wgsl" :default curves-wgsl
          "\"../shaders/cube.wgsl" :default cube-wgsl
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
    |lagopus.comp.plate $ {}
      :defs $ {}
        |calc-ratio $ quote
          defn calc-ratio (p)
            let
                x $ nth p 0
                y $ nth p 1
                px $ &+ x (&* 0.5 y)
                py $ * 0.5 sqrt-3 y
                radian $ js/Math.atan2 py px
              &* 0.5 $ &* sqrt-3
                cos $ &- radian (&/ &PI 6)
        |comp-plate $ quote
          defn comp-plate (options)
            let
                base $ either (&map:get options :position) ([] 0 0 0)
                x-direction $ either (&map:get options :x-direction) ([] 1 0 0)
                y-direction $ either (&map:get options :y-direction) ([] 0 1 0)
                radius $ either (&map:get options :radius) 80
                iteration $ either (&map:get options :iteration) 4
                color $ either (&map:get options :color) ([] 0.6 0.8 0.76)
                *counter $ atom 0
                r-unit $ &/ radius iteration
                transformer $ either (&map:get options :transformer) identity
                chromatism $ either (&map:get options :chromatism) 0.1
              object $ {}
                :shader $ either (&map:get options :shader) wgsl-plate
                :topology $ either (&map:get options :topology) :triangle-list
                :attrs-list $ [] (:: :float32x3 :position) (:: :uint32 :idx)
                :data $ -> (range 6)
                  map $ fn (section-idx)
                    let
                        angle $ &* section-idx (&/ &PI 3)
                        angle-next $ &* (inc section-idx) (&/ &PI 3)
                        unit-x $ v-scale
                          &v+
                            v-scale x-direction $ cos angle
                            v-scale y-direction $ sin angle
                          , r-unit 
                        unit-y $ v-scale
                          &v+
                            v-scale x-direction $ cos angle-next
                            v-scale y-direction $ sin angle-next
                          , r-unit
                      -> (range iteration)
                        map $ fn (idx)
                          ->
                            range $ &- iteration idx
                            map $ fn (j)
                              let
                                  c @*counter
                                  c1 $ inc c
                                  p0 $ [] idx j
                                  p1 $ [] (inc idx) j
                                  p2 $ [] idx (inc j)
                                  p3 $ [] (inc idx) (inc j)
                                  s0 $ calc-ratio p0
                                  s1 $ calc-ratio p1
                                  s2 $ calc-ratio p2
                                  s3 $ calc-ratio p3
                                  ps0 $ &v+ base
                                    transformer $ &v+
                                      v-scale unit-x $ &* s0 (nth p0 0)
                                      v-scale unit-y $ &* s0 (nth p0 1)
                                  ps1 $ &v+ base
                                    transformer $ &v+
                                      v-scale unit-x $ &* s1 (nth p1 0)
                                      v-scale unit-y $ &* s1 (nth p1 1)
                                  ps2 $ &v+ base
                                    transformer $ &v+
                                      v-scale unit-x $ &* s2 (nth p2 0)
                                      v-scale unit-y $ &* s2 (nth p2 1)
                                  ps3 $ &v+ base
                                    transformer $ &v+
                                      v-scale unit-x $ &* s3 (nth p3 0)
                                      v-scale unit-y $ &* s3 (nth p3 1)
                                swap! *counter &+ 2
                                []
                                  {} (:position ps0) (:idx c)
                                  {} (:position ps1) (:idx c)
                                  {} (:position ps2) (:idx c)
                                  if
                                    &< (&+ idx j) (dec iteration)
                                    []
                                      {} (:position ps3) (:idx c1)
                                      {} (:position ps1) (:idx c1)
                                      {} (:position ps2) (:idx c1)
                                    []
                :add-uniform $ fn () (js-array & color chromatism)
        |sqrt-3 $ quote
          def sqrt-3 $ sqrt 3
        |wgsl-plate $ quote
          def wgsl-plate $ inline-shader "\"plate"
      :ns $ quote
        ns lagopus.comp.plate $ :require
          lagopus.config :refer $ inline-shader
          lagopus.alias :refer $ object
          quaternion.core :refer $ &v+ v-cross v-scale v-dot &v- v-length v+
    |lagopus.comp.sphere $ {}
      :defs $ {}
        |build-sphere-triangles $ quote
          defn build-sphere-triangles (base radius depth *counter p0 p1 p2) (; "\"based on knowledge from https://www.danielsieger.com/blog/2021/03/27/generating-spheres.html")
            if (<= depth 0)
              let
                  idx $ deref *counter
                swap! *counter inc
                []
                  {} (:idx idx)
                    :position $ &v+ base (v-scale p0 radius)
                  {} (:idx idx)
                    :position $ &v+ base (v-scale p1 radius)
                  {} (:idx idx)
                    :position $ &v+ base (v-scale p2 radius)
              let
                  p01 $ pick-radian-middle p0 p1
                  p02 $ pick-radian-middle p0 p2
                  p12 $ pick-radian-middle p1 p2
                []
                  build-sphere-triangles base radius (dec depth) *counter p0 p01 p02
                  build-sphere-triangles base radius (dec depth) *counter p1 p01 p12
                  build-sphere-triangles base radius (dec depth) *counter p2 p02 p12
                  build-sphere-triangles base radius (dec depth) *counter p01 p12 p02
        |comp-sphere $ quote
          defn comp-sphere (options)
            let
                base $ either (&map:get options :position) ([] 0 0 0)
                radius $ either (&map:get options :radius) 40
                iteration $ either (&map:get options :iteration) 2
                color $ either (&map:get options :color) ([] 0.6 0.8 0.76)
                *counter $ atom 0
              object $ {}
                :shader $ either (&map:get options :shader) sphere-wgsl
                :topology $ either (&map:get options :topology) :triangle-list
                :attrs-list $ [] (:: :float32x3 :position) (:: :uint32 :idx)
                :data $ -> unit-triangles
                  map $ fn (xs)
                    build-sphere-triangles base radius iteration *counter (nth xs 0) (nth xs 1) (nth xs 2)
                :add-uniform $ fn () (js-array & color 1)
        |pick-radian-middle $ quote
          defn pick-radian-middle (p0 p1)
            let
                p-mid $ v-scale (&v+ p0 p1) 0.5
                l $ v-length p-mid
                ratio $ &/ 1 l
                p-mid-unit $ v-scale p-mid ratio
              , p-mid-unit
        |unit-triangles $ quote
          def unit-triangles $ []
            [] ([] 1 0 0) ([] 0 1 0) ([] 0 0 1)
            [] ([] 1 0 0) ([] 0 1 0) ([] 0 0 -1)
            [] ([] 1 0 0) ([] 0 -1 0) ([] 0 0 1)
            [] ([] 1 0 0) ([] 0 -1 0) ([] 0 0 -1)
            [] ([] -1 0 0) ([] 0 1 0) ([] 0 0 1)
            [] ([] -1 0 0) ([] 0 1 0) ([] 0 0 -1)
            [] ([] -1 0 0) ([] 0 -1 0) ([] 0 0 1)
            [] ([] -1 0 0) ([] 0 -1 0) ([] 0 0 -1)
      :ns $ quote
        ns lagopus.comp.sphere $ :require
          lagopus.config :refer $ inline-shader
          lagopus.alias :refer $ object
          quaternion.core :refer $ &v+ v-cross v-scale v-dot &v- v-length
          "\"../shaders/sphere.wgsl" :default sphere-wgsl
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
        |bloom? $ quote
          def bloom? $ = "\"true" (get-env "\"bloom" "\"false")
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
        |mobile-info $ quote
          def mobile-info $ ismobile js/window.navigator
      :ns $ quote
        ns lagopus.config $ :require
          lagopus.$meta :refer $ calcit-dirname
          "\"ismobilejs" :default ismobile
    |lagopus.main $ {}
      :defs $ {}
        |*store $ quote
          defatom *store $ {} (:tab :plate)
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
            if
              and bloom? $ not (.-any mobile-info)
              enableBloom
            if dev? $ load-console-formatter!
            js-await $ initializeContext
            initializeCanvasTextures
            reset-clear-color! $ {} (:r 0.4) (:g 0.4) (:b 0.4) (:a 1)
            render-app!
            renderControl
            startControlLoop 10 onControlEvent
            registerShaderResult handle-compilation
            set! js/window.onresize $ fn (e) (resetCanvasSize canvas) (initializeCanvasTextures) (paintLagopusTree)
            resetCanvasSize canvas
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
          "\"@triadica/lagopus" :refer $ setupMouseEvents onControlEvent paintLagopusTree renderLagopusTree initializeContext resetCanvasSize initializeCanvasTextures registerShaderResult enableBloom
          "\"@triadica/touch-control" :refer $ renderControl startControlLoop
          lagopus.config :refer $ dev? mobile-info bloom?
          lagopus.util :refer $ handle-compilation reset-clear-color!
          "\"bottom-tip" :default hud!
          "\"./calcit.build-errors" :default build-errors
          memof.once :refer $ reset-memof1-caches!
    |lagopus.math $ {}
      :defs $ {}
        |fibo-grid-n $ quote
          defn fibo-grid-n (n total)
            let
                z $ dec
                  &/
                    dec $ &* 2 n
                    , total
                t $ sqrt
                  &- 1 $ &* z z
                t2 $ * 2 &PI n phi
                x $ &* t (js/Math.cos t2)
                y $ &* t (js/Math.sin t2)
              [] x y z
        |fibo-grid-range $ quote
          defn fibo-grid-range (total)
            -> (range total)
              map $ fn (n)
                fibo-grid-n (inc n) total
        |phi $ quote
          def phi $ * 0.5
            dec $ sqrt 5
        |rotate-3d-fn $ quote
          defn rotate-3d-fn (origin axis angle)
            let
                axis-0 $ v-normalize axis
                cos-d $ js/Math.cos angle
                sin-d $ js/Math.sin angle
              defn rotate-3d-apply (p)
                let
                    p-v $ &v- p origin
                    h $ v-dot axis-0 p-v
                    h-v $ v-scale axis-0 h
                    flat-p-v $ &v- p-v h-v
                    rot-direction $ v-normalize (v-cross flat-p-v axis-0)
                    rot-v $ v-scale rot-direction (v-length flat-p-v)
                  v+ origin h-v (v-scale flat-p-v cos-d) (v-scale rot-v sin-d)
      :ns $ quote
        ns lagopus.math $ :require
          quaternion.core :refer $ v-dot v-normalize &v- v-scale v-cross v+ &v+ v-length
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
