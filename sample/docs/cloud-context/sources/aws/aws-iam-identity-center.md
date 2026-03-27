---
source_url: "https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html"
fetched_at: "2026-03-27T21:22:23Z"
vendor: "aws"
layer: "foundation"
---

applications such as Kiro and Amazon Quick, and other AWS resources. You can connect your existing identity provider and synchronize users and groups from your directory, or create and manage your users directly in IAM Identity Center. You can then use IAM Identity Center for either or both of the following:

::: itemizedlist
- User access to applications

- User access to AWS accounts
:::

**Already using IAM for access to AWS accounts?**

You don't need to make any changes to your current AWS account workflows to use IAM Identity Center for access to AWS managed applications. If you're using [federation with IAM](https://docs.aws.amazon.com//IAM/latest/UserGuide/id_roles_providers.html#id_roles_providers_iam) for AWS account access, your users can continue to access AWS accounts in the same way they always have, and you can continue to use your existing workflows to manage that access.

## Why use IAM Identity Center? {#features}

IAM Identity Center streamlines and simplifies workforce user access to applications or AWS accounts, or both, through the following key capabilities.

:::::::::: variablelist
**[]{.term}**

::: {#awsmanagedapplications}
:::

Integration with AWS managed applications

[AWS managed applications](./awsapps.html) such as Kiro and Amazon Redshift integrate with IAM Identity Center. IAM Identity Center provides AWS managed applications with a common view of users and groups.

**[]{.term}**

::: {#trustedidentitypropagationdefinition}
:::

Trusted identity propagation across applications

With trusted identity propagation, AWS managed applications such as Amazon Quick can securely share a user's identity with other AWS managed applications such as Amazon Redshift and authorize access to AWS resources based on the user's identity. You can more easily audit user activity because CloudTrail events are logged based on the user and the actions the user initiated. This makes it easier to understand who accessed what. For information about supported use cases, including end-to-end configuration guidance, see [Trusted identity propagation use cases](./trustedidentitypropagation-integrations.html).

**[]{.term}**

::: {#multiaccountpermissions}
:::

One place to assign permissions to multiple AWS accounts

With multi-account permissions, IAM Identity Center provides a single place for you to assign permissions to groups of users in multiple AWS accounts. You can create permissions based on common job functions or define custom permissions that meet your security needs. You can then assign those permissions to workforce users to control their access to specific AWS accounts.

This optional feature is available only for [organization instances](./organization-instances-identity-center.html) of IAM Identity Center.

**[]{.term}**

::: {#workforceidentities}
:::

One point of federation to simplify user access to AWS

By providing one point of federation, IAM Identity Center reduces the administrative effort required to use multiple AWS managed applications and AWS accounts. With IAM Identity Center, you only federate once, and you have only one certificate to manage when using a [`SAML 2.0`{.code}](https://wiki.oasis-open.org/security){rel="noopener noreferrer" target="_blank"} identity provider. IAM Identity Center provides AWS managed applications with a common view of users and groups for trusted identity propagation use cases, or when users share access to AWS resources with other people.

For information about how to configure commonly used identity providers to work with IAM Identity Center, see [IAM Identity Center identity source tutorials](./tutorials.html). If you don't have an existing identity provider, you can [create and manage users directly in IAM Identity Center](./quick-start-default-idc.html).

**[]{.term}**

::: {#instances}
:::

Two instance types

IAM Identity Center supports two types of instances: *organization instances* and *account instances*. An organization instance is the best practice. It\'s the only instance that enables you to manage access to AWS accounts and it is recommended for all production use of applications. An organization instance is deployed in the AWS Organizations management account and gives you a single point from which to manage user access across AWS.

Account instances are bound to the AWS account in which they are enabled. Use account instances of IAM Identity Center only to support isolated deployments of select AWS managed applications. For more information, see [Organization and account instances of IAM Identity Center](./identity-center-instances.html).

**[]{.term}**

::: {#accessportal}
:::

User-friendly web portal access for your users

The AWS access portal is a user-friendly web portal that provides your users with seamless access to all their assigned applications, AWS accounts, or both.

**[]{.term}**

::: {#multi-region-access-to-accounts-and-applications}
:::

Multi-Region access to AWS accounts and applications

When you replicate your IAM Identity Center instance to additional Regions, your workforce can access their assigned AWS accounts and applications through all enabled Regions, and they can deploy AWS managed applications in each enabled Region.
::::::::::

## IAM Identity Center rename {#renamed}

On July 26, 2022, AWS Single Sign-On was renamed to AWS IAM Identity Center.

### Legacy namespaces remain the same {#legacy-namespaces}

The `sso`{.code} and `identitystore`{.code} API namespaces along with the following related namespaces **remain unchanged** for backward compatibility purposes.

::: itemizedlist
- CLI commands

  ::: itemizedlist
  - [`aws configure sso`{.code}](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html)

  - [`identitystore`{.code}](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/identitystore/index.html){rel="noopener noreferrer" target="_blank"}

  - [`sso`{.code}](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/sso/index.html){rel="noopener noreferrer" target="_blank"}

  - [`sso-admin`{.code}](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/sso-admin/index.html){rel="noopener noreferrer" target="_blank"}

  - [`sso-oidc`{.code}](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/sso-oidc/index.html){rel="noopener noreferrer" target="_blank"}
  :::

- [Managed policies](https://docs.aws.amazon.com//singlesignon/latest/userguide/security-iam-awsmanpol.html) containing `AWSSSO`{.code} and `AWSIdentitySync`{.code} prefixes

- [Service endpoints](https://docs.aws.amazon.com//general/latest/gr/sso.html#sso_region) containing `sso`{.code} and `identitystore`{.code}

- [CloudFormation](https://docs.aws.amazon.com//AWSCloudFormation/latest/UserGuide/AWS_SSO.html) resources containing `AWS::SSO`{.code} prefixes

- [Service-linked role](https://docs.aws.amazon.com//singlesignon/latest/userguide/using-service-linked-roles.html#slr-permissions) containing `AWSServiceRoleForSSO`{.code}

- Console URLs containing `sso`{.code} and `singlesignon`{.code}

- Documentation URLs containing `singlesignon`{.code}
:::

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
::: {#next .next-link accesskey="n" href="./getting-started.html"}
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
