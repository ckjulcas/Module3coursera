rmarkdown::render("steak_article_paramsList.Rmd",
                  params = list(region = "Mountain"))

render_report <-function(regionvar){
  template <-"steak_article_params.Rmd"
  outfile <-sprintf("steak_article_%s.html",regionvar)
  parameters <-list(region = regionvar)
  rmarkdown::render(template,
                    output_file=outfile,
                    params=parameters)
  invisible(TRUE)
}

render_report("Pacific")


## R code to use the custom function with purrr


library(purrr)
params_list <- list(list("East North Central",
                         "East South Central", "Middle Atlantic",
                         "Mountain", "New England", "Pacific",
                         "South Atlantic", "West North Central",
                         "West South Central"))
purrr::pmap(params_list,render_report)
