#!/usr/bin/env cwl-runner

arguments:
- run
- diversity
- alpha_correlation
- inputs.json
baseCommand: q2cwl
class: CommandLineTool
cwlVersion: v1.0
id: qiime2.plugins.diversity.visualizers.alpha_correlation
inputs:
  alpha_diversity:
    doc: Vector of alpha diversity values by sample.
    label: alpha_diversity
    type: File
  metadata:
    doc: The sample metadata.
    type:
    - File
    - File[]
  method:
    default: spearman
    doc: The correlation test to be applied.
    type: string
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
