rankall <- function(outcome, num = "best"){
 ## Read outcome data
  infile<- read.csv("outcome-of-care-measures.csv", colClasses = "character")
x<<- NULL
outfile<- data.frame()

if (outcome == "heart attack")  x<<- 3
else if (outcome == "heart failure")  x<<- 4
else if (outcome == "pneumonia")  x<<- 5

else

  stop("invalid outcome")

if (num=="worst") num<- -1

outcome1<<- outcome
num1 <<- num

df<- c(2,7,11,17,23)
r<- infile[df]


unq<<-unique.default(sapply(r[2], unique))
unq2<<- unq[order(unq)]
##print(unq2)
for (i in unq2){
    ##print (i)
    e<<-subset(r,State==i)
    w<<-e[x]
    ex<<- w[w!="Not Available"]
    exas<<- as.numeric(ex)
    exas2<<- exas[order(exas)]

    ans<<- subset(e,e[x]==exas2[num1])
    ##if (nrow(ans) >1) ans<<-ans[order(ans[1]),]
    ##else if (length(ans>1)) ans<- ans[order(ans[1]),]
    #if (nrow(ans)>1) qans<<-ans[order(ans[1]),]
    ##else if (nrow(ans) == 0 ) qans[1]<- "NA"
    ###qans<<- ans[order(ans[1]),]
    ##newrow<<- data.frame(  ans[1,1], i)
    ##outfile <<- rbind(outfile, newrow)
    ans<<- subset(e,e[x]==exas2[num1])
    qans<<- ans[order(ans[1]),]
    qans1<<- qans[1,1]
    print(qans1)
    print i
}



  ##if ans>1 then need to order and return first




  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death

qans
qans1<<- qans[1,1]
qans1
}
