# Use a imagem estável de JMeter do repositório Justb4
FROM justb4/jmeter:5.4

# Defina as variáveis de ambiente para o JMeter
ENV JMETER_HOME /opt/apache-jmeter
ENV PATH $JMETER_HOME/bin:$PATH

# Copia os arquivos de teste JMX para o container
COPY Peak_Test.jmx /tests/Peak_Test.jmx
COPY Load_Test.jmx /tests/Load_Test.jmx

# Cria o diretório para armazenar os resultados
RUN mkdir -p /results/peak /results/load

# Cria um script de execução para rodar os testes em sequência
COPY run_tests.sh /run_tests.sh
RUN chmod +x /run_tests.sh

# Use o script de entrada para executar ambos os testes
ENTRYPOINT ["/run_tests.sh"]

