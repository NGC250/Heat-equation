#!/bin/bash

gfortran -J ../build/mod -c globals.f90 -o ../build/obj/globals.o
gfortran -J ../build/mod -c laplacian.f90 -o ../build/obj/laplacian.o
gfortran -J ../build/mod -c initialise.f90 -o ../build/obj/initialise.o
gfortran -J ../build/mod -c main.f90 -o ../build/obj/main.o

cd ../build/obj

gfortran -o ../../src/heat_eqn.out globals.o laplacian.o initialise.o main.o

cd ../../src

./heat_eqn.out
