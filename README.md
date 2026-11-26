# PROMs in primary care public data

## Requirements

- [R](https://www.r-project.org/)
- [Quarto](https://quarto.org/)
- R packages from CRAN: `gt`, `here`, `paletteer`, `patchwork`, `scales`, `tidyverse`
- R packages from GitHub: [`opencodecounts`](https://github.com/bennettoxford/opencodecounts)

Install the GitHub package with:

```r
pak::pak("bennettoxford/opencodecounts")
```

## Codelists

We developed the following four codelists:

- [PROMs for anxiety disorders](https://www.opencodelists.org/codelist/user/Lola_O/proms-anx/)
- [Declined PROMs for anxiety disorders](https://www.opencodelists.org/codelist/user/Lola_O/proms-anx-declined/)
- [PROMs for depression](https://www.opencodelists.org/codelist/user/Lola_O/proms-dep/)
- [Declined PROMs for depression](https://www.opencodelists.org/codelist/user/Lola_O/proms-dep-declined/)

The codelist versions are listed in `codelists/codelists.txt`.
Rendering the manuscript downloads them to `codelists/` as CSV files.

## Render manuscript

To render the `manuscript/proms.qmd` run:

```sh
quarto render
```

Outputs are written to `output/`.

## References

`manuscript/references.bib` is exported from the [Mental health research using public data](https://www.zotero.org/groups/6544461/mental_health_research_using_public_data/library) Zotero group library.

## Licence

Code is licensed under the MIT Licence. 
The manuscript in `manuscript/` and the rendered outputs in `output/` are licensed [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
