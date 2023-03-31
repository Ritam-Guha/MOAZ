for features in 4
  do
  for seed in $(seq 1 30);
  do
    sh run_demo_linreg_re.sh $seed $features
  done
done