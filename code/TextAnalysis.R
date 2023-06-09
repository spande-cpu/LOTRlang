

# Data
data <- read_rds("./processed_data/a2k_40_page_nested_extract.rds")



## Some


# Top Topics
data %>%
  select(Url, Titles, Topics) %>%
  unnest_tokens(word, Topics) %>%
  #group_by(Url, Titles) %>%
  count(word) %>%
  .$n %>% hist()
  slice_max(order_by = n, n = 1)
  pivot_wider(names_from = word, values_from = n)
  separate(Topics, into = c("topic1", "topic2", "topic3"), sep = ",",
           extra = "drop") %>%
  glimpse()

# Top Words
data %>%
  unnest(cols = "posts") %>%
  unnest_tokens(word, posts) %>%
  ## Remove stop words
  anti_join(stop_words, by = "word") %>%
  filter(!str_detect(word, "[0-9]+"), !str_detect(word, "_")) %>%
  count(word) %>%
  arrange(desc(n))
  


