#!/bin/bash
gfortran -J ../build/mod -c globals.f90 -o ../build/obj/globals.o
gfortran -J ../build/mod -c vectoralgebra.f90 -o ../build/obj/vectoralgebra.o
gfortran -J ../build/mod -c initial.f90 -o ../build/obj/initial.o
gfortran -J ../build/mod -c dynamics.f90 -o ../build/obj/dynamics.o
gfortran -J ../build/mod -c main.f90 -o ../build/obj/main.o

cd ../build/obj

gfortran -o ../../src/poynting.out globals.o initial.o dynamics.o vectoralgebra.o main.o

cd ../../src/

./poynting.out
