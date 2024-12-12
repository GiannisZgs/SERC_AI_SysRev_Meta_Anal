# Meta-Analysis

This directory contains tools and results for performing the meta-analysis. We utilized the 1.5 version of the _Meta-Essentials_ workbooks [1], that contains necessary tools to measure diagnostic test performance and assess heterogeneity of the studies. Data extracted from the studies are grouped into low-valenced and high-valenced emotions in the categorical case, and arousal/valence in the emotional case. Diagnostic test performance is measured for the accuracy, f1-score and recall metrics, through the Odds Ratio (OR) effect size [2]. Heterogeneity of the random effects in the emotion recognition outcome was assessed used the I^2 statistic and the Cochran's Q test [3]. Specifically, the following files are contained:

- **_diagnostic_test_performance_data_extraction.xlsx_**: Contains the extracted data (performance metrics) from the used papers (Note: unfortunately some data were lost and this file lacks information from some papers).
- **_meta_essentials_sheets_**: contains the meta-essentials worksheets used to perform the meta-analysis.
- **_meta_images_emotion_**: contains the main meta-analysis results, when studies are grouped according to the annotations used, i.e. categorical or dimensional emotions. 
- **_meta_images_features_**: contains the feature extraction subgrouping results, when studies inside the categorical/dimensional groups are subgrouped according to the feature extraction method used, i.e. deep features, hand-crafted features, signal processing transformations (i.e. MFCCs, spectrograms etc.). 
- **_meta_images_conversation_style_**: contains the conversation style subgrouping results, when studies inside the categorical/dimensional groups are subgrouped according to the conversation style of the corresponding dataset used, i.e. acted conversation or natural/naturalistic conversation. 
- **_meta_images_modality_**: contains the modality subgrouping results, when studies inside the categorical/dimensional groups are subgrouped according to the modality used, i.e. unimodal or multimodal speech.  

The images contained in the directories make up Figures 6-12 in the paper. 

Example figure - Accuracy within the Categorical group:
![Cat_acc](https://github.com/user-attachments/assets/a5d1fe77-020d-483d-9ff9-123981508d38)

# References
[1]: Robert Suurmond, Henk van Rhee, and Tony Hak. Introduction, compari
son, and validation of meta-essentials: a free and simple tool for meta-analysis.
Research synthesis methods, 8(4):537–553, 2017
[2]: J Martin Bland and Douglas G Altman. The odds ratio. Bmj, 320(7247):1468,
 2000.
[3]: William G Cochran. The comparison of percentages in matched samples.
 Biometrika, 37(3/4):256–266, 1950.
