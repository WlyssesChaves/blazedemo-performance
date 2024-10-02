
# BlazeDemo Full Flow Performance Test

This repository contains a performance testing setup for the BlazeDemo application using JMeter. The test simulates a complete flow for purchasing a flight ticket, including load and spike tests to evaluate the system's performance under different scenarios.

## Project Structure
- **BlazeDemo_Full_Flow_With_Criteria.jmx**: The JMeter test plan for both load and spike scenarios.
- **Dockerfile**: Docker configuration to run the JMeter tests.
- **README.md**: Documentation with instructions and execution details.

## Prerequisites
1. **JMeter 5.4.1+** installed locally (if not using Docker).
2. **Docker** installed for containerized execution.
3. Clone this repository to your local machine.

## Test Scenarios
The test plan includes two main scenarios:
1. **Load Test**:
   - 325 threads simulating 250 requests per second.
   - Executes the full flow of purchasing a flight for 60 seconds.
   
2. **Spike Test**:
   - 700 threads simulating a high load spike.
   - Executes the same flow as the load test but for 20 seconds to evaluate peak performance.

## Running the Tests

### Option 1: Run with JMeter Locally
If you have JMeter installed:
```bash
jmeter -n -t BlazeDemo_Full_Flow_With_Criteria.jmx -l results.csv -e -o html-reports/
```
This command will generate a CSV file (`results.csv`) and an HTML report (`html-reports/`).

### Option 2: Run with Docker
To run the test using Docker:
1. Build the Docker image:
```bash
docker build -t blazedemo-performance-test .
```

2. Run the container:
```bash
docker run --rm -v $(pwd)/results:/results blazedemo-performance-test
```
The results will be stored in the `results/` folder.

## Test Results and Considerations

### Summary
- **Load Test**: Successfully achieved 250 requests per second with a 90th percentile response time below 2 seconds.
- **Spike Test**: Managed to handle the sudden load with minimal errors and consistent response times.

### Considerations
- For consistent results, ensure that the test environment has sufficient resources.
- The spike test may produce varying results depending on the server's ability to handle sudden bursts of traffic.

## Future Improvements
1. Add more realistic data inputs for dynamic scenarios.
2. Implement more granular assertions based on response content.
3. Explore integrating monitoring tools like Grafana for real-time metrics.
