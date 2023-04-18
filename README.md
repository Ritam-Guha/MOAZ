<<<<<<< HEAD
# Multi-Objective AutoML-Zero (MOAZ)

Open source code for the paper: "[**MOAZ: A Multi-Objective AutoML-Zero Framework**](10.1145/3583131.3590391)"

| [Introduction](#what-is-automl-zero) | [Quick Demo](#5-minute-demo-discovering-linear-regression-from-scratch)| [Reproducing Search Baselines](#reproducing-search-baselines) | [Citation](#citation) |
|-|-|-|-|

## What is MOAZ?

MOAZ is multi-objective extension of [AutoML-Zero](http://proceedings.mlr.press/v119/real20a/real20a.pdf). Unlike AutoML-Zero, MOAZ can handle multiple objectives while searching for machine learning models in an automated fashion. In most of the real-life problems, we are dealing with multiple contradicting objectives, instead of only one objective. In the paper, we have illustrated that for linear regression problems, MOAZ is able to outperform AutoML-Zero in two ways:
1. 87.4% improvement in the complexities of the discovered algorithms.
2. 84% improvement in the convergence rate.

Moreover, MOAZ has the ability to provide multiple solution algorithms suitable for different platforms based on the computational capabilities, while trading off with accuracy.


&nbsp;

## Running MOAZ for Linear Regression

To get started, first install `bazel` following instructions [here](https://docs.bazel.build/versions/master/install.html) (bazel>=2.2.0 and g++>=9 are required), then run the demo with:
For linear regression, we create multiple datasets using different weights and samples. The goal of the framework is to find an algorithm that has the capability of learning the weights from signals from the dataset.
```
sh run_linreg_nsga2.sh $seed $d
```

This script takes two positional keyword arguments:\
$seed => seed for the experimentation.\
$d => feature dimension for the linear regression problem (2/4/8/16/32).

## Running MOAZ for Non-Linear Regression
In case of non-linear regression, we use a 2-layer teacher neural network as the regressor. The neural network is used to map the samples to corresponding labels. The goal is to then find the teacher neural network with signals from the dataset. 

```
sh run_nn_reg_nsga2.sh $seed $d
```

This script takes two positional keyword arguments:\
$seed => seed for the experimentation.\
$d => feature dimension for the linear regression problem (2/4/8/16/32).

<sup><sub>
Search keywords: machine learning, neural networks, evolution,
evolutionary algorithms, regularized evolution, program synthesis,
architecture search, NAS, neural architecture search,
neuro-architecture search, AutoML, AutoML-Zero, algorithm search,
meta-learning, genetic algorithms, genetic programming, neuroevolution,
neuro-evolution.
</sub></sup>
