# BlazeDemo Full Flow Performance Test

Este repositório contém a configuração de testes de performance para a aplicação BlazeDemo utilizando o JMeter. O teste simula o fluxo completo de compra de uma passagem aérea, incluindo testes de carga e pico para avaliar o desempenho do sistema em diferentes cenários.

## Estrutura do Projeto

- **Peak Test.jmx**: O plano de teste JMeter para o cenário de pico.
- **Load Test.jmx**: O plano de teste JMeter para o cenário de carga.
- **Dockerfile**: Configuração do Docker para executar os testes JMeter.
- **README.md**: Documentação com instruções e detalhes de execução.

## Pré-requisitos

1. **JMeter 5.4+** instalado localmente (caso não esteja utilizando Docker).
2. **Docker** instalado para execução em contêiner.
3. Clone este repositório para sua máquina local.

## Cenários de Teste

O plano de teste inclui dois cenários principais:

1. **Teste de Carga (Load Test)**:
   - 325 threads simulando 250 requisições por segundo.
   - Executa o fluxo completo de compra de passagem por 60 segundos.
2. **Teste de Pico (Peak Test)**:
   - 700 threads simulando um pico de carga elevado.
   - Executa o mesmo fluxo do teste de carga, mas por 20 segundos para avaliar o desempenho sob pico de carga.

## Executando os Testes

### Opção 1: Executar com JMeter Localmente

Se você tiver o JMeter instalado:
jmeter -n -t Peak Test.jmx -l peak_test_results.csv -e -o html-reports/ jmeter -n -t Load Test.jmx -l load_test_results.csv -e -o html-reports/

Este comando irá gerar arquivos CSV (`peak_test_results.csv`, `load_test_results.csv`) e relatórios HTML (`html-reports/`).

### Opção 2: Executar com Docker

Para rodar o teste utilizando Docker:

1. Construa a imagem Docker:
   docker build -t blazedemo-performance-test .

2. Execute o contêiner:
   docker run --rm -v $(pwd)/results:/results blazedemo-performance-test

Os resultados serão armazenados na pasta `results/`.

## Resultados dos Testes e Considerações

### Resumo

- **Teste de Carga**: Critério de aceite não foi satisfeito. Com 800 usuários virtuais, a taxa máxima alcançada foi de aproximadamente 197 requisições por segundo. Os tempos de resposta para o percentil 90 foram elevados (acima de 8 segundos), e a porcentagem de erro se manteve em torno de 2,31%. Isso indica que o sistema não está conseguindo lidar com a carga projetada e apresenta problemas de desempenho sob altas taxas de requisição.
- **Teste de Pico**: A configuração de pico com 2000 UVs resultou em uma taxa máxima de aproximadamente 198 requisições por segundo, mas a porcentagem de erro foi alta, em torno de 5,62%, com tempos de resposta inconsistentes (90% das requisições acima de 9 segundos). Isso sugere que o sistema não é capaz de suportar picos de carga sem uma degradação significativa no desempenho e aumento de erros.
