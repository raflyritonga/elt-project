# IMDB MOVIE ELT

#### Note: You're now in airflow branch

This repository contains a custom Extract, Load, Transform (ELT) project that utilizes Docker and PostgreSQL to demonstrate a simple ELT process for IMDB Movie dataset from Kaggle.

Be aware that this repository has 4 branches: 
- [main](https://github.com/raflyritonga/imdb-movie-elt): 
    > **The Simplest One** 
    > Performs manual ELT process using dummy data and containerization with docker

- [dbt](https://github.com/raflyritonga/imdb-movie-elt/tree/dbt): 
    > **The Stepping Stone** 
    > Leverage the ELT process using DBT as a data modelling tools for better management and organized

- [cron](https://github.com/raflyritonga/imdb-movie-elt/tree/cron): 
    > **The Next Step** 
    > Implemented CRON job to automate the ELT process by scheduled the ELT script running at spefified interval. In this case, run every day at 3am.

- [airflow](https://github.com/raflyritonga/imdb-movie-elt/tree/airflow): 
    > **The Final One** 
    > The complete orchestrated IMDB Movie ELT using Airflow and replace the dummy data with the real dataset up to 9000+ rows and 3+ tables. The dataset can be found in `datasets` folder


## Getting Started

Download [Docker](https://www.docker.com/), [Python](https://www.python.org/), and [Pip](https://pip.pypa.io/en/stable/getting-started/#) on your machine

Clone this repository

```bash
  git clone https://github.com/raflyritonga/imdb-movie-elt.git
```
Navigate to repository directory

```bash
  cd imdb-movie-elt
```

Install dependencies

```bash
  pip install -r requirements.txt
```

Run project

```bash
  docker compose up
```

Once ELT process done, you can access the PostgreSQL databases on ports 5433 and 5434

## Acknowledgements

 - [Credit to Justin Chau](https://github.com/justinbchau)
 - [Dataset Provider](https://www.kaggle.com/datasets/amanbarthwal/imdb-movies-data)