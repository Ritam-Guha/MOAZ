for features in 4
  do
  for seed in $(seq 1 30);
  do
    sh run_demo_linreg_nsga2.sh $seed $features
  done
done
