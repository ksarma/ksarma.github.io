---
layout: kvs
permalink: /publications/
title: Publications
description: "* indicates equal contribution"
meta_description: "Peer-reviewed papers, preprints, abstracts, and conference proceedings by Karthik V. Sarma on AI, clinical informatics, psychiatry, and VR medical simulation."
years: [2026, 2025, 2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014, 2013, 2012]
---

<header class="kvs-pub-head">
  <div class="eyebrow" style="margin-bottom: 16px;">Publications</div>
  <h1 class="display">Selected work.</h1>
  <p>
    Peer-reviewed papers, preprints, abstracts, and conference proceedings.
    <span style="font-style: italic;">An asterisk indicates equal contribution.</span>
    See also <a href="https://scholar.google.com/citations?user={{ site.scholar_userid }}" target="_blank" rel="noopener">Google Scholar</a> and <a href="https://orcid.org/{{ site.orcid_id }}" target="_blank" rel="noopener">ORCID</a>.
  </p>
</header>

<div class="kvs-legend">
  <span class="eyebrow">Legend</span>
  <span class="item"><span class="badge-abbr is-paper">Paper</span> journal paper</span>
  <span class="item"><span class="badge-abbr is-pre">Pre</span> preprint</span>
  <span class="item"><span class="badge-abbr is-conf">Conf</span> conference paper</span>
  <span class="item"><span class="badge-abbr">Abs</span> abstract</span>
  <span class="item"><span class="badge-abbr">Inv</span> invited talk</span>
  <span class="item"><span class="badge-abbr">Panel</span> panel</span>
  <span class="item"><span class="badge-abbr">Letter</span> letter</span>
</div>

<div class="kvs-pubgrid">
  <aside class="yearrail">
    <div class="eyebrow" style="margin-bottom: 14px;">By year</div>
    <ul>
      {%- for y in page.years -%}<li><a href="#y-{{ y }}">{{ y }}</a></li>{%- endfor -%}
    </ul>
  </aside>

  <main>
    {%- for y in page.years -%}
    <div class="kvs-yeargroup" id="y-{{ y }}">
      <h2 class="year">{{ y }}</h2>
      {% bibliography -f papers -q @*[year={{ y }}]* %}
    </div>
    {%- endfor -%}
  </main>
</div>
