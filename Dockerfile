# Use a última versão do JMeter
FROM apache/jmeter:latest

# Set environment variables for JMeter
ENV JMETER_HOME /opt/apache-jmeter
ENV PATH $JMETER_HOME/bin:$PATH

# Copy the JMX file into the container
COPY BlazeDemo_Full_Flow_With_Criteria.jmx /tests/BlazeDemo_Full_Flow_With_Criteria.jmx

# Create a directory for results
RUN mkdir -p /results

# Run JMeter with the specified test plan
ENTRYPOINT ["jmeter", "-n", "-t", "/tests/BlazeDemo_Full_Flow_With_Criteria.jmx", "-l", "/results/results.csv", "-e", "-o", "/results/html-reports"]
