# Tesi-MASARIN: Attacks on Credibility in Online Social Networks

## Overview

This repository collects research materials, code, and experiments for the thesis *“Attacks on Credibility in Online Social Networks.”*

The project investigates how coordinated attackers can manipulate online discussions and how moderation strategies can mitigate their effects. The core framework is the **Signed Friedkin–Johnsen (SFJ) model**, which describes opinion evolution through interpersonal influence, stubbornness, and antagonistic interactions.

Current work primarily focuses on Reddit, combining synthetic networks, simplified interaction scenarios, and real-world discussion data.

## Research Focus

### Interaction and Influence Modeling

- Represent online communities as directed, weighted networks.
- Construct interaction graphs from comments, votes, and reposts in simplified Reddit scenarios.
- Map interactions into signed influence networks, accounting for credibility and agreement or antagonism.
- Study opinion evolution and convergence under the SFJ model.

### Credibility Attacks

Two attack mechanisms are investigated:

- **Sockpuppet attacks:** coordinated accounts manipulate their declared opinions to shift the opinions of honest users. Experiments examine attacker placement, attacker count, individual aggressiveness, and incomplete knowledge of the network or users’ opinions.
- **Vote and visibility brigading:** coordinated voting changes content ranking and visibility. Ongoing work connects these mechanisms to adversarial perturbations of the influence network.

### Moderation and Control

The project develops interpretable feedback moderation strategies in MATLAB/Simulink. Given an attacker-detection signal, the moderator adjusts influence weights to bring opinions closer to a nominal, attack-free reference.

Current implementations include proportional and proportional–integral controllers, with saturation and anti-windup.

## Experiments and Current Status

Work developed so far includes:

- Toy-network simulations for interpreting attack mechanisms and moderation behavior.
- Experiments on Erdős–Rényi, Barabási–Albert, and Watts–Strogatz networks.
- Comparisons of community-based and distributed attacker placement.
- Analysis of attacks under incomplete or noisy information.
- Monte Carlo experiments on simplified Reddit interaction networks.
- Real-data preprocessing, giant-component extraction, edge-weight transformations, and SFJ simulations with graph visualizations.

Ongoing work focuses on formalizing visibility manipulation, extending real-data attack experiments, and evaluating moderation strategies.

## Tools

- **Python and Jupyter:** data preprocessing, network construction, attack simulations, and analysis.
- **MATLAB and Simulink:** opinion dynamics and feedback moderation.
- **Gephi:** network exploration and visualization.
- **React and D3.js:** interactive visualizations of discussion networks.

## Datasets

**Primary dataset**

Perra, D., Failla, A., & Rossetti, G. (2024). *Reddit Climate Change Debate Dataset* (1.0.0). Zenodo.  
https://doi.org/10.5281/zenodo.13603528

**Additional dataset identified for the broader research scope**

Mesina, V., Failla, A., Morini, V., & Rossetti, G. (2024). *Italian Covid-19 Retweet Network (2020–2022).* Zenodo.  
https://doi.org/10.5281/zenodo.13909011

**Last updated: October 2026**
