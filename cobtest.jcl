//COBUCLG  JOB (001),'COBOL TEST COMPILE',                              00010000
//             CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1)                        00020000
//HELOWRLD EXEC COBUCLG                                                 00030000
//COB.SYSIN DD *                                                        00040000
  001  IDENTIFICATION DIVISION.                                         00050000
  002  PROGRAM-ID.  'HELLO'.                                            00060000
  003  ENVIRONMENT DIVISION.                                            00070000
  004  CONFIGURATION SECTION.                                           00080000
  005  SOURCE-COMPUTER.  IBM-360.                                       00090000
  006  OBJECT-COMPUTER.  IBM-360.                                       00100000
  0065 SPECIAL-NAMES.                                                   00110000
  0066     CONSOLE IS CNSL.                                             00120000
  007  DATA DIVISION.                                                   00130000
  008  WORKING-STORAGE SECTION.                                         00140000
  009  77  HELLO-CONST   PIC X(12) VALUE 'HELLO, WORLD'.                00150000
  075  PROCEDURE DIVISION.                                              00160000
  090  000-DISPLAY.                                                     00170000
  100      DISPLAY HELLO-CONST UPON CNSL.                               00180000
  110      STOP RUN.                                                    00190000
//LKED.SYSLIB DD DSNAME=SYS1.COBLIB,DISP=SHR                            00200000
//            DD DSNAME=SYS1.LINKLIB,DISP=SHR                           00210000
//GO.SYSPRINT DD SYSOUT=A                                               00220000
//                                                                      00230000