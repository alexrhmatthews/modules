#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { IVAR_CONSENSUS } from '../../../../software/ivar/consensus/main.nf' addParams([:])

workflow test_ivar_consensus {
    def ref = file("${launchDir}/tests/data/fasta/sarscov2/MN908947.3.fa", checkIfExists: true)
    def input = []
    input = [ [ id:'test'], 
                file("${launchDir}/tests/data/bam/test-sc2-artic-v3-sorted-trimmed.bam", checkIfExists: true) ]
  IVAR_CONSENSUS ( input, ref )
}
