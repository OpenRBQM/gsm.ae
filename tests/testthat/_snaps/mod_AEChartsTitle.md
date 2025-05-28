# mod_AEChartsTitle_UI produces the expected UI

    Code
      test_result
    Output
      <div class="inlineSelectInput">
        Prevalence of 
        <div class="form-group shiny-input-container shiny-input-container-inline">
          <label class="control-label shiny-label-null" for="testing-category" id="testing-category-label"></label>
          <div id="testing-category" class="virtual-select" style="display:inline-block;" data-update="change">
            <script type="application/json" data-for="testing-category">{"stateInput":true,"options":{"type":["transpose"],"choices":{"label":["Serious?","Preferred Term","System Organ Class","Toxicity Grade","Ongoing?","Related?"],"value":["aeser","mdrpt_nsv","mdrsoc_nsv","aetoxgr","aeongo","aerel"]}},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
          </div>
        </div>
        <span id="testing-grouping" class="shiny-html-output"></span>
      </div>

---

    Code
      test_result
    Output
      <div class="inlineSelectInput">
        Prevalence of 
        <div class="form-group shiny-input-container shiny-input-container-inline">
          <label class="control-label shiny-label-null" for="testing-category" id="testing-category-label"></label>
          <div id="testing-category" class="virtual-select" style="display:inline-block;" data-update="change">
            <script type="application/json" data-for="testing-category">{"stateInput":true,"options":{"type":["transpose"],"choices":{"label":["Other Thing"],"value":["other"]}},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
          </div>
        </div>
        <span id="testing-grouping" class="shiny-html-output"></span>
      </div>

# mod_AEChartsTitle_Server works as expected

    Code
      test_html
    Output
      <span>
        by
        Study (<span style="color:#595959;">&#9607;</span>)
      </span>

---

    Code
      test_result$html
    Output
      <span>
        by
        Study (<span style="color:#595959;">&#9607;</span>)
        , Site (<span style="color:red;">&vert;</span>)
      </span>

---

    Code
      test_result$html
    Output
      <span>
        by
        Study (<span style="color:#595959;">&#9607;</span>)
        , Site (<span style="color:red;">&vert;</span>)
        , and Participant (&bull;)
      </span>

