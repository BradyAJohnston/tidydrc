% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidydrc_model.R
\name{tidydrc_model}
\alias{tidydrc_model}
\title{Tidy wrapper for \code{drc}}
\usage{
tidydrc_model(data, dose, response, model, ...)
}
\arguments{
\item{data}{dataframe with two or more variables, organized in a tidy way}

\item{dose}{Numeric, the dose variable (could be time, amount of some
compound, ...)}

\item{response}{Numeric, the response variable (for example population size,
optical density, ...)}

\item{model}{The model function from \code{drc}. Default is \code{LL.4()}}

\item{...}{Variables to group by}
}
\value{
A tibble with list-columns containing the data, the predictions and
the coefficients of the model.
}
\description{
Tidy modelling of dose-response relationships with the \code{drc} package.
}
\details{
This function is a tidy wrapper for the dose-response modeling functions of
the \code{drc} package. By default, the four-parameter log-logistic function
\code{LL.4()} is used. All other functions, implemented in \code{drc}, can be
used when provided as the \code{model} parameter to this function. The
function returns a dataframe with list-columns (the data, predictions and
coefficients). It is thus easy to implement in tidy workflows.
}
\examples{
### Logistic regression of bacterial growth data ###
# using the built-in dataset growthdata3
library(tidyverse)
data(growthdata3)

gdata <- growthdata3 \%>\% gather(strain, value, strain1:strain3)
llm.1 <- gdata \%>\% tidydrc_model(dose = hours, response = value, model = LL.5(), strain)
# get the coefficients of the model(s)
llm.1 \%>\% unnest(coefs)
# make a ggplot, facetting by strain
llm.1 \%>\% tidydrc_plot(confint = TRUE) + ggplot2::facet_grid(. ~ strain)

### Using the S.alba dataset from drc ###
llm <- tidydrc_model(S.alba, Dose, DryMatter, model = LL.4(), Herbicide)
llm \%>\% unnest(coefs)
# estimate the effective doses for several response levels, as a tibble
names(llm$drmod) <- as.character(llm$Herbicide)
map(llm$drmod, ED, c(10, 50, 90)) \%>\% map_df(as_tibble, rownames = "level", .id = "Herbicide")

### Fit a Michaelis-Menten kinetics model ###
# for the built-in Puromycin dataset and get the Km values with std. error
mm <- tidydrc_model(Puromycin, conc, rate, model = MM.3(), state)
names(mm$drmod) <- as.character(mm$state)
map(mm$drmod, ED, 50) \%>\% map_df(as_tibble, .id = "sample")
}
\seealso{
\link[tidydrc]{tidydrc_plot}
}
\author{
Angel Angelov
}
