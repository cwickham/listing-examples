library(here)
library(tidyverse)
library(yaml)

read_csv(here("data", "listings.csv")) |> 
  mutate(categories = map(categories, list)) |> 
  transpose() |>
  write_yaml(here("listings.yml"), indent.mapping.sequence = TRUE)
