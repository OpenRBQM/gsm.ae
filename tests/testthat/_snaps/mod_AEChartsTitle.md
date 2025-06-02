# mod_AEChartsTitle_UI produces the expected UI

    Code
      test_result
    Output
      <div class="inlineSelectInput">
        Descriptor
         of 
        <div class="form-group shiny-input-container shiny-input-container-inline">
          <label class="control-label shiny-label-null" for="testing-field" id="testing-field-label"></label>
          <div id="testing-field" class="virtual-select" style="display:inline-block;" data-update="change">
            <script type="application/json" data-for="testing-field">{"stateInput":true,"options":{"type":["transpose"],"choices":{"label":["Label","Label 2"],"value":["value","value2"]}},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
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
        Study (<span style="color:#595959;">&#9644;</span>)
      </span>

---

    Code
      test_result$html
    Output
      <span>
        by
        Study (<span style="color:#595959;">&#9644;</span>), Site (<span style="color:red;">&vert;</span>)
      </span>

---

    Code
      test_result$html
    Output
      <span>
        by
        Study (<span style="color:#595959;">&#9644;</span>), Site (<span style="color:red;">&vert;</span>), and Participant (&bull;)
      </span>

