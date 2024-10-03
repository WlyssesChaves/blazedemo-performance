#!/bin/bash

# Criar diretórios se não existirem
mkdir -p /results/peak/html-reports
mkdir -p /results/load/html-reports

# Executar os testes de pico
jmeter -n -t /tests/Peak_Test.jmx -l /results/peak/results.csv -e -o /results/peak/html-reports

# Executar os testes de carga
jmeter -n -t /tests/Load_Test.jmx -l /results/load/results.csv -e -o /results/load/html-reports
