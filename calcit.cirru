
{}
  :configs $ {} (:compact-output? true) (:extension |.cljs) (:init-fn |lagopus.main/main!) (:output |src) (:port 6001) (:reload-fn |lagopus.main/reload!) (:storage-key |calcit.cirru) (:version |0.0.1)
    :modules $ [] |memof/ |quaternion/
  :entries $ {}
  :ir $ {} (:package |lagopus)
    :files $ {}
      |lagopus.alias $ {}
        :configs $ {}
        :defs $ {}
          |convert-records-data $ {} (:at 1677525331213) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677525331213) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677525331213) (:by |rJG4IHzWf) (:text |convert-records-data) (:type :leaf)
              |h $ {} (:at 1677525331213) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677525337848) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
                  |X $ {} (:at 1677525883869) (:by |rJG4IHzWf) (:text |fields) (:type :leaf)
                  |h $ {} (:at 1677605217993) (:by |rJG4IHzWf) (:text |write!) (:type :leaf)
              |l $ {} (:at 1677525366831) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677525368353) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                  |b $ {} (:at 1677525368735) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677525371214) (:by |rJG4IHzWf) (:text |list?) (:type :leaf)
                      |b $ {} (:at 1677525371882) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
                  |h $ {} (:at 1677525375918) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677525383375) (:by |rJG4IHzWf) (:text |&doseq) (:type :leaf)
                      |b $ {} (:at 1677525384075) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677525386273) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                          |b $ {} (:at 1677525388107) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
                      |h $ {} (:at 1677525388968) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677525591669) (:by |rJG4IHzWf) (:text |convert-records-data) (:type :leaf)
                          |b $ {} (:at 1677525397463) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                          |e $ {} (:at 1677525886510) (:by |rJG4IHzWf) (:text |fields) (:type :leaf)
                          |h $ {} (:at 1677605219821) (:by |rJG4IHzWf) (:text |write!) (:type :leaf)
                  |j $ {} (:at 1677605260330) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677605260330) (:by |rJG4IHzWf) (:text |&doseq) (:type :leaf)
                      |b $ {} (:at 1677605260330) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677605260330) (:by |rJG4IHzWf) (:text |k) (:type :leaf)
                          |b $ {} (:at 1677605260330) (:by |rJG4IHzWf) (:text |fields) (:type :leaf)
                      |e $ {} (:at 1677605284602) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677605285121) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                          |b $ {} (:at 1677605285398) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677605285548) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677605288069) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                  |b $ {} (:at 1677605292961) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677950988386) (:by |rJG4IHzWf) (:text |&map:get) (:type :leaf)
                                      |b $ {} (:at 1677605292961) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
                                      |h $ {} (:at 1677605292961) (:by |rJG4IHzWf) (:text |k) (:type :leaf)
                          |h $ {} (:at 1677605296584) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677605297709) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                              |b $ {} (:at 1677605298339) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677605299018) (:by |rJG4IHzWf) (:text |list?) (:type :leaf)
                                  |b $ {} (:at 1677605299879) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                              |h $ {} (:at 1677605301220) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677605304245) (:by |rJG4IHzWf) (:text |&doseq) (:type :leaf)
                                  |b $ {} (:at 1677605304911) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677605305463) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                                      |b $ {} (:at 1677605308206) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
                                  |h $ {} (:at 1677605310028) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677605311169) (:by |rJG4IHzWf) (:text |write!) (:type :leaf)
                                      |b $ {} (:at 1677605312196) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                              |l $ {} (:at 1677605313369) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677605334020) (:by |rJG4IHzWf) (:text |write!) (:type :leaf)
                                  |b $ {} (:at 1677605334645) (:by |rJG4IHzWf) (:text |item) (:type :leaf)
          |count-recursive $ {} (:at 1677604931849) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677604931849) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677604931849) (:by |rJG4IHzWf) (:text |count-recursive) (:type :leaf)
              |h $ {} (:at 1677604931849) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677605353794) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
              |l $ {} (:at 1677604933761) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677604934135) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                  |b $ {} (:at 1677604934413) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677604935843) (:by |rJG4IHzWf) (:text |list?) (:type :leaf)
                      |b $ {} (:at 1677604936723) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                  |h $ {} (:at 1677604937931) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677604941142) (:by |rJG4IHzWf) (:text |reduce) (:type :leaf)
                      |X $ {} (:at 1677604948141) (:by |rJG4IHzWf) (:text |xs) (:type :leaf)
                      |b $ {} (:at 1677604944414) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                      |h $ {} (:at 1677604950179) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677604950470) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                          |b $ {} (:at 1677604950990) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677604955635) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                              |b $ {} (:at 1677604957081) (:by |rJG4IHzWf) (:text |y) (:type :leaf)
                          |h $ {} (:at 1677604960358) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677604961530) (:by |rJG4IHzWf) (:text |&+) (:type :leaf)
                              |b $ {} (:at 1677604963465) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                              |h $ {} (:at 1677604964862) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677604967029) (:by |rJG4IHzWf) (:text |count-recursive) (:type :leaf)
                                  |b $ {} (:at 1677604967589) (:by |rJG4IHzWf) (:text |y) (:type :leaf)
                  |l $ {} (:at 1677604971887) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
          |group $ {} (:at 1677524648144) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677524648144) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677524648144) (:by |rJG4IHzWf) (:text |group) (:type :leaf)
              |h $ {} (:at 1677524648144) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677524737200) (:by |rJG4IHzWf) (:text |a) (:type :leaf)
                  |b $ {} (:at 1677524739246) (:by |rJG4IHzWf) (:text |&) (:type :leaf)
                  |h $ {} (:at 1677524741900) (:by |rJG4IHzWf) (:text |children) (:type :leaf)
              |l $ {} (:at 1677524744753) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1678027206900) (:by |rJG4IHzWf) (:text |lagopus/group) (:type :leaf)
                  |b $ {} (:at 1677524759879) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                  |e $ {} (:at 1677524767075) (:by |rJG4IHzWf) (:text |&) (:type :leaf)
                  |h $ {} (:at 1677524765874) (:by |rJG4IHzWf) (:text |children) (:type :leaf)
          |object $ {} (:at 1677524651069) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677524651069) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677524651069) (:by |rJG4IHzWf) (:text |object) (:type :leaf)
              |h $ {} (:at 1677524651069) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677524776169) (:by |rJG4IHzWf) (:text |options) (:type :leaf)
              |l $ {} (:at 1677525816340) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1677525817814) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                  |L $ {} (:at 1677525818091) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1677525836196) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677525842920) (:by |rJG4IHzWf) (:text |attrs-list) (:type :leaf)
                          |b $ {} (:at 1677525844750) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677525844750) (:by |rJG4IHzWf) (:text |&map:get) (:type :leaf)
                              |b $ {} (:at 1677525844750) (:by |rJG4IHzWf) (:text |options) (:type :leaf)
                              |h $ {} (:at 1677525844750) (:by |rJG4IHzWf) (:text |:attrs-list) (:type :leaf)
                      |T $ {} (:at 1677525818265) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677525851587) (:by |rJG4IHzWf) (:text |fields) (:type :leaf)
                          |b $ {} (:at 1677525828207) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677525829261) (:by |rJG4IHzWf) (:text |map) (:type :leaf)
                              |X $ {} (:at 1677525855035) (:by |rJG4IHzWf) (:text |attrs-list) (:type :leaf)
                              |Z $ {} (:at 1677525855397) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677525856303) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                  |b $ {} (:at 1677525856563) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677525856630) (:by |rJG4IHzWf) (:text |o) (:type :leaf)
                                  |h $ {} (:at 1677525857851) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677525863730) (:by |rJG4IHzWf) (:text |&map:get) (:type :leaf)
                                      |b $ {} (:at 1677525871050) (:by |rJG4IHzWf) (:text |o) (:type :leaf)
                                      |h $ {} (:at 1677525871971) (:by |rJG4IHzWf) (:text |:field) (:type :leaf)
                      |V $ {} (:at 1677604926413) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677604927051) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
                          |b $ {} (:at 1677604928893) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677604928893) (:by |rJG4IHzWf) (:text |&map:get) (:type :leaf)
                              |b $ {} (:at 1677604928893) (:by |rJG4IHzWf) (:text |options) (:type :leaf)
                              |h $ {} (:at 1677604928893) (:by |rJG4IHzWf) (:text |:data) (:type :leaf)
                      |X $ {} (:at 1677604912794) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677604983103) (:by |rJG4IHzWf) (:text |vertices-size) (:type :leaf)
                          |b $ {} (:at 1677604914906) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677604922064) (:by |rJG4IHzWf) (:text |count-recursive) (:type :leaf)
                              |b $ {} (:at 1677604930665) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
                      |Z $ {} (:at 1677605712691) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677605717426) (:by |rJG4IHzWf) (:text |buffer-size) (:type :leaf)
                          |b $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677605988157) (:by |rJG4IHzWf) (:text |&*) (:type :leaf)
                              |b $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:text |reduce) (:type :leaf)
                                  |b $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:text |attrs-list) (:type :leaf)
                                  |h $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                  |l $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                      |b $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                                          |b $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                                      |h $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:text |&+) (:type :leaf)
                                          |b $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:text |acc) (:type :leaf)
                                          |h $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:text |&map:get) (:type :leaf)
                                              |b $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                                              |h $ {} (:at 1677605718777) (:by |rJG4IHzWf) (:text |:size) (:type :leaf)
                              |h $ {} (:at 1677605722410) (:by |rJG4IHzWf) (:text |vertices-size) (:type :leaf)
                      |b $ {} (:at 1677604841406) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677604991019) (:by |rJG4IHzWf) (:text |vertices) (:type :leaf)
                          |b $ {} (:at 1677604994769) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677604995356) (:by |rJG4IHzWf) (:text |new) (:type :leaf)
                              |b $ {} (:at 1677605000017) (:by |rJG4IHzWf) (:text |js/Float32Array) (:type :leaf)
                              |h $ {} (:at 1677605883611) (:by |rJG4IHzWf) (:text |buffer-size) (:type :leaf)
                      |h $ {} (:at 1677605047957) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677605054549) (:by |rJG4IHzWf) (:text |*idx) (:type :leaf)
                          |b $ {} (:at 1677605054970) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677605065204) (:by |rJG4IHzWf) (:text |atom) (:type :leaf)
                              |b $ {} (:at 1677605065484) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                      |l $ {} (:at 1677605066681) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677605070377) (:by |rJG4IHzWf) (:text |write!) (:type :leaf)
                          |b $ {} (:at 1677605071184) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677605071439) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                              |b $ {} (:at 1677605071802) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677605074204) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                              |h $ {} (:at 1677605075172) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677605076508) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                  |b $ {} (:at 1677605076819) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677605077285) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677605078416) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                          |b $ {} (:at 1677605084412) (:by |rJG4IHzWf) (:text |@*idx) (:type :leaf)
                                  |h $ {} (:at 1677605086193) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677605101068) (:by |rJG4IHzWf) (:text |aset) (:type :leaf)
                                      |b $ {} (:at 1677605104078) (:by |rJG4IHzWf) (:text |vertices) (:type :leaf)
                                      |h $ {} (:at 1677605105078) (:by |rJG4IHzWf) (:text |idx) (:type :leaf)
                                      |l $ {} (:at 1677605106872) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                                  |l $ {} (:at 1677605109309) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677605111596) (:by |rJG4IHzWf) (:text |swap!) (:type :leaf)
                                      |b $ {} (:at 1677605113777) (:by |rJG4IHzWf) (:text |*idx) (:type :leaf)
                                      |h $ {} (:at 1677605114384) (:by |rJG4IHzWf) (:text |inc) (:type :leaf)
                  |X $ {} (:at 1677605127764) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677605127764) (:by |rJG4IHzWf) (:text |convert-records-data) (:type :leaf)
                      |b $ {} (:at 1677605127764) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677605127764) (:by |rJG4IHzWf) (:text |&map:get) (:type :leaf)
                          |b $ {} (:at 1677605127764) (:by |rJG4IHzWf) (:text |options) (:type :leaf)
                          |h $ {} (:at 1677605127764) (:by |rJG4IHzWf) (:text |:data) (:type :leaf)
                      |h $ {} (:at 1677605127764) (:by |rJG4IHzWf) (:text |fields) (:type :leaf)
                      |l $ {} (:at 1677605132142) (:by |rJG4IHzWf) (:text |write!) (:type :leaf)
                  |a $ {} (:at 1677605914922) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677605940809) (:by |rJG4IHzWf) (:text |assert) (:type :leaf)
                      |b $ {} (:at 1677605941886) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1677605944649) (:by |rJG4IHzWf) (:text |&=) (:type :leaf)
                          |T $ {} (:at 1677605927614) (:by |rJG4IHzWf) (:text |buffer-size) (:type :leaf)
                          |b $ {} (:at 1677605946841) (:by |rJG4IHzWf) (:text |@*idx) (:type :leaf)
                      |h $ {} (:at 1677605978080) (:by |rJG4IHzWf) (:text "|\"buffer size guessed correctly") (:type :leaf)
                  |aT $ {} (:at 1678729202699) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1678729393396) (:by |rJG4IHzWf) (:text |;) (:type :leaf)
                      |T $ {} (:at 1678729202699) (:by |rJG4IHzWf) (:text |js/console.log) (:type :leaf)
                      |b $ {} (:at 1678729202699) (:by |rJG4IHzWf) (:text |vertices-size) (:type :leaf)
                      |h $ {} (:at 1678729202699) (:by |rJG4IHzWf) (:text |buffer-size) (:type :leaf)
                      |l $ {} (:at 1678729202699) (:by |rJG4IHzWf) (:text |vertices) (:type :leaf)
                  |b $ {} (:at 1677604799442) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677604799442) (:by |rJG4IHzWf) (:text |createRenderer) (:type :leaf)
                      |b $ {} (:at 1677692530671) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1677692531324) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                          |L $ {} (:at 1677692531962) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677692531962) (:by |rJG4IHzWf) (:text |&map:get) (:type :leaf)
                              |b $ {} (:at 1677692531962) (:by |rJG4IHzWf) (:text |options) (:type :leaf)
                              |h $ {} (:at 1677692531962) (:by |rJG4IHzWf) (:text |:shader) (:type :leaf)
                          |T $ {} (:at 1677692388980) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1677692392921) (:by |rJG4IHzWf) (:text |.!replace) (:type :leaf)
                              |b $ {} (:at 1677692401400) (:by |rJG4IHzWf) (:text "|\"{{simplex}}") (:type :leaf)
                              |h $ {} (:at 1677692409679) (:by |rJG4IHzWf) (:text |wgsl-simplex) (:type :leaf)
                          |b $ {} (:at 1677692533364) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677692535364) (:by |rJG4IHzWf) (:text |.!replace) (:type :leaf)
                              |b $ {} (:at 1677692542697) (:by |rJG4IHzWf) (:text "|\"{{perspective}}") (:type :leaf)
                              |h $ {} (:at 1677692546826) (:by |rJG4IHzWf) (:text |wgsl-perspective) (:type :leaf)
                      |h $ {} (:at 1677691430341) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1677691432405) (:by |rJG4IHzWf) (:text |turn-string) (:type :leaf)
                          |T $ {} (:at 1677604820296) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677604820296) (:by |rJG4IHzWf) (:text |&map:get) (:type :leaf)
                              |b $ {} (:at 1677604820296) (:by |rJG4IHzWf) (:text |options) (:type :leaf)
                              |h $ {} (:at 1677604820296) (:by |rJG4IHzWf) (:text |:topology) (:type :leaf)
                      |l $ {} (:at 1677604825713) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677604825713) (:by |rJG4IHzWf) (:text |to-js-data) (:type :leaf)
                          |b $ {} (:at 1677604825713) (:by |rJG4IHzWf) (:text |attrs-list) (:type :leaf)
                      |o $ {} (:at 1677605197705) (:by |rJG4IHzWf) (:text |vertices-size) (:type :leaf)
                      |q $ {} (:at 1677605199253) (:by |rJG4IHzWf) (:text |vertices) (:type :leaf)
          |wgsl-perspective $ {} (:at 1677692547549) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677692547549) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1677692547549) (:by |rJG4IHzWf) (:text |wgsl-perspective) (:type :leaf)
              |h $ {} (:at 1677692547549) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677692553559) (:by |rJG4IHzWf) (:text |inline-shader) (:type :leaf)
                  |b $ {} (:at 1677692557136) (:by |rJG4IHzWf) (:text "|\"perspective") (:type :leaf)
          |wgsl-simplex $ {} (:at 1677692410281) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677692410281) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1677692410281) (:by |rJG4IHzWf) (:text |wgsl-simplex) (:type :leaf)
              |h $ {} (:at 1677692410281) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677692486626) (:by |rJG4IHzWf) (:text |inline-shader) (:type :leaf)
                  |b $ {} (:at 1677692489112) (:by |rJG4IHzWf) (:text "|\"simplex") (:type :leaf)
        :ns $ {} (:at 1677524644560) (:by |rJG4IHzWf) (:type :expr)
          :data $ {}
            |T $ {} (:at 1677524644560) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
            |b $ {} (:at 1677524644560) (:by |rJG4IHzWf) (:text |lagopus.alias) (:type :leaf)
            |h $ {} (:at 1677524688054) (:by |rJG4IHzWf) (:type :expr)
              :data $ {}
                |T $ {} (:at 1677524689918) (:by |rJG4IHzWf) (:text |:require) (:type :leaf)
                |h $ {} (:at 1677524690143) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1678027173099) (:by |rJG4IHzWf) (:text "|\"@triadica/lagopus") (:type :leaf)
                    |b $ {} (:at 1677604793708) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1677604794051) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1677604796202) (:by |rJG4IHzWf) (:text |createRenderer) (:type :leaf)
                |j $ {} (:at 1677524690143) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1678027173099) (:by |rJG4IHzWf) (:text "|\"@triadica/lagopus") (:type :leaf)
                    |b $ {} (:at 1678027181656) (:by |rJG4IHzWf) (:text |:as) (:type :leaf)
                    |h $ {} (:at 1678027184530) (:by |rJG4IHzWf) (:text |lagopus) (:type :leaf)
                |l $ {} (:at 1677692491341) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1677692505336) (:by |rJG4IHzWf) (:text |lagopus.config) (:type :leaf)
                    |b $ {} (:at 1677692494459) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1677692494667) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1677692496829) (:by |rJG4IHzWf) (:text |inline-shader) (:type :leaf)
      |lagopus.comp.button $ {}
        :configs $ {}
        :defs $ {}
          |comp-button $ {} (:at 1677931948464) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677931948464) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677931948464) (:by |rJG4IHzWf) (:text |comp-button) (:type :leaf)
              |h $ {} (:at 1677931948464) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677931999836) (:by |rJG4IHzWf) (:text |props) (:type :leaf)
                  |b $ {} (:at 1677932003419) (:by |rJG4IHzWf) (:text |on-click) (:type :leaf)
              |l $ {} (:at 1677932004554) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677932021950) (:by |rJG4IHzWf) (:text |compButton) (:type :leaf)
                  |b $ {} (:at 1677932022934) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677932025365) (:by |rJG4IHzWf) (:text |to-js-data) (:type :leaf)
                      |b $ {} (:at 1677932026883) (:by |rJG4IHzWf) (:text |props) (:type :leaf)
                  |h $ {} (:at 1677932030121) (:by |rJG4IHzWf) (:text |on-click) (:type :leaf)
        :ns $ {} (:at 1677931942333) (:by |rJG4IHzWf) (:type :expr)
          :data $ {}
            |T $ {} (:at 1677931942333) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
            |b $ {} (:at 1677931942333) (:by |rJG4IHzWf) (:text |lagopus.comp.button) (:type :leaf)
            |h $ {} (:at 1677932665817) (:by |rJG4IHzWf) (:type :expr)
              :data $ {}
                |D $ {} (:at 1677932666815) (:by |rJG4IHzWf) (:text |:require) (:type :leaf)
                |T $ {} (:at 1677932009141) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1678026958737) (:by |rJG4IHzWf) (:text "|\"@triadica/lagopus") (:type :leaf)
                    |b $ {} (:at 1677932017710) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1677932017909) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1677932020089) (:by |rJG4IHzWf) (:text |compButton) (:type :leaf)
      |lagopus.comp.container $ {}
        :configs $ {}
        :defs $ {}
          |color-default $ {} (:at 1677950743954) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677950745036) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |X $ {} (:at 1677950780195) (:by |rJG4IHzWf) (:text |color-default) (:type :leaf)
              |h $ {} (:at 1677950743954) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1677950753003) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                  |T $ {} (:at 1677950743954) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                  |b $ {} (:at 1677950743954) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                  |h $ {} (:at 1677950743954) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                  |l $ {} (:at 1677950743954) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
          |comp-city $ {} (:at 1678726924731) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1678726924731) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1678726924731) (:by |rJG4IHzWf) (:text |comp-city) (:type :leaf)
              |e $ {} (:at 1678726932122) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
              |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |object) (:type :leaf)
                  |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                      |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |:shader) (:type :leaf)
                          |b $ {} (:at 1678726953645) (:by |rJG4IHzWf) (:text |city-wgsl) (:type :leaf)
                      |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |:topology) (:type :leaf)
                          |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |do) (:type :leaf)
                              |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |:line-strip) (:type :leaf)
                              |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |:triangle-list) (:type :leaf)
                      |l $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |:attrs-list) (:type :leaf)
                          |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                              |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |:field) (:type :leaf)
                                      |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                  |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |:format) (:type :leaf)
                                      |b $ {} (:at 1678729612594) (:by |rJG4IHzWf) (:text "|\"float32x2") (:type :leaf)
                                  |l $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |:size) (:type :leaf)
                                      |b $ {} (:at 1678729615656) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                              |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |:field) (:type :leaf)
                                      |b $ {} (:at 1678730657205) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                  |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |:format) (:type :leaf)
                                      |b $ {} (:at 1678811886614) (:by |rJG4IHzWf) (:text "|\"float32") (:type :leaf)
                                  |l $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |:size) (:type :leaf)
                                      |b $ {} (:at 1678730661686) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                              |l $ {} (:at 1678729625115) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1678729637037) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1678729637442) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1678729641645) (:by |rJG4IHzWf) (:text |:field) (:type :leaf)
                                      |b $ {} (:at 1678730490950) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                  |h $ {} (:at 1678729643876) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1678729645747) (:by |rJG4IHzWf) (:text |:format) (:type :leaf)
                                      |b $ {} (:at 1678811888415) (:by |rJG4IHzWf) (:text "|\"float32") (:type :leaf)
                                  |l $ {} (:at 1678729649601) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1678729650619) (:by |rJG4IHzWf) (:text |:size) (:type :leaf)
                                      |b $ {} (:at 1678729650975) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                      |o $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |:data) (:type :leaf)
                          |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                              |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |size) (:type :leaf)
                                      |b $ {} (:at 1678814715844) (:by |rJG4IHzWf) (:text |40) (:type :leaf)
                                  |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |d) (:type :leaf)
                                      |b $ {} (:at 1678814285456) (:by |rJG4IHzWf) (:text |160) (:type :leaf)
                              |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                  |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |range-bothway) (:type :leaf)
                                      |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |size) (:type :leaf)
                                  |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |map) (:type :leaf)
                                      |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                          |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                                          |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                              |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |range-bothway) (:type :leaf)
                                                  |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |size) (:type :leaf)
                                              |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |map) (:type :leaf)
                                                  |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                      |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |y) (:type :leaf)
                                                      |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                                          |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                                                                  |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |&*) (:type :leaf)
                                                                      |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |d) (:type :leaf)
                                                                      |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                                                              |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |y0) (:type :leaf)
                                                                  |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |&*) (:type :leaf)
                                                                      |b $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |d) (:type :leaf)
                                                                      |h $ {} (:at 1678726925986) (:by |rJG4IHzWf) (:text |y) (:type :leaf)
                                                              |l $ {} (:at 1678730595568) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678730596851) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                  |b $ {} (:at 1678730597779) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730597966) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                      |b $ {} (:at 1678730599231) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                                                                      |h $ {} (:at 1678730600142) (:by |rJG4IHzWf) (:text |y0) (:type :leaf)
                                                          |h $ {} (:at 1678729825550) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1678729826036) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                              |b $ {} (:at 1678729827126) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678729831673) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |b $ {} (:at 1678729833115) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678729833509) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678729833906) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678729835960) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730603785) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678729838412) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730666681) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678730675464) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |l $ {} (:at 1678730705089) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730705089) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813331476) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                  |h $ {} (:at 1678729833115) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678729833509) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678729833906) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678729835960) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730605456) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678729838412) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730668459) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678730677217) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |l $ {} (:at 1678730702720) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730702720) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678811686493) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                                  |l $ {} (:at 1678729833115) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678729833509) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678729833906) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678729835960) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730607235) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678729838412) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730669410) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678730680185) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |l $ {} (:at 1678730700688) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730700688) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813332886) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                              |h $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |o $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730609433) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730670383) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678730682364) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |l $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813336859) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                  |q $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730612529) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |e $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813337882) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                                  |s $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730614200) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                      |e $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813338810) (:by |rJG4IHzWf) (:text |3) (:type :leaf)
                                                              |l $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |o $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730609433) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730670383) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813579041) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                                      |l $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813327256) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                  |q $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730612529) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813580025) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                                      |e $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678811691092) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                                  |s $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730614200) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813580510) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                                      |e $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813341616) (:by |rJG4IHzWf) (:text |5) (:type :leaf)
                                                              |o $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |o $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730609433) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730670383) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813581555) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                                      |l $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813327256) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                  |q $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730612529) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813582302) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                                      |e $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813350969) (:by |rJG4IHzWf) (:text |5) (:type :leaf)
                                                                  |s $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730614200) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813582973) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                                      |e $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813351958) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                                                              |q $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |o $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730609433) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730670383) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813584397) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                                      |l $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813362152) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                                  |q $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730612529) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813585209) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                                      |e $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813363216) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                                  |s $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730614200) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813585777) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                                      |e $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813364843) (:by |rJG4IHzWf) (:text |6) (:type :leaf)
                                                              |s $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |o $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730609433) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730670383) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813634399) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                                      |l $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813362152) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                                                  |q $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730612529) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813636058) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                                      |e $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813371629) (:by |rJG4IHzWf) (:text |6) (:type :leaf)
                                                                  |s $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730614200) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813637317) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                                      |e $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813372356) (:by |rJG4IHzWf) (:text |5) (:type :leaf)
                                                              |t $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |o $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730609433) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730670383) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813589798) (:by |rJG4IHzWf) (:text |3) (:type :leaf)
                                                                      |l $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813383631) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                                                                  |q $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730612529) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813590518) (:by |rJG4IHzWf) (:text |3) (:type :leaf)
                                                                      |e $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813384788) (:by |rJG4IHzWf) (:text |3) (:type :leaf)
                                                                  |s $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730614200) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813591217) (:by |rJG4IHzWf) (:text |3) (:type :leaf)
                                                                      |e $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813385925) (:by |rJG4IHzWf) (:text |6) (:type :leaf)
                                                              |u $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |o $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730609433) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730670383) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813641644) (:by |rJG4IHzWf) (:text |3) (:type :leaf)
                                                                      |l $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813395626) (:by |rJG4IHzWf) (:text |3) (:type :leaf)
                                                                  |q $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730612529) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813640097) (:by |rJG4IHzWf) (:text |3) (:type :leaf)
                                                                      |e $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813397035) (:by |rJG4IHzWf) (:text |7) (:type :leaf)
                                                                  |s $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730614200) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813640760) (:by |rJG4IHzWf) (:text |3) (:type :leaf)
                                                                      |e $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813385925) (:by |rJG4IHzWf) (:text |6) (:type :leaf)
                                                              |v $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |o $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730609433) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730670383) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813596046) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                                                                      |l $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813404754) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                                                  |q $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730612529) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813596825) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                                                                      |e $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813405735) (:by |rJG4IHzWf) (:text |3) (:type :leaf)
                                                                  |s $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730614200) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813597531) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                                                                      |e $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813406372) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                                                              |w $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |o $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730609433) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730670383) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813646235) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                                                                      |l $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813414036) (:by |rJG4IHzWf) (:text |3) (:type :leaf)
                                                                  |q $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730612529) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813647408) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                                                                      |e $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813414963) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                                                                  |s $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730614200) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813648194) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                                                                      |e $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813415821) (:by |rJG4IHzWf) (:text |7) (:type :leaf)
                                                              |x $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |o $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730609433) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730670383) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813611305) (:by |rJG4IHzWf) (:text |5) (:type :leaf)
                                                                      |l $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813420982) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                                                                  |q $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730612529) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813611870) (:by |rJG4IHzWf) (:text |5) (:type :leaf)
                                                                      |e $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813421735) (:by |rJG4IHzWf) (:text |5) (:type :leaf)
                                                                  |s $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730614200) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813612641) (:by |rJG4IHzWf) (:text |5) (:type :leaf)
                                                                      |e $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813423442) (:by |rJG4IHzWf) (:text |6) (:type :leaf)
                                                              |y $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |o $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730609433) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |h $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730670383) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813649406) (:by |rJG4IHzWf) (:text |5) (:type :leaf)
                                                                      |l $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730697539) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813420982) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                                                                  |q $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730612529) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730692688) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813650147) (:by |rJG4IHzWf) (:text |5) (:type :leaf)
                                                                      |e $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730632052) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813430430) (:by |rJG4IHzWf) (:text |6) (:type :leaf)
                                                                  |s $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |b $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730573947) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1678730614200) (:by |rJG4IHzWf) (:text |p0) (:type :leaf)
                                                                      |c $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730689788) (:by |rJG4IHzWf) (:text |:normal-idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813650837) (:by |rJG4IHzWf) (:text |5) (:type :leaf)
                                                                      |e $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1678730634572) (:by |rJG4IHzWf) (:text |:idx) (:type :leaf)
                                                                          |b $ {} (:at 1678813431774) (:by |rJG4IHzWf) (:text |7) (:type :leaf)
          |comp-container $ {} (:at 1677433056435) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677433056435) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677433056435) (:by |rJG4IHzWf) (:text |comp-container) (:type :leaf)
              |h $ {} (:at 1677433056435) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677948598306) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
              |l $ {} (:at 1677433063041) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433065889) (:by |rJG4IHzWf) (:text |group) (:type :leaf)
                  |a $ {} (:at 1677525513079) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                  |h $ {} (:at 1677952357899) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1677952388469) (:by |rJG4IHzWf) (:text |memof1-call) (:type :leaf)
                      |T $ {} (:at 1677952361169) (:by |rJG4IHzWf) (:text |comp-tabs) (:type :leaf)
                  |k $ {} (:at 1677948615027) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1677948616873) (:by |rJG4IHzWf) (:text |case-default) (:type :leaf)
                      |L $ {} (:at 1677948619406) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948619961) (:by |rJG4IHzWf) (:text |:tab) (:type :leaf)
                          |b $ {} (:at 1677948620619) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                      |P $ {} (:at 1677948636611) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948637868) (:by |rJG4IHzWf) (:text |group) (:type :leaf)
                          |b $ {} (:at 1677948638957) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                      |T $ {} (:at 1677948621486) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |D $ {} (:at 1677948623165) (:by |rJG4IHzWf) (:text |:mountains) (:type :leaf)
                          |T $ {} (:at 1677948606049) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1677952300816) (:by |rJG4IHzWf) (:text |memof1-call) (:type :leaf)
                              |T $ {} (:at 1677948608410) (:by |rJG4IHzWf) (:text |comp-mountains) (:type :leaf)
                      |X $ {} (:at 1678726912046) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1678726913860) (:by |rJG4IHzWf) (:text |:city) (:type :leaf)
                          |b $ {} (:at 1678726914713) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1678726917288) (:by |rJG4IHzWf) (:text |comp-city) (:type :leaf)
                      |b $ {} (:at 1677948624850) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948626669) (:by |rJG4IHzWf) (:text |:bends) (:type :leaf)
                          |b $ {} (:at 1677948640856) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677948640856) (:by |rJG4IHzWf) (:text |group) (:type :leaf)
                              |b $ {} (:at 1677948640856) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
          |comp-mountains $ {} (:at 1677948610137) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677948610137) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677948610137) (:by |rJG4IHzWf) (:text |comp-mountains) (:type :leaf)
              |h $ {} (:at 1677948610137) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
              |l $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |object) (:type :leaf)
                  |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                      |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:shader) (:type :leaf)
                          |b $ {} (:at 1678726810262) (:by |rJG4IHzWf) (:text |mountains-wgsl) (:type :leaf)
                      |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:topology) (:type :leaf)
                          |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |do) (:type :leaf)
                              |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:line-strip) (:type :leaf)
                              |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:triangle-list) (:type :leaf)
                      |l $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:attrs-list) (:type :leaf)
                          |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                              |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                  |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:field) (:type :leaf)
                                      |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                  |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:format) (:type :leaf)
                                      |b $ {} (:at 1678729455727) (:by |rJG4IHzWf) (:text "|\"float32x2") (:type :leaf)
                                  |l $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:size) (:type :leaf)
                                      |b $ {} (:at 1678729456641) (:by |rJG4IHzWf) (:text |2) (:type :leaf)
                      |o $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:data) (:type :leaf)
                          |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                              |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |size) (:type :leaf)
                                      |b $ {} (:at 1677950561162) (:by |rJG4IHzWf) (:text |80) (:type :leaf)
                                  |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |d) (:type :leaf)
                                      |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |32) (:type :leaf)
                              |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                  |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |range-bothway) (:type :leaf)
                                      |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |size) (:type :leaf)
                                  |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |map) (:type :leaf)
                                      |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                          |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                                          |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                                              |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |range-bothway) (:type :leaf)
                                                  |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |size) (:type :leaf)
                                              |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |map) (:type :leaf)
                                                  |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                                                      |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |y) (:type :leaf)
                                                      |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                        :data $ {}
                                                          |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                                                          |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                                                                  |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677950153136) (:by |rJG4IHzWf) (:text |&*) (:type :leaf)
                                                                      |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |d) (:type :leaf)
                                                                      |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |x) (:type :leaf)
                                                              |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |x1) (:type :leaf)
                                                                  |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677950155287) (:by |rJG4IHzWf) (:text |&+) (:type :leaf)
                                                                      |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                                                                      |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |d) (:type :leaf)
                                                              |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |y0) (:type :leaf)
                                                                  |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677950156879) (:by |rJG4IHzWf) (:text |&*) (:type :leaf)
                                                                      |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |d) (:type :leaf)
                                                                      |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |y) (:type :leaf)
                                                              |l $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |y1) (:type :leaf)
                                                                  |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677950158397) (:by |rJG4IHzWf) (:text |&+) (:type :leaf)
                                                                      |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |y0) (:type :leaf)
                                                                      |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |d) (:type :leaf)
                                                          |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                            :data $ {}
                                                              |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                              |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677950959414) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                              |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                                                                              |l $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |y0) (:type :leaf)
                                                                  |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677950963686) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                              |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |x1) (:type :leaf)
                                                                              |l $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |y0) (:type :leaf)
                                                                  |l $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677950965715) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                              |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |x1) (:type :leaf)
                                                                              |l $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |y1) (:type :leaf)
                                                              |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                :data $ {}
                                                                  |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                  |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677950967852) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                              |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                                                                              |l $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |y0) (:type :leaf)
                                                                  |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677950970536) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                              |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |x1) (:type :leaf)
                                                                              |l $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |y1) (:type :leaf)
                                                                  |l $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                    :data $ {}
                                                                      |T $ {} (:at 1677950975057) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                                                      |h $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                        :data $ {}
                                                                          |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                                                          |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:type :expr)
                                                                            :data $ {}
                                                                              |T $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                                                              |b $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |x0) (:type :leaf)
                                                                              |l $ {} (:at 1677948611832) (:by |rJG4IHzWf) (:text |y1) (:type :leaf)
          |comp-tabs $ {} (:at 1677952370971) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677952370971) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677952370971) (:by |rJG4IHzWf) (:text |comp-tabs) (:type :leaf)
              |h $ {} (:at 1677952370971) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
              |l $ {} (:at 1677952379151) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1677952380021) (:by |rJG4IHzWf) (:text |group) (:type :leaf)
                  |L $ {} (:at 1677952382178) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                  |T $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |comp-button) (:type :leaf)
                      |b $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                              |b $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |40) (:type :leaf)
                                  |h $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |260) (:type :leaf)
                                  |l $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                          |h $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                              |b $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |0.9) (:type :leaf)
                                  |h $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |0.4) (:type :leaf)
                                  |l $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |0.5) (:type :leaf)
                                  |o $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                          |l $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |:size) (:type :leaf)
                              |b $ {} (:at 1677952431032) (:by |rJG4IHzWf) (:text |20) (:type :leaf)
                      |h $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                          |b $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                              |b $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                          |h $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                              |b $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |:tab) (:type :leaf)
                              |h $ {} (:at 1677952372486) (:by |rJG4IHzWf) (:text |:mountains) (:type :leaf)
                  |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |comp-button) (:type :leaf)
                      |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                              |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                  |h $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |260) (:type :leaf)
                                  |l $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                          |h $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                              |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |0.5) (:type :leaf)
                                  |h $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |0.5) (:type :leaf)
                                  |l $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |0.9) (:type :leaf)
                                  |o $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                          |l $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |:size) (:type :leaf)
                              |b $ {} (:at 1677952432581) (:by |rJG4IHzWf) (:text |20) (:type :leaf)
                      |h $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                          |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                              |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                          |h $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                              |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |:tab) (:type :leaf)
                              |h $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |:bends) (:type :leaf)
                  |h $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |comp-button) (:type :leaf)
                      |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                              |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1678810080617) (:by |rJG4IHzWf) (:text |80) (:type :leaf)
                                  |h $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |260) (:type :leaf)
                                  |l $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                          |h $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                              |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1678810086900) (:by |rJG4IHzWf) (:text |0.8) (:type :leaf)
                                  |h $ {} (:at 1678810089475) (:by |rJG4IHzWf) (:text |0.9) (:type :leaf)
                                  |l $ {} (:at 1678810090679) (:by |rJG4IHzWf) (:text |0.2) (:type :leaf)
                                  |o $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                          |l $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |:size) (:type :leaf)
                              |b $ {} (:at 1677952432581) (:by |rJG4IHzWf) (:text |20) (:type :leaf)
                      |h $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                          |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                              |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                          |h $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |d!) (:type :leaf)
                              |b $ {} (:at 1677952383571) (:by |rJG4IHzWf) (:text |:tab) (:type :leaf)
                              |h $ {} (:at 1678810094059) (:by |rJG4IHzWf) (:text |:city) (:type :leaf)
        :ns $ {} (:at 1677433051244) (:by |rJG4IHzWf) (:type :expr)
          :data $ {}
            |T $ {} (:at 1677433051244) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
            |b $ {} (:at 1677433051244) (:by |rJG4IHzWf) (:text |lagopus.comp.container) (:type :leaf)
            |h $ {} (:at 1677433079126) (:by |rJG4IHzWf) (:type :expr)
              :data $ {}
                |T $ {} (:at 1677433080972) (:by |rJG4IHzWf) (:text |:require) (:type :leaf)
                |b $ {} (:at 1677433081355) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1677525510624) (:by |rJG4IHzWf) (:text |lagopus.alias) (:type :leaf)
                    |b $ {} (:at 1677433092940) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1677433105529) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1677433106293) (:by |rJG4IHzWf) (:text |group) (:type :leaf)
                        |b $ {} (:at 1677433417824) (:by |rJG4IHzWf) (:text |object) (:type :leaf)
                |h $ {} (:at 1677433786320) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |D $ {} (:at 1678726804930) (:by |rJG4IHzWf) (:text "|\"../shaders/mountains.wgsl") (:type :leaf)
                    |T $ {} (:at 1677433797065) (:by |rJG4IHzWf) (:text |:default) (:type :leaf)
                    |b $ {} (:at 1678726807544) (:by |rJG4IHzWf) (:text |mountains-wgsl) (:type :leaf)
                |j $ {} (:at 1677433786320) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |D $ {} (:at 1678726948646) (:by |rJG4IHzWf) (:text "|\"../shaders/city.wgsl") (:type :leaf)
                    |T $ {} (:at 1677433797065) (:by |rJG4IHzWf) (:text |:default) (:type :leaf)
                    |b $ {} (:at 1678726951301) (:by |rJG4IHzWf) (:text |city-wgsl) (:type :leaf)
                |l $ {} (:at 1677932595907) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1677932602070) (:by |rJG4IHzWf) (:text |lagopus.comp.button) (:type :leaf)
                    |b $ {} (:at 1677932602874) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1677932603063) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1677932605353) (:by |rJG4IHzWf) (:text |comp-button) (:type :leaf)
                |o $ {} (:at 1677952303627) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1677952307124) (:by |rJG4IHzWf) (:text |memof.once) (:type :leaf)
                    |b $ {} (:at 1677952307932) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1677952308209) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1677952308571) (:by |rJG4IHzWf) (:text |memof1-call) (:type :leaf)
                |q $ {} (:at 1678729925437) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1678729941423) (:by |rJG4IHzWf) (:text |quaternion.core) (:type :leaf)
                    |b $ {} (:at 1678729930201) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1678729932287) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1678729932961) (:by |rJG4IHzWf) (:text |c+) (:type :leaf)
      |lagopus.config $ {}
        :configs $ {}
        :defs $ {}
          |dev? $ {} (:at 1677605432427) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677605434118) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1677605432427) (:by |rJG4IHzWf) (:text |dev?) (:type :leaf)
              |h $ {} (:at 1677605432427) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677605449054) (:by |rJG4IHzWf) (:text |&=) (:type :leaf)
                  |b $ {} (:at 1677605476519) (:by |rJG4IHzWf) (:text "|\"dev") (:type :leaf)
                  |h $ {} (:at 1677605439035) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677605442105) (:by |rJG4IHzWf) (:text |get-env) (:type :leaf)
                      |b $ {} (:at 1677605442879) (:by |rJG4IHzWf) (:text "|\"mode") (:type :leaf)
                      |h $ {} (:at 1677605444997) (:by |rJG4IHzWf) (:text "|\"release") (:type :leaf)
          |inline-shader $ {} (:at 1677692440520) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677692445759) (:by |rJG4IHzWf) (:text |defmacro) (:type :leaf)
              |b $ {} (:at 1677692440520) (:by |rJG4IHzWf) (:text |inline-shader) (:type :leaf)
              |h $ {} (:at 1677692440520) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677692448017) (:by |rJG4IHzWf) (:text |path) (:type :leaf)
              |l $ {} (:at 1677692452080) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677692522637) (:by |rJG4IHzWf) (:text |read-file) (:type :leaf)
                  |b $ {} (:at 1677692456154) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1677692458583) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                      |L $ {} (:at 1677692463151) (:by |rJG4IHzWf) (:text "|\"shaders/") (:type :leaf)
                      |T $ {} (:at 1677692455592) (:by |rJG4IHzWf) (:text |path) (:type :leaf)
                      |b $ {} (:at 1677692479319) (:by |rJG4IHzWf) (:text "|\".wgsl") (:type :leaf)
        :ns $ {} (:at 1677605429745) (:by |rJG4IHzWf) (:type :expr)
          :data $ {}
            |T $ {} (:at 1677605429745) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
            |b $ {} (:at 1677605429745) (:by |rJG4IHzWf) (:text |lagopus.config) (:type :leaf)
      |lagopus.main $ {}
        :configs $ {}
        :defs $ {}
          |*store $ {} (:at 1677948378750) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677948380199) (:by |rJG4IHzWf) (:text |defatom) (:type :leaf)
              |b $ {} (:at 1677948378750) (:by |rJG4IHzWf) (:text |*store) (:type :leaf)
              |h $ {} (:at 1677948378750) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677948381871) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                  |b $ {} (:at 1677948383921) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677948383429) (:by |rJG4IHzWf) (:text |:tab) (:type :leaf)
                      |b $ {} (:at 1678729708486) (:by |rJG4IHzWf) (:text |:city) (:type :leaf)
          |canvas $ {} (:at 1677932989462) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677932989462) (:by |rJG4IHzWf) (:text |def) (:type :leaf)
              |b $ {} (:at 1677932989462) (:by |rJG4IHzWf) (:text |canvas) (:type :leaf)
              |h $ {} (:at 1677932989462) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677932998984) (:by |rJG4IHzWf) (:text |js/document.querySelector) (:type :leaf)
                  |b $ {} (:at 1677933000721) (:by |rJG4IHzWf) (:text "|\"canvas") (:type :leaf)
          |dispatch! $ {} (:at 1677932176075) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677932177737) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677932176075) (:by |rJG4IHzWf) (:text |dispatch!) (:type :leaf)
              |h $ {} (:at 1677932176075) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677932178985) (:by |rJG4IHzWf) (:text |op) (:type :leaf)
                  |b $ {} (:at 1677932179715) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
              |j $ {} (:at 1677948512581) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677948512997) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                  |b $ {} (:at 1677948514628) (:by |rJG4IHzWf) (:text |dev?) (:type :leaf)
                  |h $ {} (:at 1677948517910) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677948736320) (:by |rJG4IHzWf) (:text |js/console.log) (:type :leaf)
                      |b $ {} (:at 1677948520970) (:by |rJG4IHzWf) (:text |op) (:type :leaf)
                      |h $ {} (:at 1677948521676) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
              |l $ {} (:at 1677948369357) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1677948370065) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                  |L $ {} (:at 1677948371444) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677948371603) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948372884) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                          |b $ {} (:at 1677948377760) (:by |rJG4IHzWf) (:text |@*store) (:type :leaf)
                      |b $ {} (:at 1677948395691) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948398078) (:by |rJG4IHzWf) (:text |next-store) (:type :leaf)
                          |b $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:text |case-default) (:type :leaf)
                              |b $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:text |op) (:type :leaf)
                              |h $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:text |do) (:type :leaf)
                                  |b $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677948741580) (:by |rJG4IHzWf) (:text |js/console.warn) (:type :leaf)
                                      |b $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:text "|:unknown op") (:type :leaf)
                                      |h $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:text |op) (:type :leaf)
                                      |l $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
                                  |h $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                              |l $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:text |:tab) (:type :leaf)
                                  |b $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:text |assoc) (:type :leaf)
                                      |b $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                                      |h $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:text |:tab) (:type :leaf)
                                      |l $ {} (:at 1677948398622) (:by |rJG4IHzWf) (:text |data) (:type :leaf)
                  |V $ {} (:at 1677948401036) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677948406785) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                      |b $ {} (:at 1677948407446) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948409654) (:by |rJG4IHzWf) (:text |not=) (:type :leaf)
                          |b $ {} (:at 1677948414299) (:by |rJG4IHzWf) (:text |next-store) (:type :leaf)
                          |h $ {} (:at 1677948417299) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                      |h $ {} (:at 1677948419563) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948422569) (:by |rJG4IHzWf) (:text |reset!) (:type :leaf)
                          |b $ {} (:at 1677948425297) (:by |rJG4IHzWf) (:text |*store) (:type :leaf)
                          |h $ {} (:at 1677948427387) (:by |rJG4IHzWf) (:text |next-store) (:type :leaf)
          |handle-compilation $ {} (:at 1677607943025) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677607944233) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677607943025) (:by |rJG4IHzWf) (:text |handle-compilation) (:type :leaf)
              |h $ {} (:at 1677607945053) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677607945053) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                  |b $ {} (:at 1677607945053) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
              |l $ {} (:at 1677608245190) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |D $ {} (:at 1677608250013) (:by |rJG4IHzWf) (:text |if-let) (:type :leaf)
                  |L $ {} (:at 1677608250957) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677608256081) (:by |rJG4IHzWf) (:text |error) (:type :leaf)
                      |b $ {} (:at 1677608256906) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677608260336) (:by |rJG4IHzWf) (:text |->) (:type :leaf)
                          |b $ {} (:at 1677608262439) (:by |rJG4IHzWf) (:text |info) (:type :leaf)
                          |h $ {} (:at 1677608264714) (:by |rJG4IHzWf) (:text |.-messages) (:type :leaf)
                          |l $ {} (:at 1677608386081) (:by |rJG4IHzWf) (:text |.-0) (:type :leaf)
                  |T $ {} (:at 1677608284577) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |D $ {} (:at 1677608285368) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                      |L $ {} (:at 1677608285728) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677608285873) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677608289087) (:by |rJG4IHzWf) (:text |line-num) (:type :leaf)
                              |b $ {} (:at 1677608289804) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677608293451) (:by |rJG4IHzWf) (:text |.-lineNum) (:type :leaf)
                                  |b $ {} (:at 1677608296654) (:by |rJG4IHzWf) (:text |error) (:type :leaf)
                          |b $ {} (:at 1677608298943) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677608300433) (:by |rJG4IHzWf) (:text |line-pos) (:type :leaf)
                              |b $ {} (:at 1677608300841) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677608303279) (:by |rJG4IHzWf) (:text |.-linePos) (:type :leaf)
                                  |b $ {} (:at 1677608304415) (:by |rJG4IHzWf) (:text |error) (:type :leaf)
                          |e $ {} (:at 1677608361277) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677608362042) (:by |rJG4IHzWf) (:text |lines) (:type :leaf)
                              |b $ {} (:at 1677608362916) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677608362916) (:by |rJG4IHzWf) (:text |.split-lines) (:type :leaf)
                                  |b $ {} (:at 1677608362916) (:by |rJG4IHzWf) (:text |code) (:type :leaf)
                          |h $ {} (:at 1677608320678) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677608323729) (:by |rJG4IHzWf) (:text |message) (:type :leaf)
                              |b $ {} (:at 1677608324048) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677608324779) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                  |l $ {} (:at 1677608342505) (:by |rJG4IHzWf) (:text |line-num) (:type :leaf)
                                  |o $ {} (:at 1677608347388) (:by |rJG4IHzWf) (:text "|\" ") (:type :leaf)
                                  |q $ {} (:at 1677608365207) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677608366377) (:by |rJG4IHzWf) (:text |nth) (:type :leaf)
                                      |b $ {} (:at 1677608368088) (:by |rJG4IHzWf) (:text |lines) (:type :leaf)
                                      |h $ {} (:at 1677608397559) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |D $ {} (:at 1677608399547) (:by |rJG4IHzWf) (:text |dec) (:type :leaf)
                                          |T $ {} (:at 1677608369505) (:by |rJG4IHzWf) (:text |line-num) (:type :leaf)
                                  |s $ {} (:at 1677608414729) (:by |rJG4IHzWf) (:text |&newline) (:type :leaf)
                                  |t $ {} (:at 1677608432102) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |D $ {} (:at 1677608434555) (:by |rJG4IHzWf) (:text |.join-str) (:type :leaf)
                                      |T $ {} (:at 1677608419693) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677608422261) (:by |rJG4IHzWf) (:text |repeat) (:type :leaf)
                                          |X $ {} (:at 1677608431211) (:by |rJG4IHzWf) (:text "|\" ") (:type :leaf)
                                          |b $ {} (:at 1677608467046) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |D $ {} (:at 1677608467635) (:by |rJG4IHzWf) (:text |+) (:type :leaf)
                                              |L $ {} (:at 1677608469377) (:by |rJG4IHzWf) (:type :expr)
                                                :data $ {}
                                                  |D $ {} (:at 1677608471704) (:by |rJG4IHzWf) (:text |count) (:type :leaf)
                                                  |T $ {} (:at 1677608472160) (:by |rJG4IHzWf) (:type :expr)
                                                    :data $ {}
                                                      |D $ {} (:at 1677608473845) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                                                      |T $ {} (:at 1677608469139) (:by |rJG4IHzWf) (:text |line-num) (:type :leaf)
                                              |T $ {} (:at 1677608429640) (:by |rJG4IHzWf) (:text |line-pos) (:type :leaf)
                                      |b $ {} (:at 1677608435198) (:by |rJG4IHzWf) (:text "|\"") (:type :leaf)
                                  |tT $ {} (:at 1677608446180) (:by |rJG4IHzWf) (:text "|\"^ ") (:type :leaf)
                                  |u $ {} (:at 1677608438342) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677608438342) (:by |rJG4IHzWf) (:text |.-message) (:type :leaf)
                                      |b $ {} (:at 1677608438342) (:by |rJG4IHzWf) (:text |error) (:type :leaf)
                      |T $ {} (:at 1677607947860) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677608500501) (:by |rJG4IHzWf) (:text |js/console.error) (:type :leaf)
                          |X $ {} (:at 1677608519133) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |D $ {} (:at 1677608519905) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                              |T $ {} (:at 1677608528674) (:by |rJG4IHzWf) (:text "|\"WGSL Error:") (:type :leaf)
                              |X $ {} (:at 1677608523623) (:by |rJG4IHzWf) (:text |&newline) (:type :leaf)
                              |b $ {} (:at 1677608520938) (:by |rJG4IHzWf) (:text |message) (:type :leaf)
                      |h $ {} (:at 1677686138091) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677686138091) (:by |rJG4IHzWf) (:text |hud!) (:type :leaf)
                          |b $ {} (:at 1677686138091) (:by |rJG4IHzWf) (:text "|\"error") (:type :leaf)
                          |h $ {} (:at 1677686138091) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677686138091) (:by |rJG4IHzWf) (:text |str) (:type :leaf)
                              |b $ {} (:at 1677686187032) (:by |rJG4IHzWf) (:text "|\"WGSL Errors:") (:type :leaf)
                              |h $ {} (:at 1677686138091) (:by |rJG4IHzWf) (:text |&newline) (:type :leaf)
                              |l $ {} (:at 1677686138091) (:by |rJG4IHzWf) (:text |message) (:type :leaf)
          |main! $ {} (:at 1677432887802) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677432887802) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677432887802) (:by |rJG4IHzWf) (:text |main!) (:type :leaf)
              |h $ {} (:at 1677432887802) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
              |m $ {} (:at 1677433196591) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433200584) (:by |rJG4IHzWf) (:text |hint-fn) (:type :leaf)
                  |b $ {} (:at 1677433201589) (:by |rJG4IHzWf) (:text |async) (:type :leaf)
              |mT $ {} (:at 1677605414138) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677605414611) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                  |b $ {} (:at 1677605462653) (:by |rJG4IHzWf) (:text |dev?) (:type :leaf)
                  |h $ {} (:at 1677605464543) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677605467481) (:by |rJG4IHzWf) (:text |load-console-formatter!) (:type :leaf)
              |n $ {} (:at 1677433208610) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433212563) (:by |rJG4IHzWf) (:text |js-await) (:type :leaf)
                  |b $ {} (:at 1677433401569) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677433216378) (:by |rJG4IHzWf) (:text |initializeContext) (:type :leaf)
              |o $ {} (:at 1677433135290) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433136904) (:by |rJG4IHzWf) (:text |render-app!) (:type :leaf)
              |s $ {} (:at 1677433285471) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433286108) (:by |rJG4IHzWf) (:text |renderControl) (:type :leaf)
              |t $ {} (:at 1677433304329) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433306479) (:by |rJG4IHzWf) (:text |startControlLoop) (:type :leaf)
                  |b $ {} (:at 1677433308382) (:by |rJG4IHzWf) (:text |10) (:type :leaf)
                  |h $ {} (:at 1677433330679) (:by |rJG4IHzWf) (:text |onControlEvent) (:type :leaf)
              |tT $ {} (:at 1677607896853) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677607917317) (:by |rJG4IHzWf) (:text |set!) (:type :leaf)
                  |b $ {} (:at 1677607931417) (:by |rJG4IHzWf) (:text |js/window.__lagopusHandleCompilationInfo) (:type :leaf)
                  |h $ {} (:at 1677607942741) (:by |rJG4IHzWf) (:text |handle-compilation) (:type :leaf)
              |u $ {} (:at 1677433332929) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433342158) (:by |rJG4IHzWf) (:text |set!) (:type :leaf)
                  |b $ {} (:at 1677433345827) (:by |rJG4IHzWf) (:text |js/window.onresize) (:type :leaf)
                  |h $ {} (:at 1677433351910) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677433353311) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                      |b $ {} (:at 1677433353669) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677604731253) (:by |rJG4IHzWf) (:text |e) (:type :leaf)
                      |h $ {} (:at 1677433354368) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1678027099048) (:by |rJG4IHzWf) (:text |paintLagopusTree) (:type :leaf)
              |uT $ {} (:at 1677948445310) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677948447140) (:by |rJG4IHzWf) (:text |add-watch) (:type :leaf)
                  |b $ {} (:at 1677948449255) (:by |rJG4IHzWf) (:text |*store) (:type :leaf)
                  |h $ {} (:at 1677948451009) (:by |rJG4IHzWf) (:text |:change) (:type :leaf)
                  |l $ {} (:at 1677948451363) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677948451657) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                      |b $ {} (:at 1677948451941) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948454707) (:by |rJG4IHzWf) (:text |next) (:type :leaf)
                          |b $ {} (:at 1677948455936) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                      |h $ {} (:at 1677948457564) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948459886) (:by |rJG4IHzWf) (:text |render-app!) (:type :leaf)
              |v $ {} (:at 1677932976878) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677932976564) (:by |rJG4IHzWf) (:text |setupMouseEvents) (:type :leaf)
                  |b $ {} (:at 1677932986654) (:by |rJG4IHzWf) (:text |canvas) (:type :leaf)
          |reload! $ {} (:at 1677433362201) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677433362201) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677433362201) (:by |rJG4IHzWf) (:text |reload!) (:type :leaf)
              |h $ {} (:at 1677433362201) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
              |i $ {} (:at 1677608676587) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677608676587) (:by |rJG4IHzWf) (:text |if) (:type :leaf)
                  |b $ {} (:at 1677608676587) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677608676587) (:by |rJG4IHzWf) (:text |nil?) (:type :leaf)
                      |b $ {} (:at 1677608676587) (:by |rJG4IHzWf) (:text |build-errors) (:type :leaf)
                  |e $ {} (:at 1677608683340) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677608683844) (:by |rJG4IHzWf) (:text |do) (:type :leaf)
                      |X $ {} (:at 1678726594371) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1678726594371) (:by |rJG4IHzWf) (:text |reset-memof1-caches!) (:type :leaf)
                      |b $ {} (:at 1677608686546) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677608686546) (:by |rJG4IHzWf) (:text |render-app!) (:type :leaf)
                      |i $ {} (:at 1677948480368) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948481961) (:by |rJG4IHzWf) (:text |remove-watch) (:type :leaf)
                          |b $ {} (:at 1677948483854) (:by |rJG4IHzWf) (:text |*store) (:type :leaf)
                          |h $ {} (:at 1677948485053) (:by |rJG4IHzWf) (:text |:change) (:type :leaf)
                      |j $ {} (:at 1677948469078) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677948469078) (:by |rJG4IHzWf) (:text |add-watch) (:type :leaf)
                          |b $ {} (:at 1677948469078) (:by |rJG4IHzWf) (:text |*store) (:type :leaf)
                          |h $ {} (:at 1677948469078) (:by |rJG4IHzWf) (:text |:change) (:type :leaf)
                          |l $ {} (:at 1677948469078) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677948469078) (:by |rJG4IHzWf) (:text |fn) (:type :leaf)
                              |b $ {} (:at 1677948469078) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677948469078) (:by |rJG4IHzWf) (:text |next) (:type :leaf)
                                  |b $ {} (:at 1677948469078) (:by |rJG4IHzWf) (:text |store) (:type :leaf)
                              |h $ {} (:at 1677948469078) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677948469078) (:by |rJG4IHzWf) (:text |render-app!) (:type :leaf)
                      |l $ {} (:at 1677608692117) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677608692117) (:by |rJG4IHzWf) (:text |println) (:type :leaf)
                          |b $ {} (:at 1677608692117) (:by |rJG4IHzWf) (:text "|\"Reloaded.") (:type :leaf)
                      |o $ {} (:at 1677609067967) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677609067967) (:by |rJG4IHzWf) (:text |hud!) (:type :leaf)
                          |b $ {} (:at 1677609067967) (:by |rJG4IHzWf) (:text "|\"ok~") (:type :leaf)
                          |h $ {} (:at 1677609067967) (:by |rJG4IHzWf) (:text "|\"OK") (:type :leaf)
                  |h $ {} (:at 1677608682298) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677608682298) (:by |rJG4IHzWf) (:text |hud!) (:type :leaf)
                      |b $ {} (:at 1677608682298) (:by |rJG4IHzWf) (:text "|\"error") (:type :leaf)
                      |h $ {} (:at 1677608682298) (:by |rJG4IHzWf) (:text |build-errors) (:type :leaf)
          |render-app! $ {} (:at 1677433138757) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677433138757) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677433138757) (:by |rJG4IHzWf) (:text |render-app!) (:type :leaf)
              |h $ {} (:at 1677433138757) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
              |l $ {} (:at 1677433140448) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433141707) (:by |rJG4IHzWf) (:text |let) (:type :leaf)
                  |b $ {} (:at 1677433142273) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677433142424) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677433143114) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                          |b $ {} (:at 1677433144848) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677433144499) (:by |rJG4IHzWf) (:text |comp-container) (:type :leaf)
                              |b $ {} (:at 1677948595311) (:by |rJG4IHzWf) (:text |@*store) (:type :leaf)
                  |l $ {} (:at 1678027054995) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1678027058925) (:by |rJG4IHzWf) (:text |renderLagopusTree) (:type :leaf)
                      |b $ {} (:at 1678027060738) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
                      |h $ {} (:at 1678027062952) (:by |rJG4IHzWf) (:text |dispatch!) (:type :leaf)
        :ns $ {} (:at 1677432884829) (:by |rJG4IHzWf) (:type :expr)
          :data $ {}
            |T $ {} (:at 1677432884829) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
            |b $ {} (:at 1677432884829) (:by |rJG4IHzWf) (:text |lagopus.main) (:type :leaf)
            |h $ {} (:at 1677433113206) (:by |rJG4IHzWf) (:type :expr)
              :data $ {}
                |T $ {} (:at 1677433114263) (:by |rJG4IHzWf) (:text |:require) (:type :leaf)
                |b $ {} (:at 1677433114924) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1677433118593) (:by |rJG4IHzWf) (:text |lagopus.comp.container) (:type :leaf)
                    |b $ {} (:at 1677433119515) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1677433119637) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1677433121299) (:by |rJG4IHzWf) (:text |comp-container) (:type :leaf)
                |e $ {} (:at 1678027004911) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1678027011285) (:by |rJG4IHzWf) (:text "|\"@triadica/lagopus") (:type :leaf)
                    |b $ {} (:at 1678027012149) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1678027012727) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1678027015751) (:by |rJG4IHzWf) (:text |setupMouseEvents) (:type :leaf)
                        |b $ {} (:at 1678027018501) (:by |rJG4IHzWf) (:text |onControlEvent) (:type :leaf)
                        |h $ {} (:at 1678027026259) (:by |rJG4IHzWf) (:text |paintLagopusTree) (:type :leaf)
                        |l $ {} (:at 1678027030023) (:by |rJG4IHzWf) (:text |renderLagopusTree) (:type :leaf)
                        |o $ {} (:at 1678027037402) (:by |rJG4IHzWf) (:text |initializeContext) (:type :leaf)
                |q $ {} (:at 1677433288307) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1677433295405) (:by |rJG4IHzWf) (:text "|\"@triadica/touch-control") (:type :leaf)
                    |b $ {} (:at 1677433296607) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1677433297147) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1677433300163) (:by |rJG4IHzWf) (:text |renderControl) (:type :leaf)
                        |b $ {} (:at 1677433302504) (:by |rJG4IHzWf) (:text |startControlLoop) (:type :leaf)
                |s $ {} (:at 1677605453529) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1677605456722) (:by |rJG4IHzWf) (:text |lagopus.config) (:type :leaf)
                    |b $ {} (:at 1677605457485) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1677605457731) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1677605458461) (:by |rJG4IHzWf) (:text |dev?) (:type :leaf)
                |t $ {} (:at 1677608567728) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1677608568258) (:by |rJG4IHzWf) (:text "|\"bottom-tip") (:type :leaf)
                    |b $ {} (:at 1677608572478) (:by |rJG4IHzWf) (:text |:default) (:type :leaf)
                    |h $ {} (:at 1677608573439) (:by |rJG4IHzWf) (:text |hud!) (:type :leaf)
                |u $ {} (:at 1677608666219) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1677608666219) (:by |rJG4IHzWf) (:text "|\"./calcit.build-errors") (:type :leaf)
                    |b $ {} (:at 1677608666219) (:by |rJG4IHzWf) (:text |:default) (:type :leaf)
                    |h $ {} (:at 1677608666219) (:by |rJG4IHzWf) (:text |build-errors) (:type :leaf)
                |v $ {} (:at 1678726583051) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1678726587340) (:by |rJG4IHzWf) (:text |memof.once) (:type :leaf)
                    |b $ {} (:at 1678726588273) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1678726588568) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1678726589897) (:by |rJG4IHzWf) (:text |reset-memof1-caches!) (:type :leaf)
  :users $ {}
    |rJG4IHzWf $ {} (:avatar nil) (:id |rJG4IHzWf) (:name |chen) (:nickname |chen) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
    |root $ {} (:avatar nil) (:id |root) (:name |root) (:nickname |root) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
