# Use a stable JMeter image
FROM bencmarshall/jmeter:latest

# Set environment variables for JMeter
ENV JMETER_HOME /opt/apache-jmeter
ENV PATH $JMETER_HOME/bin:$PATH

# Copy the JMX file into the container
COPY BlazeDemo_Full_Flow_With_Criteria.jmx /mnt/jmeter/test_plan.jmx

# Run JMeter command to execute the test plan
ENTRYPOINT ["jmeter", "-n", "-t", "/mnt/jmeter/test_plan.jmx", "-l", "/mnt/jmeter/results.jtl", "-e", "-o", "/mnt/jmeter/reports"]
