
#++++++++++++读取数据，做散点图++++++++++++++++++#
yak.weight<-read.table(file = "F:/新建文件夹/GEBV&GS/体高.csv",header=T,sep=',')
View(yak.weight)
head(yak.weight)
plot(yak.weight)

####=====构建X矩阵=======###
X <- as.matrix(cbind(1, yak.weight$体高))  
n <- dim(X)[1]
p <- dim(X)[2]
head(X)

#--------构建y矩阵-------###
y <- matrix(yak.weight$体长,,1)
head(y)

#------- 计算β参数----###
beta.hat1 <- solve(crossprod(X), crossprod(X,y)) # solve(A,B) == solve(A)%*%B
beta.hat1

#####计算拟合值Fitted_value++++
y.hat <- X %*% beta.hat1
round(y.hat[1:356, 1],3) # 拟合值
y[1:356, 1] #原始值
plot(y.hat,y)

###计算残差值（residual）
residual <- y - y.hat
head(residual)

###计算残差方差组分（残差的方差）
sigma2 <- sum((y - y.hat)^2)/(n - p)
sigma2

##计算方差协方差矩阵（var.beta）
v <- solve(t(X) %*% X) * sigma2
v

###计算参数的标准误##standard errors of the parameter estimates
sqrt(diag(v))

##对参数进行T检验，计算T值
t.values <- beta.hat1/sqrt(diag(v))
t.values

##根据T值，计算p值
2 * (1 - pt(abs(t.values), n - p))

##3. 用lm函数和矩阵得到的结果对比+++3.1 对比参数估计
mod <- lm(体长 ~ 体高,data=yak.weight)
summary(mod)$coef

###3.2 拟合值
head(fitted(mod))
head(y.hat)

#3.3 残差值
head(residuals(mod))
head(residual)

summary(mod)
sqrt(sigma2)