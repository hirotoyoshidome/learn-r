# Rの基本

# 代入
a <- 10
print(a)

# 演算
a <- a + 2
print(a)

# 「.」は意味を持たない（メソッドはない）(この場合は単純な代入)
a.b <- "aaa"
print(a.b)

# 分岐
if (a < 10) {
    print("10未満")
} else {
    print("10以上")
}

# ループ
for (i in 1:5) {
    print(i)
}

# 関数
add <- function(x, y){
    return(x + y)
}
# 関数を使う
res <- add(1,5)
print(res)

# ベクトル(cで囲うとベクトルになる)
vec <- c(1,2,3,4)
print(vec[2])
# ベクトルなので、こういうことができる
print(vec / 2)

# 範囲指定でベクトル生成(1-10の間で5要素のベクトルを生成する)
vec2 <- seq(1, 10, length=5)
print(vec2)

# 繰り返しでベクトルを生成する
vec3 <- rep(1:3, times=2)
print(vec3)

# 集計関数
# 最大
print(max(vec))
# 最小
print(min(vec))
# 平均
print(mean(vec))
# 合計
print(summary(vec))

# データフレーム
data <- data.frame(
  "商品" = c("りんご","たまご","キャベツ"),
  "値段" = c(100,20,120)
)
print(data)
head(data)
print(data[1,2])

# apply関数（データフレームの操作。列、行ごとに集計できる）
apply(data,2,sum)

# リスト（リストはデータフレームのように2次元構造ではなく、何でもOK）
list.sample <- list(
  "お店" = c("A店","B店"),
  "データ" = c(1,2,3,2,3,4,5),
  "評価" = c(T,F,T,F,F)
)
# リストにはlapplyを利用する
print(lapply(list.sample, length))

data.train <- data.frame(
  "名前" = c("A","B","C","D","E","F"),
  "血液型" = c("A","B","A","O","AB","B"),
  "給料" = c(300,450,400,500,430,380),
  "身長" = c(170,160,180,168,172,165)
)
# グループごとの集計にはtapplyを利用する
print(tapply(data.train$`給料`,data.train$`血液型`,mean))


# 行列
A <- matrix(1:4, nrow = 2, ncol = 2)
B <- matrix(2:5, nrow = 2)
# 行列同士の計算
print(A * B)

# 転置(t)や逆行列(solve)、固有値固有ベクトル(eigen)なども標準でできる


# 分析
# モデル作成(回帰分析(lm)を使う)
data.train <- data.frame(
  "名前" = c("A","B","C","D","E","F"),
  "血液型" = c("A","B","A","O","AB","B"),
  "給料" = c(300,450,400,500,430,380),
  "身長" = c(170,160,180,168,172,165)
)
model <- lm("給料 ~ 血液型 + 身長", data.train)
summary(model)

# 予測
data.test <- data.frame(
  "名前" = c("G","H","I"),
  "血液型" = c("O","B","A"),
  "身長" = c(178,165,175)
)
predict(model,　newdata=data.test)


# データの可視化
plot(data.train$血液型)
# このように細かく指定もできる
plot(data.train[,c("身長","給料")], 
     main = "タイトル",
     sub = "サブ",
     type = "b",
     xlab = "xxx",
     ylab = "yyy",
     pch = 6,
     lty = 4,
     lwd = 2,
     col=data.train$`血液型`)
