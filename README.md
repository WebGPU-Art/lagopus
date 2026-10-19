## Lagopus in Calcit

> tiny tool for drawing 3D shapes with WebGPU, wraps on [Lagopus.ts](https://github.com/Triadica/lagopus.ts).

- Demo https://r.tiye.me/Triadica/lagopus/
- Boilerplate https://github.com/Triadica/lagopus-workflow

![Dandelions, made previously with Triadica](https://pbs.twimg.com/media/FlUvndXaYAEK0iu?format=jpg)

### 开发与部署

本分支正在迁移到配对 Calcit/procs 0.30.1-alpha.5、Caps 0.1.1、Node.js 24 和 Yarn 4.18.0（编译器仍为预发布）：

```sh
caps --strict --ci
corepack yarn install --immutable
caps verify --toolchain
corepack yarn dev
```

另开终端运行 `corepack yarn watch` 可持续编译 Calcit。`corepack yarn build` 生成前端产物；`js-out/` 和 `dist/` 不纳入版本控制。源码使用 `calcit.cirru` 和 `deps.cirru`。

CI 为生产构建设置 `VITE_BASE_URL=https://cos-sh.tiye.me/WebGPU-Art/lagopus/`，通过 COS action 的 `public-base-url` 启用内置上传校验。需要 `COS_BUCKET`、`COS_SECRET_ID`、`COS_SECRET_KEY` 和原有 `rsync_private_key` secrets。保留原服务器部署路径；PR 仅检查和构建，不上传生产资源。

类型门禁使用 `calcit --check-only --all-defs --warn-dyn-method --format json`，并保留全部 18 个公开命名空间的检查。配置边界的 `:topology` 按下文约定检查为 Tag，再转为 WebGPU 所需字符串；watcher 和字符串拼接使用首选 API 名，不依赖 `calcit fix`。CI 使用可读的正式 Action release tag（并非不可变 SHA），上传验证仅由 COS action v1.2.0 执行。

此前 0.29 迁移通过全部 191 个严格定义、141 个公开定义和 JS/Vite 构建，
deprecated 与静态动态方法调用均为零。修正 external trait 的限定类型引用、Unit
返回，以及缓冲区的 `List<NumberBuffer>` 合同。`memo-object` 保留原 memof 缓存，
在渲染边界检查实际 `type-of` 为 `:js-object` 后使用正式 js-ffi 的受检入口，不声称异构缓存
已获得泛型证明；附着回归测试验证非宿主缓存结果被拒绝且仍然复用缓存。
没有新增 unsafe cast、放宽类型或校验脚本。此前的动态合同债务没有因此清零，当前数量见文末扫描；
WebGPU 实机、PR/main CI 和部署需分别验收。

本地候选暂沿用 `0.5.12` 版本字段，不代表改写了已发布的同名tag；只有完整验收后才选取新的正式版本。
候选对齐已发布的 Memof `0.0.39`，使下游可使用保留返回类型的
单参数 memo API，而无需混用两个版本的 Memof。Lagopus 自身的缓存、渲染和类型
边界不变；候选的发布状态以 GitHub Releases 为准。

本轮候选配对已发布 Calcit/procs **0.30.1-alpha.5**（仍为编译器预发布），并使用正式 Quaternion 0.2.14、Memof 0.0.39 和 js-ffi 0.2.3。npm Touch Control 最新仍只有 0.0.4-a1，保留并精确固定，不冒充正式版本。Memof Anchor `.deref` 已改为 Option，本项目当前只调用缓存 API；后续调用 Anchor 需要处理缺失值。

此前 77 处底层 Map 读取已改为公开 get/Option，保留 nil 回退、默认值、求值次数与状态路径。原有 Number/List/Map/Tag 配置和游标边界按实际数据解码，不增加默认空数据。本轮进一步检查纹理 List 容器并通过 js-cast 核对每个 Texture 的宿主成员；该检查保留对象身份与顺序，不证明 GPU 品牌或字段的深层数值合同。缓存的宿主返回值复用正式 js-ffi 检查入口，保留原拒绝消息与缓存调用，不新增 unsafe。

此前普通全定义 **191/191**、原 18 个公开命名空间 **141/141**、immutable 安装和 JS/Vite 生产 CDN 构建通过。两个真实源码边界表达式经实际生成 JS 回放：纹理对象身份/顺序、空 List、七类非法形状和五类非宿主缓存值通过；不初始化 GPU、应用存储或生产服务。

**完整 strict 仍失败，尚不能发布。** 正式 Memof 0.0.39 已消除两条依赖诊断，原缓存拒绝/复用测试保留且通过，没有修改测试期待、跳过缓存或修改共享依赖。alpha.5已消除原宿主数组返回推断诊断，本轮回调边界修正后最新完整 strict 仍有15条未证明V3断言，不把普通检查通过当作可发布。

本轮删除 6 个 helper 中 7 处由 list?/enum?/string? 分支已保证的冗余断言，直接使用同一个受检值，不新增重复 decoder。191/191 定义、原缓存测试、JS/Vite 生产构建与实际生成 helper 的浏览器回放通过：递归计数、String/Tag format、嵌套数值与属性写入顺序、真实颜色 atom、非法数字拒绝，V3 原样返回的 JS 身份仍保留。没有初始化 GPU、应用存储或生产服务，不能称已通过 WebGPU 实机验收。其余未证明 V3/回调断言没有机械替换成复制 decoder 或伪 Unit。

宿主数组返回推断 [calcit#2114](https://github.com/calcit-lang/calcit/issues/2114) 已随配对alpha.5实际通过本候选。V3分支仍原样返回对象；先前alpha.4的decode实验有JS身份变化，见仍开放的 [calcit#2154](https://github.com/calcit-lang/calcit/issues/2154)，没有把该实验混入真实V3分支或声称alpha.5已解决全部身份问题，不能为通过门禁改变身份或伪造回调。

折线构建器现在以 `Option<PolylinePrevious>` / `Option<MarkedPolylinePrevious>` 保存内部上一点状态，
不再用动态Map反复断言position/width/mark；八处生产断言被去除，外部width/mark真实检查为Number。
这不是公开options/writer合同已修复。原顶点顺序、宽度沿用、mark、break断段、状态更新先于writer
及V3引用身份均保留；没有顺手改动原算法的宽度传播或older字段行为。
直接调用这两个构建helper的使用者需改用对应typed Option状态Ref（初值为None，而非nil）；
普通comp-polylines/comp-polylines-marked调用形状未改变。该候选尚未发布，不改变现有正式tag。

当前全部193/193定义、原18个公开namespace的143/143定义、原缓存测试和两条新增折线回归共3/3
测试、immutable安装、JS/CDN构建通过。实际浏览器对照本轮改动前后生成的两个构建器，普通/带mark
各12个顶点完全一致，原V3对象身份及三份shader字符串相同；没有初始化GPU、应用存储或生产服务。
保留49处既有unsafe和75处schema Dynamic，不宣称已逐项清零；没有新增unsafe、放宽基线或改编译器。

shader宏不再打印编译期 `inline:` 消息，并去掉不再需要的 `:log` capability；文件读取和生成shader
字符串不变。JSON检查报告现在可直接解析，不必丢弃前缀日志。临时对照页/副本都在忽略目录，不新增
永久checker、测试框架或每项目重复验证脚本。

writer 边界不再用 `assert-type` 把 Map 中的任意值伪装成完整回调合同：
`object-writer` 调用前检查 `fn?`；两种折线 writer 保留缺失时的原警告，
实际调用前同样检查可调用。没有默认的伪回调或额外包装函数，回调和异常仍原样传递。
折线 collect 对已有 List 逐项检查 Enum，或检查单个 Enum，直接交给原构建器，
不复制或重新解码顶点与 V3。该检查只保证可调用/Enum 边界，不声称运行时证明任意函数的完整参数合同。

完整 strict workflow 的失败由20项降至15项，剩余均涉及真实 nominal V3边界；
所有193/193定义、原3/3附带业务测试及JS/Vite构建仍通过。既有忽略目录的浏览器回放验证
普通/带mark的实际生成回调、单顶点/批次、原异常身份，以及错误writer/批次元素拒绝；
正例在数据收集后主动抛出同一测试异常以停止于GPU创建前，没有mock renderer或初始化GPU。
这不是完整WebGPU应用验收，也不是全部V3合同已经解决。

候选保存在独立本地分支，未推送 PR、发版、上传或部署；原测试保留，无新增永久 checker、框架、compiler 规则、类型预算或 FFI 权限放宽。完整输入合同、WebGPU 实机、消费者与远端 fresh CI 仍需分别验收。

### APIs

`lagopus.alias/group` accepts nullable children, so conditional children such as
`group nil (if show? (comp-axis) js/null)` keep their original child indices. Use
explicit `js/null` for absent host children rather than Calcit's implicit `nil`.
Empty children
are skipped by traversal, not removed from the group's children array.

```cirru
:lagopus.alias :refer $ object

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
  :writer $ fn $ (write!)
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
    hint-fn $ {}
      :args $ [] 'quaternion.vector/V3
      :return 'quaternion.vector/V3
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
    hint-fn $ {}
      :args $ [] 'JsObject $ :: 'Fn
        {} (:args $ [] 'Enum) (:return 'Unit)
      :return 'Unit
    d! $ :: :tab :sphere

comp-slider
  {} $ :position ([] 0 0 0)
  fn (change on-slide)
    hint-fn $ {}
      :args $ [] 'quaternion.complex/Complex $ :: 'Fn
        {} (:args $ [] 'Enum) (:return 'Unit)
      :return 'Unit
    println |Slide change
    , &unit

comp-drag-point
  {}
    :position $ (get state :pos).unwrap-or nil
    :color $ [] 0.6 0.6 1.0 1.0
  fn (move d!)
    hint-fn $ {}
      :args $ [] 'quaternion.vector/V3 $ :: 'Fn
        {} (:args $ [] 'Enum) (:return 'Unit)
      :return 'Unit
    d! $ :: :state cursor $ assoc state :pos move
```

##### Stitch

```cirru
lagopus.comp.stitch :refer $ comp-stitch

comp-stitch $ {}
  :chars $ [] 0xf2dfea34 0xc3c4a59d 0x88737645
  :position $ [] 0 0 0
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
