version 1.0
workflow SamtoolsMetrics {
  input {
    File bamfile 
  }
  call idxstats {
    input: 
      bamfile = bamfile
  }
  output {
    File results = idxstats.idxstats
  }
}

task idxstats {
  input {
    File bamfile
  }
  command <<<
    samtools index ~{bamfile}
    samtools idxstats ~{bamfile} > idxstats.txt
  >>>
  output {
    File idxstats = "idxstats.txt"
  }
  runtime {
    docker: 'talesofhoho/docker_test_101:v_0_1_0'
  }
}