% Specify mean, covariance and likelihood functions
meanfunc = [];
covfunc = @covPeriodic;
likfunc = @likGauss;

% Initialize hyperparameter struct -- see help covSEiso to understand these
% hyperparameters
hyp = struct('mean', [], 'cov', [-1 0 0.7], 'lik', 0);


%Minimize negatve log marginal likelihood (choose hyperparameters for GP
%prior such that the observed data is as probable as possible)
hyp2 = minimize(hyp, @gp, -100, @infGaussLik, meanfunc, covfunc, likfunc, x, y);

% print local optimal hyperparameter values
hyp2

xs = linspace(-3, 3, 61)';

% Make predictions using these hyperparameters
[mu, s2] = gp(hyp2, @infGaussLik, meanfunc, covfunc, likfunc, x, y, xs);

nlml = gp(hyp2, @infGaussLik, meanfunc, covfunc, likfunc, x, y)


% Plot predictive distribution (marginalised over GP f, using local optimal
% hyperpameters found above)

f = [mu+2*sqrt(s2); flipdim(mu-2*sqrt(s2),1)];
fill([xs; flipdim(xs,1)], f, [7 7 7]/8)
 hold on; plot(xs, mu); plot(x, y, 'g+')