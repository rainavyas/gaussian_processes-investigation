  %meanfunc = {@meanSum, {@meanLinear, @meanConst}}; hyp.mean = [0 0];
  covfunc = {@covProd, {@covPeriodic, @covSEiso}}; hyp.cov = [-0.5 0 0 2 1];
  %likfunc = @likGauss; sn = 0.1; hyp.lik = log(sn);
 
  x_ = linspace(-5,5,200)';
  K = feval(covfunc{:}, hyp.cov, x_);
  %mu = feval(meanfunc{:}, hyp.mean, x_);
  y1_ = chol(K+(1e-6*eye(200)))'*randn(200, 1);
  y2_ = chol(K+(1e-6*eye(200)))'*randn(200, 1);
  y3_ = chol(K+(1e-6*eye(200)))'*randn(200, 1);
  y4_ = chol(K+(1e-6*eye(200)))'*randn(200, 1);

  plot(x_, y1_, 'blue', 'LineWidth', 2);
  hold on;
  plot(x_, y2_, 'green' , 'LineWidth', 2);
  hold on;
  plot(x_, y3_, 'red' , 'LineWidth', 2);
  %hold on;
  %plot(x_, y4_, 'black');