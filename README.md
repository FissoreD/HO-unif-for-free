# HO unification for free!

This folder contains the material for the paper: [HO unification for free!](https://inria.hal.science/hal-04547069)

The updated PDF of the paper is: [here](https://github.com/FissoreD/paper-ho/blob/pdf/main.pdf)

## Structure of the repository

| Folder  | Content                                               |
| ------- | ----------------------------------------------------- |
| `code`  | the implementation of the code described in the paper |
| `paper` | contains the tex sources of the                       |

## Conference info

Name: https://ppdp2024.github.io/

|          | Deadline |
| -------- | -------- |
| Abstract | 06 May   |
| Paper    | 13 May   |
| Talk     | 9-11 Sep |

<!-- Acmart report format: [here](https://ctan.math.illinois.edu/macros/latex/contrib/acmart/acmguide.pdf) -->

## Commands in Makefile

| Command                    | Description                                           |
| -------------------------- | ----------------------------------------------------- |
| `make`                     | build `main.pdf` in `./paper/.aux`                   |
| `make test`                | run all the test taken from `./code/deep/test.elpi`   |
| `make test ONLY=N`         | run the test with number `N`                          |
| `make test ONLY=N TEX=tex` | run the test with number `N` and prints in *tex* mode |
| `make trace ONLY=N`        | run the test with number `N` with the elpi trace      |

## Tex macros

## Continuous integration

The CI builds `./paper/main.tex` and pushes the compiled pdf in the [`pdf` branch](https://github.com/FissoreD/HO-unif-for-free/tree/pdf)