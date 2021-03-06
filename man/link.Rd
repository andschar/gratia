% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/family-utils.R
\name{link}
\alias{link}
\alias{link.family}
\alias{link.gam}
\alias{link.bam}
\alias{link.gamm}
\alias{link.glm}
\alias{link.list}
\alias{inv_link}
\alias{inv_link.family}
\alias{inv_link.gam}
\alias{inv_link.bam}
\alias{inv_link.gamm}
\alias{inv_link.list}
\alias{inv_link.glm}
\title{Extract link and inverse link functions from models}
\usage{
link(object, ...)

\method{link}{family}(
  object,
  parameter = c("location", "scale", "shape"),
  which_eta = NULL,
  ...
)

\method{link}{gam}(object, parameter = c("location", "scale", "shape"), ...)

\method{link}{bam}(object, parameter = c("location", "scale", "shape"), ...)

\method{link}{gamm}(object, ...)

\method{link}{glm}(object, ...)

\method{link}{list}(object, ...)

inv_link(object, ...)

\method{inv_link}{family}(
  object,
  parameter = c("location", "scale", "shape"),
  which_eta = NULL,
  ...
)

\method{inv_link}{gam}(object, parameter = c("location", "scale", "shape"), ...)

\method{inv_link}{bam}(object, parameter = c("location", "scale", "shape"), ...)

\method{inv_link}{gamm}(object, ...)

\method{inv_link}{list}(object, ...)

\method{inv_link}{glm}(object, ...)
}
\arguments{
\item{object}{a family object or a fitted model from which to extract the
family object.  Models fitted by \code{\link[stats:glm]{stats::glm()}}, \code{\link[mgcv:gam]{mgcv::gam()}},
\code{\link[mgcv:bam]{mgcv::bam()}}, \code{\link[mgcv:gamm]{mgcv::gamm()}}, and \code{\link[gamm4:gamm4]{gamm4::gamm4()}} are currently
supported.}

\item{...}{arguments passed to other methods.}

\item{parameter}{character; which parameter of the distribution. Usually
\code{"location"} but \code{"scale"} and \code{"shape"} may be provided for location
scale models. Other options include \code{"mu"} and \code{"sigma"} as synonyms for
\code{"location"} and \code{"scale"} respectively, \code{"pi"} for the zero-inflation
term in \code{\link[mgcv:ziplss]{mgcv::ziplss()}}, \code{"power"} for the  \code{\link[mgcv:twlss]{mgcv::twlss()}} power
parameter, and \code{"xi"}, the shape parameter for  \code{\link[mgcv:gevlss]{mgcv::gevlss()}}.}

\item{which_eta}{numeric; the linear predictor to extract for families
\code{\link[mgcv:mvn]{mgcv::mvn()}} and \code{\link[mgcv:multinom]{mgcv::multinom()}}.}
}
\description{
Returns the link or its inverse from an estimated model, and provides a
simple way to extract these functions from complex models with multiple
links, such as location scale models.
}
\examples{
load_mgcv()

link(gaussian())
link(nb())

inv_link(nb())

\dontshow{
set.seed(4234)
}
dat <- gamSim(1, n = 400, dist = "normal", scale = 2, verbose = FALSE)
mod <- gam(list(y ~ s(x0) + s(x1) + s(x2) + s(x3), ~ 1), data = dat,
           family = gaulss)

link(mod, parameter = "scale")
inv_link(mod, parameter = "scale")
}
\author{
Gavin L. Simpson
}
