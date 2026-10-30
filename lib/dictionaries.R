# Inactive (old) code mapped to the (new) active code with the same meaning and semantic tag
# Usage of the old code is counted as the new code
dict_linked_codes <- c(
  # Old term: Patient health questionnaire 2 (assessment scale)
  # New term: Patient Health Questionnaire-2 (assessment scale)
  "836521000000107" = "1359725005",
  # Old term: Assessment using patient health questionnaire 2 (procedure)
  # New term: Assessment using Patient Health Questionnaire-2 (procedure)
  "836531000000109" = "1359724009",
  # Old term: Patient health questionnaire 2 score (observable entity)
  # New term: Patient Health Questionnaire-2 score (observable entity)
  "836541000000100" = "1359723003",
  # Old term: Generalised anxiety disorder 2 scale (assessment scale)
  # New term: Generalized Anxiety Disorder 2 item scale (assessment scale)
  "836551000000102" = "1365853008",
  # Old term: Assessment using generalised anxiety disorder 2 scale (procedure)
  # New term: Assessment using Generalized Anxiety Disorder 2 item scale (procedure)
  "836561000000104" = "1365839008",
  # Old term: Generalised anxiety disorder 2 scale score (observable entity)
  # New term: Generalized Anxiety Disorder 2 item score (observable entity)
  "836571000000106" = "1365837005",
  # Old term: Patient Health Questionnaire-4 (assessment scale)
  # New term: Patient Health Questionnaire-4 (assessment scale)
  "1104941000000100" = "865935003",
  # Old term: Assessment using Patient Health Questionnaire-4 (procedure)
  # New term: Assessment using Patient Health Questionnaire-4 (procedure)
  "1104951000000102" = "865934004",
  # Old term: Patient Health Questionnaire-4 score (observable entity)
  # New term: Patient Health Questionnaire-4 score (observable entity)
  "1104961000000104" = "1359726006"
)

# Condition labels in figures
dict_condition_labels <- c(
  "anx" = "PROMs for anxiety disorders",
  "dep" = "PROMs for depression"
)

# Code descriptions mapped to short labels for tables and figures
dict_snomed_description <- c(
  "Generalized Anxiety Disorder 7 item score" = "GAD-7 score",
  "Generalized Anxiety Disorder 2 item score" = "GAD-2 score",
  "Generalized Anxiety Disorder 2 item scale" = "GAD-2",
  "Hospital Anxiety and Depression scale: anxiety score" = "HADS anxiety score",
  "Hospital Anxiety and Depression scale: depression score" = "HADS depression score",
  "Hospital anxiety and depression scale" = "HADS",
  "Patient Health Questionnaire Nine Item score" = "PHQ-9 score",
  "Patient health questionnaire 9" = "PHQ-9",
  "Patient Health Questionnaire-4 score" = "PHQ-4 score",
  "Patient Health Questionnaire-2 score" = "PHQ-2 score",
  "Edinburgh postnatal depression scale score" = "EPDS score",
  "Assessment using Whooley depression screen" = "Whooley depression screening",
  "Edinburgh postnatal depression scale" = "EPDS assessment",
  "Assessment using Generalized Anxiety Disorder 7 item scale declined" = "Assessment using GAD-7 declined",
  "EuroQol five dimension five level anxiety depression score" = "EQ-5D-5L anxiety depression score",
  "Post-traumatic stress disorder checklist for Diagnostic and Statistical Manual of Mental Disorders - Fifth Edition total symptom severity score" = "PTSD checklist for DSM-5 score",
  "Patient Health Questionnaire-2" = "PHQ-2",
  "Assessment using Patient Health Questionnaire-2" = "PHQ-2 assessment",
  "Patient Health Questionnaire-4" = "PHQ-4",
  "Assessment using Patient Health Questionnaire-4" = "PHQ-4 assessment",
  "Assessment using Generalized Anxiety Disorder 2 item scale" = "GAD-2 assessment"
)
