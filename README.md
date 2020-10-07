# ToneClouds
This repository includes the data and code used to generate the figures for the paper "Emergence of abstract sound representations in the ascending auditory system" by Harpaz, Jankowski, Khouri and Nelken.

A separate subdirectory called 'Fig1' includes the code, data and images required for generating figure 1 (Fig 1.m). Note that the matrices for generating the images of brain slices are too large to be uploaded to GitHub and can be downloaded from this google drive folder: https://drive.google.com/drive/folders/1tUpGBEhVgwul1sjMv9XKn8UzcP12uv-T?usp=sharing

"data_figs.mat" contains the data for Figs. 2-5 and the supplemental figures. This struct array is divided into fields named after brain regions and subregions of the Auditory system. Each field contains the data used to generate the panels of the corresponding figure. Thus,field A1 has the data for Figure 2; IC: Figure 3; MGB: Figure 4. The field 'frc' (firing rate change) includes all the data required for generating Figure 5. The other fields, with names corresponding to subregions, contain the data for the supplemental figures.

The scripts contain the code for generating the figures, as specified by their names (e.g. Fig2.m, S2.m, etc.).


















