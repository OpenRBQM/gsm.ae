# gsm.ae 0.1.0

This initial release provides a dashboard that summarizes trends in Site- and Country-level adverse event and severe adverse event data. The data is presented as a series of panels, which can be expanded to show additional information (as demonstrated in the "Prevalence" panel).

## New Features

- Summary Panel: The "Summary" panel presents summary data for AE and SAE at the Study-, Group- (Site or Country), and Participant-level, reacting to the selections of the user. If multiple snapshots are available, the current data is compared to the previous snapshot. (#9, #12, #21, #23, #24, #25, #26, #34, #36, #37)
- Prevalence Panel: The "Prevalence" panel presents plots showing the prevalence (as % of all AEs) for categorical variables such as whether the AE is "Serious?" or the tagged "Toxicity Grade", with bars by Study, Group (Site or Country), and Participant, reacting to the selections of the user. Expanding this panel demonstrates the possibility of different views in this dashboard based on whether or not the panel is expanded. In this case, the view adds a table of all values for the selected categorical variable, sorted by prevalence at the Study level. (#10, #11, #22, #29, #33, #35)
- Timeline Panel: The "Timeline" panel shows counts of adverse events by month for data variables (such as "AE Entry Date", "AE Start Date", and "AE End Date"), faceted at the Study-, Group- (Site or Country), and Participant-level, reacting to the selections of the user. (#16)
