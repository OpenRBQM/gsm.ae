# Contributing to gsm.ae

This outlines how to propose a change to gsm.ae.
For tips on contributing to R packages, please see the [tidyverse development contributing guide](https://rstd.io/tidy-contrib) and the tidyverse team's [code review principles](https://code-review.tidyverse.org/).

## Fixing typos

You can fix typos, spelling mistakes, or grammatical errors in the documentation directly using the GitHub web interface, as long as the changes are made in the _source_ file. 
This generally means you'll need to edit [roxygen2 comments](https://roxygen2.r-lib.org/articles/roxygen2.html) in an `.R`, not a `.Rd` file. 
You can find the `.R` file that generates the `.Rd` by reading the comment in the first line.

## Bigger changes

If you want to make a bigger change, it's a good idea to first file an issue and make sure someone from the team agrees that it’s needed. 
If you’ve found a bug, please file an issue that illustrates the bug with a minimal [reprex](https://www.tidyverse.org/help/#reprex) (this will also help you write a unit test, if needed).
See the tidyverse guide on [how to create a great issue](https://code-review.tidyverse.org/issues/) for more advice.

### Branches

The core branches that are used in this repository are:

-   `main`: Contains the production version of the package.
-   `dev`: Contains the development version of the package.
-   `fix-XXXX`: Used to develop new functionality in the package.
-   `rc-vX.X.X`: Used for final touches to release `dev` to `main`.

### Pull request process {#pull-request-process}

-   Fork the package and clone onto your computer. If you haven't done this before, we recommend using `usethis::create_from_github("OpenRBQM/gsm.ae")`.
-   Install all development dependencies with `pak::pak()`, and then make sure the package passes R CMD check by running `devtools::check()`. If R CMD check doesn't pass cleanly, it's a good idea to ask for help before continuing. 
-   Create a Git branch for your pull request (PR). We recommend using `usethis::pr_init("brief-description-of-change")`.
-   Make your changes. For user-facing changes, add a bullet to the top of `NEWS.md` (i.e. just below the first header). Follow the style described in <https://style.tidyverse.org/news.html>.
-   Commit your changes to git, and then create a PR by running `usethis::pr_push()`, and following the prompts in your browser. The title of your PR should briefly describe the change. The body of your PR should include `Closes #issue-number`. All PRs other than releases should target the `dev` branch.

### Code style

-   New code should follow the tidyverse [style guide](https://style.tidyverse.org). You can use the [styler](https://CRAN.R-project.org/package=styler) package to apply these styles, but please don't restyle code that has nothing to do with your PR.  

-   We use [roxygen2](https://cran.r-project.org/package=roxygen2), with [Markdown syntax](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html), for documentation.  

-   We use [testthat](https://cran.r-project.org/package=testthat) for unit tests. Contributions with test cases included are easier to accept.

-   See [Styler](#styler) below for the formal guidelines that will be performed at release.

## Release Process {#release-process}

Use this process to update the `main` branch of the project.

-   Create a branch from `dev`, `rc-vX.Y.Z`, where `X.Y.Z` is the target version number of this release.
-   Run `usethis::use_version("major")` (to change the `X` in `X.Y.Z`), `"minor"` (to change the `Y`), or `"patch"` (to change the `Z`). Almost all releases should be `"minor"`. This function updates the `Version` field in the `DESCRIPTION`, as well as the version at the top of `NEWS.md`.
-   Ensure that `NEWS.md` is ready and mentions all relevant changes in the release.
-   Ensure that the `DESCRIPTION` only references `main` branches of `gsm` packages in the `Remotes` section. If {gsm.ae} relies on a branch of a `gsm` package other than `main`, {gsm.ae} is not ready to release. Wait until the other package has a release to its `main` branch.
-   Run `usethis::use_tidy_description()` to ensure that the `DESCRIPTION` is laid out as expected.
-   Run `spelling::spell_check_package()` to eliminate typos. Use `spelling::update_wordlist()` to log any known terms in the package `WORDLIST`, but verify that none of them are typos.
-   Ensure that the package follows the style as described in the [Styler](#styler) section.
-   Run `devtools::check()` to ensure that everything is working as expected. This runs automatically on GitHub for every PR, but it's good to run locally to check for warnings or notes that might be hidden in the GitHub action.

## Styler {styler}

Use this function to ensure that the package follows our style:

```r
gilead_style <- function(dirs = c("R", "tests")) {
  double_indent_style <- styler::tidyverse_style()
  double_indent_style$indention$unindent_fun_dec <- NULL
  double_indent_style$indention$update_indention_ref_fun_dec <- NULL
  double_indent_style$line_break$remove_line_breaks_in_fun_dec <- NULL

  for (dir in dirs) {
    styler::style_dir(
      dir,
      recursive = TRUE,
      transformers = double_indent_style
    )
  }
}
gilead_style()
```

## Code of Conduct

Please note that the gsm.ae project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project you agree to abide by its terms.
