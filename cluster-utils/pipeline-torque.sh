#!/bin/bash
#
# walltime : maximum wall clock time (hh:mm:ss)
#PBS -l walltime=144:00:00
#
# join stdout and stderr
#PBS -j oe
#
# spool output immediately
#PBS -k oe
#
# specify queue
#PBS -q batch
#
# nodes: number of nodes
#   ppn: number of processes per node
#PBS -l nodes=1:ppn=1
#
# specify memory
#
#PBS -l mem=80G
#
# export all my environment variables to the job
#PBS -V
#
# job name (default = name of script file)
#PBS -N msm_pipeline
#
# specify email for notifications
#PBS -M steven.albanese@choderalab.org
#
# mail settings (one or more characters)
# n: do not send mail
# a: send mail if job is aborted
# b: send mail when job begins execution
# e: send mail when job terminates
#PBS -m n
#
# filename for standard output (default = <job_name>.o<job_id>)
# at end of job, it is in directory from which qsub was executed
# remove extra ## from the line below if you want to name your own file
#PBS -o msm_pipeline

# Change to working directory used for job submission
cd $PBS_O_WORKDIR
source activate py27

# Launch job.
python pipeline.py '/cbio//cbio/jclab/home/albaness/trajectories/10493'
