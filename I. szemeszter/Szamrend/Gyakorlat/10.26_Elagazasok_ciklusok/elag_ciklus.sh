#!/bin/bash

test 6 -gt 10; echo $?;  #greater than >, less than <

test 12 -gt 10; echo $?;  

szo="Fradi"

test $szo = "Fradi"; echo $?;

test 3 -lt 5 -a 3 -gt 0; echo $?; #-a AND, -o OR


