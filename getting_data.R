#Getting Data

library(httr)
require(jsonlite)

# -- Find OAuth settings for github:
# -- Using API

github <- oauth_endpoints("github")

my_app <- oauth_app("github", key="8eb5b31747577c42c737", 
                    secret="00a11ce07751e1ffc33a9ac532ce6ffc78ad4566")
findings <- GET("https://api.github.com/users/jtleek/repos",
              authenticate("anajaved", "f48235c674252607186257968ffab5ff2a9eaa31"))

json1 <- content(findings)
json2 <- jsonlite::fromJSON(toJSON(json1))
list(json2$name[[11]], json2$created_at[[11]])  #"2013-11-07T13:25:07Z"

##########