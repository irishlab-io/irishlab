---
date: 2017-10-19T15:26:15Z
lastmod: 2019-10-26T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: true

title: "GitHub Action"
description: ""
author:
  - irish1986

weight: 2
---

# GitHub Action

[GitHub Actions](https://github.com/features/actions) are a great way to automate your own software development cycle. GitHub Actions are free of charge for public repositories and provide you with a whole CI/CD platform. It allows you to automate all parts of your software supply chain and run it in virtual environments or even your own environment using [self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/about-self-hosted-runners).  But more to come on this topic.

Much of what used to be done with a Jenkins job can now be done with GitHub Actions. In this article, I will give you a quick start in GitHub Actions and explain what actions, workflows, events, jobs and steps are. As an example we take a JavaScript application for which we set up a test automation.

## What are GitHub Actions?

GitHub Actions are reusable scripts that can be used on GitHub's platform for **continuous integration** and **continuous delivery** (CI/CD). You can write your own actions using JavaScript (and other languages) or use published actions from the [GitHub Marketplace](https://github.com/marketplace?type=actions).

There are already actions for various tasks like checking for code linting, uploading code coverage reports or deploying code in the cloud (or your homelab). In this tutorial, we will use existing GitHub Actions and wire them together in a so-called "workflow".

What are workflows?
A workflow is a description for your CI/CD pipeline on GitHub Actions. A workflow always runs one or more jobs and each job consists of steps which can be calls to GitHub Actions or regular shell commands. A workflow is triggered by an event (e.g. a commit in your branch) and runs on a virtual environment on GitHub (called "hosted runner") or your own environment (called "self-hosted runner").

Test Automation with GitHub Actions
To ensure that pull requests are compatible with your code, you can setup a GitHub workflow to run a test automation pipeline. I will show you how to do this by using a JavaScript demo project for which we will run npm test when new code comes in.

Setting up a workflow
Setting up a workflow is done by creating a YAML file inside of the .github/workflows directory of your repository on GitHub. We will save our test automation in test.yml:

.github/workflows/test.yml
