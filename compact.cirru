
{} (:package |lagopus)
  :configs $ {} (:init-fn |lagopus.main/main!) (:reload-fn |lagopus.main/reload!) (:version |0.5.8)
    :modules $ [] |memof/ |quaternion/
  :entries $ {}
  :files $ {}
    |lagopus.alias $ %{} :FileEntry
      :defs $ {}
        |buffer-format $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn buffer-format (format)
              case-default format
                if (string? format) format $ do (js/console.warn "\"Unknown format" format) "\"float32"
                :float32 "\"float32"
                :float32x2 "\"float32x2"
                :float32x3 "\"float32x3"
                :float32x4 "\"float32x4"
                :uint32 "\"uint32"
        |collect-array! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn collect-array! (indices collect!)
              if (list? indices)
                &doseq (x indices) (collect-array! x collect!)
                collect! indices
        |collect-from-records! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn collect-from-records! (data field idx write!)
              cond
                  list? data
                  &doseq (x data) (collect-from-records! x field idx write!)
                (tuple? data)
                  do
                    if
                      not= :vertex $ nth data 0
                      js/console.warn "\"expected :vertex tag" data
                    let
                        xs $ nth data (inc idx)
                      if (tuple? xs)
                        tag-match xs $ 
                          :v3 x y z
                          do (write! x) (write! y) (write! z)
                        if (list? xs)
                          &doseq (x xs) (write! x)
                          write! xs
                (map? data)
                  let
                      xs $ &map:get data field
                    if (tuple? xs)
                      tag-match xs $ 
                        :v3 x y z
                        do (write! x) (write! y) (write! z)
                      if (list? xs)
                        &doseq (x xs) (write! x)
                        write! xs
                true $ raise "\"unknown data"
        |count-recursive $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn count-recursive (xs)
              if (list? xs)
                reduce xs 0 $ fn (acc y)
                  &+ acc $ count-recursive y
                , 1
        |expand-attr $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn expand-attr (x)
              if (tuple? x)
                {}
                  :field $ &tuple:nth x 1
                  :format $ &tuple:nth x 0
                , x
        |group $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn group (a & children)
              if
                not $ or (nil? a)
                  = a $ &{}
                js/console.warn "\"group options is not used at current" a
              lagopus/group nil & children
        |inject-shader-snippets $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn inject-shader-snippets (code)
              -> code (.!replace "\"#import lagopus::simplex" wgsl-simplex) (.!replace "\"#import lagopus::perspective" wgsl-perspective) (.!replace "\"#import lagopus::colors" wgsl-colors) (.!replace "\"#import lagopus::rand" wgsl-rand) (.!replace "\"#import lagopus::rotation" wgsl-rotation) (.!replace "\"#import lagopus::hsluv" wgsl-hsluv)
        |make-empty-js-arrays $ %{} :CodeEntry (:doc "|create nested array of js, as placeholder for attributes data")
          :code $ quote
            defn make-empty-js-arrays (n)
              -> (new js/Array n) (.!fill 0)
                .!map $ fn (x i _) (js-array)
        |object $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn object (options)
              let
                  attrs-list $ map (&map:get options :attrs-list) expand-attr
                  data $ &map:get options :data
                  vertices-size $ count-recursive data
                  buffers $ js-array &
                    map-indexed attrs-list $ fn (idx attr)
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
                        collect-from-records! data field idx write!
                        ; js/console.log @*idx $ .-length buffer
                        if
                          not= @*idx $ .-length buffer
                          eprintln "\"buffer size guessed incorrectly"
                        , buffer
                ; js/console.log vertices-size buffers
                createRenderer $ js-object
                  :shader $ inject-shader-snippets (&map:get options :shader)
                  :topology $ turn-string (&map:get options :topology)
                  :attrsList $ to-js-data attrs-list
                  :verticesLength vertices-size
                  :vertices buffers
                  :hitRegion nil
                  :indices $ if-let
                    indices $ &map:get options :indices
                    u32buffer $ let
                        *arr $ js-array
                        collect! $ fn (x) (.!push *arr x )
                      collect-array! indices collect!
                      , *arr
                  :getParams $ &map:get options :get-params
                  :textures $ js-array &
                    either (&map:get options :textures) ([])
                  :label $ &map:get options :label
                  :computeOptions $ &map:get options :compute-options
        |object-writer $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn object-writer (options)
              let
                  attrs-list $ map (&map:get options :attrs-list) expand-attr
                  writer $ &map:get options :writer
                  bundles $ noted "\"actually stores data in this nested list..."
                    make-empty-js-arrays $ count attrs-list
                  *counter $ atom 0
                  count! $ fn (x) (swap! *counter &+ x)
                  collect! $ fn (chunk)
                    &doseq (record chunk) (count! 1)
                      map-indexed attrs-list $ fn (idx attr)
                        let
                            arr $ js-get bundles idx
                            data $ do
                              assert "\"expected tuple" $ tuple? record
                              if
                                not= :vertex $ nth record 0
                                js/console.warn "\"expected :vertex tag" record
                              nth record $ inc idx
                          if (tuple? data)
                            tag-match data $ 
                              :v3 x y z
                              do $ .!push arr x y z
                            if (list? data)
                              &doseq (d data) (.!push arr d)
                              .!push arr data
                  buffers $ do
                    noted "\"call writer function to fill data into buffer" $ writer collect!
                    js-array & $ map-indexed attrs-list
                      fn (idx attr)
                        newBufferFormatArray
                          buffer-format $ &map:get attr :format
                          js-get bundles idx
                ; js/console.log @*counter buffers
                createRenderer $ js-object
                  :shader $ inject-shader-snippets (&map:get options :shader)
                  :topology $ turn-string (&map:get options :topology)
                  :attrsList $ to-js-data attrs-list
                  :verticesLength @*counter
                  :vertices buffers
                  :hitRegion nil
                  :indices $ if-let
                    indices $ &map:get options :indices
                    u32buffer $ let
                        *arr $ js-array
                        collect! $ fn (x) (.!push *arr x)
                      collect-array! indices collect!
                      , *arr
                  :getParams $ &map:get options :get-params
                  :textures $ js-array &
                    either (&map:get options :textures) ([])
                  :label $ &map:get options :label
                  :computeOptions $ &map:get options :compute-options
        |wgsl-colors $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-colors $ inline-shader "\"lagopus-colors"
        |wgsl-hsluv $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-hsluv $ inline-shader "\"lagopus-hsluv"
        |wgsl-perspective $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-perspective $ inline-shader "\"lagopus-perspective"
        |wgsl-rand $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-rand $ inline-shader "\"lagopus-rand"
        |wgsl-rotation $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-rotation $ inline-shader "\"lagopus-rotation"
        |wgsl-simplex $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-simplex $ inline-shader "\"lagopus-simplex"
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.alias $ :require
            "\"@triadica/lagopus" :refer $ createRenderer u32buffer newBufferFormatLength newBufferFormatArray
            "\"@triadica/lagopus" :as lagopus
            lagopus.config :refer $ inline-shader
    |lagopus.comp.button $ %{} :FileEntry
      :defs $ {}
        |comp-button $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-button (props on-click)
              compButton
                -> props
                  update :position $ fn (p) (.to-js p)
                  to-js-data
                , on-click
        |comp-drag-point $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-drag-point (props on-drag)
              let
                  color $ &map:get props :color
                  position $ &map:get props :position
                compDragPoint
                  js-object
                    :color $ to-js-data color
                    :position $ if (tuple? position)
                      js-array (nth position 1) (nth position 2) (nth position 3)
                      if (list? position) (to-js-data position)
                        do (eprintln "\"unknown position" position) (js-array 10 0 0)
                  fn (move d!)
                    on-drag
                      v3 (.-0 move) (.-1 move) (.-2 move)
                      , d!
        |comp-flat-button $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-flat-button (props on-click)
              compFlatButton
                -> props
                  update :position $ fn (p) (.to-js p)
                  to-js-data
                , on-click
        |comp-slider $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-slider (props on-slide)
              compSlider (to-js-data props)
                fn (move d!)
                  on-slide
                    complex (.-0 move) (.-1 move)
                    , d!
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.comp.button $ :require
            "\"@triadica/lagopus" :refer $ compButton compSlider compDragPoint
            "\"@triadica/lagopus/lib/comp/button.mjs" :refer $ compFlatButton
            quaternion.vector :refer $ v3
            quaternion.complex :refer $ complex
    |lagopus.comp.container $ %{} :FileEntry
      :defs $ {}
        |color-default $ %{} :CodeEntry (:doc |)
          :code $ quote
            def color-default $ [] 1 0 0 1
        |comp-bubbles-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-bubbles-demo () $ let
                area 2000
              comp-bubbles $ {}
                :bubbles $ -> (range 600)
                  map $ fn (idx)
                    [] (rand-shift 0 area) (rand-shift 0 area) (rand-shift 0 area)
                      + 6 $ rand 120
        |comp-city $ %{} :CodeEntry (:doc |)
          :code $ quote
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
                              [] (:: :vertex p0 0 0) (:: :vertex p0 0 1) (:: :vertex p0 0 2)
                              [] (:: :vertex p0 0 0) (:: :vertex p0 0 2) (:: :vertex p0 0 3)
                              [] (:: :vertex p0 1 0) (:: :vertex p0 1 1) (:: :vertex p0 1 5)
                              [] (:: :vertex p0 1 0) (:: :vertex p0 1 5) (:: :vertex p0 1 4)
                              [] (:: :vertex p0 2 1) (:: :vertex p0 2 2) (:: :vertex p0 2 6)
                              [] (:: :vertex p0 2 1) (:: :vertex p0 2 6) (:: :vertex p0 2 5)
                              [] (:: :vertex p0 3 2) (:: :vertex p0 3 3) (:: :vertex p0 3 6)
                              [] (:: :vertex p0 3 3) (:: :vertex p0 3 7) (:: :vertex p0 3 6)
                              [] (:: :vertex p0 4 0) (:: :vertex p0 4 3) (:: :vertex p0 4 4)
                              [] (:: :vertex p0 4 3) (:: :vertex p0 4 4) (:: :vertex p0 4 7)
                              [] (:: :vertex p0 5 4) (:: :vertex p0 5 5) (:: :vertex p0 5 6)
                              [] (:: :vertex p0 5 4) (:: :vertex p0 5 6) (:: :vertex p0 5 7)
        |comp-container $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-container (store textures-dict)
              let
                  cursor $ []
                  states $ :states store
                group nil (memof1-call comp-tabs)
                  case-default (:tab store) (group nil)
                    :axis $ comp-axis
                      {} (:n 20) (:unit 20)
                    :mountains $ memof1-call comp-mountains
                    :city $ memof1-call comp-city
                    :bends $ group nil
                    :cube $ comp-cube
                      {}
                        :position $ v3 40 0 0
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
                          v+ i $ v3 0 0 -10
                        ; :x-direction $ v3 1 0 0
                        ; :y-direction $ v3 0 1 0
                        :chromatism 0.14
                    :control $ comp-control-demo (>> states :control)
                    :stitch $ comp-stitch-demo
                    :bubbles $ comp-bubbles-demo
                    :triangles $ comp-triangles-demo
                    :image $ comp-image-demo textures-dict
                    :kaleidoscope $ comp-kaleidoscope textures-dict
        |comp-control-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-control-demo (states)
              let
                  cursor $ :cursor states
                  state $ either (:data states)
                    {} $ :pos ([] 60 0 0)
                group nil
                  comp-slider
                    {} $ :position ([] 0 0 0)
                    fn (change on-slide) (js/console.log "\"Slide" change)
                  comp-drag-point
                    {}
                      :position $ :pos state
                      :color $ [] 0.6 0.6 1.0 1.0
                    fn (move d!)
                      d! $ : :state cursor (assoc state :pos move)
                  comp-flat-button
                    {}
                      :position $ v3 100 20 0
                      :color $ [] 0.9 0.4 0.5 1
                      :size 40
                    fn (e d!) (js/console.log "\"CLICKED")
        |comp-mountains $ %{} :CodeEntry (:doc |)
          :code $ quote
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
                                :: :vertex $ [] x0 y0
                                :: :vertex $ [] x1 y0
                                :: :vertex $ [] x1 y1
                              []
                                :: :vertex $ [] x0 y0
                                :: :vertex $ [] x1 y1
                                :: :vertex $ [] x0 y1
        |comp-necklace $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-necklace () $ comp-spots
              {} (; :topology :line-strip) (:radius 6) (:vertex-count 8) (:shift 12)
                :points $ -> (range 80)
                  map $ fn (idx)
                    let
                        r $ * idx 4
                      [] r
                        * r $ cos (* 0.1129 idx)
                        * r $ sin (* 0.123 idx)
        |comp-ribbon $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-ribbon () $ comp-curves
              {} (; :topology :line-strip)
                :curves $ []
                  -> (range 400)
                    map $ fn (idx)
                      let
                          angle $ * 0.1 idx
                          r 40
                        {}
                          :position $ v3
                            * r $ cos angle
                            * 0.6 idx
                            * r $ sin angle
                          :width 2
        |comp-stitch-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-stitch-demo () $ group nil
              comp-stitch $ {}
                :chars $ [] 0xf2dfea34 0xc3c4a59d 0x88737645
        |comp-tabs $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-tabs () $ group nil
              comp-button
                {}
                  :position $ v3 0 260 0
                  :color $ [] 0.5 0.5 0.9 1
                  :size 20
                fn (e d!)
                  d! $ : tab :axis
              comp-button
                {}
                  :position $ v3 40 260 0
                  :color $ [] 0.9 0.4 0.5 1
                  :size 20
                fn (e d!)
                  d! $ : tab :mountains
              comp-button
                {}
                  :position $ v3 80 260 0
                  :color $ [] 0.8 0.9 0.2 1
                  :size 20
                fn (e d!)
                  d! $ : tab :city
              comp-button
                {}
                  :position $ v3 120 260 0
                  :color $ [] 0.3 0.9 0.2 1
                  :size 20
                fn (e d!)
                  d! $ : tab :cube
              comp-button
                {}
                  :position $ v3 160 260 0
                  :color $ [] 0.8 0.0 0.9 1
                  :size 20
                fn (e d!)
                  d! $ : tab :ribbon
              comp-button
                {}
                  :position $ v3 200 260 0
                  :color $ [] 0.2 0.9 0.6 1
                  :size 20
                fn (e d!)
                  d! $ : tab :necklace
              comp-button
                {}
                  :position $ v3 240 260 0
                  :color $ [] 0.2 0.9 0.6 1
                  :size 20
                fn (e d!)
                  d! $ : tab :sphere
              comp-button
                {}
                  :position $ v3 280 260 0
                  :color $ [] 0.9 0.4 0.6 1
                  :size 20
                fn (e d!)
                  d! $ : tab :plate
              comp-button
                {}
                  :position $ v3 20 220 0
                  :color $ [] 0.7 0.8 0.9 1
                  :size 20
                fn (e d!)
                  d! $ : tab :control
              comp-button
                {}
                  :position $ v3 60 220 0
                  :color $ [] 0.9 0.7 0.6 1
                  :size 20
                fn (e d!)
                  d! $ : tab :stitch
              comp-button
                {}
                  :position $ v3 100 220 0
                  :color $ [] 0.9 0.3 0.8 1
                  :size 20
                fn (e d!)
                  d! $ : tab :bubbles
              comp-button
                {}
                  :position $ v3 140 220 0
                  :color $ [] 0.1 0.6 0.8 1
                  :size 20
                fn (e d!)
                  d! $ : tab :triangles
              comp-button
                {}
                  :position $ v3 180 220 0
                  :color $ [] 0.9 0.2 0.99 1
                  :size 20
                fn (e d!)
                  d! $ : tab :image
              comp-button
                {}
                  :position $ v3 220 220 0
                  :color $ [] 0.9 0.8 0.99 1
                  :size 20
                fn (e d!)
                  d! $ : tab :kaleidoscope
        |comp-triangles-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-triangles-demo () $ let
                width 2
              group nil
                ; comp-polylines $ {} (; :topology :line-strip)
                  :writer $ fn (write!)
                    write! $ []
                      : vertex (v3 0 0 0) width
                      : vertex (v3 100 100 0) width
                      , break-mark
                        : vertex (v3 0 0 10) width
                        : vertex (v3 200 0 10) width
                        : vertex (v3 200 20 0) width
                        : vertex (v3 100 40 0) width
                        : vertex (v3 100 20 200) width
                        , break-mark
                comp-polylines-marked $ {} (; :topology :line-strip)
                  :writer $ fn (write!)
                    write! $ []
                      : vertex (v3 0 0 0) width 0
                      : vertex (v3 100 100 0) width 0
                      , break-mark
                        : vertex (v3 0 0 10) width 2
                        : vertex (v3 200 0 10) width 2
                        : vertex (v3 200 20 0) width 2
                        : vertex (v3 100 40 0) width 2
                        : vertex (v3 100 20 200) width 2
                        , break-mark
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.comp.container $ :require
            lagopus.alias :refer $ group object
            "\"../shaders/mountains.wgsl" :default mountains-wgsl
            "\"../shaders/city.wgsl" :default city-wgsl
            lagopus.comp.button :refer $ comp-button comp-slider comp-drag-point comp-flat-button
            lagopus.comp.curves :refer $ comp-curves comp-axis comp-polylines comp-polylines-marked break-mark
            lagopus.comp.spots :refer $ comp-spots comp-bubbles
            memof.once :refer $ memof1-call
            quaternion.vector :refer $ v+ v3
            lagopus.comp.cube :refer $ comp-cube
            lagopus.comp.sphere :refer $ comp-sphere
            lagopus.comp.plate :refer $ comp-plate
            lagopus.cursor :refer $ >>
            lagopus.comp.stitch :refer $ comp-stitch
            "\"@calcit/std" :refer $ rand-shift rand
            lagopus.config :refer $ inline-shader
            lagopus.comp.image :refer $ comp-image-demo comp-kaleidoscope
    |lagopus.comp.cube $ %{} :FileEntry
      :defs $ {}
        |comp-cube $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-cube (options)
              let
                  base $ either (&map:get options :position) (v3 0 0 0)
                  radius $ either (&map:get options :radius) 80
                object $ {} (:shader wgsl-cube)
                  :topology $ do :line-strip :triangle-list
                  :attrs-list $ [] (:: :float32x3 :position) (:: :float32x3 :metrics)
                  :data $ []
                    :: :vertex
                      &v+ base $ v-scale (v3 -1 -1 -1) radius
                      v3 -1 -1 -1
                    :: :vertex
                      &v+ base $ v-scale (v3 -1 1 -1) radius
                      v3 -1 1 -1
                    :: :vertex
                      &v+ base $ v-scale (v3 -1 1 1) radius
                      v3 -1 1 1
                    :: :vertex
                      &v+ base $ v-scale (v3 -1 -1 1) radius
                      v3 -1 -1 1
                    :: :vertex
                      &v+ base $ v-scale (v3 1 -1 -1) radius
                      v3 1 -1 -1
                    :: :vertex
                      &v+ base $ v-scale (v3 1 1 -1) radius
                      v3 1 1 -1
                    :: :vertex
                      &v+ base $ v-scale (v3 1 1 1) radius
                      v3 1 1 1
                    :: :vertex
                      &v+ base $ v-scale (v3 1 -1 1) radius
                      v3 1 -1 1
                  :indices $ [] ([] 0 1 2 0 2 3) ([] 0 1 5 0 4 5) ([] 1 2 6 1 6 5) ([] 2 3 6 3 6 7) ([] 0 3 4 3 4 7) ([] 4 5 6 4 6 7)
        |wgsl-cube $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-cube $ inline-shader "\"cube"
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.comp.cube $ :require
            lagopus.config :refer $ inline-shader
            lagopus.alias :refer $ object
            quaternion.vector :refer $ &v+ v-cross v-scale v-dot &v- v+ v3
    |lagopus.comp.curves $ %{} :FileEntry
      :defs $ {}
        |break-mark $ %{} :CodeEntry (:doc |)
          :code $ quote
            def break-mark $ :: :break
        |build-curve-points $ %{} :CodeEntry (:doc |)
          :code $ quote
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
                        p $ if (tuple? p-raw) (nth p-raw 1) (&map:get p-raw :position)
                        q $ if (tuple? q-raw) (nth q-raw 1)
                          if (map? q-raw) (&map:get q-raw :position)
                        q2 $ if (tuple? q2-raw) (nth q2-raw 1)
                          if (list? q2-raw)
                            if (map? q2-raw) (&map:get q2-raw :position)
                        direction $ &v- q p
                        direction2 $ if (some? q2) (&v- q2 q) direction
                        p-width $ either
                          if (tuple? p-raw) (nth p-raw 2)
                            if (map? p-raw) (&map:get p-raw :width)
                          , 1
                        q-width $ either
                          if (tuple? q-raw) (nth q-raw 2)
                            if (map? q-raw) (&map:get q-raw :width)
                          , 1
                        ratio $ &/ idx size
                        ratio+1 $ &/ idx+1 size
                      [] (:: :vertex p 0 direction curve-ratio idx p-width) (:: :vertex q 0 direction2 curve-ratio idx+1 q-width) (:: :vertex p 1 direction2 curve-ratio idx p-width) (:: :vertex q 0 direction2 curve-ratio idx+1 p-width) (:: :vertex q 1 direction2 curve-ratio idx+1 q-width) (:: :vertex p 1 direction curve-ratio idx p-width)
        |build-polyline-points $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn build-polyline-points (*prev p write!)
              tag-match p
                  :break
                  do $ reset! *prev nil
                (:vertex position width)
                  if-let (prev @*prev)
                    let
                        older $ :older prev
                      reset! *prev $ {} (:position position) (:older older)
                        :width $ :width prev
                      if (some? older)
                        let
                            p older
                            q $ :position prev
                            q2 position
                            direction $ &v- q p
                            direction2 $ &v- q2 q
                            p-width $ :width prev
                            q-width width
                          write! $ [] (:: :vertex q 0 direction p-width) (:: :vertex q2 0 direction2 q-width) (:: :vertex q 1 direction2 p-width) (:: :vertex q2 0 direction2 p-width) (:: :vertex q2 1 direction2 q-width) (:: :vertex q 1 direction p-width)
                        let
                            q $ :position prev
                            q2 position
                            direction $ &v- q2 q
                            p-width $ :width prev
                            q-width width
                          write! $ [] (:: :vertex q 0 direction p-width) (:: :vertex q2 0 direction q-width) (:: :vertex q 1 direction p-width) (:: :vertex q2 0 direction p-width) (:: :vertex q2 1 direction q-width) (:: :vertex q 1 direction p-width)
                    do $ reset! *prev
                      {} (:position position) (:older nil) (:width width)
        |build-polyline-points-marked $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn build-polyline-points-marked (*prev p write!)
              tag-match p
                  :break
                  do $ reset! *prev nil
                (:vertex position width mark)
                  if-let (prev @*prev)
                    let
                        older $ :older prev
                      reset! *prev $ {} (:position position) (:older older) (:mark mark)
                        :width $ :width prev
                      if (some? older)
                        let
                            p older
                            q $ :position prev
                            prev-mark $ :mark prev
                            q2 position
                            direction $ &v- q p
                            direction2 $ &v- q2 q
                            p-width $ :width prev
                            q-width width
                          write! $ [] (:: :vertex q 0 direction p-width prev-mark) (:: :vertex q2 0 direction2 q-width mark) (:: :vertex q 1 direction2 p-width prev-mark) (:: :vertex q2 0 direction2 p-width mark) (:: :vertex q2 1 direction2 q-width mark) (:: :vertex q 1 direction p-width prev-mark)
                        let
                            q $ :position prev
                            prev-mark $ :mark prev
                            q2 position
                            direction $ &v- q2 q
                            p-width $ :width prev
                            q-width width
                          write! $ [] (:: :vertex q 0 direction p-width prev-mark) (:: :vertex q2 0 direction q-width mark) (:: :vertex q 1 direction p-width prev-mark) (:: :vertex q2 0 direction p-width mark) (:: :vertex q2 1 direction q-width mark) (:: :vertex q 1 direction p-width prev-mark)
                    do $ reset! *prev
                      {} (:position position) (:older nil) (:mark mark) (:width width)
        |char-x $ %{} :CodeEntry (:doc |)
          :code $ quote
            def char-x $ count-hex
              reverse $ concat ([] true false true false false false false true) ([] false false true false true true false false) ([] false false false true true false true false) ([] false true false false false false true false)
        |char-y $ %{} :CodeEntry (:doc |)
          :code $ quote
            def char-y $ count-hex
              reverse $ concat ([] true false true false false false false true) ([] false false true false true true false false) ([] false false false false true true false false) ([] false false false false true true false false)
        |char-z $ %{} :CodeEntry (:doc |)
          :code $ quote
            def char-z $ count-hex
              reverse $ concat ([] true false true false true true false true) ([] false false false false false true false false) ([] false false false true false false false false) ([] false true true true true true true true true)
        |comp-axis $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-axis (? options)
              let
                  n $ either (get options :n) 20
                  unit $ either (get options :unit) 20
                  w $ either (get options :width) 1
                group nil
                  comp-polylines-marked $ {} (; :topology :line-strip)
                    :shader $ inline-shader "\"axis"
                    :writer $ fn (write!)
                      &doseq
                        idx $ range-bothway n
                        write! $ :: :vertex
                          v3 (* idx unit) 0 0
                          , w 0
                      write! break-mark
                      &doseq
                        idx $ range-bothway n
                        write! $ :: :vertex
                          v3 0 (* idx unit) 0
                          , w 1
                      write! break-mark
                      &doseq
                        idx $ range-bothway n
                        write! $ :: :vertex
                          v3 0 0 $ * idx unit
                          , w 2
                      write! break-mark
                  ; comp-stitch $ {} (:size 16)
                    :position $ v3 400 0 0
                    :chars $ [] char-x
                  ; comp-stitch $ {} (:size 16)
                    :position $ v3 0 400 0
                    :chars $ [] char-y
                  ; comp-stitch $ {} (:size 16)
                    :position $ v3 0 0 400
                    :chars $ [] char-z
        |comp-curves $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-curves (options)
              let
                  curves $ either (&map:get options :curves) ([])
                object $ {}
                  :shader $ either (&map:get options :shader) wgsl-curves
                  :topology $ either (&map:get options :topology) :triangle-list
                  :attrs-list $ [] (:: :float32x3 :position) (:: :uint32 :brush) (:: :float32x3 :direction) (:: :float32 :curve_ratio) (:: :uint32 :color_index) (:: :float32 :width)
                  :data $ let
                      size $ count curves
                    map-indexed curves $ fn (idx c)
                      build-curve-points c $ &/ idx size
        |comp-polylines $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-polylines (options)
              let
                  chunk-writer! $ either (&map:get options :writer)
                    fn (_) (js/console.warn "\"expected polylines writer")
                object-writer $ {}
                  :shader $ either (&map:get options :shader) wgsl-polylines
                  :topology $ either (&map:get options :topology) :triangle-list
                  :attrs-list $ [] (: float32x3 :position) (: uint32 :brush) (: float32x3 :direction) (: float32 :width)
                  :writer $ fn (write!)
                    let
                        *prev $ atom nil
                        collect! $ fn (p)
                          if (list? p)
                            &doseq (x p) (build-polyline-points *prev x write!)
                            build-polyline-points *prev p write!
                      chunk-writer! collect!
                  :get-params $ &map:get options :get-params
                  :compute-options $ &map:get options :compute-options
        |comp-polylines-marked $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-polylines-marked (options)
              let
                  chunk-writer! $ either (&map:get options :writer)
                    fn (_) (js/console.warn "\"expected polylines writer")
                object-writer $ {}
                  :shader $ either (&map:get options :shader) wgsl-polylines-marked
                  :topology $ either (&map:get options :topology) :triangle-list
                  :attrs-list $ [] (: float32x3 :position) (: uint32 :brush) (: float32x3 :direction) (: float32 :width) (: float32 :mark)
                  :writer $ fn (write!)
                    let
                        *prev $ atom nil
                        collect! $ fn (p)
                          if (list? p)
                            &doseq (x p) (build-polyline-points-marked *prev x write!)
                            build-polyline-points-marked *prev p write!
                      chunk-writer! collect!
                  :get-params $ &map:get options :get-params
                  :compute-options $ &map:get options :compute-options
        |count-hex $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn count-hex (xs)
              -> xs
                map-indexed $ fn (idx v)
                  * (if v 1 0) (pow 2 idx)
                reduce 0 &+
        |wgsl-curves $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-curves $ inline-shader "\"curves"
        |wgsl-polylines $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-polylines $ inline-shader "\"polylines"
        |wgsl-polylines-marked $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-polylines-marked $ inline-shader "\"polylines-marked"
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.comp.curves $ :require
            lagopus.config :refer $ inline-shader
            lagopus.alias :refer $ object group object-writer
            quaternion.vector :refer $ &v+ v-cross v-scale v-dot &v- v3
            lagopus.comp.stitch :refer $ comp-stitch
    |lagopus.comp.image $ %{} :FileEntry
      :defs $ {}
        |comp-image-demo $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-image-demo (textures-dict)
              object $ {} (:label :image) (:shader wgsl-image)
                :topology $ do :line-strip :triangle-list
                :attrs-list $ []
                  {} (:field :position) (:format "\"float32x3")
                  {} (:field :uv) (:format "\"float32x2")
                :data $ []
                  []
                    :: :vertex ([] 0 0 0) ([] 0 0)
                    :: :vertex ([] 100 0 0) ([] 1 0)
                    :: :vertex ([] 100 100 0) ([] 1 1)
                  []
                    :: :vertex ([] 100 100 0) ([] 1 1)
                    :: :vertex ([] 0 100 0) ([] 0 1)
                    :: :vertex ([] 0 0 0) ([] 0 0)
                :textures $ [] (get textures-dict :tiye)
        |comp-kaleidoscope $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-kaleidoscope (textures-dict)
              object $ {} (:label :image) (:shader wgsl-kaleidoscope)
                :topology $ do :line-strip :triangle-list
                :attrs-list $ []
                  {} (:field :position) (:format "\"float32x3")
                  {} (:field :uv) (:format "\"float32x2")
                :data $ []
                  []
                    :: :vertex ([] 0 0 0) ([] 0 0)
                    :: :vertex ([] 100 0 0) ([] 1 0)
                    :: :vertex ([] 100 100 0) ([] 1 1)
                  []
                    :: :vertex ([] 100 100 0) ([] 1 1)
                    :: :vertex ([] 0 100 0) ([] 0 1)
                    :: :vertex ([] 0 0 0) ([] 0 0)
                :textures $ [] (get textures-dict :tiye)
        |wgsl-image $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-image $ inline-shader "\"image"
        |wgsl-kaleidoscope $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-kaleidoscope $ inline-shader "\"kaleidoscope"
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.comp.image $ :require
            lagopus.alias :refer $ group object
            lagopus.comp.button :refer $ comp-button comp-slider comp-drag-point
            memof.once :refer $ memof1-call
            quaternion.vector :refer $ v+ v3
            lagopus.cursor :refer $ >>
            "\"@calcit/std" :refer $ rand-shift rand
            lagopus.config :refer $ inline-shader
    |lagopus.comp.plate $ %{} :FileEntry
      :defs $ {}
        |calc-ratio $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn calc-ratio (p)
              let
                  x $ nth p 0
                  y $ nth p 1
                  px $ &+ x (&* 0.5 y)
                  py $ * 0.5 sqrt-3 y
                  radian $ js/Math.atan2 py px
                &* 0.5 $ &* sqrt-3
                  cos $ &- radian (&/ &PI 6)
        |comp-plate $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-plate (options)
              let
                  base $ either (&map:get options :position) (v3 0 0 0)
                  x-direction $ either (&map:get options :x-direction) (v3 1 0 0)
                  y-direction $ either (&map:get options :y-direction) (v3 0 1 0)
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
                                  [] (:: :vertex ps0 c) (:: :vertex ps1 c) (:: :vertex ps2 c)
                                    if
                                      &< (&+ idx j) (dec iteration)
                                      [] (:: :vertex ps3 c1) (:: :vertex ps1 c1) (:: :vertex ps2 c1)
                                      []
                  :get-params $ fn () (js-array & color chromatism)
        |sqrt-3 $ %{} :CodeEntry (:doc |)
          :code $ quote
            def sqrt-3 $ sqrt 3
        |wgsl-plate $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-plate $ inline-shader "\"plate"
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.comp.plate $ :require
            lagopus.config :refer $ inline-shader
            lagopus.alias :refer $ object
            quaternion.vector :refer $ &v+ v-cross v-scale v-dot &v- v-length v3 v+
    |lagopus.comp.sphere $ %{} :FileEntry
      :defs $ {}
        |build-sphere-triangles $ %{} :CodeEntry (:doc "|based on knowledge from https://www.danielsieger.com/blog/2021/03/27/generating-spheres.html")
          :code $ quote
            defn build-sphere-triangles (base radius depth *counter p0 p1 p2)
              if (<= depth 0)
                let
                    idx $ deref *counter
                  swap! *counter inc
                  []
                    :: :vertex
                      &v+ base $ v-scale p0 radius
                      , idx
                    :: :vertex
                      &v+ base $ v-scale p1 radius
                      , idx
                    :: :vertex
                      &v+ base $ v-scale p2 radius
                      , idx
                let
                    p01 $ pick-radian-middle p0 p1
                    p02 $ pick-radian-middle p0 p2
                    p12 $ pick-radian-middle p1 p2
                  []
                    build-sphere-triangles base radius (dec depth) *counter p0 p01 p02
                    build-sphere-triangles base radius (dec depth) *counter p1 p01 p12
                    build-sphere-triangles base radius (dec depth) *counter p2 p02 p12
                    build-sphere-triangles base radius (dec depth) *counter p01 p12 p02
        |comp-sphere $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-sphere (options)
              let
                  base $ either (&map:get options :position) (v3 0 0 0)
                  radius $ either (&map:get options :radius) 40
                  iteration $ either (&map:get options :iteration) 2
                  color $ either (&map:get options :color) ([] 0.6 0.8 0.76)
                  *counter $ atom 0
                object $ {}
                  :shader $ either (&map:get options :shader) wgsl-sphere
                  :topology $ either (&map:get options :topology) :triangle-list
                  :attrs-list $ [] (:: :float32x3 :position) (:: :uint32 :idx)
                  :data $ -> unit-triangles
                    map $ fn (xs)
                      build-sphere-triangles base radius iteration *counter (nth xs 0) (nth xs 1) (nth xs 2)
                  :get-params $ fn () (js-array & color 1)
        |pick-radian-middle $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn pick-radian-middle (p0 p1)
              let
                  p-mid $ v-scale (&v+ p0 p1) 0.5
                  l $ v-length p-mid
                  ratio $ &/ 1 l
                  p-mid-unit $ v-scale p-mid ratio
                , p-mid-unit
        |unit-triangles $ %{} :CodeEntry (:doc |)
          :code $ quote
            def unit-triangles $ []
              [] (v3 1 0 0) (v3 0 1 0) (v3 0 0 1)
              [] (v3 1 0 0) (v3 0 1 0) (v3 0 0 -1)
              [] (v3 1 0 0) (v3 0 -1 0) (v3 0 0 1)
              [] (v3 1 0 0) (v3 0 -1 0) (v3 0 0 -1)
              [] (v3 -1 0 0) (v3 0 1 0) (v3 0 0 1)
              [] (v3 -1 0 0) (v3 0 1 0) (v3 0 0 -1)
              [] (v3 -1 0 0) (v3 0 -1 0) (v3 0 0 1)
              [] (v3 -1 0 0) (v3 0 -1 0) (v3 0 0 -1)
        |wgsl-sphere $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-sphere $ inline-shader "\"sphere"
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.comp.sphere $ :require
            lagopus.config :refer $ inline-shader
            lagopus.alias :refer $ object
            quaternion.vector :refer $ &v+ v-cross v-scale v-dot &v- v-length v3
    |lagopus.comp.spots $ %{} :FileEntry
      :defs $ {}
        |comp-bubbles $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-bubbles (options)
              let
                  bubbles $ either (&map:get options :bubbles)
                    [] $ [] 0 0 0 100
                object $ {} (:shader wgsl-bubbles) (:topology :line-list)
                  :attrs-list $ [] (:: :float32x3 :position) (:: :float32x2 :arm) (:: :float32 :radian)
                  :data $ -> bubbles
                    map $ fn (info)
                      let
                          position $ take info 3
                          radius $ nth info 3
                          size $ + 20
                            * 8 $ sqrt radius
                          step $ &/ (* 2 &PI) size
                        -> (range size)
                          map $ fn (idx)
                            []
                              let
                                  radian $ * step idx
                                {} (:position position) (:radian radian)
                                  :arm $ []
                                    * radius $ cos radian
                                    * radius $ sin radian
                              let
                                  radian $ * step (inc idx)
                                {} (:position position) (:radian radian)
                                  :arm $ []
                                    * radius $ cos radian
                                    * radius $ sin radian
        |comp-spots $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-spots (options)
              let
                  points $ either (&map:get options :points) ([])
                  color $ either (&map:get options :color) ([] 0.8 0.8 1)
                  radius $ either (&map:get options :radius) 12
                  shift $ either (&map:get options :shift) 40
                  vertex-count $ &max 3
                    either (&map:get options :vertex-count) 8
                object $ {}
                  :shader $ either (&map:get options :shader) wgsl-spots
                  :topology $ either (&map:get options :topology) :triangle-list
                  :attrs-list $ [] (:: :float32x3 :base) (:: :float32x3 :color) (:: :float32 :radius) (:: :uint32 :vertex-count) (:: :uint32 :angle-idx) (:: :float32 :shift) (:: :uint32 :spot-idx)
                  :data $ -> points
                    map-indexed $ fn (spot-idx base)
                      ->
                        range $ - vertex-count 2
                        map $ fn (angle-idx)
                          [] (:: :vertex base color radius vertex-count 0 shift spot-idx)
                            :: :vertex base color radius vertex-count (+ 1 angle-idx) shift spot-idx
                            :: :vertex base color radius vertex-count (+ 2 angle-idx) shift spot-idx
        |wgsl-bubbles $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-bubbles $ inline-shader "\"bubbles"
        |wgsl-spots $ %{} :CodeEntry (:doc |)
          :code $ quote
            def wgsl-spots $ inline-shader "\"spots"
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.comp.spots $ :require
            lagopus.config :refer $ inline-shader
            lagopus.alias :refer $ object
            quaternion.vector :refer $ &v+ v+ v-cross v-scale v-dot &v- v3
            quaternion.complex :refer $ complex
    |lagopus.comp.stitch $ %{} :FileEntry
      :defs $ {}
        |comp-stitch $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn comp-stitch (props)
              let
                  chars $ either (:chars props) ([] 0x1111)
                  position $ either (:position props) (v3 0 0 0)
                  size $ either (:size props) 24
                  gap 4
                  s0 $ * 0.1 size
                group ({})
                  object $ {} (:topology :triangle-list)
                    :shader $ inline-shader "\"stitch-bg"
                    :attrs-list $ [] (:: :float32x3 :base) (:: :float32x3 :position)
                    :data $ map-indexed chars
                      fn (idx c)
                        ->
                          [] (v3 0 0 0) (v3 1 0 0) (v3 1 -1 0) (v3 0 0 0) (v3 1 -1 0) (v3 0 -1 0)
                          map $ fn (x)
                            {} (:base position)
                              :position $ &v+ (v-scale x size)
                                v-scale
                                  v3 (+ size gap) 0 0
                                  , idx
                    :hit-region $ :hit-region props
                  object $ {} (:topology :triangle-list)
                    :shader $ inline-shader "\"stitch-line"
                    :attrs-list $ [] (:: :float32x3 :base) (:: :float32x3 :position) (:: :uint32 :value)
                    :data $ map-indexed chars
                      fn (idx c)
                        let
                            pattern $ .!padStart
                              .!slice (&number:display-by c 2) 2
                              , 32 "\"0"
                          -> stitch-strokes $ map
                            fn (info)
                              let
                                  x $ :position info
                                  data-idx $ :data info
                                {} (:base position)
                                  :position $ &v+ (v-scale x s0)
                                    v-scale
                                      v3 (+ size gap) 0 0
                                      , idx
                                  :value $ if
                                    = "\"1" $ get pattern data-idx
                                    , 1 0
        |stitch-strokes $ %{} :CodeEntry (:doc |)
          :code $ quote
            def stitch-strokes $ let
                shift 0.2
              -> (range 4)
                mapcat $ fn (i)
                  -> (range 4)
                    mapcat $ fn (j)
                      let
                          base $ v3
                            + 1 $ * j 2
                            - (* i -2) 1
                            , shift
                          base-bottom-right $ &v+ base (v3 2 -2 0)
                          base-top-right $ &v+ base (v3 2 0 0)
                          base-bottom-left $ &v+ base (v3 0 -2 0)
                          base-idx $ * 2
                            + (* i 4) j
                          base-idx-next $ inc base-idx
                        []
                          {}
                            :position $ &v+ base (v3 -0.2 0.2 0)
                            :data base-idx
                          {}
                            :position $ &v+ base (v3 0.2 0.2 0)
                            :data base-idx
                          {}
                            :position $ &v+ base (v3 -0.2 -0.2 0)
                            :data base-idx
                          {}
                            :position $ &v+ base (v3 0.2 0.2 0)
                            :data base-idx
                          {}
                            :position $ &v+ base (v3 -0.2 -0.2 0)
                            :data base-idx
                          {}
                            :position $ &v+ base-bottom-right (v3 0.2 0.2 0)
                            :data base-idx
                          {}
                            :position $ &v+ base (v3 -0.2 -0.2 0)
                            :data base-idx
                          {}
                            :position $ &v+ base-bottom-right (v3 0.2 0.2 0)
                            :data base-idx
                          {}
                            :position $ &v+ base-bottom-right (v3 -0.2 -0.2 0)
                            :data base-idx
                          {}
                            :position $ &v+ base-bottom-right (v3 0.2 0.2 0)
                            :data base-idx
                          {}
                            :position $ &v+ base-bottom-right (v3 -0.2 -0.2 0)
                            :data base-idx
                          {}
                            :position $ &v+ base-bottom-right (v3 0.2 -0.2 0)
                            :data base-idx
                          ; "\"next stroke"
                          {}
                            :position $ &v+ base-top-right (v3 -0.2 0.2 0)
                            :data base-idx-next
                          {}
                            :position $ &v+ base-top-right (v3 0.2 -0.2 0)
                            :data base-idx-next
                          {}
                            :position $ &v+ base-top-right (v3 0.2 0.2 0)
                            :data base-idx-next
                          {}
                            :position $ &v+ base-top-right (v3 -0.2 0.2 0)
                            :data base-idx-next
                          {}
                            :position $ &v+ base-top-right (v3 0.2 -0.2 0)
                            :data base-idx-next
                          {}
                            :position $ &v+ base-bottom-left (v3 -0.2 0.2 0)
                            :data base-idx-next
                          {}
                            :position $ &v+ base-top-right (v3 0.2 -0.2 0)
                            :data base-idx-next
                          {}
                            :position $ &v+ base-bottom-left (v3 0.2 -0.2 0)
                            :data base-idx-next
                          {}
                            :position $ &v+ base-bottom-left (v3 -0.2 0.2 0)
                            :data base-idx-next
                          {}
                            :position $ &v+ base-bottom-left (v3 0.2 -0.2 0)
                            :data base-idx-next
                          {}
                            :position $ &v+ base-bottom-left (v3 -0.2 0.2 0)
                            :data base-idx-next
                          {}
                            :position $ &v+ base-bottom-left (v3 -0.2 -0.2 0)
                            :data base-idx-next
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.comp.stitch $ :require
            lagopus.config :refer $ inline-shader
            lagopus.alias :refer $ group object
            quaternion.vector :refer $ &v+ v-cross v-scale v-dot &v- v3
    |lagopus.config $ %{} :FileEntry
      :defs $ {}
        |bg-color $ %{} :CodeEntry (:doc |)
          :code $ quote
            def bg-color $ let
                bg $ get-env "\"bg-color" "\""
              if (.blank? bg) nil $ let
                  items $ -> (.split bg "\",")
                    map $ fn (piece) (js/parseFloat piece)
                :: :rgba (nth items 0) (nth items 1) (nth items 2)
                  either (nth items 3) 1
        |bloom? $ %{} :CodeEntry (:doc |)
          :code $ quote
            def bloom? $ = "\"true" (get-env "\"bloom" "\"false")
        |dev? $ %{} :CodeEntry (:doc |)
          :code $ quote
            def dev? $ &= "\"dev" (get-env "\"mode" "\"release")
        |inline-shader $ %{} :CodeEntry (:doc |)
          :code $ quote
            defmacro inline-shader (name)
              let
                  shader $ if (blank? calcit-dirname) (str "\"shaders/" name "\".wgsl")
                    let
                        dir $ if (.ends-with? calcit-dirname "\"/") calcit-dirname (str calcit-dirname "\"/")
                      str dir "\"shaders/" name "\".wgsl"
                println "\"inline:" shader
                read-file shader
        |mobile-info $ %{} :CodeEntry (:doc |)
          :code $ quote
            def mobile-info $ ismobile js/window.navigator
        |remote-control? $ %{} :CodeEntry (:doc |)
          :code $ quote
            def remote-control? $ get-env "\"remote-control" nil
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.config $ :require
            lagopus.$meta :refer $ calcit-dirname
            "\"ismobilejs" :default ismobile
    |lagopus.cursor $ %{} :FileEntry
      :defs $ {}
        |>> $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn >> (states k)
              let
                  parent-cursor $ either (:cursor states) ([])
                  branch $ either (get states k) ({})
                assoc branch :cursor $ conj parent-cursor k
        |update-states $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn update-states (store cursor new-state)
              assoc-in store ([] :states & cursor :data) new-state
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote (ns lagopus.cursor)
    |lagopus.main $ %{} :FileEntry
      :defs $ {}
        |*global-textures $ %{} :CodeEntry (:doc "|track textures with a hashmap, this is global states passing to container")
          :code $ quote
            defatom *global-textures $ {}
        |*store $ %{} :CodeEntry (:doc |)
          :code $ quote
            defatom *store $ {}
              :states $ {}
              :tab :axis
        |canvas $ %{} :CodeEntry (:doc |)
          :code $ quote
            def canvas $ js/document.querySelector "\"canvas"
        |dispatch! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn dispatch! (op)
              if dev? $ js/console.log op
              let
                  store @*store
                  next-store $ tag-match op
                      :state c s
                      update-states store c s
                    (:tab t) (assoc store :tab t)
                if (not= next-store store) (reset! *store next-store)
        |load-images! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn load-images! (gpu-device *textures) (hint-fn async)
              let
                  response $ js-await (js/fetch "\"https://cdn.tiye.me/logo/tiye.jpg")
                  bitmap $ js-await
                    js/createImageBitmap $ js-await (.!blob response)
                  texture $ createTextureFromSource gpu-device
                    js-object (:source bitmap)
                      :w $ .-width bitmap
                      :h $ .-height bitmap
                swap! *textures assoc :tiye texture
        |main! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn main! () (hint-fn async)
              if
                and bloom? $ not (.-any mobile-info)
                enableBloom
              if dev? $ load-console-formatter!
              let
                  context $ js-await (initializeContext)
                js-await $ load-images! (.-device context) *global-textures
              initializeCanvasTextures
              reset-clear-color! $ either bg-color (:: :rgba 0.18 0.2 0.36 1)
              render-app!
              renderControl
              startControlLoop 10 onControlEvent
              registerShaderResult handle-compilation
              set! js/window.onresize $ fn (e) (resetCanvasSize canvas) (initializeCanvasTextures) (paintLagopusTree)
              resetCanvasSize canvas
              add-watch *store :change $ fn (next store) (render-app!)
              setupMouseEvents canvas
              loadGamepadControl
              paintLagopusTree
              if remote-control? $ setupRemoteControl
        |reload! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reload! () $ if (nil? build-errors)
              do (reset-memof1-caches!) (render-app!) (remove-watch *store :change)
                add-watch *store :change $ fn (next store) (render-app!)
                println "\"Reloaded."
                hud! "\"ok~" "\"OK"
              hud! "\"error" build-errors
        |render-app! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn render-app! () $ let
                tree $ comp-container @*store @*global-textures
              renderLagopusTree tree dispatch!
              paintLagopusTree
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.main $ :require
            lagopus.comp.container :refer $ comp-container
            "\"@triadica/lagopus" :refer $ setupMouseEvents onControlEvent paintLagopusTree renderLagopusTree initializeContext resetCanvasSize initializeCanvasTextures registerShaderResult enableBloom loadGamepadControl createTextureFromSource
            "\"@triadica/touch-control" :refer $ renderControl startControlLoop
            lagopus.config :refer $ dev? mobile-info bloom? bg-color remote-control?
            lagopus.util :refer $ handle-compilation reset-clear-color!
            "\"bottom-tip" :default hud!
            "\"./calcit.build-errors" :default build-errors
            memof.once :refer $ reset-memof1-caches!
            lagopus.cursor :refer $ update-states
            "\"@triadica/lagopus/lib/remote-control.mjs" :refer $ setupRemoteControl
    |lagopus.math $ %{} :FileEntry
      :defs $ {}
        |fibo-grid-n $ %{} :CodeEntry (:doc |)
          :code $ quote
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
                v3 x y z
        |fibo-grid-range $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn fibo-grid-range (total)
              -> (range total)
                map $ fn (n)
                  fibo-grid-n (inc n) total
        |phi $ %{} :CodeEntry (:doc |)
          :code $ quote
            def phi $ * 0.5
              dec $ sqrt 5
        |rotate-3d $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn rotate-3d (origin axis-0 angle p)
              let
                  cos-d $ js/Math.cos angle
                  sin-d $ js/Math.sin angle
                  p-v $ &v- p origin
                  h $ v-dot axis-0 p-v
                  h-v $ v-scale axis-0 h
                  flat-p-v $ &v- p-v h-v
                  rot-direction $ v-normalize (v-cross flat-p-v axis-0)
                  rot-v $ v-scale rot-direction (v-length flat-p-v)
                v+ origin h-v (v-scale flat-p-v cos-d) (v-scale rot-v sin-d)
        |rotate-3d-fn $ %{} :CodeEntry (:doc |)
          :code $ quote
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
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.math $ :require
            quaternion.vector :refer $ v-dot v-normalize &v- v-scale v-cross v+ &v+ v-length v3
    |lagopus.util $ %{} :FileEntry
      :defs $ {}
        |handle-compilation $ %{} :CodeEntry (:doc |)
          :code $ quote
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
        |reset-clear-color! $ %{} :CodeEntry (:doc |)
          :code $ quote
            defn reset-clear-color! (color)
              .!reset atomClearColor $ if (tuple? color)
                tag-match color
                    :rgba r g b a
                    js-object (:r r) (:g g) (:b b) (:a a)
                  _ $ raise (str "\"unknown color: " color)
                to-js-data color
      :ns $ %{} :CodeEntry (:doc |)
        :code $ quote
          ns lagopus.util $ :require ("\"bottom-tip" :default hud!)
            "\"@triadica/lagopus/lib/global" :refer $ atomClearColor
