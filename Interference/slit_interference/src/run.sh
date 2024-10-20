#!/bin/bash

gfortran -J ../build/mod/ -c globals.f90 -o ../build/obj/globals.o
gfortran -J ../build/mod/ -c integrate.f90 -o ../build/obj/integrate.o
gfortran -J ../build/mod/ -c project.f90 -o ../build/obj/project.o
gfortran -J ../build/mod/ -c main.f90 -o ../build/obj/main.o

cd ../build/obj

gfortran -o ../../src/interfere.out globals.o integrate.o project.o main.o

cd ../../src

./interfere.out
