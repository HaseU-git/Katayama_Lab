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

round(v1, 3)
round(v2, 3)

evalue <- result$values
evector <- result$vectors

#### 解釈について

noxやage、disなどが効いてきている  
住宅地ではなく、工場地帯であるところらへんが第一ベクトル  
第二ベクトルが住宅位みたいなやつ  
工場地帯と住宅地にグルーピングできる感じ  

#### 正規直行を確認

round(evector %*% t(evector), 5)
round(t(evector) %*% evector, 5)

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

### 4

### 5

### 6
