data {
  int<lower=1> N;
  int<lower=1> G;
  vector[N] year;
  int<lower=1, upper=G> genre[N];
  vector[N] rating;
}
parameters {
  real beta_0;
  real beta_year;
  vector[G] beta_genre;
  real<lower=0> sigma;
}
model {
  beta_0 ~ normal(0, 10);
  beta_year ~ normal(0, 10);
  beta_genre ~ normal(0, 10);
  sigma ~ normal(0, 5);

  rating ~ normal(beta_0 + beta_year * year + beta_genre[genre], sigma);
}

