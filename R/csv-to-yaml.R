library(here)
library(tidyverse)
library(yaml)

listings <- read_csv(here("data", "listings.csv")) 

listings |> 
  mutate(
    source = paste0("[</>](", source, ")"),
    categories = map(categories, list)
  ) |> 
  transpose() |>
  write_yaml(here("listings.yml"), indent.mapping.sequence = TRUE)
