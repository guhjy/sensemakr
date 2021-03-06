% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/class_df_from_term.R
\name{class_df_from_term}
\alias{class_df_from_term}
\title{helper function to figure out classes of a data.frame column used in lm}
\usage{
class_df_from_term(model, class_post_formula = FALSE)
}
\arguments{
\item{model}{an 'lm' object}

\item{class_post_formula}{if FALSE (default), returns class of df col BEFORE any in-formula transformations applied to terms
if TRUE, returns class of df col AFTER any in-formula transformations applied to terms}
}
\value{
a named list containing named character vectors. The list names are model terms. The vector names are data frame column names.
The vector values are characters for the data frame column's class.
NOTE: If any in-formula transformations were applied, the data.frame referenced would represent an 'intermediate' one
that is not exactly the originating data.frame passed to the 'data' arg of lm(data=.).
}
\description{
Looks up and returns the class of the data.frame column(s) associated with a model's term.
}
\examples{
model = lm(data = iris,Sepal.Length ~ Species + as.numeric(Species) +
             Species:Sepal.Width + as.factor(Sepal.Width)+
             as.factor(Sepal.Width)*as.factor(Petal.Length)+
             as.numeric(Species)*as.factor(Petal.Length))

class_df_from_term(model,class_post_formula = TRUE)

class_df_from_term(model,class_post_formula = FALSE)
}
