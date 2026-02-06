# rocker rstudio base
FROM rocker/rstudio:4.4.2

# installing renv
RUN R -e "install.packages(c('renv', 'remotes'), repos = 'https://cran.rstudio.com')"

# copying renv files from local project
COPY renv.lock renv.lock
COPY renv/ renv/

RUN R -e "renv::restore()"