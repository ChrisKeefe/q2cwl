#!/usr/bin/env cwl-runner

arguments:
- run
- sample_classifier
- classify_samples
- inputs.json
baseCommand: q2cwl
class: CommandLineTool
cwlVersion: v1.0
id: qiime2.plugins.sample_classifier.visualizers.classify_samples
inputs:
  cv:
    default: 5
    doc: Number of k-fold cross-validations to perform.
    type: long
  estimator:
    default: RandomForestClassifier
    doc: Estimator method to use for sample prediction.
    type: string
  metadata:
    doc: Categorical metadata column to use as prediction target.
    type: File
  metadata_column:
    doc: Column name to use from 'metadata'
    type: string
  missing_samples:
    default: error
    doc: How to handle missing samples in metadata. "error" will fail if missing samples
      are detected. "ignore" will cause the feature table and metadata to be filtered,
      so that only samples found in both files are retained.
    type: string
  n_estimators:
    default: 100
    doc: Number of trees to grow for estimation. More trees will improve predictive
      accuracy up to a threshold level, but will also increase time and memory requirements.
      This parameter only affects ensemble estimators, such as Random Forest, AdaBoost,
      ExtraTrees, and GradientBoosting.
    type: long
  n_jobs:
    default: 1
    doc: Number of jobs to run in parallel.
    type: long
  optimize_feature_selection:
    default: false
    doc: Automatically optimize input feature selection using recursive feature elimination.
    type: boolean
  palette:
    default: sirocco
    doc: The color palette to use for plotting.
    type: string
  parameter_tuning:
    default: false
    doc: Automatically tune hyperparameters using random grid search.
    type: boolean
  random_state:
    default: null
    doc: Seed used by random number generator.
    type: long?
  step:
    default: 0.05
    doc: If optimize_feature_selection is True, step is the percentage of features
      to remove at each iteration.
    type: double
  table:
    doc: Feature table containing all features that should be used for target prediction.
    label: table
    type: File
  test_size:
    default: 0.2
    doc: Fraction of input samples to exclude from training set and use for classifier
      testing.
    type: double
outputs:
  visualization:
    doc: null
    label: visualization
    outputBinding:
      glob: visualization.qzv
    type: File
requirements:
  EnvVarRequirement:
    envDef:
      LC_ALL: en_US.utf8
      MPLBACKEND: Agg
  InitialWorkDirRequirement:
    listing:
    - entry: '{"_": $(inputs)}'
      entryname: inputs.json
