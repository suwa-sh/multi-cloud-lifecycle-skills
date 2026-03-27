---
source_url: "https://docs.aws.amazon.com/secretsmanager/latest/userguide/best-practices.html"
fetched_at: "2026-03-27T21:50:38Z"
vendor: "aws"
layer: "shared-platform"
---

security policies. The following best practices are general guidelines and don\'t represent a complete security solution. Because these best practices might not be appropriate or sufficient for your environment, treat them as helpful considerations rather than prescriptions.

::: {#inline-topiclist .highlights}
###### Consider the following best practices for storing and managing secrets:

- [Store credentials and other sensitive information in AWS Secrets Manager](#best-practices-store-secrets-safely)

- [Find unprotected secrets in your code](#w2aab9b9)

- [Choose an encryption key for your secret](#w2aab9c11)

- [Use caching to retrieve secrets](#w2aab9c13)

- [Rotate your secrets](#w2aab9c15)

- [Mitigate risks of using CLI](#w2aab9c17)

- [Limit access to secrets](#w2aab9c19)

- [Replicate secrets](#w2aab9c21)

- [Monitor secrets](#w2aab9c23)

- [Run your infrastructure on private networks](#w2aab9c25)
:::

## Store credentials and other sensitive information in AWS Secrets Manager {#best-practices-store-secrets-safely}

Secrets Manager can help improve your security posture and compliance, and reduce the risk of unauthorized access to your sensitive information. Secrets Manager encrypts secrets at rest using encryption keys that you own and store in AWS Key Management Service (AWS KMS). When you retrieve a secret, Secrets Manager decrypts the secret and transmits it securely over TLS to your local environment. For more information, see [Create an AWS Secrets Manager secret](./create_secret.html).

## Find unprotected secrets in your code {#w2aab9b9}

CodeGuru Reviewer integrates with Secrets Manager to use a secrets detector that finds unprotected secrets in your code. The secrets detector searches for hardcoded passwords, database connection strings, user names, and more. For more information, see [Find unprotected secrets in your code with Amazon CodeGuru Reviewer](./integrating-codeguru.html).

Amazon Q can scan your codebase for security vulnerabilities and code quality issues to improve the posture of your applications throughout the development cycle. For more information, see [Scanning your code with Amazon Q](https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/security-scans.html) in the *Amazon Q Developer User Guide*.

## Choose an encryption key for your secret {#w2aab9c11}

For most cases, we recommend using the `aws/secretsmanager`{.code} AWS managed key to encrypt secrets. There is no cost for using it.

To be able to access a secret from another account or to apply a key policy to the encryption key, use a customer managed key to encrypt the secret.

::: itemizedlist
- In the key policy, assign the value `secretsmanager.<region>.amazonaws.com`{.code} to the [`kms:ViaService`{.code}](https://docs.aws.amazon.com/kms/latest/developerguide/policy-conditions.html#conditions-kms-via-service) condition key. This limits use of the key to only requests from Secrets Manager.

- To further limit use of the key to only requests from Secrets Manager with the correct context, use keys or values in the [Secrets Manager encryption context](https://docs.aws.amazon.com/secretsmanager/latest/userguide/security-encryption.html#security-encryption-encryption-context) as a condition for using the KMS key by creating:

  ::: itemizedlist
  - A [string condition operator](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_condition_operators.html#Conditions_String) in an IAM policy or key policy

  - A [grant constraint](https://docs.aws.amazon.com/kms/latest/APIReference/API_GrantConstraints.html) in a grant
  :::
:::

For more information, see [Secret encryption and decryption in AWS Secrets Manager](./security-encryption.html).

## Use caching to retrieve secrets {#w2aab9c13}

To use your secrets most efficiently, we recommend you use one of the following supported Secrets Manager caching components to cache your secrets and update them only when required:

::: itemizedlist
- [Java with client-side caching](./retrieving-secrets_cache-java.html)

- [Python with client-side caching](./retrieving-secrets_cache-python.html)

- [.NET with client-side caching](./retrieving-secrets_cache-net.html)

- [Go with client-side caching](./retrieving-secrets_cache-go.html)

- [Rust with client-side caching](./retrieving-secrets_cache-rust.html)

- [AWS Parameters and Secrets Lambda Extension](./retrieving-secrets_lambda.html)

- [Use AWS Secrets Manager secrets in Amazon Elastic Kubernetes Service](./integrate_eks.html)

- Use [Using the AWS Secrets Manager Agent](./secrets-manager-agent.html) to standardize consumption of secrets from Secrets Manager across environments such as AWS Lambda, Amazon Elastic Container Service, Amazon Elastic Kubernetes Service, and Amazon Elastic Compute Cloud.
:::

## Rotate your secrets {#w2aab9c15}

If you don\'t change your secrets for a long period of time, the secrets become more likely to be compromised. With Secrets Manager, you can set up automatic rotation as often as every four hours. Secrets Manager offers two strategies for rotation: [Single user](./rotation-strategy.html#rotating-secrets-one-user-one-password) and [Alternating users](./rotation-strategy.html#rotating-secrets-two-users). For more information, see [Rotate AWS Secrets Manager secrets](./rotating-secrets.html).

## Mitigate risks of using CLI {#w2aab9c17}

When you use the AWS CLI to invoke AWS operations, you enter those commands in a command shell. Most command shells offer features that could compromise your secrets, such as logging and the ability to see the last entered command. Before you use the AWS CLI to enter sensitive information, be sure to [Mitigate the risks of using the AWS CLI to store your AWS Secrets Manager secrets](./security_cli-exposure-risks.html).

## Limit access to secrets {#w2aab9c19}

In IAM policy statements that control access to your secrets, use the principle of [least privileged access](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#grant-least-privilege). You can use [IAM roles and policies](./auth-and-access_iam-policies.html), [resource policies](./auth-and-access_resource-policies.html), and [attribute-based access control (ABAC)](./auth-and-access-abac.html). For more information, see [Authentication and access control for AWS Secrets Manager](./auth-and-access.html).

::: {#inline-topiclist .highlights}
###### Topics

- [Block broad access to secrets](#iam-contextkeys-blockpublicpolicy)

- [Use caution with IP address conditions in policies](#iam-contextkeys-ipaddress)

- [Limit requests with VPC endpoint conditions](#iam-contextkeys-vpcendpoint)
:::

### Block broad access to secrets {#iam-contextkeys-blockpublicpolicy}

In identity policies that allow the action `PutResourcePolicy`{.code}, we recommend you use `BlockPublicPolicy: true`{.code}. This condition means that users can only attach a resource policy to a secret if the policy doesn\'t allow broad access.

Secrets Manager uses Zelkova automated reasoning to analyze resource policies for broad access. For more information about Zelkova, see [ How AWS uses automated reasoning to help you achieve security at scale](https://aws.amazon.com/blogs/security/protect-sensitive-data-in-the-cloud-with-automated-reasoning-zelkova/){rel="noopener noreferrer" target="_blank"} on the AWS Security Blog.

The following example shows how to use `BlockPublicPolicy`{.code}.

JSON

:   ::: variablelist

    **[]{.term}**

    :   ``` {.programlisting example-id="d235643dfffd6731f0bd501feeb38ea553fcf10f3986415f613055b41bd25c8a"}
        {
            "Version":"2012-10-17",              
            "Statement": {
                "Effect": "Allow",
                "Action": "secretsmanager:PutResourcePolicy",
                "Resource": "arn:aws:secretsmanager:us-east-1:123456789012:secret:secretName-AbCdEf",
            "Condition": {
                    "Bool": {
                        "secretsmanager:BlockPublicPolicy": "true"
                    }
                }
            }
        }
        ```
    :::

### Use caution with IP address conditions in policies {#iam-contextkeys-ipaddress}

Use caution when you specify the [IP address condition operators](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_condition_operators.html#Conditions_IPAddress) or the `aws:SourceIp`{.code} condition key in a policy statement that allows or denies access to Secrets Manager. For example, if you attach a policy that restricts AWS actions to requests from your corporate network IP address range to a secret, then your requests as an IAM user invoking the request from the corporate network work as expected. However, if you enable other services to access the secret on your behalf, such as when you enable rotation with a Lambda function, that function calls the Secrets Manager operations from an AWS-internal address space. Requests impacted by the policy with the IP address filter fail.

Also, the `aws:sourceIP`{.code} condition key is less effective when the request comes from an Amazon VPC endpoint. To restrict requests to a specific VPC endpoint, use [Limit requests with VPC endpoint conditions](#iam-contextkeys-vpcendpoint).

### Limit requests with VPC endpoint conditions {#iam-contextkeys-vpcendpoint}

To allow or deny access to requests from a particular VPC or VPC endpoint, use `aws:SourceVpc`{.code} to limit access to requests from the specified VPC or `aws:SourceVpce`{.code} to limit access to requests from the specified VPC endpoint. See [Example: Permissions and VPCs](./auth-and-access_resource-policies.html#auth-and-access_examples_vpc).

::: itemizedlist
- `aws:SourceVpc`{.code} limits access to requests from the specified VPC.

- `aws:SourceVpce`{.code} limits access to requests from the specified VPC endpoint.
:::

If you use these condition keys in a resource policy statement that allows or denies access to Secrets Manager secrets, you can inadvertently deny access to services that use Secrets Manager to access secrets on your behalf. Only some AWS services can run with an endpoint within your VPC. If you restrict requests for a secret to a VPC or VPC endpoint, then calls to Secrets Manager from a service not configured for the service can fail.

See [Using an AWS Secrets Manager VPC endpoint](./vpc-endpoint-overview.html).

## Replicate secrets {#w2aab9c21}

Secrets Manager can automatically replicate your secrets to multiple AWS Regions to meet your resiliency or disaster recovery requirements. For more information, see [Replicate AWS Secrets Manager secrets across Regions](./replicate-secrets.html).

## Monitor secrets {#w2aab9c23}

Secrets Manager enables you to audit and monitor secrets through integration with AWS logging, monitoring, and notification services. For more information, see:

::: itemizedlist
- [Log AWS Secrets Manager events with AWS CloudTrail](./monitoring-cloudtrail.html)

- [Monitor AWS Secrets Manager with Amazon CloudWatch](./monitoring-cloudwatch.html)

- [Monitor AWS Secrets Manager secrets for compliance by using AWS Config](./configuring-awsconfig-rules.html)

- [Monitor Secrets Manager costs](./monitor-secretsmanager-costs.html)

- [Detect threats with Amazon GuardDuty](./monitoring-guardduty.html)
:::

## Run your infrastructure on private networks {#w2aab9c25}

We recommend that you run as much of your infrastructure as possible on private networks that are not accessible from the public internet. You can establish a private connection between your VPC and Secrets Manager by creating an *interface VPC endpoint*. For more information, see [Using an AWS Secrets Manager VPC endpoint](./vpc-endpoint-overview.html).

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

::::::: {#main-col-footer .awsui-util-font-size-0}
::: {#doc-conventions}
[Document Conventions](/general/latest/gr/docconventions.html){target="_top"}
:::

::::: prev-next
::: {#previous .prev-link accesskey="p" href="./asm_access.html"}
Access Secrets Manager
:::

::: {#next .next-link accesskey="n" href="./tutorials.html"}
Tutorials
:::
:::::
:::::::

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
