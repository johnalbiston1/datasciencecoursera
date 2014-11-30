best <- function(state, outcome) {
  ## Read outcome data
  infile<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
x<<- NULL

if (outcome == "heart attack")  x<<- 3
else if (outcome == "heart failure")  x<<- 4
else if (outcome == "pneumonia")  x<<- 5

else

  stop("invalid outcome")
 



state1<<-state
df<- c(2,7,11,17,23)
r<- infile[df]
e<<-subset(r,State==state)

if (nrow(e)==0) stop ("invalid state")
      
w<<-e[x]
ex<<- w[w!="Not Available"]
exas<<- as.numeric(ex)
ans<<- subset(e,e[x]==min(exas))


if (nrow(ans) == 0 ) stop ("invalid outcome")
else if (nrow(ans)>1) ans<<-ans[order(ans[1]),]

  ##if ans>1 then need to order and return first
ans1<<- ans[1,1]



  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death

ans1

}