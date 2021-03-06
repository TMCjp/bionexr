% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/plot_ppi.R
\name{network_from_ppi}
\alias{network_from_ppi}
\title{Generate network from PPI-based result.}
\usage{
network_from_ppi(ppi_result, topn = 10)
}
\arguments{
\item{ppi_result}{PPI-based analysis result.}

\item{topn}{Default value is 10.}
}
\value{
A igraph object.
}
\description{
Generate network from PPI-based result.
}
\examples{
\dontrun{

prepare_ma()
res.gene <- perform_gene_ppi(hnsc_mut_part, hnsc_exp_part)
res.network <- perform_network_ppi(res.gene[[2]], res.gene[[3]])
g <- network_from_ppi(res.network)
}
}

