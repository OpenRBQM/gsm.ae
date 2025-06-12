# pluginAE returns the expected result

    Code
      pluginAE()
    Output
      $meta
      $meta$Name
      [1] "Adverse Events"
      
      
      $shiny
      $shiny$UI
      function(...) "This is mod_AE_UI"
      <environment: xxxx>
      
      $shiny$Server
      function(...) "This is mod_AE_Server"
      <environment: xxxx>
      
      
      $spec
      $spec$AE
      $spec$AE$SubjectID
      $spec$AE$SubjectID$type
      [1] "character"
      
      
      $spec$AE$GroupID
      $spec$AE$GroupID$type
      [1] "character"
      
      
      $spec$AE$GroupLevel
      $spec$AE$GroupLevel$type
      [1] "character"
      
      
      $spec$AE$aeser
      $spec$AE$aeser$type
      [1] "character"
      
      
      $spec$AE$mdrpt_nsv
      $spec$AE$mdrpt_nsv$type
      [1] "character"
      
      
      $spec$AE$mdrsoc_nsv
      $spec$AE$mdrsoc_nsv$type
      [1] "character"
      
      
      $spec$AE$aetoxgr
      $spec$AE$aetoxgr$type
      [1] "character"
      
      
      $spec$AE$aeongo
      $spec$AE$aeongo$type
      [1] "character"
      
      
      $spec$AE$aerel
      $spec$AE$aerel$type
      [1] "character"
      
      
      $spec$AE$mincreated_dts
      $spec$AE$mincreated_dts$type
      [1] "Date"
      
      
      $spec$AE$aest_dt
      $spec$AE$aest_dt$type
      [1] "Date"
      
      
      $spec$AE$aeen_dt
      $spec$AE$aeen_dt$type
      [1] "Date"
      
      
      
      $spec$SUBJ
      $spec$SUBJ$SubjectID
      $spec$SUBJ$SubjectID$type
      [1] "character"
      
      
      
      
      $config
      $config$chrCategoricalFields
                     aeser            mdrpt_nsv           mdrsoc_nsv 
                "Serious?"     "Preferred Term" "System Organ Class" 
                   aetoxgr               aeongo                aerel 
          "Toxicity Grade"           "Ongoing?"           "Related?" 
      
      $config$chrDateFields
       mincreated_dts         aest_dt         aeen_dt 
      "AE Entry Date"      "AE Start"        "AE End" 
      
      $config$strMetricID_AE
      [1] "Analysis_kri0001"
      
      $config$strMetricID_SAE
      [1] "Analysis_kri0002"
      
      
      $packages
      list()
      
      $required_inputs
      character(0)
      
      $workflows
      list()
      

