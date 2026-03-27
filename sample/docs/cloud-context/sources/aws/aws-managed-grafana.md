---
source_url: "https://docs.aws.amazon.com/grafana/latest/userguide/what-is-Amazon-Managed-Service-Grafana.html"
fetched_at: "2026-03-27T21:50:38Z"
vendor: "aws"
layer: "shared-platform"
---

instantly query, correlate, and visualize operational metrics, logs, and traces from multiple sources. Amazon Managed Grafana makes it easy to deploy, operate, and scale Grafana, a widely deployed data visualization tool that is popular for its extensible data support.

With Amazon Managed Grafana, you create logically isolated Grafana servers called *workspaces*. Then, you can create Grafana dashboards and visualizations to analyze your metrics, logs, and traces without having to build, package, or deploy any hardware to run your Grafana servers.

Amazon Managed Grafana manages the provisioning, setup, scaling, and maintenance of your logical Grafana servers so that you don\'t have to do these tasks yourself. Amazon Managed Grafana also provides built-in security features for compliance with corporate governance requirements, including single sign-on, data access control, and audit reporting.

Amazon Managed Grafana is integrated with AWS data sources that collect operational data, such as Amazon CloudWatch, Amazon OpenSearch Service, AWS X-Ray, AWS IoT SiteWise, Amazon Timestream, and Amazon Managed Service for Prometheus. Amazon Managed Grafana includes a permission provisioning feature for adding supported AWS services as data sources. Amazon Managed Grafana also supports many popular open-source, third-party, and other cloud data sources.

For user authentication and authorization, Amazon Managed Grafana can integrate with identity providers (IdPs) that support SAML 2.0 and also can integrate with AWS IAM Identity Center.

Amazon Managed Grafana is priced per active user in a workspace. For information about pricing, see [Amazon Managed Grafana Pricing](https://aws.amazon.com/grafana/pricing){rel="noopener noreferrer" target="_blank"}.

## Supported Regions {#AMG-supported-Regions}

Amazon Managed Grafana currently supports the following Regions:

:::: table-container
::: table-contents
+--------------------------+-----------------+------------------------------------------+-----------------+
| Region Name              | Region          | Endpoint                                 | Protocol        |
+==========================+=================+==========================================+=================+
| US East (Ohio)           | us-east-2       | grafana.us-east-2.amazonaws.com          | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana.us-east-2.api.aws                | HTTPS           |
+--------------------------+-----------------+------------------------------------------+-----------------+
| US East (N. Virginia)    | us-east-1       | grafana.us-east-1.amazonaws.com          | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana.us-east-1.api.aws                | HTTPS           |
+--------------------------+-----------------+------------------------------------------+-----------------+
| US West (Oregon)         | us-west-2       | grafana.us-west-2.amazonaws.com          | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana.us-west-2.api.aws                | HTTPS           |
+--------------------------+-----------------+------------------------------------------+-----------------+
| Asia Pacific (Seoul)     | ap-northeast-2  | grafana.ap-northeast-2.amazonaws.com     | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana.ap-northeast-2.api.aws           | HTTPS           |
+--------------------------+-----------------+------------------------------------------+-----------------+
| Asia Pacific (Singapore) | ap-southeast-1  | grafana.ap-southeast-1.amazonaws.com     | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana.ap-southeast-1.api.aws           | HTTPS           |
+--------------------------+-----------------+------------------------------------------+-----------------+
| Asia Pacific (Sydney)    | ap-southeast-2  | grafana.ap-southeast-2.amazonaws.com     | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana.ap-southeast-2.api.aws           | HTTPS           |
+--------------------------+-----------------+------------------------------------------+-----------------+
| Asia Pacific (Tokyo)     | ap-northeast-1  | grafana.ap-northeast-1.amazonaws.com     | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana.ap-northeast-1.api.aws           | HTTPS           |
+--------------------------+-----------------+------------------------------------------+-----------------+
| Europe (Frankfurt)       | eu-central-1    | grafana.eu-central-1.amazonaws.com       | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana.eu-central-1.api.aws             | HTTPS           |
+--------------------------+-----------------+------------------------------------------+-----------------+
| Europe (Ireland)         | eu-west-1       | grafana.eu-west-1.amazonaws.com          | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana.eu-west-1.api.aws                | HTTPS           |
+--------------------------+-----------------+------------------------------------------+-----------------+
| Europe (London)          | eu-west-2       | grafana.eu-west-2.amazonaws.com          | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana.eu-west-2.api.aws                | HTTPS           |
+--------------------------+-----------------+------------------------------------------+-----------------+
| AWS GovCloud (US-East)   | us-gov-east-1   | grafana.us-gov-east-1.amazonaws.com      | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana-fips.us-gov-east-1.api.aws       | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana-fips.us-gov-east-1.amazonaws.com | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana.us-gov-east-1.api.aws            | HTTPS           |
+--------------------------+-----------------+------------------------------------------+-----------------+
| AWS GovCloud (US-West)   | us-gov-west-1   | grafana.us-gov-west-1.amazonaws.com      | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana-fips.us-gov-west-1.api.aws       | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana-fips.us-gov-west-1.amazonaws.com | HTTPS           |
|                          |                 |                                          |                 |
|                          |                 | grafana.us-gov-west-1.api.aws            | HTTPS           |
+--------------------------+-----------------+------------------------------------------+-----------------+
:::
::::

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
::: {#next .next-link accesskey="n" href="./getting-started-with-AMG.html"}
Getting started
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
