# Tesi-MASARIN: Attacks on Credibility in Online Social Networks

## Overview
This repository contains the research materials and experiments for the thesis on **"Attacks on Credibility in Online Social Networks"**. The project investigates how credibility is attacked and undermined in online discourse, with a focus on multiple online communities including Reddit and Twitter.

## Repository Organization

### Root Files
- **`DeGroot_toy.m`** - MATLAB implementation of DeGroot's consensus dynamics model for network opinion formation
- **`SignedDeGroot_toy.m`** - Extended version incorporating signed networks (positive and negative relationships)
- **`README.md`** - Project documentation

### ClimateChangeSubreddit/
Main analysis folder containing experiments and data from the r/ClimateChange subreddit community:

#### Data Files
- **`climatechange-1.csv` through `climatechange-4.csv`** - Raw Reddit discussion datasets (segmented into multiple parts)
- **`climatechange-opinions.csv`** - Processed user opinions and sentiment data

#### Analysis Notebook
- **`DS2024-exp.ipynb`** - Jupyter notebook containing the complete experimental analysis, including data exploration, opinion dynamics simulation, and credibility attack patterns

#### Visualizations
- **`graph.png`** - Network graph visualization of user interactions
- **`sampled_subgraph_Q1.png`** & **`sampled_subgraph_clean_Q1.png`** - Subgraph visualizations with and without noise
- **`polarization-cc.png`** - Polarization metrics over time
- **`acrophily-cc.png`**, **`acrophily-matrix-cc.png`**, **`acrophily-time-cc.png`** - Acrophily (assortative mixing) analysis
- **`thresholds-cc.png`** - Opinion threshold dynamics

### Covid19Retweet/
Dataset and analysis folder containing Twitter data related to COVID-19 discussions:

#### Data Files
- **COVID-19 retweet datasets** - Raw Twitter data capturing retweet patterns and user interactions related to COVID-19 misinformation and credibility discussions
- **`covid19-opinions.csv`** - Processed user opinions and sentiment regarding COVID-19 information

#### Analysis Materials
- Experimental notebooks analyzing credibility attacks in COVID-19 discourse
- Network analysis of information propagation and retweeting patterns
- Identification of misinformation clusters and credibility-attacking content

#### Visualizations
- Network graphs of COVID-19 information spread
- Retweet pattern analysis and temporal dynamics
- Polarization and sentiment distribution in COVID-19 discussions

## Project Focus
The research examines how credibility attacks manifest in online social networks, using opinion dynamics models and real-world data from Reddit and Twitter to analyze polarization, information propagation, misinformation patterns, and network behavior across different discourse contexts.

## Technologies Used
- **Python** (Jupyter Notebooks for data analysis)
- **MATLAB** (Opinion dynamics modeling)
- Data analysis and network visualization

## Datasets
1.Perra, D., Failla, A., & Rossetti, G. (2024). Reddit Climate Change Debate Dataset (1.0.0) [Data set]. 27th International Conference on Discovery Science (DS2024), Pisa, Italy. Zenodo. https://doi.org/10.5281/zenodo.13603528
3. Mesina, V., Failla, A., Morini, V., & Rossetti, G. (2024). Italian Covid-19 Retweet Network (2020-2022) [Data set]. 13th International Conference on Complex Networks and Their Applications (CNA2024), Istanbul, Turkey. Zenodo. https://doi.org/10.5281/zenodo.13909011

---
*Last updated: April 2026*
