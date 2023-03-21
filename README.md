## Lagopus binding fpr Calcit

> wraps on [Lagopus](https://github.com/Triadica/lagopus), to play with WebGPU.

Demo https://r.tiye.me/Triadica/lagopus.calcit .

### APIs

```cirru
lagopus.comp.curves :refer $ comp-curves

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

### Workflow

https://github.com/calcit-lang/respo-calcit-workflow

### Resources

Shader functions from https://gist.github.com/munrocket/236ed5ba7e409b8bdf1ff6eca5dcdc39

### License

MIT
