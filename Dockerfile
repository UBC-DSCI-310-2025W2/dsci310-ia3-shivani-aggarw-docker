# rocker rstudio base
FROM rocker/rstudio:4.4.2

# installing renv
RUN R -e "install.packages(c('renv', 'remotes'), repos = 'https://cran.rstudio.com')"

# copying renv files from local project
COPY renv.lock renv.lock
COPY renv/ renv/

# restoring dependencies based on renv.lock --> minor comment to trigger workflow
RUN R -e "renv::restore()"

# triggering another workflow