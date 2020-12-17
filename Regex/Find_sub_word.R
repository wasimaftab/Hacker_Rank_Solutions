cat('\014')

library(stringr)

N <- as.numeric(readline('Enter number of lines to be read = '))
nmax <- 100
qmax <- 10

if(N > nmax+qmax+2){
    stop('too many sentences and query strings')
}

## find subword
x <- readLines(n = N)
num_sen <- as.numeric(x[1])
num_qry <- as.numeric(x[num_sen + 2])
if ((num_sen >= 1 || num_sen <= 100)
    &&
    (num_qry >= 1 || num_qry <= 10)) {
    
    sentence_arr <- x[2:(num_sen + 1)]
    search_str_arr <- x[(num_sen + 3):(num_sen + num_qry + 2)]

    for (i in 1:num_qry) {
        pattern <- paste0("[0-9a-zA-Z_]", 
                          search_str_arr[i], 
                          "[0-9a-zA-Z_]")
        count <- 0
        for (j in 1:num_sen) {
            y <- stringr::str_extract_all(sentence_arr[j], pattern)
            count <- count + length(unlist(y))
            # browser()
        }
        print(count)
    }
} else {
    stop('too many sentences or query strings')
}
