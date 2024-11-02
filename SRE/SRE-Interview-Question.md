# SRE Interview Questions and Answers

## 1. What is Site Reliability Engineering (SRE)?
**Answer:**  
Site Reliability Engineering (SRE) is a discipline that incorporates aspects of software engineering and applies them to infrastructure and operations problems. The primary goals are to create scalable, reliable, and efficient systems. SRE uses automation, monitoring, and incident response to ensure systems meet reliability targets, with a focus on balancing system reliability with operational efficiency.

## 2. How does SRE differ from DevOps?
**Answer:**  
While both SRE and DevOps aim to improve collaboration between development and operations, they differ in their approaches:
- **DevOps** is a cultural shift focused on bridging the gap between development and operations through practices like CI/CD, collaboration, and shared responsibilities.
- **SRE** is more of an engineering discipline that uses software principles to solve operational issues, focusing heavily on reliability and automation, often with explicit reliability targets (SLAs, SLOs, SLIs).

## 3. What are SLAs, SLOs, and SLIs? Explain with examples.
**Answer:**  
- **Service Level Agreement (SLA)**: A formal agreement with customers that defines the acceptable level of service. Example: "99.9% availability per month."
- **Service Level Objective (SLO)**: The internal target reliability metric, typically set slightly stricter than the SLA. Example: "99.95% uptime per month."
- **Service Level Indicator (SLI)**: A specific measurable metric indicating the level of service. Example: "Request success rate, latency, or error rate."

In summary, **SLO** is the objective to achieve; **SLA** is the commitment to the customer, and **SLI** is the metric used to track them.

## 4. What is an error budget, and why is it important?
**Answer:**  
An error budget is the maximum allowable failure or downtime within a defined period. It’s the difference between 100% reliability and the SLO. For example, with a 99.9% uptime SLO, the error budget is 0.1% downtime (around 43.2 minutes/month).  
**Importance**: It balances reliability with feature velocity. If a team uses up the error budget, they may pause new features to focus on stability. Conversely, if reliability is high, they might take on more risk to roll out new features.

## 5. Explain the concept of monitoring and alerting in SRE.
**Answer:**  
**Monitoring** involves collecting metrics (e.g., CPU usage, request latency) to observe the state of systems. It’s essential for tracking SLIs and understanding system health.  
**Alerting** triggers notifications when specific thresholds are breached, often based on SLO violations. Effective alerting ensures that alerts are actionable and meaningful, helping teams respond quickly to critical incidents without alert fatigue.

## 6. What’s the difference between proactive and reactive monitoring?
**Answer:**  
- **Proactive Monitoring**: Involves monitoring for conditions that could lead to incidents (e.g., high CPU or memory usage), allowing the team to address potential issues before they impact users.
- **Reactive Monitoring**: Involves detecting and alerting on incidents after they occur, focusing on responding and mitigating the impact as quickly as possible.

## 7. Describe the incident management process.
**Answer:**  
The incident management process typically involves:
1. **Detection and Alerting**: Identifying the incident via monitoring and alerting systems.
2. **Triage**: Assessing the severity and impact to prioritize response.
3. **Investigation and Diagnosis**: Determining the root cause of the incident.
4. **Resolution**: Implementing a fix or workaround to restore service.
5. **Post-Incident Review**: Analyzing the incident to identify improvements and prevent recurrence, often through a blameless post-mortem.

## 8. How do you handle on-call rotations in SRE?
**Answer:**  
On-call rotations distribute the responsibility of incident response among team members to avoid burnout and ensure 24/7 coverage. Effective rotations often include:
- **Clear escalation policies** to ensure incidents are resolved quickly.
- **Adequate handovers** at shift changes to share critical context.
- **Post-mortem reviews** to improve response and reduce incident frequency.
- **Rotation balance** to avoid fatigue and maintain work-life balance.

## 9. What is “Chaos Engineering,” and why is it used in SRE?
**Answer:**  
Chaos Engineering is the practice of intentionally introducing failures to test a system’s resilience. By simulating failures (e.g., server outages, network issues), teams learn how the system reacts under stress and can identify weaknesses. It’s used in SRE to build more resilient systems by testing failure recovery mechanisms in controlled, real-world conditions.

## 10. Describe how you would debug high latency in a service.
**Answer:**  
To debug high latency:
1. **Check Metrics**: Look at latency metrics and error rates to identify which part of the service is slow.
2. **Trace Requests**: Use distributed tracing to pinpoint which component or API call is causing the latency.
3. **Review Logs**: Examine logs for errors or timeouts during the slow requests.
4. **Evaluate Resources**: Check if resources like CPU, memory, or network bandwidth are constrained.
5. **Analyze Dependencies**: Investigate external dependencies (e.g., databases) that may be causing delays.
6. **Optimize**: Identify and implement optimizations or add caching where appropriate.

## 11. What is Infrastructure as Code (IaC), and how does it benefit SRE?
**Answer:**  
Infrastructure as Code (IaC) is the practice of managing infrastructure through code (e.g., Terraform, CloudFormation) rather than manual configurations. It benefits SRE by providing:
- **Consistency**: Ensures identical environments across development, testing, and production.
- **Version Control**: Tracks changes over time, enabling rollback and auditability.
- **Scalability**: Automates deployment and scaling, making it easier to manage large infrastructures.

## 12. How would you prevent alert fatigue?
**Answer:**  
To prevent alert fatigue:
1. **Tune Alerts**: Set thresholds that trigger alerts only when genuinely needed.
2. **Group Alerts**: Consolidate related alerts to reduce noise.
3. **Use SLOs for Alerting**: Base alerts on SLO breaches to focus on critical issues.
4. **Review and Adjust**: Regularly review alerts to remove outdated or low-priority ones.
5. **Categorize Alerts**: Differentiate between informational, warning, and critical alerts to avoid overwhelming responders.

## 13. What tools do you use for monitoring and logging?
**Answer:**  
Common tools include:
- **Monitoring**: Prometheus, Grafana, Datadog, AppDynamics, New Relic, Nagios.
- **Logging**: ELK Stack (Elasticsearch, Logstash, Kibana), Splunk, Fluentd, Graylog.

---

## 14. How do you ensure system reliability in production?
**Answer:**  
Ensuring reliability involves:
- **SLI/SLO Management**: Set realistic SLOs to track reliability.
- **Monitoring & Alerting**: Track system health, detect anomalies, and alert on critical issues.
- **Automated Testing**: Use CI/CD to test deployments rigorously before they reach production.
- **Chaos Engineering**: Test failure scenarios to improve resilience.
- **Capacity Planning**: Regularly evaluate and scale infrastructure to meet demands.

---