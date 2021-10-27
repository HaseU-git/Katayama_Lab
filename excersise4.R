library(MASS)
head(Boston)


# Excersise #4

## 4-1

### 1

xx <- scale(Boston)
sigma <- cov(xx)

#### 固有値・固有ベクトル

result <- eigen(sigma)
v1 <- result$vectors[, 1]
v2 <- result$vectors[, 2]

names(v1) <- names(Boston)
names(v2) <- names(Boston)


evalue <- result$values
evector <- result$vectors


#### 正規直行を確認

round(evector %*% t(evector), 5)
round(t(evector) %*% evector, 5)

#### 解釈について

round(v1, 3)
round(v2, 3)

noxやage、disなどが効いてきている  
住宅地ではなく、工場地帯であるところらへんが第一ベクトル  
第二ベクトルが住宅位みたいなやつ  
工場地帯と住宅地にグルーピングできる感じ  

### 2

#### SVD
result <- svd(xx); str(result)

ap.xx <- result$u %*% diag(result$d) %*% t(result$v)
sum(ap.xx - xx)


# -=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-

## 4-2

### 1

library(tm)

rawdata <- read.csv("dataset/amazon_review2.csv", stringsAsFactors=F, header=F)[,1]
sentences <- VCorpus(VectorSource(rawdata))
sentences[[1]]$content
sentences[[2]]$content

bow <- DocumentTermMatrix(sentences, control=list(wordLengths=c(2,20)))

### 2



### 3



#L=1かつwordの後のみを共起語として抽出する関数
#nは文章の数, token.amazon[[i]]には文章iの単語ベクトルが入っていると想定
# kyouki <- function(word){
#   co <- NULL #箱を用意
#   for(i in 1:n){ #全ての文章をサーチ
#     tmp <- which(token.amazon[[i]] == word) #wordの位置を探す
#     if(length(tmp) > 0){ #wordが存在する文章に限定
#       if(max(tmp) < length(token.amazon[[i]])){ #wordが文章の最後の単語以外の場合に限定
#         neighbor <- tmp + 1
#         co <- c(co, token.amazon[[i]][neighbor]) #wordの次の単語を抽出
#       }
#     }
#   }
#   return(co)
}


### 4

### 5

### 6
