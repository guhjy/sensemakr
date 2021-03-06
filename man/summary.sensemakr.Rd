% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/print_and_summary.R
\name{summary.sensemakr}
\alias{summary.sensemakr}
\alias{summary.sensemakr}
\alias{print.summary.sensemakr}
\alias{summary.sensemakr}
\alias{interpret}
\alias{summary.sensemakr}
\alias{worstcaseinterpret}
\title{The summary method for a sensemakr object}
\usage{
\method{summary}{sensemakr}(object, ...)

\method{print}{summary.sensemakr}(x, q = 1, scenarios = c(1, 0.25), ...)

interpret(object, q = 1)

worstcaseinterpret(object, q = 1, scenarios = c(1, 0.25))
}
\arguments{
\item{object}{a 'sensemakr' object, result of \code{\link{sensemakr}}}

\item{...}{extra arguments that might be passed to underlying functions}

\item{x}{a `summary.sensemakr` object, result of \code{\link{summary.sensemakr}}}

\item{q}{numeric value between 0 and 1 representing proportion of alteration to treatment estimates}

\item{scenarios}{a numeric vector where each element represents a R2 scenario}
}
\description{
The summary.sensemakr() method creates summary text of a sensemakr object.

The companion print.summary.sensemakr() method provides text interpretation of a summarized sensemakr object.

The interpret() function provides text interpretation of sensitivity quantitites.

The worstcaseinterpret() function provides text interpretation of worst-case sensitivity quantitites.
}
\examples{
# loads data
data("darfur")

# fits model
model  = lm(peacefactor ~ directlyharmed + age + farmer_dar + herder_dar +
               pastvoted + hhsize_darfur + female + village, data = darfur)

# runs benchmarking etc
sense = sensemakr(model, treatment = "directlyharmed")

summary(sense)

out_summary = summary(sense)
class(out_summary)


print(summary(sense))

# NOTE: if 'q' or 'scenarios' are specified as optional args
# during summary(...) it is carried forward
# into print.summary.sensemakr() and then
# all the way down into interpret() or worstcaseinterpret()

print(summary(sense),q = 0.2, scenarios = 0.5)
summary(sense,q = 0.2, scenarios = 0.5)


interpret(sense, q = 0.5)
interpret(sense, q = 0.6)
summary(sense)


worstcaseinterpret(sense)
summary(sense)

worstcaseinterpret(sense,q = 0.2, scenarios = 0.5)
summary(sense,q = 0.2, scenarios = 0.5)

}
\seealso{
\code{\link{print}} \code{\link{sensemakr}}
}
