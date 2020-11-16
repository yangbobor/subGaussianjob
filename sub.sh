#!/bin/bash
#PBS -j oe
#PBS -l nodes=1:ppn=4
#PBS -q master
#PBS -e err.log
#PBS -o job.log
#PBS -N master

###User s Input File and Output File
JOBNAME=Cel_Cs4
INPUTNAME=$JOBNAME.gjf
CHKNAME=$JOBNAME.chk
OUTPUTNAME=$JOBNAME.log
INPUTDIR=$PBS_O_WORKDIR

echo "$JOB_RUN_DIR"
###Copy file to local filesystem /tmp
JOB_RUN_DIR=/home/$USER/tmp/$PBS_JOBID
mkdir -p $JOB_RUN_DIR
if [ -f $CHKNAME ]; then
  /bin/cp $INPUTDIR/$CHKNAME $JOB_RUN_DIR/
fi
if [ -f $OUTPUTNAME ]; then
  /bin/cp $INPUTDIR/$OUTPUTNAME $JOB_RUN_DIR/
fi

/bin/cp  $INPUTDIR/$INPUTNAME $JOB_RUN_DIR/

cd $JOB_RUN_DIR

# Run G16 Job
g16 <$INPUTNAME >>$OUTPUTNAME

## Copy file from local /tmp to NFS filesystem /home
/bin/rm $JOB_RUN_DIR/Gau-*.rwf
cp -rf $JOB_RUN_DIR $INPUTDIR/
rm -rf $JOB_RUN_DIR/
