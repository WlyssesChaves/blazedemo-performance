
# Use the official JMeter image
FROM ghcr.io/navikt/jmeter:latest

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
