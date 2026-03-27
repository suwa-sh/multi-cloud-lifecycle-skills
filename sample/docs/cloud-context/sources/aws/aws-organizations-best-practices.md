---
source_url: "https://docs.aws.amazon.com/organizations/latest/userguide/orgs_best-practices.html"
fetched_at: "2026-03-27T21:22:23Z"
vendor: "aws"
layer: "foundation"
---

multi-account environment in AWS Organizations.

::: {#inline-topiclist .highlights}
###### Topics

- [Account and credentials](#orgs_best-practices-account-management)

- [Organization structure and workloads](#orgs_best-practices-organization-structure)

- [Service and cost management](#orgs_best-practices-service-cost-management)
:::

## Account and credentials {#orgs_best-practices-account-management}

### Enable root access management to simplify managing root user credentials for member accounts {#bp_root-access-management}

We recommend you enable root access management to help you monitor and remove root user credentials for member accounts. Root access management prevents recovery of root user credentials, improving account security in your organization.

::: itemizedlist
- Remove root user credentials for member accounts to prevent sign in to the root user. This also prevents member accounts from recovery of the root user.

- Assume a privileged session to perform the following tasks on member accounts:

  ::: itemizedlist
  - Remove a misconfigured bucket policy that denies all principals from accessing an Amazon S3 bucket.

  - Delete an Amazon Simple Queue Service resource-based policy that denies all principals from accessing an Amazon SQS queue.

  - Allow a member account to recover their root user credentials. The person with access to the root user email inbox for the member account can reset the root user password and sign in as the member account root user.
  :::
:::

After root access management is enabled, newly created member accounts are secure-by-default, having no root user credentials, which eliminates the need for additional security, such as MFA after provisioning.

For more information, see [Centralize root user credentials for member accounts](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html#id_root-user-access-management) in the *AWS Identity and Access Management User Guide*.

### Keep the contact phone number updated {#bp_multi-acct_keep-contact}

To recover access to your AWS account, it is crucial to have a valid and active contact phone number that allows you to receive text messages or calls. We recommend using a dedicated phone number to make sure that AWS can contact you for account support and recovery purposes. You can easily view and manage your account phone numbers via the AWS Management Console or Account Management APIs.

There are various ways to obtain a dedicated phone number that ensures AWS can contact you. We strongly recommend that you obtain a dedicated SIM card and physical phone. Safely store the phone and the SIM long-term to guarantee the phone number remains available for account recovery. Also make sure the team responsible for the mobile bill understands the importance of this number, even if it remains inactive for extended periods. It is essential to keep this phone number confidential within your organization for additional protection.

Document the phone number in the AWS Contact Information console page, and share its details with the specific teams that must know about it in your organization. This approach helps minimize the risk associated with transferring the phone number to a different SIM. Store the phone according to your existing information security policy. However, do not store the phone in the same location as the other related credential information. Any access to the phone or its storage location should be logged and monitored. If the phone number associated with an account changes, implement processes to update the phone number in your existing documentation.

### Use a group email address for root accounts {#bp_multi-acct_use-group}

Use an email address that is managed by your business. Use an email address that forwards received messages directly to a group of users. In the event that AWS must contact the owner of the account, for example, to confirm access, the email message is distributed to multiple parties. This approach helps to reduce the risk of delays in responding, even if individuals are on vacation, out sick, or leave the business.

## Organization structure and workloads {#orgs_best-practices-organization-structure}

### Manage your accounts within a single organization {#bp_multi-acct_single-org}

We recommend creating a single organization and managing all your accounts within this organization. An organization is a security boundary that lets you maintain consistency across accounts in your environment. You can centrally apply policies or service-level configurations across accounts within an organization. If you want to enable consistent policies, central visibility, and programmatic controls across your multi-account environment, this is best achieved within a single organization.

### Group workloads based on business purpose and not reporting structure {#bp_multi-acct_group-workloads}

We recommend that you isolate production workload environments and data under your top-level workload-oriented OUs. Your OUs should be based on a common set of controls rather than mirroring your company's reporting structure. Apart from production OUs, we recommend that you define one or more non-production OUs that contain accounts and workload environments that are used to develop and test workloads. For additional guidance, see [Organizing workload-oriented OUs](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/organizing-workload-oriented-ous.html).

### Use multiple accounts to organize your workloads {#bp_multi-acct_use-multiple}

An AWS account provides natural security, access, and billing boundaries for your AWS resources. There are benefits of using multiple accounts because it lets you distribute account level quotas and API request-rate limits, and [additional benefits](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/benefits-of-using-multiple-aws-accounts.html) listed here. We recommend that you use a number of [organization-wide foundational accounts](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/recommended-ous-and-accounts.html), such as accounts for security, logging, and infrastructure. For workload accounts, you should [separate production workloads from test/development workloads in separate accounts](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/design-principles-for-your-multi-account-strategy.html#separate-production-from-non-production-workloads).

## Service and cost management {#orgs_best-practices-service-cost-management}

### Enable AWS services at the organizational level using the service console or API/CLI operations {#bp_multi-acct_enable-aws}

As a best practice, we recommend enabling or disabling any services you'd like to integrate with across AWS Organizations using that service's console, or API operations/CLI command equivalents. Using this method, the AWS service can perform all required initialization steps for your organization, such as creating any required resources and cleaning up resources when disabling the service. AWS Account Management is the only service that requires use of the AWS Organizations Console or APIs to enable. To review the list of services that are integrated with AWS Organizations, see [AWS services that you can use with AWS Organizations](./orgs_integrate_services_list.html).

### Use billing tools to track costs and optimize resource usage {#bp_multi-acct_use-billing}

When managing an organization, you get a consolidated bill that covers all charges from accounts in your organization. For business users who need access to cost visibility, you can provide a role in the management account with restricted read-only permissions to review billing and cost tools. For example, you can [create a permission set](https://docs.aws.amazon.com/singlesignon/latest/userguide/howtocreatepermissionset.html) that provides access to billing reports, or use the AWS Cost Explorer Service (a tool for viewing cost trends over time), and cost-efficiency services such as [Amazon S3 Storage Lens](https://aws.amazon.com/blogs/aws/s3-storage-lens/){rel="noopener noreferrer" target="_blank"} and [AWS Compute Optimizer](https://aws.amazon.com/compute-optimizer/){rel="noopener noreferrer" target="_blank"}.

### Plan the tagging strategy and enforcement of tags across your organization resources {#bp_multi-acct_plan-tagging}

As your accounts and workloads scale, tags can be a useful feature for cost tracking, access control, and resource organization. For tagging naming strategies, follow the guidance in [Tagging your AWS resources](https://docs.aws.amazon.com/tag-editor/latest/userguide/tagging.html). In addition to resources, you can create tags on the organization root, accounts, OUs, and policies. Refer to the [Building your tagging strategy](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/building-your-tagging-strategy.html) for additional information.

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
::: {#previous .prev-link accesskey="p" href="./support-and-feedback.html"}
Support and feedback
:::

::: {#next .next-link accesskey="n" href="./orgs_getting-started.html"}
Getting started
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
