# subGaussianjob
PBS job system to submit gaussian job
to use sub.sh:
## For single job: 
$vi sub.sh
### change the -N jobname and -q master, etc..
### change JOBNAME=your_job_name
### make sure you have your gaussian path sourced in ~/.bashrc
$:wq
$qsub sub.sh

## For batch jobs:

$mkdir jobfolder
$cd jobfolder
### paste all your .com file into jobfolder
### paster sub_batch.sh into jobfolder
$qsub sub_batch.sh
