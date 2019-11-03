  %meanfunc = {@meanSum, {@meanLinear, @meanConst}}; hyp.mean = [0 0];
  covfunc = {@covProd, {@covPeriodic, @covSEiso}}; hyp.cov = [-0.5 0 0 2 0];
  %likfunc = @likGauss; sn = 0.1; hyp.lik = log(sn);
 
  x_ = linspace(-5,5,200)';
  K = feval(covfunc{:}, hyp.cov, x_);
  %mu = feval(meanfunc{:}, hyp.mean, x_);
  y_ = chol(K+(1e-6*eye(200)))'*randn(200, 1);

  plot(x_, y_, '+');