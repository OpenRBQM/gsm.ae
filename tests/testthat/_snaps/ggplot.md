# scale_fill_StudyGroupSubject returns the expected object

    Code
      test_result <- scale_fill_StudyGroupSubject()
      test_result
    Output
      <ggproto object: Class ScaleDiscrete, Scale, gg>
          aesthetics: fill
          axis_order: function
          break_info: function
          break_positions: function
          breaks: waiver
          call: call
          clone: function
          dimension: function
          drop: TRUE
          expand: waiver
          get_breaks: function
          get_breaks_minor: function
          get_labels: function
          get_limits: function
          get_transformation: function
          guide: none
          is_discrete: function
          is_empty: function
          labels: waiver
          limits: NULL
          make_sec_title: function
          make_title: function
          map: function
          map_df: function
          n.breaks.cache: NULL
          na.translate: TRUE
          na.value: grey50
          name: waiver
          palette: function
          palette.cache: NULL
          position: left
          range: environment
          rescale: function
          reset: function
          train: function
          train_df: function
          transform: function
          transform_df: function
          super:  <ggproto object: Class ScaleDiscrete, Scale, gg>

---

    Code
      test_result$palette(3)
    Output
      [1] "#1b9e77" "#d95f02" "#7570b3"

# theme_AE returns the expected object

    Code
      test_result <- theme_AE()
      test_result
    Output
      List of 136
       $ line                            :List of 6
        ..$ colour       : chr "black"
        ..$ linewidth    : num 0.909
        ..$ linetype     : num 1
        ..$ lineend      : chr "butt"
        ..$ arrow        : logi FALSE
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_line" "element"
       $ rect                            :List of 5
        ..$ fill         : chr "white"
        ..$ colour       : chr "black"
        ..$ linewidth    : num 0.909
        ..$ linetype     : num 1
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_rect" "element"
       $ text                            :List of 11
        ..$ family       : chr ""
        ..$ face         : chr "plain"
        ..$ colour       : chr "black"
        ..$ size         : num 20
        ..$ hjust        : num 0.5
        ..$ vjust        : num 0.5
        ..$ angle        : num 0
        ..$ lineheight   : num 0.9
        ..$ margin       : 'margin' num [1:4] 0points 0points 0points 0points
        .. ..- attr(*, "unit")= int 8
        ..$ debug        : logi FALSE
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_text" "element"
       $ title                           : NULL
       $ aspect.ratio                    : NULL
       $ axis.title                      : NULL
       $ axis.title.x                    :List of 11
        ..$ family       : NULL
        ..$ face         : NULL
        ..$ colour       : NULL
        ..$ size         : NULL
        ..$ hjust        : NULL
        ..$ vjust        : num 1
        ..$ angle        : NULL
        ..$ lineheight   : NULL
        ..$ margin       : 'margin' num [1:4] 5points 0points 0points 0points
        .. ..- attr(*, "unit")= int 8
        ..$ debug        : NULL
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_text" "element"
       $ axis.title.x.top                :List of 11
        ..$ family       : NULL
        ..$ face         : NULL
        ..$ colour       : NULL
        ..$ size         : NULL
        ..$ hjust        : NULL
        ..$ vjust        : num 0
        ..$ angle        : NULL
        ..$ lineheight   : NULL
        ..$ margin       : 'margin' num [1:4] 0points 0points 5points 0points
        .. ..- attr(*, "unit")= int 8
        ..$ debug        : NULL
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_text" "element"
       $ axis.title.x.bottom             : NULL
       $ axis.title.y                    :List of 11
        ..$ family       : NULL
        ..$ face         : NULL
        ..$ colour       : NULL
        ..$ size         : NULL
        ..$ hjust        : NULL
        ..$ vjust        : num 1
        ..$ angle        : num 90
        ..$ lineheight   : NULL
        ..$ margin       : 'margin' num [1:4] 0points 5points 0points 0points
        .. ..- attr(*, "unit")= int 8
        ..$ debug        : NULL
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_text" "element"
       $ axis.title.y.left               : NULL
       $ axis.title.y.right              :List of 11
        ..$ family       : NULL
        ..$ face         : NULL
        ..$ colour       : NULL
        ..$ size         : NULL
        ..$ hjust        : NULL
        ..$ vjust        : num 1
        ..$ angle        : num -90
        ..$ lineheight   : NULL
        ..$ margin       : 'margin' num [1:4] 0points 0points 0points 5points
        .. ..- attr(*, "unit")= int 8
        ..$ debug        : NULL
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_text" "element"
       $ axis.text                       :List of 11
        ..$ family       : NULL
        ..$ face         : NULL
        ..$ colour       : chr "grey30"
        ..$ size         : 'rel' num 0.8
        ..$ hjust        : NULL
        ..$ vjust        : NULL
        ..$ angle        : NULL
        ..$ lineheight   : NULL
        ..$ margin       : NULL
        ..$ debug        : NULL
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_text" "element"
       $ axis.text.x                     :List of 11
        ..$ family       : NULL
        ..$ face         : NULL
        ..$ colour       : NULL
        ..$ size         : NULL
        ..$ hjust        : NULL
        ..$ vjust        : num 1
        ..$ angle        : NULL
        ..$ lineheight   : NULL
        ..$ margin       : 'margin' num [1:4] 4points 0points 0points 0points
        .. ..- attr(*, "unit")= int 8
        ..$ debug        : NULL
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_text" "element"
       $ axis.text.x.top                 :List of 11
        ..$ family       : NULL
        ..$ face         : NULL
        ..$ colour       : NULL
        ..$ size         : NULL
        ..$ hjust        : NULL
        ..$ vjust        : num 0
        ..$ angle        : NULL
        ..$ lineheight   : NULL
        ..$ margin       : 'margin' num [1:4] 0points 0points 4points 0points
        .. ..- attr(*, "unit")= int 8
        ..$ debug        : NULL
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_text" "element"
       $ axis.text.x.bottom              : NULL
       $ axis.text.y                     :List of 11
        ..$ family       : NULL
        ..$ face         : NULL
        ..$ colour       : NULL
        ..$ size         : NULL
        ..$ hjust        : num 1
        ..$ vjust        : NULL
        ..$ angle        : NULL
        ..$ lineheight   : NULL
        ..$ margin       : 'margin' num [1:4] 0points 4points 0points 0points
        .. ..- attr(*, "unit")= int 8
        ..$ debug        : NULL
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_text" "element"
       $ axis.text.y.left                : NULL
       $ axis.text.y.right               :List of 11
        ..$ family       : NULL
        ..$ face         : NULL
        ..$ colour       : NULL
        ..$ size         : NULL
        ..$ hjust        : num 0
        ..$ vjust        : NULL
        ..$ angle        : NULL
        ..$ lineheight   : NULL
        ..$ margin       : 'margin' num [1:4] 0points 0points 0points 4points
        .. ..- attr(*, "unit")= int 8
        ..$ debug        : NULL
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_text" "element"
       $ axis.text.theta                 : NULL
       $ axis.text.r                     :List of 11
        ..$ family       : NULL
        ..$ face         : NULL
        ..$ colour       : NULL
        ..$ size         : NULL
        ..$ hjust        : num 0.5
        ..$ vjust        : NULL
        ..$ angle        : NULL
        ..$ lineheight   : NULL
        ..$ margin       : 'margin' num [1:4] 0points 4points 0points 4points
        .. ..- attr(*, "unit")= int 8
        ..$ debug        : NULL
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_text" "element"
       $ axis.ticks                      : list()
        ..- attr(*, "class")= chr [1:2] "element_blank" "element"
       $ axis.ticks.x                    : NULL
       $ axis.ticks.x.top                : NULL
       $ axis.ticks.x.bottom             : NULL
       $ axis.ticks.y                    : NULL
       $ axis.ticks.y.left               : NULL
       $ axis.ticks.y.right              : NULL
       $ axis.ticks.theta                : NULL
       $ axis.ticks.r                    : NULL
       $ axis.minor.ticks.x.top          : NULL
       $ axis.minor.ticks.x.bottom       : NULL
       $ axis.minor.ticks.y.left         : NULL
       $ axis.minor.ticks.y.right        : NULL
       $ axis.minor.ticks.theta          : NULL
       $ axis.minor.ticks.r              : NULL
       $ axis.ticks.length               : 'simpleUnit' num 5points
        ..- attr(*, "unit")= int 8
       $ axis.ticks.length.x             : NULL
       $ axis.ticks.length.x.top         : NULL
       $ axis.ticks.length.x.bottom      : NULL
       $ axis.ticks.length.y             : NULL
       $ axis.ticks.length.y.left        : NULL
       $ axis.ticks.length.y.right       : NULL
       $ axis.ticks.length.theta         : NULL
       $ axis.ticks.length.r             : NULL
       $ axis.minor.ticks.length         : 'rel' num 0.75
       $ axis.minor.ticks.length.x       : NULL
       $ axis.minor.ticks.length.x.top   : NULL
       $ axis.minor.ticks.length.x.bottom: NULL
       $ axis.minor.ticks.length.y       : NULL
       $ axis.minor.ticks.length.y.left  : NULL
       $ axis.minor.ticks.length.y.right : NULL
       $ axis.minor.ticks.length.theta   : NULL
       $ axis.minor.ticks.length.r       : NULL
       $ axis.line                       : list()
        ..- attr(*, "class")= chr [1:2] "element_blank" "element"
       $ axis.line.x                     : NULL
       $ axis.line.x.top                 : NULL
       $ axis.line.x.bottom              : NULL
       $ axis.line.y                     : NULL
       $ axis.line.y.left                : NULL
       $ axis.line.y.right               : NULL
       $ axis.line.theta                 : NULL
       $ axis.line.r                     : NULL
       $ legend.background               : list()
        ..- attr(*, "class")= chr [1:2] "element_blank" "element"
       $ legend.margin                   : 'margin' num [1:4] 10points 10points 10points 10points
        ..- attr(*, "unit")= int 8
       $ legend.spacing                  : 'simpleUnit' num 20points
        ..- attr(*, "unit")= int 8
       $ legend.spacing.x                : NULL
       $ legend.spacing.y                : NULL
       $ legend.key                      : list()
        ..- attr(*, "class")= chr [1:2] "element_blank" "element"
       $ legend.key.size                 : 'simpleUnit' num 1.2lines
        ..- attr(*, "unit")= int 3
       $ legend.key.height               : NULL
       $ legend.key.width                : NULL
       $ legend.key.spacing              : 'simpleUnit' num 10points
        ..- attr(*, "unit")= int 8
       $ legend.key.spacing.x            : NULL
       $ legend.key.spacing.y            : NULL
       $ legend.frame                    : NULL
       $ legend.ticks                    : NULL
       $ legend.ticks.length             : 'rel' num 0.2
       $ legend.axis.line                : NULL
       $ legend.text                     :List of 11
        ..$ family       : NULL
        ..$ face         : NULL
        ..$ colour       : NULL
        ..$ size         : 'rel' num 0.8
        ..$ hjust        : NULL
        ..$ vjust        : NULL
        ..$ angle        : NULL
        ..$ lineheight   : NULL
        ..$ margin       : NULL
        ..$ debug        : NULL
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_text" "element"
       $ legend.text.position            : NULL
       $ legend.title                    :List of 11
        ..$ family       : NULL
        ..$ face         : NULL
        ..$ colour       : NULL
        ..$ size         : NULL
        ..$ hjust        : num 0
        ..$ vjust        : NULL
        ..$ angle        : NULL
        ..$ lineheight   : NULL
        ..$ margin       : NULL
        ..$ debug        : NULL
        ..$ inherit.blank: logi TRUE
        ..- attr(*, "class")= chr [1:2] "element_text" "element"
       $ legend.title.position           : NULL
       $ legend.position                 : chr "right"
       $ legend.position.inside          : NULL
       $ legend.direction                : NULL
       $ legend.byrow                    : NULL
       $ legend.justification            : chr "center"
       $ legend.justification.top        : NULL
       $ legend.justification.bottom     : NULL
       $ legend.justification.left       : NULL
       $ legend.justification.right      : NULL
       $ legend.justification.inside     : NULL
       $ legend.location                 : NULL
       $ legend.box                      : NULL
       $ legend.box.just                 : NULL
       $ legend.box.margin               : 'margin' num [1:4] 0cm 0cm 0cm 0cm
        ..- attr(*, "unit")= int 1
       $ legend.box.background           : list()
        ..- attr(*, "class")= chr [1:2] "element_blank" "element"
       $ legend.box.spacing              : 'simpleUnit' num 20points
        ..- attr(*, "unit")= int 8
        [list output truncated]
       - attr(*, "class")= chr [1:2] "theme" "gg"
       - attr(*, "complete")= logi TRUE
       - attr(*, "validate")= logi TRUE

