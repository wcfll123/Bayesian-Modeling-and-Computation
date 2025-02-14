
data {
  int<lower=1> N;            // number of data points
  vector[N] x;               // predictor (standardized year)
  vector[N] y;               // response (rating)
}
parameters {
  real alpha;                // intercept
  real beta;                 // slope
  real<lower=0> sigma;       // residual standard deviation
}
model {
  // Priors
  alpha ~ normal(0, 1);
  beta ~ normal(0, 1);
  sigma ~ normal(0, 1);

  // Likelihood
  y ~ normal(alpha + beta * x, sigma);
}
