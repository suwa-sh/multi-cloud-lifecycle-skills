---
source_url: "https://docs.aws.amazon.com/prometheus/latest/userguide/what-is-Amazon-Managed-Service-Prometheus.html"
fetched_at: "2026-03-27T21:50:38Z"
vendor: "aws"
layer: "shared-platform"
---

that makes it easier to securely monitor container environments at scale. With Amazon Managed Service for Prometheus, you can use the same open-source Prometheus data model and query language that you use today to monitor the performance of your containerized workloads, and also enjoy improved scalability, availability, and security without having to manage the underlying infrastructure.

Amazon Managed Service for Prometheus automatically scales the ingestion, storage, and querying of operational metrics as workloads scale up and down. It integrates with AWS security services to enable fast and secure access to data.

Amazon Managed Service for Prometheus is designed to be highly available using multiple Availability Zone (Multi-AZ) deployments. Data ingested into a workspace is replicated across three Availability Zones in the same Region.

Amazon Managed Service for Prometheus works with container clusters that run on Amazon Elastic Kubernetes Service and self-managed Kubernetes environments.

With Amazon Managed Service for Prometheus, you use the same open-source Prometheus data model and PromQL query language that you use with Prometheus. Engineering teams can use PromQL to filter, aggregate, and alarm on metrics and quickly gain performance visibility without any code changes. Amazon Managed Service for Prometheus provides flexible query capabilities without the operational cost and complexity.

Metrics ingested into a workspace are stored for 150 days by default, and are then automatically deleted. You can adjust the retention period by configuring your workspace up to a maximum of 1095 days (three years). For more information, see [Configure your workspace](https://docs.aws.amazon.com/prometheus/latest/userguide/AMP-workspace-configuration.html).

## Supported Regions {#AMP-supported-Regions}

Amazon Managed Service for Prometheus currently supports the following Regions:

:::: table-container
::: table-contents
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Region Name               | Region          | Endpoint                                        | Protocol        |
+===========================+=================+=================================================+=================+
| US East (Ohio)            | us-east-2       | aps.us-east-2.amazonaws.com                     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.us-east-2.amazonaws.com          | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.us-east-2.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.us-east-2.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.us-east-2.api.aws                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.us-east-2.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.us-east-2.api.aws                           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.us-east-2.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| US East (N. Virginia)     | us-east-1       | aps.us-east-1.amazonaws.com                     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.us-east-1.amazonaws.com          | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.us-east-1.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.us-east-1.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.us-east-1.api.aws                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.us-east-1.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.us-east-1.api.aws                           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.us-east-1.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| US West (N. California)   | us-west-1       | aps.us-west-1.amazonaws.com                     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.us-west-1.amazonaws.com          | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.us-west-1.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.us-west-1.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.us-west-1.api.aws                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.us-west-1.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.us-west-1.api.aws                           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.us-west-1.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| US West (Oregon)          | us-west-2       | aps.us-west-2.amazonaws.com                     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.us-west-2.amazonaws.com          | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.us-west-2.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.us-west-2.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.us-west-2.api.aws                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.us-west-2.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.us-west-2.api.aws                           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.us-west-2.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Africa (Cape Town)        | af-south-1      | aps.af-south-1.amazonaws.com                    | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.af-south-1.amazonaws.com         | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.af-south-1.api.aws               | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.af-south-1.api.aws                          | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Asia Pacific (Hong Kong)  | ap-east-1       | aps.ap-east-1.amazonaws.com                     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-east-1.amazonaws.com          | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-east-1.api.aws                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ap-east-1.api.aws                           | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Asia Pacific (Hyderabad)  | ap-south-2      | aps.ap-south-2.amazonaws.com                    | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-south-2.amazonaws.com         | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-south-2.api.aws               | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ap-south-2.api.aws                          | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Asia Pacific (Jakarta)    | ap-southeast-3  | aps.ap-southeast-3.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-southeast-3.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-southeast-3.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ap-southeast-3.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Asia Pacific (Malaysia)   | ap-southeast-5  | aps.ap-southeast-5.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-southeast-5.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-southeast-5.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ap-southeast-5.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Asia Pacific (Melbourne)  | ap-southeast-4  | aps.ap-southeast-4.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-southeast-4.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-southeast-4.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ap-southeast-4.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Asia Pacific (Mumbai)     | ap-south-1      | aps.ap-south-1.amazonaws.com                    | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-south-1.amazonaws.com         | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-south-1.api.aws               | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ap-south-1.api.aws                          | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Asia Pacific (Osaka)      | ap-northeast-3  | aps.ap-northeast-3.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-northeast-3.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-northeast-3.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ap-northeast-3.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Asia Pacific (Seoul)      | ap-northeast-2  | aps.ap-northeast-2.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-northeast-2.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-northeast-2.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ap-northeast-2.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Asia Pacific (Singapore)  | ap-southeast-1  | aps.ap-southeast-1.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-southeast-1.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-southeast-1.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ap-southeast-1.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Asia Pacific (Sydney)     | ap-southeast-2  | aps.ap-southeast-2.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-southeast-2.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-southeast-2.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ap-southeast-2.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Asia Pacific (Taipei)     | ap-east-2       | aps.ap-east-2.amazonaws.com                     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-east-2.amazonaws.com          | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-east-2.api.aws                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ap-east-2.api.aws                           | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Asia Pacific (Thailand)   | ap-southeast-7  | aps.ap-southeast-7.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-southeast-7.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-southeast-7.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ap-southeast-7.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Asia Pacific (Tokyo)      | ap-northeast-1  | aps.ap-northeast-1.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-northeast-1.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ap-northeast-1.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ap-northeast-1.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Canada (Central)          | ca-central-1    | aps.ca-central-1.amazonaws.com                  | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ca-central-1.amazonaws.com       | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.ca-central-1.amazonaws.com  | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.ca-central-1.api.aws        | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ca-central-1.api.aws             | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.ca-central-1.amazonaws.com             | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ca-central-1.api.aws                        | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.ca-central-1.api.aws                   | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Canada West (Calgary)     | ca-west-1       | aps.ca-west-1.amazonaws.com                     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ca-west-1.amazonaws.com          | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.ca-west-1.amazonaws.com     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.ca-west-1.api.aws           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.ca-west-1.api.aws                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.ca-west-1.amazonaws.com                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.ca-west-1.api.aws                           | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.ca-west-1.api.aws                      | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Europe (Frankfurt)        | eu-central-1    | aps.eu-central-1.amazonaws.com                  | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-central-1.amazonaws.com       | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-central-1.api.aws             | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.eu-central-1.api.aws                        | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Europe (Ireland)          | eu-west-1       | aps.eu-west-1.amazonaws.com                     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-west-1.amazonaws.com          | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-west-1.api.aws                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.eu-west-1.api.aws                           | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Europe (London)           | eu-west-2       | aps.eu-west-2.amazonaws.com                     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-west-2.amazonaws.com          | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-west-2.api.aws                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.eu-west-2.api.aws                           | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Europe (Milan)            | eu-south-1      | aps.eu-south-1.amazonaws.com                    | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-south-1.amazonaws.com         | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-south-1.api.aws               | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.eu-south-1.api.aws                          | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Europe (Paris)            | eu-west-3       | aps.eu-west-3.amazonaws.com                     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-west-3.amazonaws.com          | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-west-3.api.aws                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.eu-west-3.api.aws                           | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Europe (Spain)            | eu-south-2      | aps.eu-south-2.amazonaws.com                    | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-south-2.amazonaws.com         | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-south-2.api.aws               | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.eu-south-2.api.aws                          | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Europe (Stockholm)        | eu-north-1      | aps.eu-north-1.amazonaws.com                    | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-north-1.amazonaws.com         | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-north-1.api.aws               | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.eu-north-1.api.aws                          | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Europe (Zurich)           | eu-central-2    | aps.eu-central-2.amazonaws.com                  | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-central-2.amazonaws.com       | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.eu-central-2.api.aws             | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.eu-central-2.api.aws                        | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Israel (Tel Aviv)         | il-central-1    | aps.il-central-1.amazonaws.com                  | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.il-central-1.amazonaws.com       | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.il-central-1.api.aws             | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.il-central-1.api.aws                        | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Mexico (Central)          | mx-central-1    | aps.mx-central-1.amazonaws.com                  | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.mx-central-1.amazonaws.com       | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.mx-central-1.api.aws             | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.mx-central-1.api.aws                        | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Middle East (Bahrain)     | me-south-1      | aps.me-south-1.amazonaws.com                    | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.me-south-1.amazonaws.com         | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.me-south-1.api.aws               | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.me-south-1.api.aws                          | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| Middle East (UAE)         | me-central-1    | aps.me-central-1.amazonaws.com                  | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.me-central-1.amazonaws.com       | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.me-central-1.api.aws             | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.me-central-1.api.aws                        | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| South America (São Paulo) | sa-east-1       | aps.sa-east-1.amazonaws.com                     | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.sa-east-1.amazonaws.com          | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.sa-east-1.api.aws                | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.sa-east-1.api.aws                           | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| AWS GovCloud (US-East)    | us-gov-east-1   | aps.us-gov-east-1.amazonaws.com                 | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.us-gov-east-1.amazonaws.com      | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.us-gov-east-1.amazonaws.com | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.us-gov-east-1.api.aws       | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.us-gov-east-1.api.aws            | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.us-gov-east-1.amazonaws.com            | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.us-gov-east-1.api.aws                       | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.us-gov-east-1.api.aws                  | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
| AWS GovCloud (US-West)    | us-gov-west-1   | aps.us-gov-west-1.amazonaws.com                 | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.us-gov-west-1.amazonaws.com      | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.us-gov-west-1.amazonaws.com | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces-fips.us-gov-west-1.api.aws       | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-workspaces.us-gov-west-1.api.aws            | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.us-gov-west-1.amazonaws.com            | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps.us-gov-west-1.api.aws                       | HTTPS           |
|                           |                 |                                                 |                 |
|                           |                 | aps-fips.us-gov-west-1.api.aws                  | HTTPS           |
+---------------------------+-----------------+-------------------------------------------------+-----------------+
:::
::::

Amazon Managed Service for Prometheus includes control plane endpoints (to perform workspace management tasks) and data plane endpoints (to work with Prometheus-compatible data in a workspace instance). Control plane endpoints start with `aps.*`{.code}, and dataplane endpoints start with `aps-workspaces.*`{.code}. Endpoints that end in `.amazonaws.com`{.code} support IPv4, and endpoints that end in `.api.aws`{.code} support both IPv4 and IPv6.

## Pricing {#AMP-pricing}

You incur charges for ingestion and storage of metrics. Storage charges are based on the compressed size of metric samples and metadata. For more information, see [Amazon Managed Service for Prometheus Pricing](http://aws.amazon.com/prometheus/pricing){rel="noopener noreferrer" target="_blank"}.

You can use AWS Cost Explorer and AWS Cost and Usage Reports to monitor your charges. For more information, see [Exploring your data using Cost Explorer](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/ce-exploring-data.html) and [What are AWS Cost and Usage Reports](https://docs.aws.amazon.com/cur/latest/userguide/what-is-cur.html).

## Premium support {#AMP-support}

If you subscribe to any level of the AWS premium support plans, your premium support applies to Amazon Managed Service for Prometheus.

:::::: {}
::::: {}
:::: {}
::: {#js_error_message}
![Warning](https://d1ge0kk1l5kms0.cloudfront.net/images/G/01/webservices/console/warning.png) **Javascript is disabled or is unavailable in your browser.**

To use the Amazon Web Services Documentation, Javascript must be enabled. Please refer to your browser\'s Help pages for instructions.
:::
::::
:::::
::::::

:::::: {#main-col-footer .awsui-util-font-size-0}
::: {#doc-conventions}
[Document Conventions](/general/latest/gr/docconventions.html){target="_top"}
:::

:::: prev-next
::: {#next .next-link accesskey="n" href="./AMP-getting-started.html"}
Get started
:::
::::
::::::

::::: {#quick-feedback-yes style="display: none;"}
::: title
Did this page help you? - Yes
:::

::: content
Thanks for letting us know we\'re doing a good job!

If you\'ve got a moment, please tell us what we did right so we can do more of it.
:::
:::::

::::: {#quick-feedback-no style="display: none;"}
::: title
Did this page help you? - No
:::

::: content
Thanks for letting us know this page needs work. We\'re sorry we let you down.

If you\'ve got a moment, please tell us how we can make the documentation better.
:::
:::::

::: {#page-loading-indicator .page-loading-indicator}
:::

::: {#tools-panel dom-region="tools"}
:::
