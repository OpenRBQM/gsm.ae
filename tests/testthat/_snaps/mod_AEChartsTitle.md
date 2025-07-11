# mod_AEChartsTitle_UI produces the expected UI

    Code
      test_result
    Output
      <div class="inlineSelectInput">
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
        Study (<span style="color:#595959;">&#9644;</span>) and Site (<span style="color:red;">&vert;</span>)
      </span>

---

    Code
      test_result$html
    Output
      <span>
        by
        Study (<span style="color:#595959;">&#9644;</span>), Site (<span style="color:red;">&vert;</span>) and Participant (&bull;)
      </span>

# mod_AEChartsTitle_Server_Color works as expected

    Code
      test_html
    Output
      <span>
        by
        <span style="font-weight: bold; padding: 3px; color: white; background-color:#1b9e77;">Study</span>
      </span>

---

    Code
      test_result$html
    Output
      <span>
        by
        <span style="font-weight: bold; padding: 3px; color: white; background-color:#1b9e77;">Study</span> and <span style="font-weight: bold; padding: 3px; color: white; background-color:#d95f02;">Site (12345)</span>
      </span>

---

    Code
      test_result$html
    Output
      <span>
        by
        <span style="font-weight: bold; padding: 3px; color: white; background-color:#1b9e77;">Study</span>, <span style="font-weight: bold; padding: 3px; color: white; background-color:#d95f02;">Site (12345)</span> and <span style="font-weight: bold; padding: 3px; color: white; background-color:#7570b3;">Participant (6789)</span>
      </span>

# mod_AEChartsTitle_Server_Color sets names if necessary

    Code
      test_html
    Output
      <span>
        by
        <span style="font-weight: bold; padding: 3px; color: white; background-color:#1b9e77;">Study</span>
      </span>

---

    Code
      test_result$html
    Output
      <span>
        by
        <span style="font-weight: bold; padding: 3px; color: white; background-color:#1b9e77;">Study</span> and <span style="font-weight: bold; padding: 3px; color: white; background-color:#d95f02;">Site (12345)</span>
      </span>

---

    Code
      test_result$html
    Output
      <span>
        by
        <span style="font-weight: bold; padding: 3px; color: white; background-color:#1b9e77;">Study</span>, <span style="font-weight: bold; padding: 3px; color: white; background-color:#d95f02;">Site (12345)</span> and <span style="font-weight: bold; padding: 3px; color: white; background-color:#7570b3;">Participant (6789)</span>
      </span>

