# mod_AESummary_UI produces the expected UI

    Code
      test_result
    Output
      <div class="card bslib-card bslib-mb-spacing bslib-card-input html-fill-item html-fill-container" data-bslib-card-init data-full-screen="false" data-require-bs-caller="card()" data-require-bs-version="5" id="testing" style="min-height:300px;">
        <div class="card-body bslib-gap-spacing html-fill-item html-fill-container" style="margin-top:auto;margin-bottom:auto;flex:1 1 auto;">
          <h5>Summary</h5>
          <div class="shiny-html-output gt_shiny" id="testing-table"></div>
        </div>
        <bslib-tooltip placement="auto" bsOptions="[]" data-require-bs-version="5" data-require-bs-caller="tooltip()">
          <template>Expand</template>
          <button aria-expanded="false" aria-label="Expand card" class="bslib-full-screen-enter badge rounded-pill"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="height:1em;width:1em;fill:currentColor;" aria-hidden="true" role="img"><path d="M20 5C20 4.4 19.6 4 19 4H13C12.4 4 12 3.6 12 3C12 2.4 12.4 2 13 2H21C21.6 2 22 2.4 22 3V11C22 11.6 21.6 12 21 12C20.4 12 20 11.6 20 11V5ZM4 19C4 19.6 4.4 20 5 20H11C11.6 20 12 20.4 12 21C12 21.6 11.6 22 11 22H3C2.4 22 2 21.6 2 21V13C2 12.4 2.4 12 3 12C3.6 12 4 12.4 4 13V19Z"/></svg></button>
        </bslib-tooltip>
        <script data-bslib-card-init>bslib.Card.initializeAllCards();</script>
      </div>

# mod_AESummary_Server works as expected

    Code
      test_html
    Output
      <div id="gtRandomID" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
        <style>#gtRandomID table {
        font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
      }
      
      #gtRandomID thead, #gtRandomID tbody, #gtRandomID tfoot, #gtRandomID tr, #gtRandomID td, #gtRandomID th {
        border-style: none;
      }
      
      #gtRandomID p {
        margin: 0;
        padding: 0;
      }
      
      #gtRandomID .gt_table {
        display: table;
        border-collapse: collapse;
        line-height: normal;
        margin-left: auto;
        margin-right: auto;
        color: #333333;
        font-size: 16px;
        font-weight: normal;
        font-style: normal;
        background-color: #FFFFFF;
        width: auto;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #A8A8A8;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #A8A8A8;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
      }
      
      #gtRandomID .gt_caption {
        padding-top: 4px;
        padding-bottom: 4px;
      }
      
      #gtRandomID .gt_title {
        color: #333333;
        font-size: 125%;
        font-weight: initial;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-color: #FFFFFF;
        border-bottom-width: 0;
      }
      
      #gtRandomID .gt_subtitle {
        color: #333333;
        font-size: 85%;
        font-weight: initial;
        padding-top: 3px;
        padding-bottom: 5px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-color: #FFFFFF;
        border-top-width: 0;
      }
      
      #gtRandomID .gt_heading {
        background-color: #FFFFFF;
        text-align: center;
        border-bottom-color: #FFFFFF;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_bottom_border {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_col_headings {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_col_heading {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 5px;
        padding-bottom: 6px;
        padding-left: 5px;
        padding-right: 5px;
        overflow-x: hidden;
      }
      
      #gtRandomID .gt_column_spanner_outer {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        padding-top: 0;
        padding-bottom: 0;
        padding-left: 4px;
        padding-right: 4px;
      }
      
      #gtRandomID .gt_column_spanner_outer:first-child {
        padding-left: 0;
      }
      
      #gtRandomID .gt_column_spanner_outer:last-child {
        padding-right: 0;
      }
      
      #gtRandomID .gt_column_spanner {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 5px;
        padding-bottom: 5px;
        overflow-x: hidden;
        display: inline-block;
        width: 100%;
      }
      
      #gtRandomID .gt_spanner_row {
        border-bottom-style: hidden;
      }
      
      #gtRandomID .gt_group_heading {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: middle;
        text-align: left;
      }
      
      #gtRandomID .gt_empty_group_heading {
        padding: 0.5px;
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: middle;
      }
      
      #gtRandomID .gt_from_md > :first-child {
        margin-top: 0;
      }
      
      #gtRandomID .gt_from_md > :last-child {
        margin-bottom: 0;
      }
      
      #gtRandomID .gt_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        margin: 10px;
        border-top-style: solid;
        border-top-width: 1px;
        border-top-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: middle;
        overflow-x: hidden;
      }
      
      #gtRandomID .gt_stub {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: solid;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_stub_row_group {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: solid;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
        vertical-align: top;
      }
      
      #gtRandomID .gt_row_group_first td {
        border-top-width: 2px;
      }
      
      #gtRandomID .gt_row_group_first th {
        border-top-width: 2px;
      }
      
      #gtRandomID .gt_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_first_summary_row {
        border-top-style: solid;
        border-top-color: #D3D3D3;
      }
      
      #gtRandomID .gt_first_summary_row.thick {
        border-top-width: 2px;
      }
      
      #gtRandomID .gt_last_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_grand_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_first_grand_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-style: double;
        border-top-width: 6px;
        border-top-color: #D3D3D3;
      }
      
      #gtRandomID .gt_last_grand_summary_row_top {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: double;
        border-bottom-width: 6px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_striped {
        background-color: rgba(128, 128, 128, 0.05);
      }
      
      #gtRandomID .gt_table_body {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_footnotes {
        color: #333333;
        background-color: #FFFFFF;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_footnote {
        margin: 0px;
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_sourcenotes {
        color: #333333;
        background-color: #FFFFFF;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_sourcenote {
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_left {
        text-align: left;
      }
      
      #gtRandomID .gt_center {
        text-align: center;
      }
      
      #gtRandomID .gt_right {
        text-align: right;
        font-variant-numeric: tabular-nums;
      }
      
      #gtRandomID .gt_font_normal {
        font-weight: normal;
      }
      
      #gtRandomID .gt_font_bold {
        font-weight: bold;
      }
      
      #gtRandomID .gt_font_italic {
        font-style: italic;
      }
      
      #gtRandomID .gt_super {
        font-size: 65%;
      }
      
      #gtRandomID .gt_footnote_marks {
        font-size: 75%;
        vertical-align: 0.4em;
        position: initial;
      }
      
      #gtRandomID .gt_asterisk {
        font-size: 100%;
        vertical-align: 0;
      }
      
      #gtRandomID .gt_indent_1 {
        text-indent: 5px;
      }
      
      #gtRandomID .gt_indent_2 {
        text-indent: 10px;
      }
      
      #gtRandomID .gt_indent_3 {
        text-indent: 15px;
      }
      
      #gtRandomID .gt_indent_4 {
        text-indent: 20px;
      }
      
      #gtRandomID .gt_indent_5 {
        text-indent: 25px;
      }
      
      #gtRandomID .katex-display {
        display: inline-flex !important;
        margin-bottom: 0.75em !important;
      }
      
      #gtRandomID div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
        height: 0px !important;
      }
      </style>
        <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>Δ = change since previous snapshot</caption><!--html_preserve-->
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Study">
              <div class="gt_column_spanner">Study</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Study_Current">Value</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Study_Previous">Δ</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">AE</th>
      <td headers="stub_1_1 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">507</td>
      <td headers="stub_1_1 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+173</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">AE Rate</th>
      <td headers="stub_1_2 Study_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.067</td>
      <td headers="stub_1_2 Study_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.043</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">SAE</th>
      <td headers="stub_1_3 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">276</td>
      <td headers="stub_1_3 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+90</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">SAE Rate</th>
      <td headers="stub_1_4 Study_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.037</td>
      <td headers="stub_1_4 Study_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.022</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">Days on Study</th>
      <td headers="stub_1_5 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">7,530</td>
      <td headers="stub_1_5 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+4,400</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">Participants</th>
      <td headers="stub_1_6 Study_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">170</td>
      <td headers="stub_1_6 Study_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">+59</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub"> w/0 AE</th>
      <td headers="stub_1_7 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">27</td>
      <td headers="stub_1_7 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+9</td></tr>
        </tbody>
        
        
      </table>
      </div>
      <script>gtShinyBinding.initialize('testing-table');</script>

---

    Code
      test_html
    Output
      <div id="gtRandomID" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
        <style>#gtRandomID table {
        font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
      }
      
      #gtRandomID thead, #gtRandomID tbody, #gtRandomID tfoot, #gtRandomID tr, #gtRandomID td, #gtRandomID th {
        border-style: none;
      }
      
      #gtRandomID p {
        margin: 0;
        padding: 0;
      }
      
      #gtRandomID .gt_table {
        display: table;
        border-collapse: collapse;
        line-height: normal;
        margin-left: auto;
        margin-right: auto;
        color: #333333;
        font-size: 16px;
        font-weight: normal;
        font-style: normal;
        background-color: #FFFFFF;
        width: auto;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #A8A8A8;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #A8A8A8;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
      }
      
      #gtRandomID .gt_caption {
        padding-top: 4px;
        padding-bottom: 4px;
      }
      
      #gtRandomID .gt_title {
        color: #333333;
        font-size: 125%;
        font-weight: initial;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-color: #FFFFFF;
        border-bottom-width: 0;
      }
      
      #gtRandomID .gt_subtitle {
        color: #333333;
        font-size: 85%;
        font-weight: initial;
        padding-top: 3px;
        padding-bottom: 5px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-color: #FFFFFF;
        border-top-width: 0;
      }
      
      #gtRandomID .gt_heading {
        background-color: #FFFFFF;
        text-align: center;
        border-bottom-color: #FFFFFF;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_bottom_border {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_col_headings {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_col_heading {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 5px;
        padding-bottom: 6px;
        padding-left: 5px;
        padding-right: 5px;
        overflow-x: hidden;
      }
      
      #gtRandomID .gt_column_spanner_outer {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        padding-top: 0;
        padding-bottom: 0;
        padding-left: 4px;
        padding-right: 4px;
      }
      
      #gtRandomID .gt_column_spanner_outer:first-child {
        padding-left: 0;
      }
      
      #gtRandomID .gt_column_spanner_outer:last-child {
        padding-right: 0;
      }
      
      #gtRandomID .gt_column_spanner {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 5px;
        padding-bottom: 5px;
        overflow-x: hidden;
        display: inline-block;
        width: 100%;
      }
      
      #gtRandomID .gt_spanner_row {
        border-bottom-style: hidden;
      }
      
      #gtRandomID .gt_group_heading {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: middle;
        text-align: left;
      }
      
      #gtRandomID .gt_empty_group_heading {
        padding: 0.5px;
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: middle;
      }
      
      #gtRandomID .gt_from_md > :first-child {
        margin-top: 0;
      }
      
      #gtRandomID .gt_from_md > :last-child {
        margin-bottom: 0;
      }
      
      #gtRandomID .gt_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        margin: 10px;
        border-top-style: solid;
        border-top-width: 1px;
        border-top-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: middle;
        overflow-x: hidden;
      }
      
      #gtRandomID .gt_stub {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: solid;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_stub_row_group {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: solid;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
        vertical-align: top;
      }
      
      #gtRandomID .gt_row_group_first td {
        border-top-width: 2px;
      }
      
      #gtRandomID .gt_row_group_first th {
        border-top-width: 2px;
      }
      
      #gtRandomID .gt_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_first_summary_row {
        border-top-style: solid;
        border-top-color: #D3D3D3;
      }
      
      #gtRandomID .gt_first_summary_row.thick {
        border-top-width: 2px;
      }
      
      #gtRandomID .gt_last_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_grand_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_first_grand_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-style: double;
        border-top-width: 6px;
        border-top-color: #D3D3D3;
      }
      
      #gtRandomID .gt_last_grand_summary_row_top {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: double;
        border-bottom-width: 6px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_striped {
        background-color: rgba(128, 128, 128, 0.05);
      }
      
      #gtRandomID .gt_table_body {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_footnotes {
        color: #333333;
        background-color: #FFFFFF;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_footnote {
        margin: 0px;
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_sourcenotes {
        color: #333333;
        background-color: #FFFFFF;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_sourcenote {
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_left {
        text-align: left;
      }
      
      #gtRandomID .gt_center {
        text-align: center;
      }
      
      #gtRandomID .gt_right {
        text-align: right;
        font-variant-numeric: tabular-nums;
      }
      
      #gtRandomID .gt_font_normal {
        font-weight: normal;
      }
      
      #gtRandomID .gt_font_bold {
        font-weight: bold;
      }
      
      #gtRandomID .gt_font_italic {
        font-style: italic;
      }
      
      #gtRandomID .gt_super {
        font-size: 65%;
      }
      
      #gtRandomID .gt_footnote_marks {
        font-size: 75%;
        vertical-align: 0.4em;
        position: initial;
      }
      
      #gtRandomID .gt_asterisk {
        font-size: 100%;
        vertical-align: 0;
      }
      
      #gtRandomID .gt_indent_1 {
        text-indent: 5px;
      }
      
      #gtRandomID .gt_indent_2 {
        text-indent: 10px;
      }
      
      #gtRandomID .gt_indent_3 {
        text-indent: 15px;
      }
      
      #gtRandomID .gt_indent_4 {
        text-indent: 20px;
      }
      
      #gtRandomID .gt_indent_5 {
        text-indent: 25px;
      }
      
      #gtRandomID .katex-display {
        display: inline-flex !important;
        margin-bottom: 0.75em !important;
      }
      
      #gtRandomID div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
        height: 0px !important;
      }
      </style>
        <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>Δ = change since previous snapshot</caption><!--html_preserve-->
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Study">
              <div class="gt_column_spanner">Study</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Site (0X902)">
              <div class="gt_column_spanner">Site (0X902)</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Study_Current">Value</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Study_Previous">Δ</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Site_Current">Value</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Site_Previous">Δ</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">AE</th>
      <td headers="stub_1_1 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">507</td>
      <td headers="stub_1_1 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+173</td>
      <td headers="stub_1_1 Site_Current" class="gt_row gt_center" style="white-space: nowrap;">41</td>
      <td headers="stub_1_1 Site_Previous" class="gt_row gt_center" style="white-space: nowrap;">+8</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">AE Rate</th>
      <td headers="stub_1_2 Study_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.067</td>
      <td headers="stub_1_2 Study_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.043</td>
      <td headers="stub_1_2 Site_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.077</td>
      <td headers="stub_1_2 Site_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.053</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">SAE</th>
      <td headers="stub_1_3 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">276</td>
      <td headers="stub_1_3 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+90</td>
      <td headers="stub_1_3 Site_Current" class="gt_row gt_center" style="white-space: nowrap;">27</td>
      <td headers="stub_1_3 Site_Previous" class="gt_row gt_center" style="white-space: nowrap;">+6</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">SAE Rate</th>
      <td headers="stub_1_4 Study_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.037</td>
      <td headers="stub_1_4 Study_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.022</td>
      <td headers="stub_1_4 Site_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.050</td>
      <td headers="stub_1_4 Site_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.032</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">Days on Study</th>
      <td headers="stub_1_5 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">7,530</td>
      <td headers="stub_1_5 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+4,400</td>
      <td headers="stub_1_5 Site_Current" class="gt_row gt_center" style="white-space: nowrap;">535</td>
      <td headers="stub_1_5 Site_Previous" class="gt_row gt_center" style="white-space: nowrap;">+279</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">Participants</th>
      <td headers="stub_1_6 Study_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">170</td>
      <td headers="stub_1_6 Study_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">+59</td>
      <td headers="stub_1_6 Site_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">9</td>
      <td headers="stub_1_6 Site_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub"> w/0 AE</th>
      <td headers="stub_1_7 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">27</td>
      <td headers="stub_1_7 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+9</td>
      <td headers="stub_1_7 Site_Current" class="gt_row gt_center" style="white-space: nowrap;">0</td>
      <td headers="stub_1_7 Site_Previous" class="gt_row gt_center" style="white-space: nowrap;">−1</td></tr>
        </tbody>
        
        
      </table>
      </div>
      <script>gtShinyBinding.initialize('testing-table');</script>

---

    Code
      test_html
    Output
      <div id="gtRandomID" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
        <style>#gtRandomID table {
        font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
      }
      
      #gtRandomID thead, #gtRandomID tbody, #gtRandomID tfoot, #gtRandomID tr, #gtRandomID td, #gtRandomID th {
        border-style: none;
      }
      
      #gtRandomID p {
        margin: 0;
        padding: 0;
      }
      
      #gtRandomID .gt_table {
        display: table;
        border-collapse: collapse;
        line-height: normal;
        margin-left: auto;
        margin-right: auto;
        color: #333333;
        font-size: 16px;
        font-weight: normal;
        font-style: normal;
        background-color: #FFFFFF;
        width: auto;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #A8A8A8;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #A8A8A8;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
      }
      
      #gtRandomID .gt_caption {
        padding-top: 4px;
        padding-bottom: 4px;
      }
      
      #gtRandomID .gt_title {
        color: #333333;
        font-size: 125%;
        font-weight: initial;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-color: #FFFFFF;
        border-bottom-width: 0;
      }
      
      #gtRandomID .gt_subtitle {
        color: #333333;
        font-size: 85%;
        font-weight: initial;
        padding-top: 3px;
        padding-bottom: 5px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-color: #FFFFFF;
        border-top-width: 0;
      }
      
      #gtRandomID .gt_heading {
        background-color: #FFFFFF;
        text-align: center;
        border-bottom-color: #FFFFFF;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_bottom_border {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_col_headings {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_col_heading {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 5px;
        padding-bottom: 6px;
        padding-left: 5px;
        padding-right: 5px;
        overflow-x: hidden;
      }
      
      #gtRandomID .gt_column_spanner_outer {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        padding-top: 0;
        padding-bottom: 0;
        padding-left: 4px;
        padding-right: 4px;
      }
      
      #gtRandomID .gt_column_spanner_outer:first-child {
        padding-left: 0;
      }
      
      #gtRandomID .gt_column_spanner_outer:last-child {
        padding-right: 0;
      }
      
      #gtRandomID .gt_column_spanner {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 5px;
        padding-bottom: 5px;
        overflow-x: hidden;
        display: inline-block;
        width: 100%;
      }
      
      #gtRandomID .gt_spanner_row {
        border-bottom-style: hidden;
      }
      
      #gtRandomID .gt_group_heading {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: middle;
        text-align: left;
      }
      
      #gtRandomID .gt_empty_group_heading {
        padding: 0.5px;
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: middle;
      }
      
      #gtRandomID .gt_from_md > :first-child {
        margin-top: 0;
      }
      
      #gtRandomID .gt_from_md > :last-child {
        margin-bottom: 0;
      }
      
      #gtRandomID .gt_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        margin: 10px;
        border-top-style: solid;
        border-top-width: 1px;
        border-top-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: middle;
        overflow-x: hidden;
      }
      
      #gtRandomID .gt_stub {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: solid;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_stub_row_group {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: solid;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
        vertical-align: top;
      }
      
      #gtRandomID .gt_row_group_first td {
        border-top-width: 2px;
      }
      
      #gtRandomID .gt_row_group_first th {
        border-top-width: 2px;
      }
      
      #gtRandomID .gt_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_first_summary_row {
        border-top-style: solid;
        border-top-color: #D3D3D3;
      }
      
      #gtRandomID .gt_first_summary_row.thick {
        border-top-width: 2px;
      }
      
      #gtRandomID .gt_last_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_grand_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_first_grand_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-style: double;
        border-top-width: 6px;
        border-top-color: #D3D3D3;
      }
      
      #gtRandomID .gt_last_grand_summary_row_top {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: double;
        border-bottom-width: 6px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_striped {
        background-color: rgba(128, 128, 128, 0.05);
      }
      
      #gtRandomID .gt_table_body {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_footnotes {
        color: #333333;
        background-color: #FFFFFF;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_footnote {
        margin: 0px;
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_sourcenotes {
        color: #333333;
        background-color: #FFFFFF;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_sourcenote {
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_left {
        text-align: left;
      }
      
      #gtRandomID .gt_center {
        text-align: center;
      }
      
      #gtRandomID .gt_right {
        text-align: right;
        font-variant-numeric: tabular-nums;
      }
      
      #gtRandomID .gt_font_normal {
        font-weight: normal;
      }
      
      #gtRandomID .gt_font_bold {
        font-weight: bold;
      }
      
      #gtRandomID .gt_font_italic {
        font-style: italic;
      }
      
      #gtRandomID .gt_super {
        font-size: 65%;
      }
      
      #gtRandomID .gt_footnote_marks {
        font-size: 75%;
        vertical-align: 0.4em;
        position: initial;
      }
      
      #gtRandomID .gt_asterisk {
        font-size: 100%;
        vertical-align: 0;
      }
      
      #gtRandomID .gt_indent_1 {
        text-indent: 5px;
      }
      
      #gtRandomID .gt_indent_2 {
        text-indent: 10px;
      }
      
      #gtRandomID .gt_indent_3 {
        text-indent: 15px;
      }
      
      #gtRandomID .gt_indent_4 {
        text-indent: 20px;
      }
      
      #gtRandomID .gt_indent_5 {
        text-indent: 25px;
      }
      
      #gtRandomID .katex-display {
        display: inline-flex !important;
        margin-bottom: 0.75em !important;
      }
      
      #gtRandomID div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
        height: 0px !important;
      }
      </style>
        <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>Δ = change since previous snapshot</caption><!--html_preserve-->
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Study">
              <div class="gt_column_spanner">Study</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Site (0X902)">
              <div class="gt_column_spanner">Site (0X902)</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Participant (S65082)">
              <div class="gt_column_spanner">Participant (S65082)</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Study_Current">Value</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Study_Previous">Δ</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Site_Current">Value</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Site_Previous">Δ</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Participant_Current">Value</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Participant_Previous">Δ</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">AE</th>
      <td headers="stub_1_1 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">507</td>
      <td headers="stub_1_1 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+173</td>
      <td headers="stub_1_1 Site_Current" class="gt_row gt_center" style="white-space: nowrap;">41</td>
      <td headers="stub_1_1 Site_Previous" class="gt_row gt_center" style="white-space: nowrap;">+8</td>
      <td headers="stub_1_1 Participant_Current" class="gt_row gt_center" style="white-space: nowrap;">8</td>
      <td headers="stub_1_1 Participant_Previous" class="gt_row gt_center" style="white-space: nowrap;">+1</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">AE Rate</th>
      <td headers="stub_1_2 Study_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.067</td>
      <td headers="stub_1_2 Study_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.043</td>
      <td headers="stub_1_2 Site_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.077</td>
      <td headers="stub_1_2 Site_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.053</td>
      <td headers="stub_1_2 Participant_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.099</td>
      <td headers="stub_1_2 Participant_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.041</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">SAE</th>
      <td headers="stub_1_3 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">276</td>
      <td headers="stub_1_3 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+90</td>
      <td headers="stub_1_3 Site_Current" class="gt_row gt_center" style="white-space: nowrap;">27</td>
      <td headers="stub_1_3 Site_Previous" class="gt_row gt_center" style="white-space: nowrap;">+6</td>
      <td headers="stub_1_3 Participant_Current" class="gt_row gt_center" style="white-space: nowrap;">6</td>
      <td headers="stub_1_3 Participant_Previous" class="gt_row gt_center" style="white-space: nowrap;">0</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">SAE Rate</th>
      <td headers="stub_1_4 Study_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.037</td>
      <td headers="stub_1_4 Study_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.022</td>
      <td headers="stub_1_4 Site_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.050</td>
      <td headers="stub_1_4 Site_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.032</td>
      <td headers="stub_1_4 Participant_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.074</td>
      <td headers="stub_1_4 Participant_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.046</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">Days on Study</th>
      <td headers="stub_1_5 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">7,530</td>
      <td headers="stub_1_5 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+4,400</td>
      <td headers="stub_1_5 Site_Current" class="gt_row gt_center" style="white-space: nowrap;">535</td>
      <td headers="stub_1_5 Site_Previous" class="gt_row gt_center" style="white-space: nowrap;">+279</td>
      <td headers="stub_1_5 Participant_Current" class="gt_row gt_center" style="white-space: nowrap;">81</td>
      <td headers="stub_1_5 Participant_Previous" class="gt_row gt_center" style="white-space: nowrap;">+31</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">Participants</th>
      <td headers="stub_1_6 Study_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">170</td>
      <td headers="stub_1_6 Study_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">+59</td>
      <td headers="stub_1_6 Site_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">9</td>
      <td headers="stub_1_6 Site_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0</td>
      <td headers="stub_1_6 Participant_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">1</td>
      <td headers="stub_1_6 Participant_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub"> w/0 AE</th>
      <td headers="stub_1_7 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">27</td>
      <td headers="stub_1_7 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+9</td>
      <td headers="stub_1_7 Site_Current" class="gt_row gt_center" style="white-space: nowrap;">0</td>
      <td headers="stub_1_7 Site_Previous" class="gt_row gt_center" style="white-space: nowrap;">−1</td>
      <td headers="stub_1_7 Participant_Current" class="gt_row gt_center" style="white-space: nowrap;">0</td>
      <td headers="stub_1_7 Participant_Previous" class="gt_row gt_center" style="white-space: nowrap;">0</td></tr>
        </tbody>
        
        
      </table>
      </div>
      <script>gtShinyBinding.initialize('testing-table');</script>

---

    Code
      test_html
    Output
      <div id="gtRandomID" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
        <style>#gtRandomID table {
        font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
      }
      
      #gtRandomID thead, #gtRandomID tbody, #gtRandomID tfoot, #gtRandomID tr, #gtRandomID td, #gtRandomID th {
        border-style: none;
      }
      
      #gtRandomID p {
        margin: 0;
        padding: 0;
      }
      
      #gtRandomID .gt_table {
        display: table;
        border-collapse: collapse;
        line-height: normal;
        margin-left: auto;
        margin-right: auto;
        color: #333333;
        font-size: 16px;
        font-weight: normal;
        font-style: normal;
        background-color: #FFFFFF;
        width: auto;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #A8A8A8;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #A8A8A8;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
      }
      
      #gtRandomID .gt_caption {
        padding-top: 4px;
        padding-bottom: 4px;
      }
      
      #gtRandomID .gt_title {
        color: #333333;
        font-size: 125%;
        font-weight: initial;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-color: #FFFFFF;
        border-bottom-width: 0;
      }
      
      #gtRandomID .gt_subtitle {
        color: #333333;
        font-size: 85%;
        font-weight: initial;
        padding-top: 3px;
        padding-bottom: 5px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-color: #FFFFFF;
        border-top-width: 0;
      }
      
      #gtRandomID .gt_heading {
        background-color: #FFFFFF;
        text-align: center;
        border-bottom-color: #FFFFFF;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_bottom_border {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_col_headings {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_col_heading {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 5px;
        padding-bottom: 6px;
        padding-left: 5px;
        padding-right: 5px;
        overflow-x: hidden;
      }
      
      #gtRandomID .gt_column_spanner_outer {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: normal;
        text-transform: inherit;
        padding-top: 0;
        padding-bottom: 0;
        padding-left: 4px;
        padding-right: 4px;
      }
      
      #gtRandomID .gt_column_spanner_outer:first-child {
        padding-left: 0;
      }
      
      #gtRandomID .gt_column_spanner_outer:last-child {
        padding-right: 0;
      }
      
      #gtRandomID .gt_column_spanner {
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: bottom;
        padding-top: 5px;
        padding-bottom: 5px;
        overflow-x: hidden;
        display: inline-block;
        width: 100%;
      }
      
      #gtRandomID .gt_spanner_row {
        border-bottom-style: hidden;
      }
      
      #gtRandomID .gt_group_heading {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: middle;
        text-align: left;
      }
      
      #gtRandomID .gt_empty_group_heading {
        padding: 0.5px;
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        vertical-align: middle;
      }
      
      #gtRandomID .gt_from_md > :first-child {
        margin-top: 0;
      }
      
      #gtRandomID .gt_from_md > :last-child {
        margin-bottom: 0;
      }
      
      #gtRandomID .gt_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        margin: 10px;
        border-top-style: solid;
        border-top-width: 1px;
        border-top-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 1px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 1px;
        border-right-color: #D3D3D3;
        vertical-align: middle;
        overflow-x: hidden;
      }
      
      #gtRandomID .gt_stub {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: solid;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_stub_row_group {
        color: #333333;
        background-color: #FFFFFF;
        font-size: 100%;
        font-weight: initial;
        text-transform: inherit;
        border-right-style: solid;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
        padding-left: 5px;
        padding-right: 5px;
        vertical-align: top;
      }
      
      #gtRandomID .gt_row_group_first td {
        border-top-width: 2px;
      }
      
      #gtRandomID .gt_row_group_first th {
        border-top-width: 2px;
      }
      
      #gtRandomID .gt_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_first_summary_row {
        border-top-style: solid;
        border-top-color: #D3D3D3;
      }
      
      #gtRandomID .gt_first_summary_row.thick {
        border-top-width: 2px;
      }
      
      #gtRandomID .gt_last_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_grand_summary_row {
        color: #333333;
        background-color: #FFFFFF;
        text-transform: inherit;
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_first_grand_summary_row {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-top-style: double;
        border-top-width: 6px;
        border-top-color: #D3D3D3;
      }
      
      #gtRandomID .gt_last_grand_summary_row_top {
        padding-top: 8px;
        padding-bottom: 8px;
        padding-left: 5px;
        padding-right: 5px;
        border-bottom-style: double;
        border-bottom-width: 6px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_striped {
        background-color: rgba(128, 128, 128, 0.05);
      }
      
      #gtRandomID .gt_table_body {
        border-top-style: solid;
        border-top-width: 2px;
        border-top-color: #D3D3D3;
        border-bottom-style: solid;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
      }
      
      #gtRandomID .gt_footnotes {
        color: #333333;
        background-color: #FFFFFF;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_footnote {
        margin: 0px;
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_sourcenotes {
        color: #333333;
        background-color: #FFFFFF;
        border-bottom-style: none;
        border-bottom-width: 2px;
        border-bottom-color: #D3D3D3;
        border-left-style: none;
        border-left-width: 2px;
        border-left-color: #D3D3D3;
        border-right-style: none;
        border-right-width: 2px;
        border-right-color: #D3D3D3;
      }
      
      #gtRandomID .gt_sourcenote {
        font-size: 90%;
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 5px;
        padding-right: 5px;
      }
      
      #gtRandomID .gt_left {
        text-align: left;
      }
      
      #gtRandomID .gt_center {
        text-align: center;
      }
      
      #gtRandomID .gt_right {
        text-align: right;
        font-variant-numeric: tabular-nums;
      }
      
      #gtRandomID .gt_font_normal {
        font-weight: normal;
      }
      
      #gtRandomID .gt_font_bold {
        font-weight: bold;
      }
      
      #gtRandomID .gt_font_italic {
        font-style: italic;
      }
      
      #gtRandomID .gt_super {
        font-size: 65%;
      }
      
      #gtRandomID .gt_footnote_marks {
        font-size: 75%;
        vertical-align: 0.4em;
        position: initial;
      }
      
      #gtRandomID .gt_asterisk {
        font-size: 100%;
        vertical-align: 0;
      }
      
      #gtRandomID .gt_indent_1 {
        text-indent: 5px;
      }
      
      #gtRandomID .gt_indent_2 {
        text-indent: 10px;
      }
      
      #gtRandomID .gt_indent_3 {
        text-indent: 15px;
      }
      
      #gtRandomID .gt_indent_4 {
        text-indent: 20px;
      }
      
      #gtRandomID .gt_indent_5 {
        text-indent: 25px;
      }
      
      #gtRandomID .katex-display {
        display: inline-flex !important;
        margin-bottom: 0.75em !important;
      }
      
      #gtRandomID div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
        height: 0px !important;
      }
      </style>
        <table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
        <!--/html_preserve--><caption class='gt_caption'>Δ = change since previous snapshot</caption><!--html_preserve-->
        <thead>
          <tr class="gt_col_headings gt_spanner_row">
            <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="a::stub"></th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Study">
              <div class="gt_column_spanner">Study</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Site (0X902)">
              <div class="gt_column_spanner">Site (0X902)</div>
            </th>
            <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="2" scope="colgroup" id="Participant (S65082)">
              <div class="gt_column_spanner">Participant (S65082)</div>
            </th>
          </tr>
          <tr class="gt_col_headings">
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Study_Current">Value</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Study_Previous">Δ</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Site_Current">Value</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Site_Previous">Δ</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Participant_Current">Value</th>
            <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Participant_Previous">Δ</th>
          </tr>
        </thead>
        <tbody class="gt_table_body">
          <tr><th id="stub_1_1" scope="row" class="gt_row gt_right gt_stub">AE</th>
      <td headers="stub_1_1 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">334</td>
      <td headers="stub_1_1 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+171</td>
      <td headers="stub_1_1 Site_Current" class="gt_row gt_center" style="white-space: nowrap;">33</td>
      <td headers="stub_1_1 Site_Previous" class="gt_row gt_center" style="white-space: nowrap;">+16</td>
      <td headers="stub_1_1 Participant_Current" class="gt_row gt_center" style="white-space: nowrap;">7</td>
      <td headers="stub_1_1 Participant_Previous" class="gt_row gt_center" style="white-space: nowrap;">+4</td></tr>
          <tr><th id="stub_1_2" scope="row" class="gt_row gt_right gt_stub">AE Rate</th>
      <td headers="stub_1_2 Study_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.110</td>
      <td headers="stub_1_2 Study_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.110</td>
      <td headers="stub_1_2 Site_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.130</td>
      <td headers="stub_1_2 Site_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.110</td>
      <td headers="stub_1_2 Participant_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.140</td>
      <td headers="stub_1_2 Participant_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0</td></tr>
          <tr><th id="stub_1_3" scope="row" class="gt_row gt_right gt_stub">SAE</th>
      <td headers="stub_1_3 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">186</td>
      <td headers="stub_1_3 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+105</td>
      <td headers="stub_1_3 Site_Current" class="gt_row gt_center" style="white-space: nowrap;">21</td>
      <td headers="stub_1_3 Site_Previous" class="gt_row gt_center" style="white-space: nowrap;">+13</td>
      <td headers="stub_1_3 Participant_Current" class="gt_row gt_center" style="white-space: nowrap;">6</td>
      <td headers="stub_1_3 Participant_Previous" class="gt_row gt_center" style="white-space: nowrap;">+3</td></tr>
          <tr><th id="stub_1_4" scope="row" class="gt_row gt_right gt_stub">SAE Rate</th>
      <td headers="stub_1_4 Study_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.059</td>
      <td headers="stub_1_4 Study_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.051</td>
      <td headers="stub_1_4 Site_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.082</td>
      <td headers="stub_1_4 Site_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.028</td>
      <td headers="stub_1_4 Participant_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0.120</td>
      <td headers="stub_1_4 Participant_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">−0.020</td></tr>
          <tr><th id="stub_1_5" scope="row" class="gt_row gt_right gt_stub">Days on Study</th>
      <td headers="stub_1_5 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">3,130</td>
      <td headers="stub_1_5 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+2,389</td>
      <td headers="stub_1_5 Site_Current" class="gt_row gt_center" style="white-space: nowrap;">256</td>
      <td headers="stub_1_5 Site_Previous" class="gt_row gt_center" style="white-space: nowrap;">+184</td>
      <td headers="stub_1_5 Participant_Current" class="gt_row gt_center" style="white-space: nowrap;">50</td>
      <td headers="stub_1_5 Participant_Previous" class="gt_row gt_center" style="white-space: nowrap;">+29</td></tr>
          <tr><th id="stub_1_6" scope="row" class="gt_row gt_right gt_stub">Participants</th>
      <td headers="stub_1_6 Study_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">111</td>
      <td headers="stub_1_6 Study_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">+60</td>
      <td headers="stub_1_6 Site_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">9</td>
      <td headers="stub_1_6 Site_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">+4</td>
      <td headers="stub_1_6 Participant_Current" class="gt_row gt_center gt_striped" style="white-space: nowrap;">1</td>
      <td headers="stub_1_6 Participant_Previous" class="gt_row gt_center gt_striped" style="white-space: nowrap;">0</td></tr>
          <tr><th id="stub_1_7" scope="row" class="gt_row gt_right gt_stub"> w/0 AE</th>
      <td headers="stub_1_7 Study_Current" class="gt_row gt_center" style="white-space: nowrap;">18</td>
      <td headers="stub_1_7 Study_Previous" class="gt_row gt_center" style="white-space: nowrap;">+15</td>
      <td headers="stub_1_7 Site_Current" class="gt_row gt_center" style="white-space: nowrap;">1</td>
      <td headers="stub_1_7 Site_Previous" class="gt_row gt_center" style="white-space: nowrap;">+1</td>
      <td headers="stub_1_7 Participant_Current" class="gt_row gt_center" style="white-space: nowrap;">0</td>
      <td headers="stub_1_7 Participant_Previous" class="gt_row gt_center" style="white-space: nowrap;">0</td></tr>
        </tbody>
        
        
      </table>
      </div>
      <script>gtShinyBinding.initialize('testing-table');</script>

