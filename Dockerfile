# Use a public and stable JMeter image
FROM blazemeter/taurus:latest

# Set environment variables for JMeter
ENV JMETER_HOME /opt/apache-jmeter
ENV PATH $JMETER_HOME/bin:$PATH

# Set JMeter test file and result paths
ENV JMETER_TEST_PLAN=BlazeDemo_Full_Flow_With_Criteria.jmx
ENV JMETER_RESULTS_FILE=/results/results.csv
ENV JMETER_REPORT_FOLDER=/results/html-reports

# Copy the JMeter test plan into the container
COPY ${JMETER_TEST_PLAN} /tests/${JMETER_TEST_PLAN}

# Create a directory for results
RUN mkdir -p /results

# Run JMeter with the specified test plan
ENTRYPOINT ["jmeter", "-n", "-t", "/tests/BlazeDemo_Full_Flow_With_Criteria.jmx", "-l", "/results/results.csv", "-e", "-o", "/results/html-reports"]
