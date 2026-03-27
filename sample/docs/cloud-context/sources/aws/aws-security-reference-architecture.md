---
source_url: "https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/introduction.html"
fetched_at: "2026-03-27T21:22:23Z"
vendor: "aws"
layer: "foundation"
---

history)

:::: table-container
::: table-contents
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  Influence the future of the AWS Security Reference Architecture (AWS SRA) by taking a [short survey](https://amazonmr.au1.qualtrics.com/jfe/form/SV_e3XI1t37KMHU2ua){rel="noopener noreferrer" target="_blank"}.
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:::
::::

The Amazon Web Services (AWS) Security Reference Architecture (AWS SRA) is a holistic set of guidelines for deploying the full complement of AWS security services in a multi-account environment. Use it to help design, implement, and manage AWS security services so that they align with AWS recommended practices. The recommendations are built around a single-page architecture that includes AWS security services*---*how they help achieve security objectives, where they can be best deployed and managed in your AWS accounts, and how they interact with other security services. This overall architectural guidance complements detailed, service-specific recommendations such as those found on the [AWS Security Documentation website](https://docs.aws.amazon.com/security/).

The architecture and accompanying recommendations are based on our collective experiences with AWS enterprise customers. This document is a reference---a comprehensive set of guidance for using AWS services to secure a particular environment---and the solution patterns in the [AWS SRA code repository](./code-repo.html) were designed for the specific architecture illustrated in this reference. Each customer will have different requirements. As a result, the design of your AWS environment might differ from the examples provided here. **You will need to modify and tailor these recommendations to suit your individual environment and security needs. **Throughout the document, where appropriate, we suggest options for frequently seen alternative scenarios. 

The AWS SRA is a living set of guidance and is updated periodically based on new service and feature releases, customer feedback, and the constantly changing threat landscape. Each update will include the revision date and the associated [change log](./doc-history.html). 

Although we rely on a one-page diagram as our foundation, the architecture goes deeper than a single block diagram and must be built on a well-structured foundation of fundamentals and security principles. You can use this document in two ways: as a narrative or as a reference. The topics are organized as a story, so you can read them from the beginning (foundational security guidance) to the end (discussion of code samples you can implement). Alternatively, you can navigate the document to focus on the security principles, services, account types, guidance, and examples that are most relevant to your needs. 

This document is divided into the following sections and an appendix:

::: itemizedlist
- [About the AWS SRA library](./about-sra-library.html) provides an overview of the technical guidance and code included in the AWS SRA collection of publications.

- [The value of the AWS SRA](./value.html) discusses the motivation for building the AWS SRA, describes how you can use it to help improve your security, and lists key takeaways.

- [Security foundations](./foundations.html) reviews the AWS Cloud Adoption Framework (AWS CAF), the AWS Well-Architected Framework, and the AWS Shared Responsibility Model, and highlights elements that are especially relevant to the AWS SRA.

- [AWS Organizations, accounts, and IAM guardrails](./organizations.html) introduces the AWS Organizations service, discusses the foundational security capabilities and guardrails, and gives an overview of our recommended multi-account strategy.

- [The AWS Security Reference Architecture](./architecture.html) is a single-page architecture diagram that shows functional AWS accounts, and the security services and features that are generally available.

- [AI/ML for security](./ai-ml.html) describes how different AWS services use artificial intelligence and machine learning (AI/ML) in the background to help you achieve specific security objectives. You can include these AWS services in your design to take advantage of advanced security features.

- [Building your security architecture ‒ A phased approach](./phases.html) provides guidance on how you can build your own security architecture in six iterative phases, based on the reference provided by the AWS SRA.

- [AWS SRA best practices checklist](./checklist.html) distills the recommendations discussed throughout the guide into a checklist that you can follow as you build your version of the security architecture.

- [IAM resources](./iam-resources.html) presents a summary and set of pointers for AWS Identity and Access Management (IAM) guidance that are important to your security architecture.

- [Code repository for AWS SRA examples](./code-repo.html) provides an overview of the associated [GitHub repository](https://github.com/aws-samples/aws-security-reference-architecture-examples){rel="noopener noreferrer" target="_blank"} that will help developers and engineers deploy some of the guidance and architecture patterns presented in this document. You can deploy the samples by using AWS CloudFormation or Terraform by HashiCorp. They support both AWS Control Tower and non‒AWS Control Tower environments.
:::

The [appendix](./appendix.html) contains a list of the individual AWS security, identity, and compliance services, and provides links to more information about each service. The [Document history](./doc-history.html) section provides a change log for tracking versions of this document. You can also subscribe to an [RSS feed](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/security-reference-architecture.rss) for change notifications.

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
::: {#next .next-link accesskey="n" href="./about-sra-library.html"}
About the AWS SRA library
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
