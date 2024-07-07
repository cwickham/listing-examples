library(here)
library(tidyverse)
library(yaml)

listings <- read_csv(here("data", "listings.csv")) 

listings |> 
  mutate(
    title = paste0("[", title, "]", "(", path, ")", " [{{< fa brands github >}}](", source, ")"), 
    categories = map(categories, list)
  ) |> 
  transpose() |>
  write_yaml(here("listings.yml"), indent.mapping.sequence = TRUE)
