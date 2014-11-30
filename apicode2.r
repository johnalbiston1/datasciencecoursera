library(httr)
library(httpuv)
library(jsonlite)
jna<-oauth_endpoints("github")


myapp <- oauth_app("https://api.github.com/users/jtleek/repos", key="4080a42ac2e06422d580", secret="52a03dc655363cf737fab0e23676ae4d830b7956")


github_token <- oauth2.0_token(jna, myapp)
gtoken<- config(token=github_token)
req<- GET("https://api.github.com/rate_limit",gtoken)
stop_for_status(req)

content(req)

json<-fromJSON("https://api.github.com/users/jtleek/repos")


cv<- subset(json, name=="datasharing")
bn<- cv$created_at

  
  



