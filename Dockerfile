# Use a imagem estável de JMeter
FROM justb4/jmeter:5.4

# Defina as variáveis de ambiente para o JMeter
ENV JMETER_HOME /opt/apache-jmeter
ENV PATH $JMETER_HOME/bin:$PATH

# Cria os diretórios para armazenar os resultados
RUN mkdir -p /results/peak/html-reports /results/load/html-reports

# Defina permissões de leitura e gravação para os diretórios
RUN chmod -R 777 /results

# Copie os planos de teste JMX para o container
COPY Peak_Test.jmx /tests/Peak_Test.jmx
COPY Load_Test.jmx /tests/Load_Test.jmx

# Copie o script de execução para o container
COPY run_tests.sh /run_tests.sh

# Defina permissões para o script de execução
RUN chmod +x /run_tests.sh

# Defina o ponto de entrada para o script
ENTRYPOINT ["/bin/bash", "/run_tests.sh"]
