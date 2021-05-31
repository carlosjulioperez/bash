#!/bin/sh
# 2018-10-20 carper

DIR=/home/cromero/dbbackup/2018
DATE=`date +%d-%m-%Y`
[ ! $DIR ] && mkdir -p $DIR || :

/usr/bin/pg_dump -U postgres apracomsa   | bzip2 -c > $DIR/$DATE.apracomsa.sql.bz2
cp -p $DIR/$DATE.apracomsa.sql.bz2 /mnt/2018

/usr/bin/pg_dump -U postgres atver     | bzip2 -c > $DIR/$DATE.atver.sql.bz2
cp -p $DIR/$DATE.atver.sql.bz2 /mnt/2018

/usr/bin/pg_dump -U postgres avisusa     | bzip2 -c > $DIR/$DATE.avisusa.sql.bz2
cp -p $DIR/$DATE.avisusa.sql.bz2 /mnt/2018

/usr/bin/pg_dump -U postgres biolitsa     | bzip2 -c > $DIR/$DATE.biolitsa.sql.bz2
cp -p $DIR/$DATE.biolitsa.sql.bz2 /mnt/2018

/usr/bin/pg_dump -U postgres blutec      | bzip2 -c > $DIR/$DATE.blutec.sql.bz2
cp -p $DIR/$DATE.blutec.sql.bz2 /mnt/2018

/usr/bin/pg_dump -U postgres busicentury | bzip2 -c > $DIR/$DATE.busicentury.sql.bz2
cp -p $DIR/$DATE.busicentury.sql.bz2 /mnt/2018

/usr/bin/pg_dump -U postgres catver      | bzip2 -c > $DIR/$DATE.catver.sql.bz2
cp -p $DIR/$DATE.catver.sql.bz2 /mnt/2018

/usr/bin/pg_dump -U postgres gambalit | bzip2 -c > $DIR/$DATE.gambalit.sql.bz2
cp -p $DIR/$DATE.gambalit.sql.bz2 /mnt/2018

/usr/bin/pg_dump -U postgres peru326 | bzip2 -c > $DIR/$DATE.peru326.sql.bz2
cp -p $DIR/$DATE.peru326.sql.bz2 /mnt/2018

/usr/bin/pg_dump -U postgres tradetecsa  | bzip2 -c > $DIR/$DATE.tradetecsa.sql.bz2
cp -p $DIR/$DATE.tradetecsa.sql.bz2 /mnt/2018

#/usr/bin/mutt -s 'Apracom 2015 Database backup' -a $DIR/$DATE.apracomsa.sql.bz2   -- sql.ledger.backups@gmail.com < /dev/null
#/usr/bin/mutt -s 'Database backup' -a $DIR/$DATE.tradetecsa.sql.bz2 -- sql_backups@fieso.com < /home/cromero/backup.msg.txt
