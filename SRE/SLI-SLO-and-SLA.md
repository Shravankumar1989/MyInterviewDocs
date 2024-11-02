# SLI, SLO, and SLA: Key Concepts in Site Reliability Engineering

These three concepts—Service Level Indicator (SLI), Service Level Objective (SLO), and Service Level Agreement (SLA)—are crucial in understanding, setting, and managing expectations for service performance and reliability.

---

## 1. SLI (Service Level Indicator)

- **What it means**:  
  A metric that measures how well a service is performing.

- **Examples**:
  - **Availability**: Percentage of time the website is up (e.g., 99.9%).
  - **Latency**: How long it takes for a page to load (e.g., <200ms).

- **Think of it as**:  
  An indicator of how the system is doing, often collected through monitoring tools.

---

## 2. SLO (Service Level Objective)

- **What it means**:  
  A target or goal for the SLIs.

- **Examples**:
  - "We aim for 99.95% uptime each month."
  - "Page load time should be under 100ms 95% of the time."

- **Think of it as**:  
  A goal that tells you how well the service should perform.

---

## 3. SLA (Service Level Agreement)

- **What it means**:  
  A formal contract between a service provider and a customer. It defines the service standards the provider promises to meet.

- **Example**:
  - "We guarantee 99.9% uptime. If downtime exceeds this, customers get a refund."

- **Think of it as**:  
  A commitment that the company makes to customers. SLAs are legally binding, while SLOs are internal goals.

---

## How They Connect

1. **SLIs** help you measure how a service is performing.
2. **SLOs** define what good performance looks like.
3. **SLAs** are promises to customers about service levels.

These three levels work together to set, measure, and manage reliability and customer satisfaction expectations for a service.