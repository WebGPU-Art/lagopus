
{}
  :configs $ {} (:compact-output? true) (:extension |.cljs) (:init-fn |lagopus.main/main!) (:output |src) (:port 6001) (:reload-fn |lagopus.main/reload!) (:storage-key |calcit.cirru) (:version |0.0.1)
    :modules $ []
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
                                      |T $ {} (:at 1677605292961) (:by |rJG4IHzWf) (:text |&record:get) (:type :leaf)
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
                  |T $ {} (:at 1677524747367) (:by |rJG4IHzWf) (:text |alias-js/group) (:type :leaf)
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
                  |b $ {} (:at 1677604799442) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677604799442) (:by |rJG4IHzWf) (:text |createRenderer) (:type :leaf)
                      |b $ {} (:at 1677604813597) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677604813597) (:by |rJG4IHzWf) (:text |&map:get) (:type :leaf)
                          |b $ {} (:at 1677604813597) (:by |rJG4IHzWf) (:text |options) (:type :leaf)
                          |h $ {} (:at 1677604813597) (:by |rJG4IHzWf) (:text |:shader) (:type :leaf)
                      |h $ {} (:at 1677604820296) (:by |rJG4IHzWf) (:type :expr)
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
        :ns $ {} (:at 1677524644560) (:by |rJG4IHzWf) (:type :expr)
          :data $ {}
            |T $ {} (:at 1677524644560) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
            |b $ {} (:at 1677524644560) (:by |rJG4IHzWf) (:text |lagopus.alias) (:type :leaf)
            |h $ {} (:at 1677524688054) (:by |rJG4IHzWf) (:type :expr)
              :data $ {}
                |T $ {} (:at 1677524689918) (:by |rJG4IHzWf) (:text |:require) (:type :leaf)
                |b $ {} (:at 1677524690143) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1677524709233) (:by |rJG4IHzWf) (:text "|\"@triadica/lagopus/lib/alias.mjs") (:type :leaf)
                    |b $ {} (:at 1677524713040) (:by |rJG4IHzWf) (:text |:as) (:type :leaf)
                    |h $ {} (:at 1677524729109) (:by |rJG4IHzWf) (:text |alias-js) (:type :leaf)
                |h $ {} (:at 1677524690143) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1677604789140) (:by |rJG4IHzWf) (:text "|\"@triadica/lagopus/lib/render.mjs") (:type :leaf)
                    |b $ {} (:at 1677604793708) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1677604794051) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1677604796202) (:by |rJG4IHzWf) (:text |createRenderer) (:type :leaf)
      |lagopus.comp.container $ {}
        :configs $ {}
        :defs $ {}
          |Vertex $ {} (:at 1677526073041) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677526075058) (:by |rJG4IHzWf) (:text |defrecord) (:type :leaf)
              |b $ {} (:at 1677526217729) (:by |rJG4IHzWf) (:text |Vertex) (:type :leaf)
              |h $ {} (:at 1677526090990) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
              |l $ {} (:at 1677526092985) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
          |comp-container $ {} (:at 1677433056435) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677433056435) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677433056435) (:by |rJG4IHzWf) (:text |comp-container) (:type :leaf)
              |h $ {} (:at 1677433056435) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
              |l $ {} (:at 1677433063041) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433065889) (:by |rJG4IHzWf) (:text |group) (:type :leaf)
                  |a $ {} (:at 1677525513079) (:by |rJG4IHzWf) (:text |nil) (:type :leaf)
                  |h $ {} (:at 1677433408932) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677433414212) (:by |rJG4IHzWf) (:text |object) (:type :leaf)
                      |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                        :data $ {}
                          |T $ {} (:at 1677525518101) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                          |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |:shader) (:type :leaf)
                              |b $ {} (:at 1677433782568) (:by |rJG4IHzWf) (:text |triangle-wgsl) (:type :leaf)
                          |h $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |:topology) (:type :leaf)
                              |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text "|\"triangle-list") (:type :leaf)
                          |l $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677525633484) (:by |rJG4IHzWf) (:text |:attrs-list) (:type :leaf)
                              |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677525520463) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677525523034) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1677433743653) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677433748998) (:by |rJG4IHzWf) (:text |:field) (:type :leaf)
                                          |b $ {} (:at 1677525694810) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                      |h $ {} (:at 1677433753053) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677433753933) (:by |rJG4IHzWf) (:text |:format) (:type :leaf)
                                          |b $ {} (:at 1677433758382) (:by |rJG4IHzWf) (:text "|\"float32x4") (:type :leaf)
                                      |l $ {} (:at 1677433759046) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677433759726) (:by |rJG4IHzWf) (:text |:size) (:type :leaf)
                                          |b $ {} (:at 1677433760553) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                                  |h $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677525524683) (:by |rJG4IHzWf) (:text |{}) (:type :leaf)
                                      |b $ {} (:at 1677433743653) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677433748998) (:by |rJG4IHzWf) (:text |:field) (:type :leaf)
                                          |b $ {} (:at 1677525697122) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                                      |h $ {} (:at 1677433753053) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677433753933) (:by |rJG4IHzWf) (:text |:format) (:type :leaf)
                                          |b $ {} (:at 1677433758382) (:by |rJG4IHzWf) (:text "|\"float32x4") (:type :leaf)
                                      |l $ {} (:at 1677433759046) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677433759726) (:by |rJG4IHzWf) (:text |:size) (:type :leaf)
                                          |b $ {} (:at 1677433760553) (:by |rJG4IHzWf) (:text |4) (:type :leaf)
                          |o $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                            :data $ {}
                              |T $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |:data) (:type :leaf)
                              |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                :data $ {}
                                  |T $ {} (:at 1677525531101) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                  |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677526068948) (:by |rJG4IHzWf) (:text |%{}) (:type :leaf)
                                      |X $ {} (:at 1677526219440) (:by |rJG4IHzWf) (:text |Vertex) (:type :leaf)
                                      |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                          |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1677525540398) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |-100) (:type :leaf)
                                              |h $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |-100) (:type :leaf)
                                              |l $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |0.3) (:type :leaf)
                                              |o $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                      |h $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                                          |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1677525542015) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                              |h $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                              |l $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                              |o $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                  |h $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677526097649) (:by |rJG4IHzWf) (:text |%{}) (:type :leaf)
                                      |X $ {} (:at 1677526222056) (:by |rJG4IHzWf) (:text |Vertex) (:type :leaf)
                                      |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                          |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1677525543888) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                              |h $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |100) (:type :leaf)
                                              |l $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |100) (:type :leaf)
                                              |o $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                      |h $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                                          |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1677525545259) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                              |h $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                              |l $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                              |o $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                  |l $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                    :data $ {}
                                      |T $ {} (:at 1677526102217) (:by |rJG4IHzWf) (:text |%{}) (:type :leaf)
                                      |X $ {} (:at 1677526223236) (:by |rJG4IHzWf) (:text |Vertex) (:type :leaf)
                                      |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |:position) (:type :leaf)
                                          |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1677525546723) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |100) (:type :leaf)
                                              |h $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |-100) (:type :leaf)
                                              |l $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |-100) (:type :leaf)
                                              |o $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                      |h $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                        :data $ {}
                                          |T $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |:color) (:type :leaf)
                                          |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:type :expr)
                                            :data $ {}
                                              |T $ {} (:at 1677525548428) (:by |rJG4IHzWf) (:text |[]) (:type :leaf)
                                              |b $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                              |h $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |0) (:type :leaf)
                                              |l $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
                                              |o $ {} (:at 1677433700366) (:by |rJG4IHzWf) (:text |1) (:type :leaf)
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
                    |D $ {} (:at 1677433808425) (:by |rJG4IHzWf) (:text "|\"../shaders/triangle.wgsl") (:type :leaf)
                    |T $ {} (:at 1677433797065) (:by |rJG4IHzWf) (:text |:default) (:type :leaf)
                    |b $ {} (:at 1677433797626) (:by |rJG4IHzWf) (:text |triangle-wgsl) (:type :leaf)
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
        :ns $ {} (:at 1677605429745) (:by |rJG4IHzWf) (:type :expr)
          :data $ {}
            |T $ {} (:at 1677605429745) (:by |rJG4IHzWf) (:text |ns) (:type :leaf)
            |b $ {} (:at 1677605429745) (:by |rJG4IHzWf) (:text |lagopus.config) (:type :leaf)
      |lagopus.main $ {}
        :configs $ {}
        :defs $ {}
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
              |q $ {} (:at 1677433243132) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433248052) (:by |rJG4IHzWf) (:text |paintApp) (:type :leaf)
              |s $ {} (:at 1677433285471) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433286108) (:by |rJG4IHzWf) (:text |renderControl) (:type :leaf)
              |t $ {} (:at 1677433304329) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433306479) (:by |rJG4IHzWf) (:text |startControlLoop) (:type :leaf)
                  |b $ {} (:at 1677433308382) (:by |rJG4IHzWf) (:text |10) (:type :leaf)
                  |h $ {} (:at 1677433330679) (:by |rJG4IHzWf) (:text |onControlEvent) (:type :leaf)
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
                          |T $ {} (:at 1677433357003) (:by |rJG4IHzWf) (:text |paintApp) (:type :leaf)
          |reload! $ {} (:at 1677433362201) (:by |rJG4IHzWf) (:type :expr)
            :data $ {}
              |T $ {} (:at 1677433362201) (:by |rJG4IHzWf) (:text |defn) (:type :leaf)
              |b $ {} (:at 1677433362201) (:by |rJG4IHzWf) (:text |reload!) (:type :leaf)
              |h $ {} (:at 1677433362201) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
              |l $ {} (:at 1677433364095) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433373149) (:by |rJG4IHzWf) (:text |paintApp) (:type :leaf)
              |o $ {} (:at 1677433374053) (:by |rJG4IHzWf) (:type :expr)
                :data $ {}
                  |T $ {} (:at 1677433376145) (:by |rJG4IHzWf) (:text |println) (:type :leaf)
                  |b $ {} (:at 1677433379409) (:by |rJG4IHzWf) (:text "|\"Reloaded.") (:type :leaf)
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
                  |h $ {} (:at 1677433148155) (:by |rJG4IHzWf) (:type :expr)
                    :data $ {}
                      |T $ {} (:at 1677433154750) (:by |rJG4IHzWf) (:text |.!reset) (:type :leaf)
                      |b $ {} (:at 1677433159214) (:by |rJG4IHzWf) (:text |atomLagopusTree) (:type :leaf)
                      |h $ {} (:at 1677433161427) (:by |rJG4IHzWf) (:text |tree) (:type :leaf)
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
                |h $ {} (:at 1677433163121) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1677433180869) (:by |rJG4IHzWf) (:text "|\"@triadica/lagopus/lib/global.mjs") (:type :leaf)
                    |b $ {} (:at 1677433181608) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1677433181967) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1677433183174) (:by |rJG4IHzWf) (:text |atomLagopusTree) (:type :leaf)
                |l $ {} (:at 1677433163121) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |T $ {} (:at 1677433223219) (:by |rJG4IHzWf) (:text "|\"@triadica/lagopus/lib/render.mjs") (:type :leaf)
                    |b $ {} (:at 1677433181608) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |h $ {} (:at 1677433181967) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1677433224428) (:by |rJG4IHzWf) (:text |initializeContext) (:type :leaf)
                |o $ {} (:at 1677433254802) (:by |rJG4IHzWf) (:type :expr)
                  :data $ {}
                    |5 $ {} (:at 1677433266703) (:by |rJG4IHzWf) (:text "|\"@triadica/lagopus/lib/control.mjs") (:type :leaf)
                    |D $ {} (:at 1677433260183) (:by |rJG4IHzWf) (:text |:refer) (:type :leaf)
                    |T $ {} (:at 1677433256928) (:by |rJG4IHzWf) (:type :expr)
                      :data $ {}
                        |T $ {} (:at 1677433255543) (:by |rJG4IHzWf) (:text |paintApp) (:type :leaf)
                        |b $ {} (:at 1677433274495) (:by |rJG4IHzWf) (:text |onControlEvent) (:type :leaf)
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
  :users $ {}
    |rJG4IHzWf $ {} (:avatar nil) (:id |rJG4IHzWf) (:name |chen) (:nickname |chen) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
    |root $ {} (:avatar nil) (:id |root) (:name |root) (:nickname |root) (:password |d41d8cd98f00b204e9800998ecf8427e) (:theme :star-trail)
