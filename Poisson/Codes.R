# --------------------------------
# Fixed Effects Poisson Regression
# --------------------------------

# --- packages ---
options(warn = -1)

# install.packages("poisFErobust")
library(poisFErobust)
library(dplyr)
library(plyr)

# --- create a function to implement FE Poisson ---

poisFEr <- function(nobs,
                    nperiods=10,
                    nvars=4)
  {

  X <- as.data.frame(cbind(matrix(rnorm(nobs*nvars*nperiods),nobs*nperiods,nvars),rep(1:nperiods, each=units))) 
  colnames(X) <- c(paste("X",1:nvars, sep=""),"period")
  betas <- seq(0.5,0.5*nvars,length.out = nvars)
  u_i <- 0.05*rnorm(nobs)
  
  panel_data <- data.frame()

  for (i in 1:nperiods) {
   
    lambda <- exp(as.matrix(X[X$period==i,-ncol(X)])%*%betas+u_i)
    data <- data.frame(
      obs <- 1:nobs,
      time <- i,
      X[X$period==i,-ncol(X)],
      Y <- rpois(nobs, lambda)
    )
    panel_data <- rbind(panel_data, data)
  }
  
  colnames(panel_data) <- c("obs","time",paste("X",1:nvars,sep=""),"Y")
  
  panel_data$obs<-as.factor(panel_data$obs)
  model<-pois.fe.robust(outcome = "Y", xvars = paste("X",1:nvars,sep=""), group.name = "obs",allow.set.key=TRUE,data = data.table::as.data.table(panel_data))
  return(model$coefficients)
}

# --- simulations ---

set.seed(100)
model.sim <- plyr::llply(c(10,50,seq(100,1500,by=100)), function(x) t(replicate(n=100, poisFEr(nobs = x))))

# --- plots ---

# histograms
par(mfrow = c(2, 2))
for (i in 1:4){
  hist(model.sim[[17]][,i], probability = T,ylim=c(0,150),col="white",xlab = paste("beta",i,"=",0.5+0.5*(i-1), sep=""),main = NULL)
  lines(density(model.sim[[17]][,i]), lwd = 2)
  abline(v=0.5+0.5*(i-1), lty=2,lwd=2)
}

# consistency
beta.means <- ldply(model.sim, function(x) apply(x,2,mean))
par(mfrow=c(2,2))
for(i in 1:4){
  plot(c(10,50,seq(100,1500,by=100)),beta.means[,i,drop=TRUE],type="b",xlab = paste("beta",i,"=",0.5+0.5*(i-1), sep=""),ylab="")
  abline(h=0.5+0.5*(i-1))
}


