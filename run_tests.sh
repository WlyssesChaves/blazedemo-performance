#!/bin/bash

# Executa o primeiro teste (Peak Test)
echo "Running Peak Test..."
jmeter -n -t /tests/Peak_Test.jmx -l /results/peak/results_peak.csv -e -o /results/peak/html-reports
echo "Peak Test completed."

# Executa o segundo teste (Load Test)
echo "Running Load Test..."
jmeter -n -t /tests/Load_Test.jmx -l /results/load/results_load.csv -e -o /results/load/html-reports
echo "Load Test completed."
