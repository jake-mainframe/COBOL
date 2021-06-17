//COBOLREC  JOB (TSO),
//             'UNLOAD',
//             CLASS=A,
//             MSGCLASS=A,
//             MSGLEVEL=(1,1),
//             USER=IBMUSER,PASSWORD=SYS1
//*                                                                     00020000
//* ***************************************************************** * 00030000
//* RELOAD MVT COBOL FROM TAPE                                        * 00040000
//* ***************************************************************** * 00050000
//*                                                                     00060000
//RELOAD  EXEC PGM=IEBCOPY,REGION=1024K                                 00070000
//SYSPRINT DD  SYSOUT=A                                                 00080000
//TAPEIN1  DD  DSN=COBOL.LOAD,UNIT=TAPE,DISP=(OLD,KEEP),                00090000
//             VOL=(PRIVATE,RETAIN,SER=000901),LABEL=(1,SL)             00100000
//TAPEIN2  DD  DSN=COBOL.LIB,UNIT=AFF=TAPEIN1,DISP=(OLD,KEEP),          00110000
//             VOL=(PRIVATE,RETAIN,SER=000901),LABEL=(2,SL)             00120000
//LIBOUT1  DD  DSN=&&COBLOAD,DISP=(NEW,PASS),                           00130000
//             UNIT=SYSDA,SPACE=(CYL,(1,1,5)),                          00140000
//             DCB=(RECFM=U,BLKSIZE=13030)                              00150000
//LIBOUT2  DD  DSN=&&COBLIB,DISP=(NEW,PASS),                            00160000
//             UNIT=SYSDA,SPACE=(CYL,(1,1,15)),                         00170000
//             DCB=(RECFM=U,BLKSIZE=13030)                              00180000
//SYSUT3   DD  UNIT=SYSDA,SPACE=(80,(60,45)),DISP=(NEW,DELETE)          00190000
//SYSIN    DD  *                                                        00200000
  COPY INDD=TAPEIN1,OUTDD=LIBOUT1                                       00210000
  COPY INDD=TAPEIN2,OUTDD=LIBOUT2                                       00220000
/*                                                                      00230000
//*                                                                     00240000
//PROCS   EXEC PGM=IEBUPDTE,REGION=1024K,PARM=NEW                       00250000
//SYSPRINT DD  SYSOUT=A                                                 00260000
//SYSUT2   DD  DSN=SYS2.PROCLIB,DISP=SHR         <== TARGET             00270000
//SYSIN    DD  DSN=COBOL.PROCS,UNIT=TAPE,DISP=(OLD,KEEP),               00280000
//             VOL=(PRIVATE,RETAIN,SER=000901),LABEL=(3,SL)             00290000
//*                                                                     00300000
//LINK001 EXEC PGM=IEWL,REGION=512K,                                    00310000
//             PARM='LET,LIST,XREF,NCAL,DC'                             00320000
//SYSPRINT DD  SYSOUT=A                                                 00330000
//SYSUT1   DD  SPACE=(CYL,(5,1)),UNIT=SYSDA                             00340000
//SYSLMOD  DD  DSN=SYS2.LINKLIB,DISP=OLD         <== TARGET             00350000
//INLIB    DD  DSN=&&COBLOAD,DISP=(OLD,PASS)                            00360000
//SYSLIN   DD  *                                                        00370000
               ENTRY     START                                          00380000
     INCLUDE   INLIB(IKFCBL00)                                          00390000
 NAME     IKFCBL00(R)                                                   00400000
               ENTRY     PH1B                                           00410000
     INCLUDE   INLIB(IKFCBL1B)                                          00420000
 NAME     IKFCBL1B(R)                                                   00430000
               ENTRY     PH1A                                           00440000
     INCLUDE   INLIB(IKFCBL10)                                          00450000
 NAME     IKFCBL10(R)                                                   00460000
               ENTRY     PH2                                            00470000
     INCLUDE   INLIB(IKFCBL20)                                          00480000
 NAME     IKFCBL20(R)                                                   00490000
               ENTRY     PH3                                            00500000
     INCLUDE   INLIB(IKFCBL30)                                          00510000
 NAME     IKFCBL30(R)                                                   00520000
               ENTRY     PH4                                            00530000
     INCLUDE   INLIB(IKFCBL40)                                          00540000
 NAME     IKFCBL40(R)                                                   00550000
               ENTRY     PHASE50                                        00560000
     INCLUDE   INLIB(IKFCBL50)                                          00570000
 NAME     IKFCBL50(R)                                                   00580000
               ENTRY     PH51                                           00590000
     INCLUDE   INLIB(IKFCBL51)                                          00600000
 NAME     IKFCBL51(R)                                                   00610000
               ENTRY     IKF6A01                                        00620000
     INCLUDE   INLIB(IKFCBL6A)                                          00630000
 NAME     IKFCBL6A(R)                                                   00640000
               ENTRY     PHASE6                                         00650000
     INCLUDE   INLIB(IKFCBL60)                                          00660000
 NAME     IKFCBL60(R)                                                   00670000
               ENTRY     IEQCOB70                                       00680000
     INCLUDE   INLIB(IKFCBL70)                                          00690000
 NAME     IKFCBL70(R)                                                   00700000
/*                                                                      00710000
//*                                                                     00720000
//LINK002 EXEC PGM=IEWL,REGION=512K,                                    00730000
//             PARM='LET,LIST,XREF,NCAL'                                00740000
//SYSPRINT DD  SYSOUT=A                                                 00750000
//SYSUT1   DD  SPACE=(CYL,(5,1)),UNIT=SYSDA                             00760000
//SYSLMOD  DD  DSN=SYS2.LINKLIB,DISP=OLD         <== TARGET             00770000
//INLIB    DD  DSN=&&COBLOAD,DISP=(OLD,PASS)                            00780000
//SYSLIN   DD  *                                                        00790000
               ENTRY     IKFCBL01                                       00800000
     INCLUDE   INLIB(IKFCBL01)                                          00810000
 NAME     IKFCBL01(R)                                                   00820000
/*                                                                      00830000
//*                                                                     00840000
//LINK003 EXEC PGM=IEWL,REGION=512K,                                    00850000
//             PARM='LET,LIST,XREF,NCAL,DC'                             00860000
//SYSPRINT DD  SYSOUT=A                                                 00870000
//SYSUT1   DD  SPACE=(CYL,(5,1)),UNIT=SYSDA                             00880000
//SYSLMOD  DD  DSN=SYS1.COBLIB,DISP=(,CATLG),    <== TARGET             00890000
//             UNIT=3350,VOL=SER=MVSRES,                                00900000
//             SPACE=(TRK,(60,,15),RLSE),                               00910000
//             DCB=(SYS1.LINKLIB)                                       00920000
//INLIB    DD  DSN=&&COBLIB,DISP=(OLD,PASS)                             00930000
//SYSLIN   DD  *                                                        00940000
               ENTRY     ILBOACP0                                       00950000
     INCLUDE   INLIB(ILBOACP0)                                          00960000
 NAME     ILBOACP0(R)                                                   00970000
               ENTRY     ILBOANE0                                       00980000
     INCLUDE   INLIB(ILBOANE0)                                          00990000
 NAME     ILBOANE0(R)                                                   01000000
               ENTRY     ILBOANF0                                       01010000
     INCLUDE   INLIB(ILBOANF0)                                          01020000
 NAME     ILBOANF0(R)                                                   01030000
               ENTRY     ILBOATB0                                       01040000
     INCLUDE   INLIB(ILBOATB0)                                          01050000
 NAME     ILBOATB0(R)                                                   01060000
               ENTRY     ILBOBID0                                       01070000
          ALIAS     ILBOBID2                                            01080000
          ALIAS     ILBOBID1                                            01090000
     INCLUDE   INLIB(ILBOBID0)                                          01100000
 NAME     ILBOBID0(R)                                                   01110000
               ENTRY     ILBOBIE0                                       01120000
          ALIAS     ILBOBIE2                                            01130000
          ALIAS     ILBOBIE1                                            01140000
     INCLUDE   INLIB(ILBOBIE0)                                          01150000
 NAME     ILBOBIE0(R)                                                   01160000
               ENTRY     ILBOBII0                                       01170000
          ALIAS     ILBOBII2                                            01180000
          ALIAS     ILBOBII1                                            01190000
     INCLUDE   INLIB(ILBOBII0)                                          01200000
 NAME     ILBOBII0(R)                                                   01210000
               ENTRY     ILBOCKP0                                       01220000
     INCLUDE   INLIB(ILBOCKP0)                                          01230000
 NAME     ILBOCKP0(R)                                                   01240000
               ENTRY     ILBOCLS0                                       01250000
     INCLUDE   INLIB(ILBOCLS0)                                          01260000
 NAME     ILBOCLS0(R)                                                   01270000
               ENTRY     ILBODCI0                                       01280000
          ALIAS     ILBODCI1                                            01290000
     INCLUDE   INLIB(ILBODCI0)                                          01300000
 NAME     ILBODCI0(R)                                                   01310000
               ENTRY     ILBODSP0                                       01320000
     INCLUDE   INLIB(ILBODSP0)                                          01330000
 NAME     ILBODSP0(R)                                                   01340000
               ENTRY     ILBODTE0                                       01350000
          ALIAS     ILBODTE1                                            01360000
     INCLUDE   INLIB(ILBODTE0)                                          01370000
 NAME     ILBODTE0(R)                                                   01380000
               ENTRY     ILBOEFL0                                       01390000
          ALIAS     ILBOEFL2                                            01400000
          ALIAS     ILBOEFL1                                            01410000
     INCLUDE   INLIB(ILBOEFL0)                                          01420000
 NAME     ILBOEFL0(R)                                                   01430000
               ENTRY     ILBOERR0                                       01440000
          ALIAS     ILBOERR6                                            01450000
          ALIAS     ILBOERR5                                            01460000
          ALIAS     ILBOERR4                                            01470000
          ALIAS     ILBOERR3                                            01480000
          ALIAS     ILBOERR2                                            01490000
          ALIAS     ILBOERR1                                            01500000
     INCLUDE   INLIB(ILBOERR0)                                          01510000
 NAME     ILBOERR0(R)                                                   01520000
               ENTRY     ILBOETB0                                       01530000
     INCLUDE   INLIB(ILBOETB0)                                          01540000
 NAME     ILBOETB0(R)                                                   01550000
               ENTRY     ILBOFPW0                                       01560000
     INCLUDE   INLIB(ILBOFPW0)                                          01570000
 NAME     ILBOFPW0(R)                                                   01580000
               ENTRY     ILBOGPW0                                       01590000
     INCLUDE   INLIB(ILBOGPW0)                                          01600000
 NAME     ILBOGPW0(R)                                                   01610000
               ENTRY     ILBOIDB0                                       01620000
          ALIAS     ILBOIDB1                                            01630000
     INCLUDE   INLIB(ILBOIDB0)                                          01640000
 NAME     ILBOIDB0(R)                                                   01650000
               ENTRY     ILBOIDR0                                       01660000
     INCLUDE   INLIB(ILBOIDR0)                                          01670000
 NAME     ILBOIDR0(R)                                                   01680000
               ENTRY     ILBOIDT0                                       01690000
     INCLUDE   INLIB(ILBOIDT0)                                          01700000
 NAME     ILBOIDT0(R)                                                   01710000
               ENTRY     ILBOIFB0                                       01720000
          ALIAS     ILBOIFB2                                            01730000
          ALIAS     ILBOIFB1                                            01740000
     INCLUDE   INLIB(ILBOIFB0)                                          01750000
 NAME     ILBOIFB0(R)                                                   01760000
               ENTRY     ILBOIFD0                                       01770000
          ALIAS     ILBOIFD1                                            01780000
     INCLUDE   INLIB(ILBOIFD0)                                          01790000
 NAME     ILBOIFD0(R)                                                   01800000
               ENTRY     ILBOITB0                                       01810000
     INCLUDE   INLIB(ILBOITB0)                                          01820000
 NAME     ILBOITB0(R)                                                   01830000
               ENTRY     ILBOIVL0                                       01840000
     INCLUDE   INLIB(ILBOIVL0)                                          01850000
 NAME     ILBOIVL0(R)                                                   01860000
               ENTRY     ILBOMVL0                                       01870000
     INCLUDE   INLIB(ILBOMVL0)                                          01880000
 NAME     ILBOMVL0(R)                                                   01890000
               ENTRY     ILBOPTV0                                       01900000
          ALIAS     ILBOPTV2                                            01910000
          ALIAS     ILBOPTV1                                            01920000
     INCLUDE   INLIB(ILBOPTV0)                                          01930000
 NAME     ILBOPTV0(R)                                                   01940000
               ENTRY     ILBOSAMR                                       01950000
     INCLUDE   INLIB(ILBOSAMR)                                          01960000
 NAME     ILBOSAMR(R)                                                   01970000
               ENTRY     ILBOSAM0                                       01980000
     INCLUDE   INLIB(ILBOSAM0)                                          01990000
 NAME     ILBOSAM0(R)                                                   02000000
               ENTRY     ILBOSCH0                                       02010000
     INCLUDE   INLIB(ILBOSCH0)                                          02020000
 NAME     ILBOSCH0(R)                                                   02030000
               ENTRY     ILBOSGM0                                       02040000
          ALIAS     ILBOSGM2                                            02050000
          ALIAS     ILBOSGM1                                            02060000
     INCLUDE   INLIB(ILBOSGM0)                                          02070000
 NAME     ILBOSGM0(R)                                                   02080000
               ENTRY     ILBOSPA0                                       02090000
     INCLUDE   INLIB(ILBOSPA0)                                          02100000
 NAME     ILBOSPA0(R)                                                   02110000
               ENTRY     ILBOSRT0                                       02120000
     INCLUDE   INLIB(ILBOSRT0)                                          02130000
 NAME     ILBOSRT0(R)                                                   02140000
               ENTRY     ILBOSTI0                                       02150000
     INCLUDE   INLIB(ILBOSTI0)                                          02160000
 NAME     ILBOSTI0(R)                                                   02170000
               ENTRY     ILBOSTP0                                       02180000
          ALIAS     ILBOSTP1                                            02190000
     INCLUDE   INLIB(ILBOSTP0)                                          02200000
 NAME     ILBOSTP0(R)                                                   02210000
               ENTRY     ILBOTEF0                                       02220000
          ALIAS     ILBOTEF3                                            02230000
          ALIAS     ILBOTEF2                                            02240000
          ALIAS     ILBOTEF1                                            02250000
     INCLUDE   INLIB(ILBOTEF0)                                          02260000
 NAME     ILBOTEF0(R)                                                   02270000
               ENTRY     ILBOTRN0                                       02280000
     INCLUDE   INLIB(ILBOTRN0)                                          02290000
 NAME     ILBOTRN0(R)                                                   02300000
               ENTRY     ILBOUTB0                                       02310000
     INCLUDE   INLIB(ILBOUTB0)                                          02320000
 NAME     ILBOUTB0(R)                                                   02330000
               ENTRY     ILBOVCO0                                       02340000
     INCLUDE   INLIB(ILBOVCO0)                                          02350000
 NAME     ILBOVCO0(R)                                                   02360000
               ENTRY     ILBOVMO0                                       02370000
          ALIAS     ILBOVMO1                                            02380000
     INCLUDE   INLIB(ILBOVMO0)                                          02390000
 NAME     ILBOVMO0(R)                                                   02400000
               ENTRY     ILBOVTR0                                       02410000
     INCLUDE   INLIB(ILBOVTR0)                                          02420000
 NAME     ILBOVTR0(R)                                                   02430000
               ENTRY     ILBOWTB0                                       02440000
     INCLUDE   INLIB(ILBOWTB0)                                          02450000
 NAME     ILBOWTB0(R)                                                   02460000
               ENTRY     ILBOXDI0                                       02470000
     INCLUDE   INLIB(ILBOXDI0)                                          02480000
 NAME     ILBOXDI0(R)                                                   02490000
               ENTRY     ILBOXMU0                                       02500000
     INCLUDE   INLIB(ILBOXMU0)                                          02510000
 NAME     ILBOXMU0(R)                                                   02520000
               ENTRY     ILBOXPR0                                       02530000
     INCLUDE   INLIB(ILBOXPR0)                                          02540000
 NAME     ILBOXPR0(R)                                                   02550000
/*                                                                      02560000
//*                                                                     02570000
//                                                                      02580000