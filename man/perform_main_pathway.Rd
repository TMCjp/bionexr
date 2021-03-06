% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/main_pathway.R
\name{perform_main_pathway}
\alias{perform_main_pathway}
\title{Pipeline of pathway-based analysis.}
\usage{
perform_main_pathway(df_user_mut, df_user_exp, sid_pattern = c("-01$",
  "-11$"), mcutoff = 2, fraction = 0.6, padj = 0.01,
  log2_fold_change = 2, jobname = "tcga", raw_count = TRUE,
  use_cache = FALSE)
}
\arguments{
\item{df_user_mut}{Mutation dataframe.}

\item{df_user_exp}{Gene expression dataframe.}

\item{sid_pattern}{A regex string to match case and control IDs.}

\item{mcutoff}{A float number between 0 and 6, default is 2.}

\item{fraction}{A float number between 0 and 1, default is 0.6.}

\item{padj}{Adjusted p value threshold for differential analysis, default is 0.01.}

\item{log2_fold_change}{log2 transformed fold change threshold for
differential analysis, default is 2.}

\item{jobname}{unique job name.}

\item{raw_count}{Logical value, set TRUE to process RSEM-based expression
data.}

\item{use_cache}{Logical value, set TRUE to save intermediate result.}
}
\value{
A list.
}
\description{
This is the pathway-based analysis pipeline.
}
\details{
\code{df_user_mut} is a dataframe with 7 columns, which are "Hugo_Symbol",
"Chromosome", "Start_position", "End_position", "Reference_Allele",
"Tumor_Seq_Allele2", "Tumor_Sample_Barcode". \code{df_user_exp} is a
dataframe, row names are gene symbols, and column names are sample IDs.
\code{sid_pattern} is a regex string that can distingish case ID and control
ID.
}
\examples{
\dontrun{
mut_data <- firehose_get("HNSC", "mutation", run_date = "2015_08_21", run_type = "stddata")
mut_data <- mut_data[[1]]
mut_sample_ids <- unique(mut_data[[7]])

exp_data <- firehose_get("HNSC", "expression", run_date = "2015_08_21", run_type = "stddata")
exp_data <- exp_data[[1]]
exp_sample_ids <- colnames(exp_data)

common_case <- intersect(mut_sample_ids, exp_sample_ids)
exp_control <- grepl("-11$", exp_sample_ids)
hnsc_mut <- mut_data[mut_data[[7]] \%in\% common_case, ]
hnsc_exp <- exp_data[, (exp_sample_ids \%in\% common_case) | exp_control]

prepare_ma()
res <- perform_main_pathway(hnsc_mut, hnsc_exp, jobname = "HNSC", use_cache = TRUE)
}
}

