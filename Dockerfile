# Use a imagem estável de JMeter do repositório Justb4
FROM justb4/jmeter:5.4.1

# Defina as variáveis de ambiente para o JMeter
ENV JMETER_HOME /opt/apache-jmeter
ENV PATH $JMETER_HOME/bin:$PATH

# Copia o arquivo de teste JMX para o container
COPY BlazeDemo_Full_Flow_With_Criteria.jmx /tests/BlazeDemo_Full_Flow_With_Criteria.jmx

# Cria o diretório para armazenar os resultados
RUN mkdir -p /results

# Comando de execução do JMeter
ENTRYPOINT ["jmeter", "-n", "-t", "/tests/BlazeDemo_Full_Flow_With_Criteria.jmx", "-l", "/results/results.csv", "-e", "-o", "/results/html-reports"]
