{:user {:plugins [;[lein-midje "3.2.1"]
		  [lein-exec "0.3.6"]
          [jonase/eastwood "0.2.3"]
          [luminus/lein-template "2.9.11.05"]
          [lein-pprint "1.1.2"]]
        :dependencies [[slamhound "RELEASE"]
                       [cljfmt "0.5.1"]
                       [jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
