
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |lagopus
  :entries $ {} $ :default
    {} (:description |) (:init-fn 'lagopus.main/main!) (:mode :js) (:reload-fn 'lagopus.main/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |memof/ |quaternion/
      :type-slots $ {}
  :files $ {}
    'lagopus.alias $ %{} 'FileEntry
      :defs $ {}
        'NumberArray $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait NumberArray
            .push $ :: 'Fn $ {}
              :args $ [] 'NumberArray 'Number
              :return 'Number
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'NumberBuffer $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait NumberBuffer (:length 'Number)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'buffer-format $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn buffer-format (format)
            case-default format
              if (string? format) (assert-type format 'String)
                do (eprintln "|Unknown format" format) |float32
              :float32 |float32
              :float32x2 |float32x2
              :float32x3 |float32x3
              :float32x4 |float32x4
              :uint32 |uint32
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'Dynamic
        'collect-array! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn collect-array! (indices collect!)
            if (list? indices)
              &doseq
                x $ assert-type indices $ :: 'List 'Dynamic
                collect-array! x collect!
              collect! $ assert-type indices 'Number
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] 'Number
        'collect-from-records! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn collect-from-records! (data field idx write!)
            cond
                list? data
                &doseq
                  x $ assert-type data $ :: 'List 'Dynamic
                  collect-from-records! x field idx write!
              (enum? data)
                let
                    tag $ .unwrap $ nth data 0
                    xs $ .unwrap $ nth data (inc idx)
                  if (not= :vertex tag) (eprintln "|expected :vertex tag" data)
                  write-attribute! xs write!
              (map? data)
                let
                    row $ assert-type data $ :: 'Map 'Tag 'Dynamic
                  write-attribute!
                    .unwrap $ get row field
                    , write!
              true $ raise "|unknown data"
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic 'Tag 'Number $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] 'Number
        'count-recursive $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn count-recursive (xs)
            if (list? xs)
              reduce
                assert-type xs $ :: 'List 'Dynamic
                , 0 $ fn (acc y)
                  hint-fn $ {}
                    :args $ [] 'Number 'Dynamic
                    :return 'Number
                  + acc $ count-recursive y
              , 1
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Dynamic
        'create-object! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn create-object! (options attrs-list vertices-size buffers)
            let
                create! $ unsafe-coerce createRenderer $ :: 'Fn
                  {}
                    :args $ [] 'JsObject
                    :return 'JsObject
                index-buffer! $ unsafe-coerce u32buffer $ :: 'Fn
                  {}
                    :args $ [] 'JsObject
                    :return 'JsObject
                indices $ &map:get options :indices
                textures $ either (&map:get options :textures) ([])
              create! $ js-object
                :shader $ inject-shader-snippets $ assert-type (&map:get options :shader) 'String
                :topology $ turn-string $ &map:get options :topology
                :attrsList $ to-js-data attrs-list
                :verticesLength vertices-size
                :vertices buffers
                :hitRegion nil
                :indices $ if (nil? indices) nil $ let
                    arr $ unsafe-coerce (js-array) NumberArray
                    collect! $ fn (x)
                      hint-fn $ {}
                        :args $ [] 'Number
                        :return 'Unit
                        :features $ #{} :js-ffi
                      arr .push x
                      , &unit
                  collect-array! indices collect!
                  index-buffer! $ unsafe-coerce arr 'JsObject
                :getParams $ &map:get options :get-params
                :textures $ js-array & $ assert-type textures (:: 'List 'lagopus.gpu/Texture)
                :label $ &map:get options :label
                :computeOptions $ &map:get options :compute-options
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] (:: 'Map 'Tag 'Dynamic)
              :: 'List $ :: 'Map 'Tag 'Dynamic
              , 'Number 'JsObject
            :features $ #{} :js-ffi
        'expand-attr $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn expand-attr (x)
            if (enum? x)
              {}
                :field $ .unwrap $ nth x 1
                :format $ .unwrap $ nth x 0
              assert-type x $ :: 'Map 'Tag 'Dynamic
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Dynamic
            :return $ :: 'Map 'Tag 'Dynamic
        'group $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn group (a & children)
            if
              not $ or (nil? a)
                = a $ {}
              eprintln "|group options is not used at current" a
            let
                make-group $ unsafe-coerce lagopus/group $ :: 'Fn
                  {}
                    :args $ [] 'Nil
                    :rest 'JsObject
                    :return 'JsObject
              make-group nil & children
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:rest 'JsObject) (:return 'JsObject)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
        'inject-shader-snippets $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn inject-shader-snippets (code)
            -> code (browser/replace-first "|#import lagopus::simplex" wgsl-simplex) (browser/replace-first "|#import lagopus::perspective" wgsl-perspective) (browser/replace-first "|#import lagopus::colors" wgsl-colors) (browser/replace-first "|#import lagopus::rand" wgsl-rand) (browser/replace-first "|#import lagopus::rotation" wgsl-rotation) (browser/replace-first "|#import lagopus::hsluv" wgsl-hsluv)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String
        'make-empty-js-arrays $ %{} 'CodeEntry
          :doc "|create nested array of js, as placeholder for attributes data"
          :code $ quote $ defn make-empty-js-arrays (n)
            js-array & $ map (range n)
              fn (_idx)
                hint-fn $ {}
                  :args $ [] 'Number
                  :return 'JsObject
                  :features $ #{} :js-ffi
                js-array
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'Number
            :features $ #{} :js-ffi
        'object $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn object (options)
            let
                attrs-list $ map
                  assert-type (&map:get options :attrs-list) (:: 'List 'Dynamic)
                  , expand-attr
                data $ &map:get options :data
                vertices-size $ count-recursive data
                make-buffer! $ unsafe-coerce newBufferFormatLength $ :: 'Fn
                  {}
                    :args $ [] 'String 'Number
                    :return 'lagopus.alias/NumberBuffer
                buffers $ js-array & $ map-indexed attrs-list
                  fn (idx attr)
                    hint-fn $ {}
                      :args $ [] 'Number $ :: 'Map 'Tag 'Dynamic
                      :return 'lagopus.alias/NumberBuffer
                      :features $ #{} :js-ffi
                    let
                        buffer $ make-buffer!
                          buffer-format $ &map:get attr :format
                          , vertices-size
                        *offset $ atom 0
                        field $ assert-type (&map:get attr :field) 'Tag
                        write! $ fn (x)
                          hint-fn $ {}
                            :args $ [] 'Number
                            :return 'Unit
                            :features $ #{} :js-ffi
                          aset buffer @*offset x
                          swap! *offset inc
                      collect-from-records! data field idx write!
                      if
                        not= @*offset $ .-length buffer
                        eprintln "|buffer size guessed incorrectly"
                      , buffer
              create-object! options attrs-list vertices-size buffers
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'object-writer $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn object-writer (options)
            let
                attrs-list $ map
                  assert-type (&map:get options :attrs-list) (:: 'List 'Dynamic)
                  , expand-attr
                writer $ assert-type (&map:get options :writer)
                  :: 'Fn $ {}
                    :args $ [] $ :: 'Fn
                      {}
                        :args $ [] $ :: 'List 'Enum
                        :return 'Unit
                    :return 'Unit
                bundles $ make-empty-js-arrays $ count attrs-list
                *counter $ atom 0
                collect! $ fn (chunk)
                  hint-fn $ {}
                    :args $ [] $ :: 'List 'Enum
                    :return 'Unit
                    :features $ #{} :js-ffi
                  &doseq (record chunk) (swap! *counter inc)
                    let
                        *index $ atom 0
                      &doseq (attr attrs-list)
                        let
                            idx @*index
                            arr $ unsafe-coerce (aget bundles idx) NumberArray
                            data $ .unwrap $ nth record (inc idx)
                            write! $ fn (value)
                              hint-fn $ {}
                                :args $ [] 'Number
                                :return 'Unit
                                :features $ #{} :js-ffi
                              arr .push value
                              , &unit
                          if
                            not= :vertex $ .unwrap $ nth record 0
                            eprintln "|expected :vertex tag" record
                          write-attribute! data write!
                        swap! *index inc
                  , &unit
                make-buffer! $ unsafe-coerce newBufferFormatArray $ :: 'Fn
                  {}
                    :args $ [] 'String 'JsObject
                    :return 'JsObject
              writer collect!
              let
                  buffers $ js-array & $ map-indexed attrs-list
                    fn (idx attr)
                      hint-fn $ {}
                        :args $ [] 'Number $ :: 'Map 'Tag 'Dynamic
                        :return 'JsObject
                        :features $ #{} :js-ffi
                      make-buffer!
                        buffer-format $ &map:get attr :format
                        unsafe-coerce (aget bundles idx) 'JsObject
                create-object! options attrs-list @*counter buffers
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'wgsl-colors $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-colors (inline-shader |lagopus-colors)
          :examples $ []
          :schema $ :: 'Dynamic
        'wgsl-hsluv $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-hsluv (inline-shader |lagopus-hsluv)
          :examples $ []
          :schema $ :: 'Dynamic
        'wgsl-perspective $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-perspective (inline-shader |lagopus-perspective)
          :examples $ []
          :schema $ :: 'Dynamic
        'wgsl-rand $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-rand (inline-shader |lagopus-rand)
          :examples $ []
          :schema $ :: 'Dynamic
        'wgsl-rotation $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-rotation (inline-shader |lagopus-rotation)
          :examples $ []
          :schema $ :: 'Dynamic
        'wgsl-simplex $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-simplex (inline-shader |lagopus-simplex)
          :examples $ []
          :schema $ :: 'Dynamic
        'write-attribute! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn write-attribute! (xs write!)
            cond
                enum? xs
                match (assert-type xs 'Enum)
                  (:v3 x y z)
                    do
                      write! $ assert-type x 'Number
                      write! $ assert-type y 'Number
                      write! $ assert-type z 'Number
              (list? xs)
                &doseq
                  x $ assert-type xs $ :: 'List 'Dynamic
                  write! $ assert-type x 'Number
              true $ write! $ assert-type xs 'Number
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] 'Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.alias
          :require
            |@triadica/lagopus :refer $ createRenderer u32buffer newBufferFormatLength newBufferFormatArray
            |@triadica/lagopus :as lagopus
            lagopus.config :refer $ inline-shader
            lagopus.browser :as browser
            lagopus.gpu :refer $ Texture
    'lagopus.browser $ %{} 'FileEntry
      :defs $ {}
        'Canvas $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait Canvas (:width 'Number) (:height 'Number)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'Document $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait Document
            .query-selector $ :: 'Fn $ {}
              :args $ [] 'Document 'String
              :return $ :: 'JsNullish 'Canvas
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'MobileInfo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait MobileInfo (:any 'Bool)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'TextHost $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait TextHost
            .replace $ :: 'Fn $ {}
              :args $ [] 'TextHost 'String 'String
              :return 'String
            .slice $ :: 'Fn $ {}
              :args $ [] 'TextHost 'Number
              :return 'String
            .pad-start $ :: 'Fn $ {}
              :args $ [] 'TextHost 'Number 'String
              :return 'String
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'Window $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait Window
            :onresize $ :: 'Fn $ {}
              :args $ [] 'JsObject
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
            :writable $ #{} :onresize
          :schema $ :: 'Trait
        'atan2 $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn atan2 (y x)
            let
                invoke $ unsafe-coerce js/Math.atan2 $ :: 'Fn
                  {}
                    :args $ [] 'Number 'Number
                    :return 'Number
              invoke y x
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number 'Number
            :features $ #{} :js-ffi
        'parse-color-channel $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn parse-color-channel (text)
            let
                parse $ unsafe-coerce js/parseFloat $ :: 'Fn
                  {}
                    :args $ [] 'String
                    :return 'Number
              parse text
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'String
            :features $ #{} :js-ffi
        'query-canvas! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn query-canvas! ()
            let
                document-host $ unsafe-coerce js/document Document
                canvas $ document-host .query-selector |canvas
              if (js-nullish? canvas) (raise "|Missing canvas element") canvas
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'lagopus.browser/Canvas)
            :args $ []
            :features $ #{} :js-ffi
        'rand $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rand (n)
            let
                random! $ unsafe-coerce js/Math.random $ :: 'Fn
                  {}
                    :args $ []
                    :return 'Number
              * (random!) n
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number
            :features $ #{} :js-ffi
        'rand-shift $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rand-shift (n dn)
            let
                random! $ unsafe-coerce js/Math.random $ :: 'Fn
                  {}
                    :args $ []
                    :return 'Number
              + (- n dn)
                * 2 dn $ random!
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number 'Number
            :features $ #{} :js-ffi
        'read-mobile-info! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn read-mobile-info! ()
            let
                detect $ unsafe-coerce ismobile $ :: 'Fn
                  {}
                    :args $ [] 'JsObject
                    :return MobileInfo
              detect $ unsafe-coerce js/window.navigator 'JsObject
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'lagopus.browser/MobileInfo)
            :args $ []
            :features $ #{} :js-ffi
        'replace-first $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn replace-first (text pattern replacement)
            let
                host $ unsafe-coerce text TextHost
              host .replace pattern replacement
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String 'String 'String
            :features $ #{} :js-ffi
        'set-resize-handler! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn set-resize-handler! (handler)
            let
                window-host $ unsafe-coerce js/window Window
              js-set window-host :onresize handler
              , &unit
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] 'JsObject
            :features $ #{} :js-ffi
        'stitch-pattern $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn stitch-pattern (value)
            let
                binary $ unsafe-coerce (&number:display-by value 2) TextHost
                digits $ unsafe-coerce (binary .slice 2) TextHost
              digits .pad-start 32 |0
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'Number
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.browser
          :require $ |ismobilejs :default ismobile
    'lagopus.comp.button $ %{} 'FileEntry
      :defs $ {}
        'Motion $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait Motion
            .at $ :: 'Fn $ {}
              :args $ [] 'Motion 'Number
              :return $ :: 'JsNullish 'Number
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'comp-button $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-button (props on-click)
            let
                position $ v3-js $ assert-type (&map:get props :position) 'quaternion.vector/V3
                host-props $ unsafe-coerce
                  to-js-data $ assoc props :position position
                  , 'JsObject
                create! $ unsafe-coerce compButton $ :: 'Fn
                  {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'JsObject $ :: 'Fn
                          {}
                            :args $ [] 'Enum
                            :return 'Unit
                        :return 'Unit
                    :return 'JsObject
              create! host-props on-click
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] (:: 'Map 'Tag 'Dynamic)
              :: 'Fn $ {} (:return 'Unit)
                :args $ [] 'JsObject $ :: 'Fn
                  {} (:return 'Unit)
                    :args $ [] 'Enum
            :features $ #{} :js-ffi
        'comp-drag-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-drag-point (props on-drag)
            let
                color $ &map:get props :color
                position $ &map:get props :position
                create! $ unsafe-coerce compDragPoint $ :: 'Fn
                  {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'lagopus.comp.button/Motion $ :: 'Fn
                          {}
                            :args $ [] 'Enum
                            :return 'Unit
                        :return 'Unit
                    :return 'JsObject
                host-props $ js-object
                  :color $ to-js-data color
                  :position $ if (enum? position)
                    v3-js $ assert-type position 'quaternion.vector/V3
                    if (list? position) (to-js-data position)
                      do (eprintln "|unknown position" position) (js-array 10 0 0)
              create! host-props $ fn (move d!)
                hint-fn $ {}
                  :args $ [] 'lagopus.comp.button/Motion $ :: 'Fn
                    {}
                      :args $ [] 'Enum
                      :return 'Unit
                  :return 'Unit
                  :features $ #{} :js-ffi
                on-drag
                  v3
                    .unwrap $ js-nullish->option $ move .at 0
                    .unwrap $ js-nullish->option $ move .at 1
                    .unwrap $ js-nullish->option $ move .at 2
                  , d!
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] (:: 'Map 'Tag 'Dynamic)
              :: 'Fn $ {} (:return 'Unit)
                :args $ [] 'quaternion.vector/V3 $ :: 'Fn
                  {} (:return 'Unit)
                    :args $ [] 'Enum
            :features $ #{} :js-ffi
        'comp-flat-button $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-flat-button (props on-click)
            let
                position $ v3-js $ assert-type (&map:get props :position) 'quaternion.vector/V3
                host-props $ unsafe-coerce
                  to-js-data $ assoc props :position position
                  , 'JsObject
                create! $ unsafe-coerce compFlatButton $ :: 'Fn
                  {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'JsObject $ :: 'Fn
                          {}
                            :args $ [] 'Enum
                            :return 'Unit
                        :return 'Unit
                    :return 'JsObject
              create! host-props on-click
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] (:: 'Map 'Tag 'Dynamic)
              :: 'Fn $ {} (:return 'Unit)
                :args $ [] 'JsObject $ :: 'Fn
                  {} (:return 'Unit)
                    :args $ [] 'Enum
            :features $ #{} :js-ffi
        'comp-slider $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-slider (props on-slide)
            let
                create! $ unsafe-coerce compSlider $ :: 'Fn
                  {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'lagopus.comp.button/Motion $ :: 'Fn
                          {}
                            :args $ [] 'Enum
                            :return 'Unit
                        :return 'Unit
                    :return 'JsObject
              create!
                unsafe-coerce (to-js-data props) 'JsObject
                fn (move d!)
                  hint-fn $ {}
                    :args $ [] 'lagopus.comp.button/Motion $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                    :features $ #{} :js-ffi
                  on-slide
                    complex
                      .unwrap $ js-nullish->option $ move .at 0
                      .unwrap $ js-nullish->option $ move .at 1
                    , d!
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] (:: 'Map 'Tag 'Dynamic)
              :: 'Fn $ {} (:return 'Unit)
                :args $ [] 'quaternion.complex/Complex $ :: 'Fn
                  {} (:return 'Unit)
                    :args $ [] 'Enum
            :features $ #{} :js-ffi
        'v3-js $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn v3-js (position)
            match position $
              :v3 x y z
              js-array x y z
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] 'quaternion.vector/V3
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.comp.button
          :require
            |@triadica/lagopus :refer $ compButton compSlider compDragPoint
            |@triadica/lagopus/lib/comp/button.mjs :refer $ compFlatButton
            quaternion.vector :refer $ v3
            quaternion.complex :refer $ complex
    'lagopus.comp.container $ %{} 'FileEntry
      :defs $ {}
        'city-wgsl $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def city-wgsl (inline-shader |city)
          :examples $ []
        'color-default $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def color-default ([] 1 0 0 1)
          :examples $ []
          :schema $ :: 'Dynamic
        'comp-bubbles-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-bubbles-demo ()
            let
                area 2000
              comp-bubbles $ {} $ :bubbles
                -> (range 600)
                  map $ fn (idx)
                    [] (rand-shift 0 area) (rand-shift 0 area) (rand-shift 0 area)
                      + 6 $ rand 120
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ []
        'comp-city $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-city ()
            object $ {} (:shader city-wgsl)
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
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ []
        'comp-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-container (store textures-dict)
            let
                cursor $ []
                states $ assert-type (&map:get store :states) (:: 'Map 'Tag 'Dynamic)
              group nil (memof1-call comp-tabs)
                case-default (&map:get store :tab) (group nil)
                  :axis $ comp-axis $ %some
                    {} (:n 20) (:unit 20)
                  :mountains $ memof1-call comp-mountains
                  :city $ memof1-call comp-city
                  :bends $ group nil
                  :cube $ comp-cube $ {}
                    :position $ v3 40 0 0
                    :radius 40
                  :ribbon $ comp-ribbon
                  :necklace $ comp-necklace
                  :sphere $ comp-sphere $ {} (; :topology :line-strip) (:iteration 4) (:radius 160)
                    :color $ [] 0.6 0.9 0.7
                  :plate $ comp-plate $ {} (; :topology :line-strip) (:iteration 20) (:radius 160)
                    :color $ [] 0.04 0.8 0.6
                    :transformer $ fn (i)
                      hint-fn $ {}
                        :args $ [] 'quaternion.vector/V3
                        :return 'quaternion.vector/V3
                      v+ i $ v3 0 0 -10
                    ; :x-direction $ v3 1 0 0
                    ; :y-direction $ v3 0 1 0
                    :chromatism 0.14
                  :control $ comp-control-demo $ >> states :control
                  :stitch $ comp-stitch-demo
                  :bubbles $ comp-bubbles-demo
                  :triangles $ comp-triangles-demo
                  :image $ comp-image-demo textures-dict
                  :kaleidoscope $ comp-kaleidoscope textures-dict
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] (:: 'Map 'Tag 'Dynamic) (:: 'Map 'Tag 'lagopus.gpu/Texture)
        'comp-control-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-control-demo (states)
            let
                cursor $ assert-type (&map:get states :cursor) (:: 'List 'Tag)
                state $ assert-type
                  either (&map:get states :data)
                    {} $ :pos $ [] 60 0 0
                  :: 'Map 'Tag 'Dynamic
              group nil
                comp-slider
                  {} $ :position $ [] 0 0 0
                  fn (change _dispatch!)
                    hint-fn $ {}
                      :args $ [] 'quaternion.complex/Complex $ :: 'Fn
                        {}
                          :args $ [] 'Enum
                          :return 'Unit
                      :return 'Unit
                    println |Slide change
                comp-drag-point
                  {}
                    :position $ &map:get state :pos
                    :color $ [] 0.6 0.6 1.0 1.0
                  fn (move d!)
                    hint-fn $ {}
                      :args $ [] 'quaternion.vector/V3 $ :: 'Fn
                        {}
                          :args $ [] 'Enum
                          :return 'Unit
                      :return 'Unit
                    d! $ :: :state cursor $ assoc state :pos move
                comp-flat-button
                  {}
                    :position $ v3 100 20 0
                    :color $ [] 0.9 0.4 0.5 1
                    :size 40
                  fn (_event _dispatch!)
                    hint-fn $ {}
                      :args $ [] 'JsObject $ :: 'Fn
                        {}
                          :args $ [] 'Enum
                          :return 'Unit
                      :return 'Unit
                    println |CLICKED
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
        'comp-mountains $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-mountains ()
            object $ {} (:shader mountains-wgsl)
              :topology $ do :line-strip :triangle-list
              :attrs-list $ [] $ {} (:field :position) (:format |float32x2)
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
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ []
        'comp-necklace $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-necklace ()
            comp-spots $ {} (; :topology :line-strip) (:radius 6) (:vertex-count 8) (:shift 12)
              :points $ -> (range 80)
                map $ fn (idx)
                  let
                      r $ * idx 4
                    [] r
                      * r $ cos $ * 0.1129 idx
                      * r $ sin $ * 0.123 idx
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ []
        'comp-ribbon $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-ribbon ()
            comp-curves $ {} (; :topology :line-strip)
              :curves $ [] $ -> (range 400)
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
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ []
        'comp-stitch-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-stitch-demo ()
            group nil $ comp-stitch $ {}
              :chars $ [] 0xf2dfea34 0xc3c4a59d 0x88737645
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ []
        'comp-tabs $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-tabs ()
            group nil
              comp-button
                {}
                  :position $ v3 0 260 0
                  :color $ [] 0.5 0.5 0.9 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :axis
              comp-button
                {}
                  :position $ v3 40 260 0
                  :color $ [] 0.9 0.4 0.5 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :mountains
              comp-button
                {}
                  :position $ v3 80 260 0
                  :color $ [] 0.8 0.9 0.2 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :city
              comp-button
                {}
                  :position $ v3 120 260 0
                  :color $ [] 0.3 0.9 0.2 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :cube
              comp-button
                {}
                  :position $ v3 160 260 0
                  :color $ [] 0.8 0.0 0.9 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :ribbon
              comp-button
                {}
                  :position $ v3 200 260 0
                  :color $ [] 0.2 0.9 0.6 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :necklace
              comp-button
                {}
                  :position $ v3 240 260 0
                  :color $ [] 0.2 0.9 0.6 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :sphere
              comp-button
                {}
                  :position $ v3 280 260 0
                  :color $ [] 0.9 0.4 0.6 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :plate
              comp-button
                {}
                  :position $ v3 20 220 0
                  :color $ [] 0.7 0.8 0.9 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :control
              comp-button
                {}
                  :position $ v3 60 220 0
                  :color $ [] 0.9 0.7 0.6 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :stitch
              comp-button
                {}
                  :position $ v3 100 220 0
                  :color $ [] 0.9 0.3 0.8 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :bubbles
              comp-button
                {}
                  :position $ v3 140 220 0
                  :color $ [] 0.1 0.6 0.8 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :triangles
              comp-button
                {}
                  :position $ v3 180 220 0
                  :color $ [] 0.9 0.2 0.99 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :image
              comp-button
                {}
                  :position $ v3 220 220 0
                  :color $ [] 0.9 0.8 0.99 1
                  :size 20
                fn (e d!)
                  hint-fn $ {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
                  d! $ : tab :kaleidoscope
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ []
        'comp-triangles-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-triangles-demo ()
            let
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
                    hint-fn $ {}
                      :args $ [] $ :: 'Fn
                        {}
                          :args $ [] 'Dynamic
                          :return 'Unit
                      :return 'Unit
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
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ []
        'mountains-wgsl $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def mountains-wgsl (inline-shader |mountains)
          :examples $ []
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.comp.container
          :require
            lagopus.alias :refer $ group object
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
            lagopus.config :refer $ inline-shader
            lagopus.comp.image :refer $ comp-image-demo comp-kaleidoscope
            lagopus.browser :refer $ rand rand-shift
    'lagopus.comp.cube $ %{} 'FileEntry
      :defs $ {}
        'comp-cube $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-cube (options)
            let
                base $ assert-type
                  either (&map:get options :position) (v3 0 0 0)
                  , 'quaternion.vector/V3
                radius $ assert-type
                  either (&map:get options :radius) 80
                  , 'Number
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
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
        'wgsl-cube $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-cube (inline-shader |cube)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.comp.cube
          :require
            lagopus.config :refer $ inline-shader
            lagopus.alias :refer $ object
            quaternion.vector :refer $ &v+ v-cross v-scale v-dot &v- v+ v3
    'lagopus.comp.curves $ %{} 'FileEntry
      :defs $ {}
        'break-mark $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def break-mark (:: :break)
          :examples $ []
          :schema $ :: 'Dynamic
        'build-curve-points $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn build-curve-points (points curve-ratio)
            let
                size $ count points
              map
                range $ dec size
                fn (idx)
                  hint-fn $ {}
                    :args $ [] 'Number
                    :return $ :: 'List 'Enum
                  let
                      idx+1 $ inc idx
                      p-raw $ .unwrap $ nth points idx
                      q-raw $ .unwrap $ nth points idx+1
                      p $ curve-position p-raw
                      q $ curve-position q-raw
                      direction $ &v- q p
                      direction2 $ match
                        nth points $ inc idx+1
                        (:some next-point)
                          if (enum? next-point)
                            &v- (curve-position next-point) q
                            , direction
                        (:none) direction
                      p-width $ curve-width p-raw
                      q-width $ curve-width q-raw
                    [] (:: :vertex p 0 direction curve-ratio idx p-width) (:: :vertex q 0 direction2 curve-ratio idx+1 q-width) (:: :vertex p 1 direction2 curve-ratio idx p-width) (:: :vertex q 0 direction2 curve-ratio idx+1 p-width) (:: :vertex q 1 direction2 curve-ratio idx+1 q-width) (:: :vertex p 1 direction curve-ratio idx p-width)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'List 'Dynamic) 'Number
            :return $ :: 'List $ :: 'List 'Enum
        'build-polyline-points $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn build-polyline-points (*prev p write!)
            match p
              (:break) (reset! *prev nil)
              (:vertex position-raw width-raw)
                let
                    position $ point-v3 position-raw
                    width $ assert-type width-raw 'Number
                    previous @*prev
                  if (nil? previous)
                    reset! *prev $ {} (:position position) (:older nil) (:width width)
                    let
                        prev $ assert-type previous $ :: 'Map 'Tag 'Dynamic
                        older $ &map:get prev :older
                        q $ point-v3 $ &map:get prev :position
                        q2 position
                        p-width $ assert-type (&map:get prev :width) 'Number
                        q-width width
                        direction2 $ &v- q2 q
                        direction $ if (nil? older) direction2 $ &v- q (point-v3 older)
                      reset! *prev $ {} (:position position) (:older older) (:width p-width)
                      write! $ [] (:: :vertex q 0 direction p-width) (:: :vertex q2 0 direction2 q-width) (:: :vertex q 1 direction2 p-width) (:: :vertex q2 0 direction2 p-width) (:: :vertex q2 1 direction2 q-width) (:: :vertex q 1 direction p-width)
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] (:: 'Ref 'Dynamic) 'Enum $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] $ :: 'List 'Enum
        'build-polyline-points-marked $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn build-polyline-points-marked (*prev p write!)
            match p
              (:break) (reset! *prev nil)
              (:vertex position-raw width-raw mark-raw)
                let
                    position $ point-v3 position-raw
                    width $ assert-type width-raw 'Number
                    mark $ assert-type mark-raw 'Number
                    previous @*prev
                  if (nil? previous)
                    reset! *prev $ {} (:position position) (:older nil) (:width width) (:mark mark)
                    let
                        prev $ assert-type previous $ :: 'Map 'Tag 'Dynamic
                        older $ &map:get prev :older
                        q $ point-v3 $ &map:get prev :position
                        q2 position
                        p-width $ assert-type (&map:get prev :width) 'Number
                        q-width width
                        prev-mark $ assert-type (&map:get prev :mark) 'Number
                        direction2 $ &v- q2 q
                        direction $ if (nil? older) direction2 $ &v- q (point-v3 older)
                      reset! *prev $ {} (:position position) (:older older) (:width p-width) (:mark mark)
                      write! $ [] (:: :vertex q 0 direction p-width prev-mark) (:: :vertex q2 0 direction2 q-width mark) (:: :vertex q 1 direction2 p-width prev-mark) (:: :vertex q2 0 direction2 p-width mark) (:: :vertex q2 1 direction2 q-width mark) (:: :vertex q 1 direction p-width prev-mark)
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] (:: 'Ref 'Dynamic) 'Enum $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] $ :: 'List 'Enum
        'char-x $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def char-x
            count-hex $ reverse $ concat
              [] true false true false false false false true
              [] false false true false true true false false
              [] false false false true true false true false
              [] false true false false false false true false
          :examples $ []
          :schema $ :: 'Dynamic
        'char-y $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def char-y
            count-hex $ reverse $ concat
              [] true false true false false false false true
              [] false false true false true true false false
              [] false false false false true true false false
              [] false false false false true true false false
          :examples $ []
          :schema $ :: 'Dynamic
        'char-z $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def char-z
            count-hex $ reverse $ concat
              [] true false true false true true false true
              [] false false false false false true false false
              [] false false false true false false false false
              [] false true true true true true true true true
          :examples $ []
          :schema $ :: 'Dynamic
        'comp-axis $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-axis (options)
            let
                settings $ .unwrap-or options $ {}
                n $ assert-type
                  .unwrap-or (get settings :n) 20
                  , 'Number
                unit $ assert-type
                  .unwrap-or (get settings :unit) 20
                  , 'Number
                w $ assert-type
                  .unwrap-or (get settings :width) 1
                  , 'Number
              group nil $ comp-polylines-marked $ {}
                :shader $ inline-shader |axis
                :writer $ fn (write!)
                  hint-fn $ {}
                    :args $ [] $ :: 'Fn
                      {}
                        :args $ [] 'Dynamic
                        :return 'Unit
                    :return 'Unit
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
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Option (:: 'Map 'Tag 'Dynamic)
        'comp-curves $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-curves (options)
            let
                curves $ assert-type
                  either (&map:get options :curves) ([])
                  :: 'List $ :: 'List 'Dynamic
              object $ {}
                :shader $ either (&map:get options :shader) wgsl-curves
                :topology $ either (&map:get options :topology) :triangle-list
                :attrs-list $ [] (:: :float32x3 :position) (:: :uint32 :brush) (:: :float32x3 :direction) (:: :float32 :curve_ratio) (:: :uint32 :color_index) (:: :float32 :width)
                :data $ let
                    size $ count curves
                  map-indexed curves $ fn (idx c)
                    hint-fn $ {}
                      :args $ [] 'Number $ :: 'List 'Dynamic
                      :return $ :: 'List $ :: 'List 'Enum
                    build-curve-points c $ / idx size
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
        'comp-polylines $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-polylines (options)
            let
                chunk-writer! $ assert-type
                  either (&map:get options :writer)
                    fn (_collect)
                      hint-fn $ {}
                        :args $ [] $ :: 'Fn
                          {}
                            :args $ [] 'Dynamic
                            :return 'Unit
                        :return 'Unit
                      eprintln "|expected polylines writer"
                  :: 'Fn $ {}
                    :args $ [] $ :: 'Fn
                      {}
                        :args $ [] 'Dynamic
                        :return 'Unit
                    :return 'Unit
              object-writer $ {}
                :shader $ either (&map:get options :shader) wgsl-polylines
                :topology $ either (&map:get options :topology) :triangle-list
                :attrs-list $ [] (:: :float32x3 :position) (:: :uint32 :brush) (:: :float32x3 :direction) (:: :float32 :width)
                :writer $ fn (write!)
                  hint-fn $ {}
                    :args $ [] $ :: 'Fn
                      {}
                        :args $ [] $ :: 'List 'Enum
                        :return 'Unit
                    :return 'Unit
                  let
                      *prev $ atom nil
                      collect! $ fn (p)
                        hint-fn $ {}
                          :args $ [] 'Dynamic
                          :return 'Unit
                        if (list? p)
                          &doseq
                            x $ assert-type p $ :: 'List 'Enum
                            build-polyline-points *prev x write!
                          build-polyline-points *prev (assert-type p 'Enum) write!
                        , &unit
                    chunk-writer! collect!
                :get-params $ &map:get options :get-params
                :compute-options $ &map:get options :compute-options
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
        'comp-polylines-marked $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-polylines-marked (options)
            let
                chunk-writer! $ assert-type
                  either (&map:get options :writer)
                    fn (_collect)
                      hint-fn $ {}
                        :args $ [] $ :: 'Fn
                          {}
                            :args $ [] 'Dynamic
                            :return 'Unit
                        :return 'Unit
                      eprintln "|expected polylines writer"
                  :: 'Fn $ {}
                    :args $ [] $ :: 'Fn
                      {}
                        :args $ [] 'Dynamic
                        :return 'Unit
                    :return 'Unit
              object-writer $ {}
                :shader $ either (&map:get options :shader) wgsl-polylines-marked
                :topology $ either (&map:get options :topology) :triangle-list
                :attrs-list $ [] (:: :float32x3 :position) (:: :uint32 :brush) (:: :float32x3 :direction) (:: :float32 :width) (:: :float32 :mark)
                :writer $ fn (write!)
                  hint-fn $ {}
                    :args $ [] $ :: 'Fn
                      {}
                        :args $ [] $ :: 'List 'Enum
                        :return 'Unit
                    :return 'Unit
                  let
                      *prev $ atom nil
                      collect! $ fn (p)
                        hint-fn $ {}
                          :args $ [] 'Dynamic
                          :return 'Unit
                        if (list? p)
                          &doseq
                            x $ assert-type p $ :: 'List 'Enum
                            build-polyline-points-marked *prev x write!
                          build-polyline-points-marked *prev (assert-type p 'Enum) write!
                        , &unit
                    chunk-writer! collect!
                :get-params $ &map:get options :get-params
                :compute-options $ &map:get options :compute-options
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
        'count-hex $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn count-hex (xs)
            -> xs
              map-indexed $ fn (idx v)
                hint-fn $ {}
                  :args $ [] 'Number 'Bool
                  :return 'Number
                * (if v 1 0) (pow 2 idx)
              reduce 0 &+
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] $ :: 'List 'Bool
        'curve-position $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn curve-position (point)
            point-v3 $ if (enum? point)
              .unwrap $ nth point 1
              &map:get
                assert-type point $ :: 'Map 'Tag 'Dynamic
                , :position
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'quaternion.vector/V3)
            :args $ [] 'Dynamic
        'curve-width $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn curve-width (point)
            assert-type
              either
                if (enum? point)
                  .unwrap-or (nth point 2) nil
                  &map:get
                    assert-type point $ :: 'Map 'Tag 'Dynamic
                    , :width
                , 1
              , 'Number
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Dynamic
        'point-v3 $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn point-v3 (point)
            if (list? point)
              let
                  values $ assert-type point $ :: 'List 'Number
                v3
                  .unwrap $ nth values 0
                  .unwrap $ nth values 1
                  .unwrap $ nth values 2
              assert-type point 'quaternion.vector/V3
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'quaternion.vector/V3)
            :args $ [] 'Dynamic
        'wgsl-curves $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-curves (inline-shader |curves)
          :examples $ []
          :schema $ :: 'Dynamic
        'wgsl-polylines $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-polylines (inline-shader |polylines)
          :examples $ []
          :schema $ :: 'Dynamic
        'wgsl-polylines-marked $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-polylines-marked (inline-shader |polylines-marked)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.comp.curves
          :require
            lagopus.config :refer $ inline-shader
            lagopus.alias :refer $ object group object-writer
            quaternion.vector :refer $ &v+ v-cross v-scale v-dot &v- v3
            lagopus.comp.stitch :refer $ comp-stitch
    'lagopus.comp.image $ %{} 'FileEntry
      :defs $ {}
        'comp-image-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-image-demo (textures-dict)
            object $ {} (:label :image) (:shader wgsl-image)
              :topology $ do :line-strip :triangle-list
              :attrs-list $ []
                {} (:field :position) (:format |float32x3)
                {} (:field :uv) (:format |float32x2)
              :data $ []
                []
                  :: :vertex ([] 0 0 0) ([] 0 0)
                  :: :vertex ([] 100 0 0) ([] 1 0)
                  :: :vertex ([] 100 100 0) ([] 1 1)
                []
                  :: :vertex ([] 100 100 0) ([] 1 1)
                  :: :vertex ([] 0 100 0) ([] 0 1)
                  :: :vertex ([] 0 0 0) ([] 0 0)
              :textures $ [] $ .unwrap (get textures-dict :tiye)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'lagopus.gpu/Texture
        'comp-kaleidoscope $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-kaleidoscope (textures-dict)
            object $ {} (:label :image) (:shader wgsl-kaleidoscope)
              :topology $ do :line-strip :triangle-list
              :attrs-list $ []
                {} (:field :position) (:format |float32x3)
                {} (:field :uv) (:format |float32x2)
              :data $ []
                []
                  :: :vertex ([] 0 0 0) ([] 0 0)
                  :: :vertex ([] 100 0 0) ([] 1 0)
                  :: :vertex ([] 100 100 0) ([] 1 1)
                []
                  :: :vertex ([] 100 100 0) ([] 1 1)
                  :: :vertex ([] 0 100 0) ([] 0 1)
                  :: :vertex ([] 0 0 0) ([] 0 0)
              :textures $ [] $ .unwrap (get textures-dict :tiye)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'lagopus.gpu/Texture
        'wgsl-image $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-image (inline-shader |image)
          :examples $ []
          :schema $ :: 'Dynamic
        'wgsl-kaleidoscope $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-kaleidoscope (inline-shader |kaleidoscope)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.comp.image
          :require
            lagopus.alias :refer $ group object
            lagopus.comp.button :refer $ comp-button comp-slider comp-drag-point
            memof.once :refer $ memof1-call
            quaternion.vector :refer $ v+ v3
            lagopus.cursor :refer $ >>
            |@calcit/std :refer $ rand-shift rand
            lagopus.config :refer $ inline-shader
    'lagopus.comp.plate $ %{} 'FileEntry
      :defs $ {}
        'calc-ratio $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn calc-ratio (p)
            let
                x $ .unwrap $ nth p 0
                y $ .unwrap $ nth p 1
                px $ + x $ * 0.5 y
                py $ * 0.5 sqrt-3 y
                radian $ browser/atan2 py px
              * 0.5 $ * sqrt-3 $ cos
                - radian $ / &PI 6
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] $ :: 'List 'Number
        'comp-plate $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-plate (options)
            let
                base $ assert-type
                  either (&map:get options :position) (v3 0 0 0)
                  , 'quaternion.vector/V3
                x-direction $ assert-type
                  either (&map:get options :x-direction) (v3 1 0 0)
                  , 'quaternion.vector/V3
                y-direction $ assert-type
                  either (&map:get options :y-direction) (v3 0 1 0)
                  , 'quaternion.vector/V3
                radius $ assert-type
                  either (&map:get options :radius) 80
                  , 'Number
                iteration $ assert-type
                  either (&map:get options :iteration) 4
                  , 'Number
                color $ assert-type
                  either (&map:get options :color) ([] 0.6 0.8 0.76)
                  :: 'List 'Number
                *counter $ atom 0
                r-unit $ / radius iteration
                transformer $ assert-type
                  either (&map:get options :transformer) identity
                  :: 'Fn $ {}
                    :args $ [] 'quaternion.vector/V3
                    :return 'quaternion.vector/V3
                chromatism $ assert-type
                  either (&map:get options :chromatism) 0.1
                  , 'Number
              object $ {}
                :shader $ either (&map:get options :shader) wgsl-plate
                :topology $ either (&map:get options :topology) :triangle-list
                :attrs-list $ [] (:: :float32x3 :position) (:: :uint32 :idx)
                :data $ map (range 6)
                  fn (section-idx)
                    hint-fn $ {}
                      :args $ [] 'Number
                      :return $ :: 'List 'Dynamic
                    let
                        angle $ * section-idx $ / &PI 3
                        angle-next $ * (inc section-idx) (/ &PI 3)
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
                        point $ fn (p)
                          hint-fn $ {}
                            :args $ [] $ :: 'List 'Number
                            :return 'quaternion.vector/V3
                          let
                              ratio $ calc-ratio p
                            &v+ base $ transformer $ &v+
                              v-scale unit-x $ * ratio $ .unwrap (nth p 0)
                              v-scale unit-y $ * ratio $ .unwrap (nth p 1)
                      map (range iteration)
                        fn (idx)
                          hint-fn $ {}
                            :args $ [] 'Number
                            :return $ :: 'List 'Dynamic
                          map
                            range $ - iteration idx
                            fn (j)
                              hint-fn $ {}
                                :args $ [] 'Number
                                :return $ :: 'List 'Dynamic
                              let
                                  c @*counter
                                  c1 $ inc c
                                  ps0 $ point $ [] idx j
                                  ps1 $ point $ [] (inc idx) j
                                  ps2 $ point $ [] idx (inc j)
                                  ps3 $ point $ [] (inc idx) (inc j)
                                swap! *counter + 2
                                [] (:: :vertex ps0 c) (:: :vertex ps1 c) (:: :vertex ps2 c)
                                  if
                                    < (+ idx j) (dec iteration)
                                    [] (:: :vertex ps3 c1) (:: :vertex ps1 c1) (:: :vertex ps2 c1)
                                    []
                :get-params $ fn ()
                  hint-fn $ {}
                    :args $ []
                    :return 'JsObject
                    :features $ #{} :js-ffi
                  js-array & color chromatism
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'sqrt-3 $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def sqrt-3 (sqrt 3)
          :examples $ []
          :schema $ :: 'Dynamic
        'wgsl-plate $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-plate (inline-shader |plate)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.comp.plate
          :require
            lagopus.config :refer $ inline-shader
            lagopus.alias :refer $ object
            quaternion.vector :refer $ &v+ v-cross v-scale v-dot &v- v-length v3 v+
            lagopus.browser :as browser
    'lagopus.comp.sphere $ %{} 'FileEntry
      :defs $ {}
        'build-sphere-triangles $ %{} 'CodeEntry
          :doc "|based on knowledge from https://www.danielsieger.com/blog/2021/03/27/generating-spheres.html"
          :code $ quote $ defn build-sphere-triangles (base radius depth *counter p0 p1 p2)
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
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'quaternion.vector/V3 'Number 'Number (:: 'Ref 'Number) 'quaternion.vector/V3 'quaternion.vector/V3 'quaternion.vector/V3
            :return $ :: 'List 'Dynamic
        'comp-sphere $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-sphere (options)
            let
                base $ assert-type
                  either (&map:get options :position) (v3 0 0 0)
                  , 'quaternion.vector/V3
                radius $ assert-type
                  either (&map:get options :radius) 40
                  , 'Number
                iteration $ assert-type
                  either (&map:get options :iteration) 2
                  , 'Number
                color $ assert-type
                  either (&map:get options :color) ([] 0.6 0.8 0.76)
                  :: 'List 'Number
                *counter $ atom 0
              object $ {}
                :shader $ either (&map:get options :shader) wgsl-sphere
                :topology $ either (&map:get options :topology) :triangle-list
                :attrs-list $ [] (:: :float32x3 :position) (:: :uint32 :idx)
                :data $ map unit-triangles $ fn (xs)
                  hint-fn $ {}
                    :args $ [] $ :: 'List 'quaternion.vector/V3
                    :return $ :: 'List 'Dynamic
                  build-sphere-triangles base radius iteration *counter
                    .unwrap $ nth xs 0
                    .unwrap $ nth xs 1
                    .unwrap $ nth xs 2
                :get-params $ fn ()
                  hint-fn $ {}
                    :args $ []
                    :return 'JsObject
                    :features $ #{} :js-ffi
                  js-array & color 1
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
            :features $ #{} :js-ffi
        'pick-radian-middle $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn pick-radian-middle (p0 p1)
            let
                p-mid $ v-scale (&v+ p0 p1) 0.5
                l $ v-length p-mid
                ratio $ &/ 1 l
                p-mid-unit $ v-scale p-mid ratio
              , p-mid-unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'quaternion.vector/V3)
            :args $ [] 'quaternion.vector/V3 'quaternion.vector/V3
        'unit-triangles $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def unit-triangles
            []
              [] (v3 1 0 0) (v3 0 1 0) (v3 0 0 1)
              [] (v3 1 0 0) (v3 0 1 0) (v3 0 0 -1)
              [] (v3 1 0 0) (v3 0 -1 0) (v3 0 0 1)
              [] (v3 1 0 0) (v3 0 -1 0) (v3 0 0 -1)
              [] (v3 -1 0 0) (v3 0 1 0) (v3 0 0 1)
              [] (v3 -1 0 0) (v3 0 1 0) (v3 0 0 -1)
              [] (v3 -1 0 0) (v3 0 -1 0) (v3 0 0 1)
              [] (v3 -1 0 0) (v3 0 -1 0) (v3 0 0 -1)
          :examples $ []
          :schema $ :: 'List $ :: 'List 'quaternion.vector/V3
        'wgsl-sphere $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-sphere (inline-shader |sphere)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.comp.sphere
          :require
            lagopus.config :refer $ inline-shader
            lagopus.alias :refer $ object
            quaternion.vector :refer $ &v+ v-cross v-scale v-dot &v- v-length v3
    'lagopus.comp.spots $ %{} 'FileEntry
      :defs $ {}
        'comp-bubbles $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-bubbles (options)
            let
                bubbles $ assert-type
                  either (&map:get options :bubbles)
                    [] $ [] 0 0 0 100
                  :: 'List $ :: 'List 'Number
              object $ {} (:shader wgsl-bubbles) (:topology :line-list)
                :attrs-list $ [] (:: :float32x3 :position) (:: :float32x2 :arm) (:: :float32 :radian)
                :data $ map bubbles $ fn (info)
                  hint-fn $ {}
                    :args $ [] $ :: 'List 'Number
                    :return $ :: 'List $ :: 'List (:: 'Map 'Tag 'Dynamic)
                  let
                      position $ take info 3
                      radius $ .unwrap $ nth info 3
                      size $ + 20 $ * 8 (sqrt radius)
                      step $ / (* 2 &PI) size
                    map (range size)
                      fn (idx)
                        hint-fn $ {}
                          :args $ [] 'Number
                          :return $ :: 'List $ :: 'Map 'Tag 'Dynamic
                        []
                          let
                              radian $ * step idx
                            {} (:position position) (:radian radian)
                              :arm $ []
                                * radius $ cos radian
                                * radius $ sin radian
                          let
                              radian $ * step $ inc idx
                            {} (:position position) (:radian radian)
                              :arm $ []
                                * radius $ cos radian
                                * radius $ sin radian
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
        'comp-spots $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-spots (options)
            let
                points $ assert-type
                  either (&map:get options :points) ([])
                  :: 'List 'Dynamic
                color $ either (&map:get options :color) ([] 0.8 0.8 1)
                radius $ assert-type
                  either (&map:get options :radius) 12
                  , 'Number
                shift $ assert-type
                  either (&map:get options :shift) 40
                  , 'Number
                vertex-count $ &max 3 $ assert-type
                  either (&map:get options :vertex-count) 8
                  , 'Number
              object $ {}
                :shader $ either (&map:get options :shader) wgsl-spots
                :topology $ either (&map:get options :topology) :triangle-list
                :attrs-list $ [] (:: :float32x3 :base) (:: :float32x3 :color) (:: :float32 :radius) (:: :uint32 :vertex-count) (:: :uint32 :angle-idx) (:: :float32 :shift) (:: :uint32 :spot-idx)
                :data $ map-indexed points $ fn (spot-idx base)
                  hint-fn $ {}
                    :args $ [] 'Number 'Dynamic
                    :return $ :: 'List $ :: 'List 'Enum
                  map
                    range $ - vertex-count 2
                    fn (angle-idx)
                      hint-fn $ {}
                        :args $ [] 'Number
                        :return $ :: 'List 'Enum
                      []
                        :: :vertex base color radius vertex-count 0 shift spot-idx
                        :: :vertex base color radius vertex-count (+ 1 angle-idx) shift spot-idx
                        :: :vertex base color radius vertex-count (+ 2 angle-idx) shift spot-idx
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
        'wgsl-bubbles $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-bubbles (inline-shader |bubbles)
          :examples $ []
          :schema $ :: 'Dynamic
        'wgsl-spots $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def wgsl-spots (inline-shader |spots)
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.comp.spots
          :require
            lagopus.config :refer $ inline-shader
            lagopus.alias :refer $ object
            quaternion.vector :refer $ &v+ v+ v-cross v-scale v-dot &v- v3
            quaternion.complex :refer $ complex
    'lagopus.comp.stitch $ %{} 'FileEntry
      :defs $ {}
        'comp-stitch $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-stitch (props)
            let
                chars $ assert-type
                  either (&map:get props :chars) ([] 0x1111)
                  :: 'List 'Number
                position $ assert-type
                  either (&map:get props :position) (v3 0 0 0)
                  , 'quaternion.vector/V3
                size $ assert-type
                  either (&map:get props :size) 24
                  , 'Number
                gap 4
                s0 $ * 0.1 size
              group ({})
                object $ {} (:topology :triangle-list)
                  :shader $ inline-shader |stitch-bg
                  :attrs-list $ [] (:: :float32x3 :base) (:: :float32x3 :position)
                  :data $ map-indexed chars $ fn (idx c)
                    hint-fn $ {}
                      :args $ [] 'Number 'Number
                      :return $ :: 'List $ :: 'Map 'Tag 'Dynamic
                    ->
                      [] (v3 0 0 0) (v3 1 0 0) (v3 1 -1 0) (v3 0 0 0) (v3 1 -1 0) (v3 0 -1 0)
                      map $ fn (x)
                        hint-fn $ {}
                          :args $ [] 'quaternion.vector/V3
                          :return $ :: 'Map 'Tag 'Dynamic
                        {} (:base position)
                          :position $ &v+ (v-scale x size)
                            v-scale
                              v3 (+ size gap) 0 0
                              , idx
                  :hit-region $ &map:get props :hit-region
                object $ {} (:topology :triangle-list)
                  :shader $ inline-shader |stitch-line
                  :attrs-list $ [] (:: :float32x3 :base) (:: :float32x3 :position) (:: :uint32 :value)
                  :data $ map-indexed chars $ fn (idx c)
                    hint-fn $ {}
                      :args $ [] 'Number 'Number
                      :return $ :: 'List $ :: 'Map 'Tag 'Dynamic
                    let
                        pattern $ stitch-pattern c
                      map stitch-strokes $ fn (info)
                        hint-fn $ {}
                          :args $ [] $ :: 'Map 'Tag 'Dynamic
                          :return $ :: 'Map 'Tag 'Dynamic
                        let
                            x $ assert-type (&map:get info :position) 'quaternion.vector/V3
                            data-idx $ assert-type (&map:get info :data) 'Number
                          {} (:base position)
                            :position $ &v+ (v-scale x s0)
                              v-scale
                                v3 (+ size gap) 0 0
                                , idx
                            :value $ if
                              = |1 $ .unwrap $ get pattern data-idx
                              , 1 0
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'JsObject)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
        'stitch-strokes $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def stitch-strokes
            let
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
                          base-bottom-right $ &v+ base $ v3 2 -2 0
                          base-top-right $ &v+ base $ v3 2 0 0
                          base-bottom-left $ &v+ base $ v3 0 -2 0
                          base-idx $ * 2 $ + (* i 4) j
                          base-idx-next $ inc base-idx
                        []
                          {}
                            :position $ &v+ base $ v3 -0.2 0.2 0
                            :data base-idx
                          {}
                            :position $ &v+ base $ v3 0.2 0.2 0
                            :data base-idx
                          {}
                            :position $ &v+ base $ v3 -0.2 -0.2 0
                            :data base-idx
                          {}
                            :position $ &v+ base $ v3 0.2 0.2 0
                            :data base-idx
                          {}
                            :position $ &v+ base $ v3 -0.2 -0.2 0
                            :data base-idx
                          {}
                            :position $ &v+ base-bottom-right $ v3 0.2 0.2 0
                            :data base-idx
                          {}
                            :position $ &v+ base $ v3 -0.2 -0.2 0
                            :data base-idx
                          {}
                            :position $ &v+ base-bottom-right $ v3 0.2 0.2 0
                            :data base-idx
                          {}
                            :position $ &v+ base-bottom-right $ v3 -0.2 -0.2 0
                            :data base-idx
                          {}
                            :position $ &v+ base-bottom-right $ v3 0.2 0.2 0
                            :data base-idx
                          {}
                            :position $ &v+ base-bottom-right $ v3 -0.2 -0.2 0
                            :data base-idx
                          {}
                            :position $ &v+ base-bottom-right $ v3 0.2 -0.2 0
                            :data base-idx
                          ; "|next stroke"
                          {}
                            :position $ &v+ base-top-right $ v3 -0.2 0.2 0
                            :data base-idx-next
                          {}
                            :position $ &v+ base-top-right $ v3 0.2 -0.2 0
                            :data base-idx-next
                          {}
                            :position $ &v+ base-top-right $ v3 0.2 0.2 0
                            :data base-idx-next
                          {}
                            :position $ &v+ base-top-right $ v3 -0.2 0.2 0
                            :data base-idx-next
                          {}
                            :position $ &v+ base-top-right $ v3 0.2 -0.2 0
                            :data base-idx-next
                          {}
                            :position $ &v+ base-bottom-left $ v3 -0.2 0.2 0
                            :data base-idx-next
                          {}
                            :position $ &v+ base-top-right $ v3 0.2 -0.2 0
                            :data base-idx-next
                          {}
                            :position $ &v+ base-bottom-left $ v3 0.2 -0.2 0
                            :data base-idx-next
                          {}
                            :position $ &v+ base-bottom-left $ v3 -0.2 0.2 0
                            :data base-idx-next
                          {}
                            :position $ &v+ base-bottom-left $ v3 0.2 -0.2 0
                            :data base-idx-next
                          {}
                            :position $ &v+ base-bottom-left $ v3 -0.2 0.2 0
                            :data base-idx-next
                          {}
                            :position $ &v+ base-bottom-left $ v3 -0.2 -0.2 0
                            :data base-idx-next
          :examples $ []
          :schema $ :: 'List $ :: 'Map 'Tag 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.comp.stitch
          :require
            lagopus.config :refer $ inline-shader
            lagopus.alias :refer $ group object
            quaternion.vector :refer $ &v+ v-cross v-scale v-dot &v- v3
            lagopus.browser :refer $ stitch-pattern
    'lagopus.config $ %{} 'FileEntry
      :defs $ {}
        'bg-color $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def bg-color
            match (get-env |bg-color)
              (:some value) (parse-bg-color value)
              (:none) (%none)
          :examples $ []
          :schema $ :: 'Dynamic
        'bloom? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def bloom?
            match (get-env |bloom)
              (:some value) (= value |true)
              (:none) false
          :examples $ []
          :schema $ :: 'Dynamic
        'dev? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def dev?
            match (get-env |mode)
              (:some value) (= value |dev)
              (:none) false
          :examples $ []
          :schema $ :: 'Dynamic
        'inline-shader $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro inline-shader (name)
            let
                shader $ if (blank? calcit-dirname) (str |shaders/ name |.wgsl)
                  let
                      dir $ if (.ends-with? calcit-dirname |/) calcit-dirname $ str calcit-dirname |/
                    str dir |shaders/ name |.wgsl
              println |inline: shader
              read-file shader
          :examples $ []
          :schema $ :: 'Macro $ {}
            :capabilities $ #{} :fs-read :log
            :expansion $ :: 'Expr 'String
            :required $ [] $ :: 'Expr 'String
        'mobile-info $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def mobile-info (browser/read-mobile-info!)
          :examples $ []
          :schema $ :: 'Dynamic
        'parse-bg-color $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn parse-bg-color (bg)
            if (blank? bg) (%none)
              let
                  items $ map (split bg |,) browser/parse-color-channel
                %some $ :: :rgba
                  .unwrap $ nth items 0
                  .unwrap $ nth items 1
                  .unwrap $ nth items 2
                  .unwrap-or (nth items 3) 1
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'String
            :return $ :: 'Option 'Enum
        'remote-control? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def remote-control?
            match (get-env |remote-control)
              (:some value) true
              (:none) false
          :examples $ []
          :schema $ :: 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.config
          :require
            lagopus.$meta :refer $ calcit-dirname
            lagopus.browser :as browser
    'lagopus.cursor $ %{} 'FileEntry
      :defs $ {}
        '>> $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn >> (states k)
            let
                parent-cursor $ match (get states :cursor)
                  (:some value)
                    assert-type value $ :: 'List 'Tag
                  (:none) ([])
                branch $ match (get states k)
                  (:some value)
                    assert-type value $ :: 'Map 'Tag 'Dynamic
                  (:none) ({})
              assoc branch :cursor $ conj parent-cursor k
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'Dynamic) 'Tag
            :return $ :: 'Map 'Tag 'Dynamic
        'update-states $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn update-states (store cursor new-state)
            assoc-in store ([] :states & cursor :data) new-state
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'Dynamic) (:: 'List 'Tag) 'Dynamic
            :return $ :: 'Map 'Tag 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.cursor
    'lagopus.gpu $ %{} 'FileEntry
      :defs $ {}
        'Bitmap $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait Bitmap (:width 'Number) (:height 'Number)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'Blob $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait Blob (:size 'Number)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'Context $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait Context (:device 'lagopus.gpu/Device)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'Device $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait Device (:label 'String)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'Response $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait Response
            .blob $ :: 'Fn $ {}
              :args $ [] 'Response
              :return 'Blob
              :async true
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'Texture $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait Texture (:width 'Number) (:height 'Number)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'initialize-device! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn initialize-device! ()
            let
                initialize! $ unsafe-coerce initializeContext $ :: 'Fn
                  {}
                    :args $ []
                    :return $ :: 'JsNullish Context
                    :async true
                context $ js-await $ initialize!
              if (js-nullish? context) (raise "|WebGPU context initialization failed") (.-device context)
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:async true) (:return 'lagopus.gpu/Device)
            :args $ []
            :features $ #{} :js-ffi
        'load-texture! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn load-texture! (device url)
            let
                fetch! $ unsafe-coerce js/fetch $ :: 'Fn
                  {}
                    :args $ [] 'String
                    :return Response
                    :async true
                decode! $ unsafe-coerce js/createImageBitmap $ :: 'Fn
                  {}
                    :args $ [] Blob
                    :return Bitmap
                    :async true
                upload! $ unsafe-coerce createTextureFromSource $ :: 'Fn
                  {}
                    :args $ [] Device 'JsObject
                    :return Texture
                response $ js-await $ fetch! url
                blob $ js-await $ response .blob
                bitmap $ js-await $ decode! blob
              upload! device $ js-object (:source bitmap)
                :w $ .-width bitmap
                :h $ .-height bitmap
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:async true) (:return 'lagopus.gpu/Texture)
            :args $ [] 'lagopus.gpu/Device 'String
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.gpu
          :require $ |@triadica/lagopus :refer $ createTextureFromSource initializeContext
    'lagopus.main $ %{} 'FileEntry
      :defs $ {}
        '*global-textures $ %{} 'CodeEntry
          :doc "|track textures with a hashmap, this is global states passing to container"
          :code $ quote $ defatom *global-textures ({})
          :examples $ []
          :schema $ :: 'Ref $ :: 'Map 'Tag 'lagopus.gpu/Texture
        '*store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defatom *store
            {}
              :states $ {}
              :tab :axis
          :examples $ []
          :schema $ :: 'Ref $ :: 'Map 'Tag 'Dynamic
        'canvas $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def canvas (browser/query-canvas!)
          :examples $ []
          :schema $ :: 'Dynamic
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (op)
            if dev? $ println op
            let
                store @*store
                next-store $ match op
                  (:state cursor data)
                    update-states store
                      assert-type cursor $ :: 'List 'Tag
                      , data
                  (:tab tab)
                    assoc store :tab $ assert-type tab 'Tag
              if (not= next-store store) (reset! *store next-store)
              , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Enum
        'load-images! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn load-images! (gpu-device *textures)
            let
                texture $ js-await $ gpu/load-texture! gpu-device |https://cdn.tiye.me/logo/tiye.jpg
              swap! *textures assoc :tiye texture
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:async true) (:return 'Unit)
            :args $ [] 'lagopus.gpu/Device $ :: 'Ref (:: 'Map 'Tag 'lagopus.gpu/Texture)
            :features $ #{} :js-ffi
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! ()
            if
              and bloom? $ not $ .-any mobile-info
              runtime/enable-bloom!
            if dev? $ load-console-formatter!
            js-await $ load-images!
              js-await $ gpu/initialize-device!
              , *global-textures
            runtime/initialize-textures!
            reset-clear-color! $ .unwrap-or bg-color $ :: :rgba 0.18 0.2 0.36 1
            render-app!
            runtime/start-controls!
            runtime/register-shader-result! handle-compilation
            browser/set-resize-handler! resize!
            runtime/reset-canvas! canvas
            add-watch *store :change store-changed!
            runtime/setup-mouse! canvas
            runtime/load-gamepad!
            runtime/paint!
            if remote-control? $ runtime/setup-remote!
            , &unit
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:async true) (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            let
                show! $ unsafe-coerce hud! $ :: 'Fn
                  {}
                    :args $ [] 'String 'String
                    :return 'Unit
              if (js-nullish? build-errors)
                do (reset-memof1-caches!) (render-app!) (remove-watch *store :change) (add-watch *store :change store-changed!) (println |Reloaded.) (show! |ok~ |OK)
                show! |error $ unsafe-coerce build-errors 'String
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! ()
            let
                tree $ comp-container @*store @*global-textures
              runtime/render-tree! tree dispatch!
              runtime/paint!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
        'resize! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn resize! (_event) (runtime/reset-canvas! canvas) (runtime/initialize-textures!) (runtime/paint!)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'JsObject
        'store-changed! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn store-changed! (_next _previous) (render-app!)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] (:: 'Map 'Tag 'Dynamic) (:: 'Map 'Tag 'Dynamic)
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.main
          :require
            lagopus.comp.container :refer $ comp-container
            lagopus.config :refer $ dev? mobile-info bloom? bg-color remote-control?
            lagopus.util :refer $ handle-compilation reset-clear-color!
            |bottom-tip :default hud!
            |./calcit.build-errors :default build-errors
            memof.once :refer $ reset-memof1-caches!
            lagopus.cursor :refer $ update-states
            lagopus.gpu :as gpu
            lagopus.browser :as browser
            lagopus.runtime :as runtime
    'lagopus.math $ %{} 'FileEntry
      :defs $ {}
        'fibo-grid-n $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn fibo-grid-n (n total)
            let
                z $ dec $ &/
                  dec $ &* 2 n
                  , total
                t $ sqrt $ &- 1 (&* z z)
                t2 $ * 2 &PI n phi
                x $ &* t $ cos t2
                y $ &* t $ sin t2
              v3 x y z
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'quaternion.vector/V3)
            :args $ [] 'Number 'Number
        'fibo-grid-range $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn fibo-grid-range (total)
            -> (range total)
              map $ fn (n)
                fibo-grid-n (inc n) total
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'Number
            :return $ :: 'List 'quaternion.vector/V3
        'phi $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def phi
            * 0.5 $ dec $ sqrt 5
          :examples $ []
          :schema $ :: 'Dynamic
        'rotate-3d $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rotate-3d (origin axis-0 angle p)
            let
                cos-d $ cos angle
                sin-d $ sin angle
                p-v $ &v- p origin
                h $ v-dot axis-0 p-v
                h-v $ v-scale axis-0 h
                flat-p-v $ &v- p-v h-v
                rot-direction $ v-normalize $ v-cross flat-p-v axis-0
                rot-v $ v-scale rot-direction $ v-length flat-p-v
              v+ origin h-v (v-scale flat-p-v cos-d) (v-scale rot-v sin-d)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'quaternion.vector/V3)
            :args $ [] 'quaternion.vector/V3 'quaternion.vector/V3 'Number 'quaternion.vector/V3
        'rotate-3d-fn $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn rotate-3d-fn (origin axis angle)
            let
                axis-0 $ v-normalize axis
                cos-d $ cos angle
                sin-d $ sin angle
              defn rotate-3d-apply (p)
                hint-fn $ {}
                  :args $ [] 'quaternion.vector/V3
                  :return 'quaternion.vector/V3
                let
                    p-v $ &v- p origin
                    h $ v-dot axis-0 p-v
                    h-v $ v-scale axis-0 h
                    flat-p-v $ &v- p-v h-v
                    rot-direction $ v-normalize $ v-cross flat-p-v axis-0
                    rot-v $ v-scale rot-direction $ v-length flat-p-v
                  v+ origin h-v (v-scale flat-p-v cos-d) (v-scale rot-v sin-d)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] 'quaternion.vector/V3 'quaternion.vector/V3 'Number
            :return $ :: 'Fn $ {} (:return 'quaternion.vector/V3)
              :args $ [] 'quaternion.vector/V3
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.math
          :require $ quaternion.vector :refer $ v-dot v-normalize &v- v-scale v-cross v+ &v+ v-length v3
    'lagopus.runtime $ %{} 'FileEntry
      :defs $ {}
        'enable-bloom! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn enable-bloom! ()
            let
                invoke! $ unsafe-coerce enableBloom $ :: 'Fn
                  {}
                    :args $ []
                    :return 'Unit
              invoke!
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'initialize-textures! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn initialize-textures! ()
            let
                invoke! $ unsafe-coerce initializeCanvasTextures $ :: 'Fn
                  {}
                    :args $ []
                    :return 'Unit
              invoke!
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'load-gamepad! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn load-gamepad! ()
            let
                invoke! $ unsafe-coerce loadGamepadControl $ :: 'Fn
                  {}
                    :args $ []
                    :return 'Unit
              invoke!
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'paint! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn paint! ()
            let
                invoke! $ unsafe-coerce paintLagopusTree $ :: 'Fn
                  {}
                    :args $ []
                    :return 'Unit
              invoke!
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'register-shader-result! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn register-shader-result! (handler)
            let
                register! $ unsafe-coerce registerShaderResult $ :: 'Fn
                  {}
                    :args $ [] $ :: 'Fn
                      {}
                        :args $ [] 'lagopus.util/CompilationInfo 'String
                        :return 'Unit
                    :return 'Unit
              register! handler
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] 'lagopus.util/CompilationInfo 'String
            :features $ #{} :js-ffi
        'render-tree! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-tree! (tree dispatch!)
            let
                render! $ unsafe-coerce renderLagopusTree $ :: 'Fn
                  {}
                    :args $ [] 'JsObject $ :: 'Fn
                      {}
                        :args $ [] 'Enum
                        :return 'Unit
                    :return 'Unit
              render! tree dispatch!
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'JsObject $ :: 'Fn
              {} (:return 'Unit)
                :args $ [] 'Enum
            :features $ #{} :js-ffi
        'reset-canvas! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reset-canvas! (canvas)
            let
                invoke! $ unsafe-coerce resetCanvasSize $ :: 'Fn
                  {}
                    :args $ [] 'lagopus.browser/Canvas
                    :return 'Unit
              invoke! canvas
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'lagopus.browser/Canvas
            :features $ #{} :js-ffi
        'setup-mouse! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn setup-mouse! (canvas)
            let
                invoke! $ unsafe-coerce setupMouseEvents $ :: 'Fn
                  {}
                    :args $ [] 'lagopus.browser/Canvas
                    :return 'Unit
              invoke! canvas
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'lagopus.browser/Canvas
            :features $ #{} :js-ffi
        'setup-remote! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn setup-remote! ()
            let
                invoke! $ unsafe-coerce setupRemoteControl $ :: 'Fn
                  {}
                    :args $ []
                    :return 'Unit
              invoke!
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'start-controls! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn start-controls! ()
            let
                render! $ unsafe-coerce renderControl $ :: 'Fn
                  {}
                    :args $ []
                    :return 'Unit
                control! $ unsafe-coerce onControlEvent $ :: 'Fn
                  {}
                    :args $ [] 'Number 'JsObject 'JsObject
                    :return 'Unit
                start! $ unsafe-coerce startControlLoop $ :: 'Fn
                  {}
                    :args $ [] 'Number $ :: 'Fn
                      {}
                        :args $ [] 'Number 'JsObject 'JsObject
                        :return 'Unit
                    :return 'Unit
              render!
              start! 10 control!
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.runtime
          :require
            |@triadica/lagopus :refer $ enableBloom initializeCanvasTextures paintLagopusTree resetCanvasSize setupMouseEvents loadGamepadControl onControlEvent registerShaderResult renderLagopusTree
            |@triadica/touch-control :refer $ renderControl startControlLoop
            |@triadica/lagopus/lib/remote-control.mjs :refer $ setupRemoteControl
            lagopus.browser :refer $ Canvas
            lagopus.util :refer $ CompilationInfo
    'lagopus.util $ %{} 'FileEntry
      :defs $ {}
        'ColorAtom $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait ColorAtom
            .reset $ :: 'Fn $ {}
              :args $ [] 'ColorAtom 'JsObject
              :return 'Unit
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'CompilationInfo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait CompilationInfo (:messages 'lagopus.util/ShaderMessages)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'ShaderMessage $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait ShaderMessage (:line-num 'Number) (:line-pos 'Number) (:message 'String)
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'ShaderMessages $ %{} 'CodeEntry (:doc |)
          :code $ quote $ deftrait ShaderMessages
            .at $ :: 'Fn $ {}
              :args $ [] 'ShaderMessages 'Number
              :return $ :: 'JsNullish 'lagopus.util/ShaderMessage
          :examples $ []
          :ffi $ {} (:backend :js) (:kind :external-object) (:target :browser)
          :schema $ :: 'Trait
        'handle-compilation $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn handle-compilation (info code)
            let
                messages $ .-messages info
                error $ messages .at 0
              if (js-present? error)
                let
                    line-num $ .-line-num error
                    line-pos $ .-line-pos error
                    lines $ .split-lines code
                    message $ str line-num "| "
                      .unwrap-or
                        nth lines $ dec line-num
                        , |
                      , &newline
                        .join-str
                          repeat "| " $ +
                            count $ str line-num
                            , line-pos
                          , |
                        , "|^ " $ .-message error
                    log! $ unsafe-coerce js/console.error $ :: 'Fn
                      {}
                        :args $ [] 'String
                        :return 'Unit
                    show! $ unsafe-coerce hud! $ :: 'Fn
                      {}
                        :args $ [] 'String 'String
                        :return 'Unit
                  log! $ str "|WGSL Error:" &newline message
                  show! |error $ str "|WGSL Errors:" &newline message
              , &unit
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'lagopus.util/CompilationInfo 'String
            :features $ #{} :js-ffi
        'reset-clear-color! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reset-clear-color! (color)
            let
                color-atom $ unsafe-coerce atomClearColor ColorAtom
                host-color $ if (enum? color)
                  match (assert-type color 'Enum)
                    (:rgba r g b a)
                      js-object
                        :r $ assert-type r 'Number
                        :g $ assert-type g 'Number
                        :b $ assert-type b 'Number
                        :a $ assert-type a 'Number
                    _ $ raise $ str "|unknown color: " color
                  unsafe-coerce (to-js-data color) 'JsObject
              color-atom .reset host-color
          :examples $ []
          :ffi $ {} (:backend :js) (:target :browser)
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Dynamic
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns lagopus.util
          :require (|bottom-tip :default hud!)
            |@triadica/lagopus/lib/global :refer $ atomClearColor
