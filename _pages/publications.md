---
layout: page
permalink: /publications/
title: publications
description: "* indicates equal contribution"
meta_description: "Academic publications by Karthik V. Sarma on artificial intelligence, clinical informatics, psychiatry and mental health, and VR/AR medical simulation technology."
years: [2026, 2025, 2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014, 2013]
nav: true
nav_order: 2
---
<!-- _pages/publications.md -->
<div class="publications">

{%- for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>
