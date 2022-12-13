# R语言中的并行循环

在用R语言编程时，我们经常需要用到循环语句。很多人喜欢用`apply`族的命令，而不喜欢用`for`语句。他们觉得，尽管`for`语句最容易理解，但是不够简洁，而且最致命的缺点是，当循环元素过多时，`for`语句的运行速度过慢。这主要是因为，`for`语句在运行时，只使用计算机的单核，而使得其他的核被闲置，造成浪费。R语言中的并行循环就为这一问题提出了解决方案。

并行循环是指，在进行循环运算时，同时使用计算机的多核，进而提高运行速度。这篇文章主要介绍如何使用`foreach`, `parallel`和`doParallel`包来进行R语言中的并行循环运算。

## `foreach`包

### 按顺序运算

与其它R包的安装方式无异，我们可以通过`install.packages()`和`library()`函数来下载和导入foreach包。
	
```r
install.packages("foreach")
library(foreach)
```

与`for`语句一样，`foreach`语句也可以只使用单核进行运算。

```r
# for loop
x_for <- vector()
for (i in 1:20) {
	x_for[i] <- i^2
	}

# foreach loop
x_foreach <- foreach(i = 1:20, 
					.combine = 'c') %do% {
					i^2}
```

在上述命令中，`x_for`和`x_foreach`的输出值是一样的。`foreach`语句中，参数`i`是指需要循环的元素，`.combine`是指以何种函数来连接输出的各元素。`'c'`表示最后用向量来连接各输出的元素。当然，还可以用`cbind`，`rbind`和各种自定义的函数来连接输出的元素。`%do%`表示按顺序来执行循环，即`for`语句的循环方式。另外，`foreach`语句的一个特点是可以同时循环多个变量，如下。

```r
x_foreach <- foreach(i = 1:3,
					j = 2:4,
					.combine = 'c') %do% {
					i*j}
```

### 并行运算

前面说到，`foreach`语句中的`%do%`要求按顺序进行循环运算，此方法与`for`语句无异。但如果我们希望进行并行循环运算，则首先需要将`%do%`改成`%dopar%`。但如果我们只改此处，则运行后将得到一个警告，如下。

```r
# foreach loop
x_foreach <- foreach(i = 1:20, 
					.combine = 'c') %do% {
					i^2}

# Warning: executing %dopar% sequentially: no parallel backend registered					
```

警告中提到，需要`parallel backend`。那么什么是`parallel backend`呢。首先，在并行运算时，往往需要有一个director和多个worker。Director告诉workers需要如何对数据和函数进行处理，然后workers执行相应的迭代循环，最后director收集workers分析得到的结果。`parallel backend`就是指director和workers以何种方式交流和沟通的。`foreach`包中有两种`parallel backend`，即`fork`和`psock`。

`fork`只适用于UNIX系统，指的是workers和director共享同一个工作环境。`psock`适用于UNIX和Windows系统，指的是各个worker需要从director那里复制工作环境，所以效率相对较低。我们需要`parallel`和`doParallel`来配置`parallel backend`。

## `parallel`和`doParallel`包

`parallel`包是在R语言中自带的包，所以无需重新安装。`doParallel`包的安装和加载如下。
	
```r
install.packages("doParallel")
library(doParallel)
```

### 配置`parallel backend`

首先我们可以通过以下命令检查电脑的内核数目，并制定用于并行循环运算的内核数目。通常我们留一个内核给其他工作任务。

```r
parallel::detectCores()
n.cores <- parallel::detectCores() - 1
```

然后，我们使用以下命令来创建和配置`parallel backend`。

```r
# create cluster
my.cluster <- parallel::makeCluster(
  n.cores, 
  type = "PSOCK"
  )
  
# register it to be used by %dopar%
doParallel::registerDoParallel(cl = my.cluster)
```

最后，我们可以使用以下命令来检查是否配置成功，以及共有多少个内核参与并行循环运算。

```r
# check if it is registered
foreach::getDoParRegistered()

# check how many workers are available?
foreach::getDoParWorkers()
```

### 并行循环运算

在完成`parallel backend`的配置后，重新运行一下命令时，我们就不会再得到任何warning。当循环元素比较大时，并行循环运算的速度将会大幅度提高。

```r
# foreach loop
x_foreach <- foreach(i = 1:20, 
					.combine = 'c') %do% {
					i^2}
```

在完成了并行循环运算后，通常建议通过以下命令来关闭`parallel backend`。

```r
parallel::stopCluster(cl = my.cluster)
```
## 完整案例

```r
# Libraries
library(foreach)
library(doParallel)

# define number of cores
n.cores <- parallel::detectCores() - 1

# create cluster
# if you are using Unix systems like Linux or Mac, then change 'PSOCK' to 'FORK' to increase efficiency
my.cluster <- parallel::makeCluster(
  n.cores, 
  type = "PSOCK"
  )
  
# register it to be used by %dopar%
doParallel::registerDoParallel(cl = my.cluster)

# check if it is registered
foreach::getDoParRegistered()

# check how many workers are available?
foreach::getDoParWorkers()

# parallel loop
m <- matrix(rnorm(9), 3, 3)
foreach(i = 1:nrow(m), 
		.combine=rbind) %dopar% 
		(m[i,] / mean(m[i,]))
```


## 参考文献

Blas M. Benito (2021). Parallelized loops with R. https://www.blasbenito.com/post/02_parallelizing_loops_with_r/

`foreach` package. https://github.com/RevolutionAnalytics/foreach

`doParallel` package. https://github.com/RevolutionAnalytics/doparallel

