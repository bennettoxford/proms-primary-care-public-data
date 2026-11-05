# Count main text words in proms.qmd, from the Introduction to the Conclusion.
# Leaves out code chunks, comments, headings, captions, tables, the abstract,
# "How this fits in", CRediT and references. Word and Google Docs will differ a
# little, depending on what is selected and I think they may also count differently ...
library(tidyverse)
library(here)

WORD_LIMIT <- 2500

# Count words as they appear after rendering, not as they are written in the
# source. Each step swaps source text for what a reader sees, then the last step
# counts each run of characters without a space as one word.
count_words <- function(text) {
  text |>
    # Inline dates render as two words, such as "July 2026"
    str_replace_all("`r format\\([^`]*\\)`", "July 2026") |>
    # Other inline values render as one word, such as "2,252,480"
    str_replace_all("`r [^`]*`", "N") |>
    # A citation block renders as one word, such as "[1,2]"
    # This may undercount a bit bit I think that's ok
    str_replace_all("\\[[^\\]]*@[^\\]]*\\]", "[1]") |>
    # A link renders as its text only, so remove the URL
    str_replace_all("\\]\\(http[^)]*\\)", "]") |>
    str_count("\\S+")
}

df_word_count <- read_file(here("manuscript", "proms.qmd")) |>
  str_remove_all("(?s)```\\{r\\}.*?```") |>
  str_remove_all("(?s)<!--.*?-->") |>
  str_extract("(?s)## Introduction.*?(?=### CRediT)") |>
  str_split_1("\n") |>
  as_tibble_col(column_name = "line") |>
  mutate(
    section = str_extract(line, "^## (.+)", group = 1),
    subsection = str_extract(line, "^### (.+)", group = 1)
  ) |>
  fill(section) |>
  group_by(section) |>
  fill(subsection) |>
  ungroup() |>
  filter(!str_starts(line, "#")) |>
  summarise(
    words = sum(count_words(line)),
    .by = c(section, subsection)
  ) |>
  filter(words > 0)

df_word_count

df_word_count |>
  summarise(words = sum(words), .by = section)

total_words <- sum(df_word_count$words)
total_words
total_words - WORD_LIMIT
