# PROMs in primary care public data

## Requirements

- [R](https://www.r-project.org/)
- [Quarto](https://quarto.org/)
- R packages from CRAN: `gt`, `here`, `patchwork`, `scales`, `tidyverse`
- R packages from GitHub: [`opencodecounts`](https://github.com/bennettoxford/opencodecounts)

Install the GitHub package with:

```r
pak::pak("bennettoxford/opencodecounts")
```

## Codelists

We developed the following four codelists:

- [Patient-reported outcome measures for anxiety disorders](https://www.opencodelists.org/codelist/user/Lola_O/patient-reported-outcome-measures-for-anxiety-disorders/0314a9a9/)
- [Declined patient-reported outcome measures for anxiety disorders](https://www.opencodelists.org/codelist/user/Lola_O/declined-proms-for-anxiety-disorders/631bb866/)
- [Patient-reported outcome measures for depression](https://www.opencodelists.org/codelist/user/Lola_O/patient-reported-outcome-measures-for-depression/62e34278/)
- [Declined patient-reported outcome measures for depression](https://www.opencodelists.org/codelist/user/Lola_O/declined-proms-for-depression/4a0c4531/)

## Render manuscript

To reproduce `manuscript/proms.qmd`, run:

```sh
quarto render
```

Outputs are written to `output/`.

## Licence

Code is licensed under the MIT Licence. The manuscript in `manuscript/` and the rendered outputs in `output/` are licensed [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
