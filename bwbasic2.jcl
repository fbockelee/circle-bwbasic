//BWBGEN JOB CLASS=C,REGION=0K
//*
//CREATE   PROC BWBPREF='BWBASIC'
//DELETE   EXEC PGM=IEFBR14
//DD1      DD DSN=&BWBPREF..SOURCE,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD2      DD DSN=&BWBPREF..INCLUDE,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD3     DD DSN=&BWBPREF..NCALIB,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD4     DD DSN=&BWBPREF..LINKLIB,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//DD5      DD DSN=&BWBPREF..JCL,DISP=(MOD,DELETE),
//       UNIT=SYSALLDA,SPACE=(TRK,(0))
//*
//ALLOC    EXEC PGM=IEFBR14
//DD1      DD DSN=&BWBPREF..SOURCE,DISP=(,CATLG),
// DCB=(RECFM=VB,LRECL=255,BLKSIZE=6233),
// SPACE=(6233,(180,180,44)),UNIT=SYSALLDA
//DD2      DD DSN=&BWBPREF..INCLUDE,DISP=(,CATLG),
// DCB=(RECFM=VB,LRECL=255,BLKSIZE=6233),
// SPACE=(6233,(26,26,44)),UNIT=SYSALLDA
//DD3      DD DSN=&BWBPREF..NCALIB,DISP=(,CATLG),
// DCB=(RECFM=U,LRECL=0,BLKSIZE=6144),
// SPACE=(6144,(130,130,44)),UNIT=SYSALLDA
//DD4      DD DSN=&BWBPREF..LINKLIB,DISP=(,CATLG),
// DCB=(RECFM=U,LRECL=0,BLKSIZE=6144),
// SPACE=(6144,(130,130,44)),UNIT=SYSALLDA
//DD5      DD DSN=&BWBPREF..JCL,DISP=(,CATLG),
// DCB=(RECFM=FB,LRECL=80,BLKSIZE=6080),
// SPACE=(6080,(130,130,44)),UNIT=SYSALLDA
//         PEND
//*
//S1 EXEC CREATE
//
