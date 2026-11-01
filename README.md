## Lagopus in Calcit

> tiny tool for drawing 3D shapes with WebGPU, wraps on [Lagopus.ts](https://github.com/Triadica/lagopus.ts).

- Demo https://r.tiye.me/Triadica/lagopus/
- Boilerplate https://github.com/Triadica/lagopus-workflow

![Dandelions, made previously with Triadica](https://pbs.twimg.com/media/FlUvndXaYAEK0iu?format=jpg)

### 0.5.15 候选：使用者影响

补齐 `lagopus.comp.curves/break-mark` 的准确 Enum 类型，值仍是 `:: :break`。
消费者传给 `List<Enum> -> Unit` writer 时，不再因未标注常量把整个列表推成 Dynamic。
组件参数、分段标记、顺序、几何、wire 格式和 JS 宿主行为不变；不改公开函数合同。
CLI/runtime 仍配对正式 0.32.1，原正式依赖图保持。新 tag 验收前不以 main/hash 代替。

该问题由 Play Rotor 实际 strict 检查发现；仅补一个真实常量 schema，不在消费者
添加断言／强转，也不扩展编译器 fix/proof。本轮执行原库门禁及真实消费者的
完整 strict；临时候选模块夹具不等于已发布依赖验收，发版后必须重新严格安装消费者。
既有 48 处宿主 unsafe 与 [City 遮挡问题 #36](https://github.com/WebGPU-Art/lagopus/issues/36)
未由这个类型补充修复，不宣称清零或全场景正确。

### 0.5.14：既有 0.32.1 迁移

本候选配对正式 Calcit CLI / `@calcit/procs` **0.32.1**。消费者需要同步工具链并重新生成 JS；正式 Git tag 发布前，不用 main 或提交号代替已发布依赖。

此前已迁移 quoted 类型表达式；本次只补齐 10 个真实常量的 String、Number、Canvas 和 Option<Enum> 标注。144 个定义的运行时代码、测试和公开函数合同不变。以下受检 V3 和 writer 合同沿用上一版迁移。

公开组件继续接收原有 options Map。V3 配置和 Plate transformer 返回值现在经过真实检查：正确的 Quaternion V3 保留对象身份；错误类型、匿名或不同名义 Enum 会更早报错，不把普通 Map 自动转换为 V3。`point-v3` 原有数字 List 转换入口保留。原默认值、几何顺序、回调单次执行和异常传播保持。

直接调用折线构建 helper 的高级使用者需传入 `Ref<Option<PolylinePrevious>>` / `Ref<Option<MarkedPolylinePrevious>>`，初值为对应类型的 None；普通 `comp-polylines` / `comp-polylines-marked` 调用形状不变。两个内部 writer 适配器执行原回调后返回 Unit；该内部返回值本来就不被 `object-writer` 消费，不要求外部 writer 伪造类型。

依赖固定为 js-ffi 0.2.9、Memof 0.0.43、Quaternion 0.2.19；npm Touch Control 保留已使用的精确 0.0.4-a1。Memof Anchor 返回 Option，本项目只使用其缓存 API。HUD 页面报错显示保留，错误消息使用真实字符串转换。

### 开发与部署

使用 Node.js 24、Yarn 4.18.0、Caps 0.1.1 和正式 Calcit 0.32.1：

```sh
caps --strict --ci
corepack yarn install --immutable
caps verify --toolchain
corepack yarn dev
```

另开终端运行 `corepack yarn watch` 持续编译。`corepack yarn build` 生成前端产物；源码使用 `calcit.cirru` / `deps.cirru`，`js-out/`、`dist/` 和 `.calcit/` 不入库。

CI 保留完整 strict、全定义、18 个公开命名空间及附带测试，不跳过 proof audit。生产构建使用 `VITE_BASE_URL=https://cos-sh.tiye.me/WebGPU-Art/lagopus/`，COS action 的 `public-base-url` 启用内置校验；服务器部署路径不变。PR 只检查和构建，不上传生产资源。需要原有 `COS_BUCKET`、`COS_SECRET_ID`、`COS_SECRET_KEY`、`rsync_private_key` secrets。

这次迁移没有清零全部类型债务：当前仍有 48 处既有 unsafe 宿主边界；schema Dynamic 从 76 降至 66（保留真实受检 V3 入口）。没有放宽类型门禁或质量基线；后续应继续按真实宿主合同收窄，而不是以数量取代代码检查。WebGPU 页面验收与 CI、部署状态分别确认。

### APIs

以下是浏览器组件用法片段，不是独立 native 程序。每段开头的命名空间引用行需并入应用的 `ns :require`；`demo-wgsl`、`width`、`state`、`cursor` 等由调用上下文提供。回调采用当前 `Fn` 类型写法，实际渲染需要浏览器 WebGPU 宿主。

`lagopus.alias/group` accepts nullable children, so conditional children such as
`group nil (if show? (comp-axis) js/null)` keep their original child indices. Use
explicit `js/null` for absent host children rather than Calcit's implicit `nil`.
Empty children
are skipped by traversal, not removed from the group's children array.

```cirru
lagopus.alias :refer $ object

object $ {}
  :shader demo-wgsl
  :topology :triangle-list
  :attrs-list $ []
    :: :float32x3 :position
    :: :float32x3 :color
  :data $ []
    :: :vertex (v3 0 0 0) (v3 1 0 0)
    :: :vertex (v3 100 0 0) (v3 0 1 0)
    :: :vertex (v3 0 100 0) (v3 0 0 1)
```

- `:shader` custom shader file string
- `:topology` topology symbol, `:triangle-list` or `:line-strip`
- `:attrs-list` list of attributes, first value providing type, second value is a name(history reason...)
- `:data` list of data, each data is a map with keys matching `:attrs-list`, nested list is supported
- optional `:indices` list of indices, each index is a number. nested list is supported
- `:get-params`, to add custom params with `uniform` buffer, for example `fn () (js-array 1 1 1 1)`, notice the values should obey [memory alignments](https://sotrh.github.io/learn-wgpu/showcase/alignment/#alignment-of-uniform-and-storage-buffers)

Alternatively, there's also `object-writer` which provides a writer API, which replaces `:data`:

```cirru
  :writer $ fn (write!)
    write! $ []
      :: :vertex (v3 1 1 1)
```

### Shader

Shader file expects 3 parts:

- params(could be empty)
- `vertex_main`, here you call `transform_perspective` to display point in 3d
- `fragment_main`

```wgsl
// to include `lagopus-perpective.wgsl` , provide function `transform_perspective`
#import lagopus::perspective

struct Params {
  _t: f32,
}

@group(0) @binding(0) var<uniform> params: Params;

// structure passing from Vertex to Fragment
struct VertexOut {
  @builtin(position) position: vec4f,
};

@vertex
fn vertex_main(
  @location(0) position: vec3f,
  // data added from attributes put here
) -> VertexOut {
  var output: VertexOut;
  let p = transform_perspective(position.xyz).point_position;
  let scale: f32 = 0.002;

  output.position = vec4(p.xyz * scale, 1.0);
  return output;
}

@fragment
fn fragment_main(vtx_out: VertexOut) -> @location(0) vec4f {
  return vec4f(0.0, 0.0, 0.0, 1.0);
}
```

##### Builtin functions

`#import lagopus::perspective`

- `fn transform_perspective(p: vec3f) -> PointResult`

`#import lagopus::colors`

- `fn hsl2rgb(hsl: vec3f) -> vec3f`
- `fn hsl(h: f32, s: f32, l: f32) -> vec3f`

`#import lagopus::rand`

- `fn rand(n: f32) -> f32`
- `fn rand_balanced(n: f32) -> f32`
- `fn noise(p: f32) -> f32`
- `fn rand2(n: vec2<f32>) -> f32`
- `fn noise2(n: vec2<f32>) -> f32`

`#import lagopus::simplex`

- `fn simplexNoise2(v: vec2<f32>) -> f32`

`#import lagopus::hsluv`

- `fn hsluvToRgb(tuple: vec3f) -> vec3f` based on 360 and 100

### Components

##### Curves

```cirru
lagopus.comp.curves :refer $ comp-curves comp-polylines break-mark

comp-curves $ {} (; :topology :line-strip)
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
```

Another way of defining lines is `comp-polylines` that seperate segments with `:: :break`s.
It does not require "flatterned" list so is supposed to be a little performant.

> note that `: vertex p` is a short form for `:: :vertex p` since Calcit `0.7.2` .

```cirru
comp-polylines $ {} (; :topology :line-strip)
  :writer $ fn (write!)
    write! $ []
      : vertex ([] 0 0 0) width
      : vertex ([] 100 100 0) width
      , break-mark
      : vertex ([] 0 0 10) width
      : vertex ([] 200 0 10) width
      : vertex ([] 200 20 0) width
      : vertex ([] 100 40 0) width
      : vertex ([] 100 20 200) width
      , break-mark
```

also if you want an extra mark for controlling colors:

```cirru
comp-polylines-marked $ {} (; :topology :line-strip)
  :writer $ fn (write!)
    write! $ []
      : vertex ([] 0 0 0) width 0
      : vertex ([] 100 100 0) width 0
      , break-mark
      : vertex ([] 0 0 10) width 2
      : vertex ([] 200 0 10) width 2
      : vertex ([] 200 20 0) width 2
      : vertex ([] 100 40 0) width 2
      : vertex ([] 100 20 200) width 2
      , break-mark
```

##### Spots

```cirru
lagopus.comp.spots :refer $ comp-spots comp-bubbles

comp-spots $ {} (; :topology :line-strip)
  :radius 6
  :vertex-count 8
  :shift 12
  :points $ -> (range 80)
    map $ fn (idx)
      let
          r $ * idx 4
        [] r
          * r $ cos (* 0.1129 idx)
          * r $ sin (* 0.123 idx)

comp-bubbles $ {}
  :bubbles $ -> (range 600)
    map $ fn (idx)
      [] (rand-shift 0 area) (rand-shift 0 area) (rand-shift 0 area) (+ 6 $ rand 120)
```

##### Axis

```cirru
lagopus.comp.curves :refer $ comp-axis

comp-axis $ Option :some $ {} (:n 20)
  :unit 20

; use default options
comp-axis $ Option :none
```

##### Cube

```cirru
lagopus.comp.cube :refer $ comp-cube

comp-cube $ {}
  :position $ v3 40 0 0
  :radius 40
```

##### Sphere

```cirru
lagopus.comp.sphere :refer $ comp-sphere

comp-sphere $ {} (; :topology :line-strip)
  :iteration 4
  :radius 160
```

##### Plate

```cirru
lagopus.comp.plate :refer $ comp-plate

comp-plate $ {} (; :topology :line-strip)
  :iteration 20
  :radius 160
  :color $ [] 0.04 0.8 0.6
  :transformer $ fn (i)
    hint-fn $ Fn quaternion.vector/V3 (-> quaternion.vector/V3)
    v+ i $ v3 0 0 -10
  ; :x-direction $ v3 1 0 0
  ; :y-direction $ v3 0 1 0
  :chromatism 0.14
```

##### Controls

```cirru
lagopus.comp.button :refer $ comp-button comp-slider comp-drag-point

comp-button
  {}
    :position $ v3 240 260 0
    :color $ [] 0.2 0.9 0.6 1
    :size 20
  fn (e d!)
    hint-fn $ Fn JsObject (Fn Enum (-> Unit)) (-> Unit)
    d! $ :: :tab :sphere

comp-slider
  {} $ :position ([] 0 0 0)
  fn (change on-slide)
    hint-fn $ Fn quaternion.complex/Complex (Fn Enum (-> Unit)) (-> Unit)
    println |Slide change
    , &unit

comp-drag-point
  {}
    :position $ (get state :pos).unwrap-or nil
    :color $ [] 0.6 0.6 1.0 1.0
  fn (move d!)
    hint-fn $ Fn quaternion.vector/V3 (Fn Enum (-> Unit)) (-> Unit)
    d! $ :: :state cursor $ assoc state :pos move
```

##### Stitch

```cirru
lagopus.comp.stitch :refer $ comp-stitch

comp-stitch $ {}
  :chars $ [] 0xf2dfea34 0xc3c4a59d 0x88737645
  :position $ v3 0 0 0
```

### Cursor

```cirru
lagopus.cursor :refer $ update-states >>
```

Math functions in `lagopus.math`

- `fibo-grid-range total` create a list of points constructing Fibonacci Sphere
- `rotate-3d origin axis-0 angle p` rotate point `p` around `axis-0`
- `rotate-3d-fn origin axis-0 angle` create a function to rotate point p

### Gamepad Controls

![Gamepad](./assets/lagopus.png)

### Resources

Shader functions from https://gist.github.com/munrocket/236ed5ba7e409b8bdf1ff6eca5dcdc39

### License

MIT
