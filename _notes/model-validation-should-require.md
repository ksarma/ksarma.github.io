---
title: What model validation should actually require
date: 2026-03-02
tags: [policy, safety]
read_min: 9
lead: "A note on the gap between 'the model achieves SOTA on this benchmark' and 'this model is safe to deploy in front of a patient.'"
description: "A note on the gap between 'the model achieves SOTA on this benchmark' and 'this model is safe to deploy in front of a patient.' Three things I keep asking companies for that aren't standard yet."
meta_description: "Three questions I ask digital-health companies during model validation that aren't standard practice yet, and why benchmarks don't establish clinical safety."
---

Benchmark performance and deployment safety are different claims, and the distance between them is where most of the risk lives. Here are three things I keep asking for that aren't yet standard.

## 1. Failure-mode characterization, not just aggregate accuracy

An aggregate accuracy number tells you how often the model is right on average. It tells you nothing about *how* it fails — and in a clinical setting, the shape of the failure matters more than its frequency.

## 2. Behavior under sustained, adversarial, multi-turn interaction

Most evaluations are single-turn. The cases that worry me clinically are not.

## 3. A monitoring plan that survives contact with production

A model that was validated once, at a point in time, on a fixed distribution, is not the model that will be running in six months.
