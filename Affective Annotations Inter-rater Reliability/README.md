# Affective Annotations Inter-Rater Reliability

This directory contains data and files for implementing the inter-rater reliability analysis. The IEMOCAP [1] and K-EmoCon [2] are used, to calculate the Cronbach's alpha statistic [3] between pairs of raters in both datasets, for each reported emotion. Specifically, the below files are contained: 

- **_IEMOCAP_arousal.fig_**: the matlab figure for producing IEMOCAP arousal results.
- **_IEMOCAP_valence.fig_**: the matlab figure for producing IEMOCAP valence results.
- **_cronbach.m_**: matlab file that contains a function to calculate cronbach's alpha.
- **_cronbachs_a_**: matlab file that calculates the cronbach's alpha for all examined scenarios in the K-EmoCon dataset.
- **_kemocon_data_struct_**: annotations from the K-EmoCon dataset [2] used to produce the results.
- **_cronbach_figures_**: the resulting figures.

# References:
[1]: Carlos Busso, Murtaza Bulut, Chi-Chun Lee, Abe Kazemzadeh, Emily Mower,
 Samuel Kim, Jeannette N. Chang, Sungbok Lee, and Shrikanth S. Narayanan.
 Iemocap: interactive emotional dyadic motion capture database. Language
 Resources and Evaluation 2008 42:4, 42:335–359, 11 2008.

[2]: Cheul Young Park, Narae Cha, Soowon Kang, Auk Kim, Ahsan Habib Khan
doker, Leontios Hadjileontiadis, Alice Oh, Yong Jeong, and Uichin Lee. K
emocon, a multimodal sensor dataset for continuous emotion recognition in
 naturalistic conversations. Scientific Data, 7(1):293, 2020. 
 
[3]: Lee J Cronbach. Coefficient alpha and the internal structure of tests. Psychome
trika, 16(3):297–334, 1951.
