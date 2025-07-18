# mod_AEDashboard_UI produces the expected UI

    Code
      test_result
    Output
      <bslib-layout-columns class="bslib-grid grid bslib-mb-spacing html-fill-item" data-require-bs-caller="layout_columns()" data-require-bs-version="5">
        <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testing-summary" style="min-height:300px;">
            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
              <h5>Summary</h5>
              <div class="shiny-html-output gt_shiny" id="testing-summary-table"></div>
            </div>
            <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
              <template>Expand</template>
              <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
            </bslib-tooltip>
            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
          </div>
        </div>
        <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testing-prevalence-card" style="min-height:300px;">
            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
              <h5>Prevalence</h5>
              <div class="inlineSelectInput">
                <div class="form-group shiny-input-container shiny-input-container-inline">
                  <label class="control-label shiny-label-null" for="testing-prevalence-title-field" id="testing-prevalence-title-field-label"></label>
                  <div id="testing-prevalence-title-field" class="virtual-select" style="display:inline-block;" data-update="change">
                    <script type="application/json" data-for="testing-prevalence-title-field">{"stateInput":true,"options":{"type":["transpose"],"choices":{"label":["Serious?","Preferred Term","System Organ Class","Toxicity Grade","Ongoing?","Related?"],"value":["aeser","mdrpt_nsv","mdrsoc_nsv","aetoxgr","aeongo","aerel"]}},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
                  </div>
                </div>
                <span id="testing-prevalence-title-grouping" class="shiny-html-output"></span>
              </div>
              <div class="shiny-html-output html-fill-item html-fill-container" id="testing-prevalence-expandable"></div>
            </div>
            <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
              <template>Expand</template>
              <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
            </bslib-tooltip>
            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
          </div>
        </div>
        <div class="bslib-grid-item bslib-gap-spacing html-fill-container">
          <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testing-timeline" style="min-height:300px;">
            <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
              <h5>Timeline</h5>
              <div class="inlineSelectInput">
                <div class="form-group shiny-input-container shiny-input-container-inline">
                  <label class="control-label shiny-label-null" for="testing-timeline-title-field" id="testing-timeline-title-field-label"></label>
                  <div id="testing-timeline-title-field" class="virtual-select" style="display:inline-block;" data-update="change">
                    <script type="application/json" data-for="testing-timeline-title-field">{"stateInput":true,"options":{"type":["transpose"],"choices":{"label":["AE Entry Date","AE Start Date","AE End Date"],"value":["mincreated_dts","aest_dt","aeen_dt"]}},"config":{"multiple":false,"search":false,"hideClearButton":true,"autoSelectFirstOption":true,"showSelectedOptionsFirst":false,"showValueAsTags":false,"optionsCount":10,"noOfDisplayValues":50,"allowNewOption":false,"disableSelectAll":true,"disableOptionGroupCheckbox":true,"disabled":false}}</script>
                  </div>
                </div>
                <span id="testing-timeline-title-grouping" class="shiny-html-output"></span>
              </div>
              <div class="shiny-plot-output html-fill-item" id="testing-timeline-plot" style="width:100%;height:400px;"></div>
            </div>
            <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
              <template>Expand</template>
              <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
            </bslib-tooltip>
            <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
          </div>
        </div>
      </bslib-layout-columns>

