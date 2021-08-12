
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tidydrc

<!-- badges: start -->
<!-- badges: end -->

The goal of {tidydrc} is to create a programmatic, ‘tidy’ interface to
the {drc} package for fitting various dose-response models to large
amounts of experimental data.

This package leverages the `tidyr::nest()` and `purrr::map()` workflow
for keeping raw data, fitted models, predictions, and relevant model
coefficients together in a single data frame.

## Installation

<!-- You can install the released version of {tidydrc} from [CRAN](https://CRAN.R-project.org) with: -->
<!-- ``` r -->
<!-- install.packages("tidydrc") -->
<!-- ``` -->

Install the development version:

``` r
devtools::install_github("bradyajohnston/tidydrc")
```

## Example

With a single function, we fit a `LL.4()` 4 parameter log-logistic
dose-response model do the example data `S.alba`.

``` r
library(tidydrc)
#> Loading required package: drc
#> Loading required package: MASS
#> 
#> 'drc' has been loaded.
#> Please cite R and 'drc' if used for a publication,
#> for references type 'citation()' and 'citation('drc')'.
#> 
#> Attaching package: 'drc'
#> The following objects are masked from 'package:stats':
#> 
#>     gaussian, getInitial
gtsummary::tbl_summary(S.alba)
```

<div id="oocvaqvlhe" style="overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>html {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;
}

#oocvaqvlhe .gt_table {
  display: table;
  border-collapse: collapse;
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

#oocvaqvlhe .gt_heading {
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

#oocvaqvlhe .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#oocvaqvlhe .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 0;
  padding-bottom: 6px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#oocvaqvlhe .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#oocvaqvlhe .gt_col_headings {
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

#oocvaqvlhe .gt_col_heading {
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

#oocvaqvlhe .gt_column_spanner_outer {
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

#oocvaqvlhe .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#oocvaqvlhe .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#oocvaqvlhe .gt_column_spanner {
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

#oocvaqvlhe .gt_group_heading {
  padding: 8px;
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
}

#oocvaqvlhe .gt_empty_group_heading {
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

#oocvaqvlhe .gt_from_md > :first-child {
  margin-top: 0;
}

#oocvaqvlhe .gt_from_md > :last-child {
  margin-bottom: 0;
}

#oocvaqvlhe .gt_row {
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

#oocvaqvlhe .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 12px;
}

#oocvaqvlhe .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#oocvaqvlhe .gt_first_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
}

#oocvaqvlhe .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#oocvaqvlhe .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#oocvaqvlhe .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#oocvaqvlhe .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#oocvaqvlhe .gt_footnotes {
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

#oocvaqvlhe .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding: 4px;
}

#oocvaqvlhe .gt_sourcenotes {
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

#oocvaqvlhe .gt_sourcenote {
  font-size: 90%;
  padding: 4px;
}

#oocvaqvlhe .gt_left {
  text-align: left;
}

#oocvaqvlhe .gt_center {
  text-align: center;
}

#oocvaqvlhe .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#oocvaqvlhe .gt_font_normal {
  font-weight: normal;
}

#oocvaqvlhe .gt_font_bold {
  font-weight: bold;
}

#oocvaqvlhe .gt_font_italic {
  font-style: italic;
}

#oocvaqvlhe .gt_super {
  font-size: 65%;
}

#oocvaqvlhe .gt_footnote_marks {
  font-style: italic;
  font-weight: normal;
  font-size: 65%;
}
</style>
<table class="gt_table">
  
  <thead class="gt_col_headings">
    <tr>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1"><strong>Characteristic</strong></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1"><strong>N = 68</strong><sup class="gt_footnote_marks">1</sup></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td class="gt_row gt_left">Dose</td>
<td class="gt_row gt_center"></td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">0</td>
<td class="gt_row gt_center">16 (24%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">10</td>
<td class="gt_row gt_center">8 (12%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">20</td>
<td class="gt_row gt_center">8 (12%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">40</td>
<td class="gt_row gt_center">8 (12%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">80</td>
<td class="gt_row gt_center">8 (12%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">160</td>
<td class="gt_row gt_center">8 (12%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">320</td>
<td class="gt_row gt_center">8 (12%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">640</td>
<td class="gt_row gt_center">4 (5.9%)</td></tr>
    <tr><td class="gt_row gt_left">Herbicide</td>
<td class="gt_row gt_center"></td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">Bentazone</td>
<td class="gt_row gt_center">36 (53%)</td></tr>
    <tr><td class="gt_row gt_left" style="text-align: left; text-indent: 10px;">Glyphosate</td>
<td class="gt_row gt_center">32 (47%)</td></tr>
    <tr><td class="gt_row gt_left">DryMatter</td>
<td class="gt_row gt_center">2.90 (0.90, 3.80)</td></tr>
  </tbody>
  
  <tfoot>
    <tr class="gt_footnotes">
      <td colspan="2">
        <p class="gt_footnote">
          <sup class="gt_footnote_marks">
            <em>1</em>
          </sup>
           
          n (%); Median (IQR)
          <br />
        </p>
      </td>
    </tr>
  </tfoot>
</table>
</div>

`S.alba` is data from two Herbicide treatments, and contains Dose info
as well as the response to the Dose (`DryMatter`),

Into the `tidydrc_mode()` function we supply the data frame, dose and
response columns, the model we wish to fit (defaults to `LL.4()`) and
and columns we wish to group by – in this case the Herbicide treatment.

``` r
fitted <- tidydrc_model(
    data = S.alba, 
    dose = Dose, 
    response = DryMatter, 
    model = LL.4(), 
    Herbicide
    )

fitted
#> # A tibble: 2 × 6
#> # Groups:   Herbicide [2]
#>   Herbicide  data              drmod  resid         pred           coefs        
#>   <fct>      <list>            <list> <list>        <list>         <list>       
#> 1 Glyphosate <tibble [32 × 4]> <drc>  <df [32 × 2]> <df [680 × 5]> <tibble [4 ×…
#> 2 Bentazone  <tibble [36 × 4]> <drc>  <df [36 × 2]> <df [680 × 5]> <tibble [4 ×…
```

The result of the `tidydrc_model()` function is a `tibble` that has a
row for each group. Each column is a nested object. Associated with each
group we have the `data`, the fitted `drmod` model, the model residuals
`resid`, the fitted curve data in `pred` and the coefficients from the
model in `coefs`.

The user can use `tidyr::unnest()` to access relevant information and
create plots and tables for reporting. The convenience function
`tidydrc_plot()` is provided for quickly plotting the results. The
result can then me modified like any other {ggplot2} plot such as
`ggplot2::facet_wrap()` .

``` r
fitted %>% 
    tidydrc_plot(
        ed50 = FALSE, 
        confint = FALSE, 
        colour = ~Herbicide
    ) + 
    ggplot2::facet_wrap(~Herbicide) + 
    ggplot2::theme(legend.position = "")
#> Warning: Transformation introduced infinite values in continuous x-axis
```

<img src="man/figures/README-plot-example-1.png" width="100%" />
