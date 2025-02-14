
data {
  int<lower=1> N;
  int<lower=1> J;
  array[N] int<lower=1, upper=J> genre;
  vector[N] x;
  vector[N] y;
}
parameters {
  vector[J] alpha;
  vector[J] beta;
  real mu_alpha;
  real mu_beta;
  real<lower=0> sigma_alpha;
  real<lower=0> sigma_beta;
  real<lower=0> sigma;
}
model {
  mu_alpha ~ normal(0, 1);
  mu_beta ~ normal(0, 1);
  sigma_alpha ~ normal(0, 1);
  sigma_beta ~ normal(0, 1);
  sigma ~ normal(0, 1);

  alpha ~ normal(mu_alpha, sigma_alpha);
  beta ~ normal(mu_beta, sigma_beta);

  for (n in 1:N)
    y[n] ~ normal(alpha[genre[n]] + beta[genre[n]] * x[n], sigma);
}
