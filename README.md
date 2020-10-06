# ToneClouds
This repository includes the original database and codes used to generate the figures for the paper "Emergence of abstract sound representations in the ascending auditory system".

"data_figs.mat" is the original database.
This struct array is divided into fields of regions and subregions of the Auditory system, each corresponds to a figure in the paper (A1, IC and MGB for the main figures, subregions for supplemental figures). Within each region field, one can find the actual data used to generate each panel of the corresponding figure. The field 'frc' (firing rate change) includes all the data required for generating Figure 5.

For generating the figures, one can run the codes named after the figure identity (e.g. Fig2.m, S2.m, etc.).

A separate branch called 'Fig1' includes the code, data and images required for generating figure 1 (Fig 1.m).
Note that the matrices for generating the images of brain slices are too large to be uploaded to GitHub and can be downloaded from this google drive folder:
https://drive.google.com/drive/folders/1tUpGBEhVgwul1sjMv9XKn8UzcP12uv-T?usp=sharing














