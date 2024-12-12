# Speech Emotion Recognition in Conversations Using Artificial Intelligence: A Systematic Review and Meta-Analysis

This repository contains the data, tools, and code, that were used to obtain the results in the paper "Speech Emotion Recognition in Conversations Using Artificial Intelligence: A Systematic Review and Meta-Analysis". 

![graphical_abstract_2](https://github.com/user-attachments/assets/0d6ece91-0484-49a3-bf51-1d0e6a30f6e9)

# Study Highlights

- **_Emotion recognition performance increases when conversations are acted_**, as the case is in datasets like IEMOCAP or MELD. Natural or naturalistic conversation scenarios such as K-EmoCon, demonstrated lower diagnostic test performance. 

- **_Speech unimodality performs better than speech multimodality_**, and this effect is statistically significant in the examined cohort.

- **_Deep features provide better performance than hand-crafted features_** and signal processing transformations, but this effect is not statistically significant. This implies that **_expert knowledge and inductive biases_** (e.g. through signal processing) **_will still be relevant_** in the near future of the SERC field.

- **_F1-score differentiates well low from high valenced emotions_** (Ekman's categorical model), whereas Accuracy and Recall show better performance in predicting Arousal than Valence (Russell's dimensional model).

- **_SERC AI studies prefer to use Ekman's categorical model_**, rather than Russell's dimensional model.

- **_Inter-rater annotation agreement was low_**, especially in K-EmoCon that has naturalistic conversations, but better in IEMOCAP that has acted conversations.

- **_Highly valenced emotions (happy, cheerful) gather the most agreement from raters_**.

- **47%** of studies had **_significant gaps in reporting completeness of their results_**, as indicated by the methodological quality and risk of bias analysis.

- **_Data selection for analysis differs across studies_**, even when the same datasets are used. This hinders comparability and reproducibility of the results.

# Overview 
This work presents a knowledge systematization in the field of speech emotion recognition in conversations (SERC) using AI, for the years 2010-2023. Through a systematic search in 6 public databases, we identified 1932 relevant records; 51 of those met our inclusion criteria for a systematic review, and 27 of them met our criteria for a meta-analysis of diagnostic test performance in the emotion recognition in conversations task. After a rigorous methodological quality and risk of bias assessment, we carry out a multi-subgroup random-effects models analysis. We evaluate the diagnostic test performance of methods regarding their predictive power on categorical emotions (Ekman's model), and dimensional emotions (Russell's model), in terms of accuracy, F1-score and recall metrics. Inside the categorical and dimensional groups, we further analyze the effects of the conversation style of a dataset, the feature extraction method, and modalities used. Finally, we analyze the inter-rater reliability of annotations in the IEMOCAP and K-EmoCon datasets. Ultimately, our work concludes with the identified limitations of the SERC AI field, along with recommendations and best practices that should be followed in the design and analysis of SERC datasets.

# How to Navigate and Use this Repository
The summary table of our study can be found in the file "summary table.xlsx", where the 51 studies used in the Systematic Review and Meta-Analysis are outlined (Table 1, pp.11 in the paper). 
More data and tools are organized according to the analysis axes that were followed in the systematic review and meta-analysis. Each analysis is contained in a single directory that contains tools and produced figures related to that analysis. Below is a brief description of the contents of each directory. For more information, please see the README files inside each directory.

- **_Systematic Search and Screening Results_**
Contains data and results that describe the systematic search process, from the initial research questions that were used to shape keywords and search strings, to the results of the search in numbers, the screening process that was carried out through Rayyan, the results of the screening process and the final studies along with their key characteristics. 

- **_Selected Papers_**

- **_Methodological Quality_**

- **_Risk of Bias Analysis - ROBINS-I_**
Contains tools and results of the risk of bias analysis through the ROBINS-I tool (Risk of Bias In Non-randomised Studies- of Interventions) []. 

- **_Meta-Analysis_**

- **_Affective Annotations Inter-Rater Reliability_**

# Citing this Work

If you found any part of this work useful, please cite the below reference:

Ghada Alhussein, Ioannis Ziogas, Shiza Saleem, Leontios Hadjileontiadis. Speech Emotion Recognition in Conversations Using Artificial Intelligence: A Systematic Review and Meta-Analysis

% -- Bibtex citation here --


# References

[]: Jonathan AC Sterne, Miguel A Hern´an, Barnaby C Reeves, Jelena Savovi´ c,
 Nancy D Berkman, Meera Viswanathan, David Henry, Douglas G Altman,
 Mohammed T Ansari, Isabelle Boutron, et al. Robins-i: a tool for assessing risk
 of bias in non-randomised studies of interventions. bmj, 355, 2016.
