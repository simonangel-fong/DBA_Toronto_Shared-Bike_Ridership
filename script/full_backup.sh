#!/bin/bash

BACKUP_DIR=$HOME/warehouse

mkdir -p $BACKUP_DIR

rman target / <<EOF
run
{
    ALLOCATE CHANNEL c1 DEVICE TYPE DISK;
    BACKUP DATABASE FORMAT '$BACKUP_DIR/full_%d_%T.bkp';
    BACKUP ARCHIVELOG ALL FORMAT '$BACKUP_DIR/arch_%d_%T_%s.bkp' DELETE INPUT;
    DELETE NOPROMPT OBSOLETE;
    RELEASE CHANNEL c1;
}
exit
EOF