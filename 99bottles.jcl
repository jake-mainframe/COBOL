//COBUCLG  JOB (001),'99 BOTTLES OF BEER',
//             CLASS=A,MSGCLASS=X,MSGLEVEL=(1,1)
//         EXEC COBUCLG
//COB.SYSIN DD *
000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID.    BOTTLE99.
000300 AUTHOR.        BILL BASS.
000400*               MODIFIED BY JAY MOSELEY (08/2008) FOR MVT COBOL.
000500 DATE-WRITTEN.  APR 2008.
000600 DATE-COMPILED.
000700*REMARKS.
000800******************************************************************
000900* PURPOSE:
001000*   THIS IS A DEMONSTRATION SAMPLE OF A COBOL PROGRAM.
001100*   IT WRITES AN 80 COLUMN OUTPUT FILE CONTAINING THE LYRICS OF
001200*   THE SONG "99 BOTTLES OF BEER ON THE WALL".  IT DOES NOT NEED
001300*   TO BE AS COMPLEX AS IT IS.  THIS WAS NOT AN ATTEMPT TO WRITE
001400*   A "SHORT" PROGRAM OR A "MOST EFFICIENT" PROGRAM.  IT WAS
001500*   INTENDED TO SERVE AS AN EXAMPLE OF WHAT ONE MIGHT COMMONLY
001600*   SEE IN A "TYPICAL" MAINFRAME COBOL PROGRAM.
001700******************************************************************
001800 ENVIRONMENT DIVISION.
001900******************************************************************
002000 INPUT-OUTPUT SECTION.
002100 FILE-CONTROL.
002200     SELECT LYRICS-FILE              ASSIGN TO UT-S-LYRICS.
002300******************************************************************
002400 DATA DIVISION.
002500******************************************************************
002600 FILE SECTION.
002700 FD  LYRICS-FILE
002800     LABEL RECORDS ARE STANDARD
002900     RECORDING MODE IS F
003000     BLOCK CONTAINS    0 RECORDS
003100     DATA RECORD IS LYRICS-REC.
003200
003300 01  LYRICS-REC                      PIC X(80).
003400*
003500 WORKING-STORAGE SECTION.
003600 01  WORK-AREAS.
003700     05 WS-LYRICS-WRITTEN            PIC S9(7) COMP-3 VALUE ZERO.
003800     05 WS-BOTTLE-NUM                PIC S9(4) COMP VALUE ZERO.
003900     05 WS-CURR-DATE                 PIC X(8).
004000     05 FILLER                       REDEFINES WS-CURR-DATE.
004100        10 WS-CURR-MON               PIC 9(2).
004200        10 FILLER                    PIC X(1).
004300        10 WS-CURR-DAY               PIC 9(2).
004400        10 FILLER                    PIC X(1).
004500        10 WS-CURR-YEAR              PIC 9(2).
004600     05 WS-CURR-TIME                 PIC X(6).
004700     05 FILLER                       REDEFINES WS-CURR-TIME.
004800        10 WS-CURR-HOUR              PIC 9(2).
004900        10 WS-CURR-MIN               PIC 9(2).
005000        10 WS-CURR-SEC               PIC 9(2).
005100     05 WS-DISPLAY-NUM               PIC --,---,--9 VALUE ZERO.
005200*
005300 01  BEER-2-DIGIT.
005400     05 B2D-BOTTLES-1                PIC 99         VALUE ZERO.
005500     05 FILLER                       PIC X(30)      VALUE
005600        ' BOTTLES OF BEER ON THE WALL, '.
005700     05 B2D-BOTTLES-2                PIC 99         VALUE ZERO.
005800     05 FILLER                       PIC X(46)      VALUE
005900        ' BOTTLES OF BEER.'.
006000*
006100 01  BEER-1-DIGIT.
006200     05 B1D-BOTTLES-1                PIC 9          VALUE ZERO.
006300     05 FILLER                       PIC X(30)      VALUE
006400        ' BOTTLES OF BEER ON THE WALL, '.
006500     05 B1D-BOTTLES-2                PIC 9          VALUE ZERO.
006600     05 FILLER                       PIC X(48)      VALUE
006700        ' BOTTLES OF BEER.'.
006800*
006900 01  BEER-1-MORE.
007000     05 FILLER                       PIC X(30)      VALUE
007100        '1 BOTTLE OF BEER ON THE WALL, '.
007200     05 FILLER                       PIC X(50)      VALUE
007300        '1 BOTTLE OF BEER.'.
007400*
007500 01  BEER-NO-MORE.
007600     05 FILLER                       PIC X(37)      VALUE
007700        'NO MORE BOTTLES OF BEER ON THE WALL, '.
007800     05 FILLER                       PIC X(43)      VALUE
007900        'NO MORE BOTTLES OF BEER.'.
008000*
008100 01  TAKE-2-DIGIT.
008200     05 FILLER                       PIC X(34)      VALUE
008300        'TAKE ONE DOWN AND PASS IT AROUND, '.
008400     05 T2D-BOTTLES-1                PIC 99         VALUE ZERO.
008500     05 FILLER                       PIC X(44)      VALUE
008600        ' BOTTLES OF BEER ON THE WALL.'.
008700*
008800 01  TAKE-1-DIGIT.
008900     05 FILLER                       PIC X(34)      VALUE
009000        'TAKE ONE DOWN AND PASS IT AROUND, '.
009100     05 T1D-BOTTLES-1                PIC 9          VALUE ZERO.
009200     05 FILLER                       PIC X(45)      VALUE
009300        ' BOTTLES OF BEER ON THE WALL.'.
009400*
009500 01  TAKE-1-MORE.
009600     05 FILLER                       PIC X(34)      VALUE
009700        'TAKE ONE DOWN AND PASS IT AROUND, '.
009800     05 FILLER                       PIC X(46)      VALUE
009900        '1 BOTTLE OF BEER ON THE WALL.'.
010000*
010100 01  TAKE-NO-MORE.
010200     05 FILLER                       PIC X(34)      VALUE
010300        'TAKE ONE DOWN AND PASS IT AROUND, '.
010400     05 FILLER                       PIC X(46)      VALUE
010500        'NO MORE BOTTLES OF BEER ON THE WALL.'.
010600*
010700 01  BUY-SOME-MORE.
010800     05 FILLER                       PIC X(35)      VALUE
010900        'GO TO THE STORE AND BUY SOME MORE, '.
011000     05 FILLER                       PIC X(45)      VALUE
011100        '99 BOTTLES OF BEER ON THE WALL.'.
011200*
011300 01  BLANK-LINE                      PIC X(80)      VALUE SPACES.
011400******************************************************************
011500 PROCEDURE DIVISION.
011600******************************************************************
011700     MOVE CURRENT-DATE TO WS-CURR-DATE.
011800     MOVE TIME-OF-DAY TO WS-CURR-TIME.
011900*
012000     DISPLAY '****************************************'
012100             '****************************************'.
012200     DISPLAY '**** BEGIN PROGRAM BOTTLE99'.
012300     DISPLAY '**** START AT: '
012400             WS-CURR-YEAR '/' WS-CURR-MON '/' WS-CURR-DAY ' '
012500             WS-CURR-HOUR ':' WS-CURR-MIN ':'
012600             WS-CURR-SEC.
012700     DISPLAY '****************************************'
012800             '****************************************'.
012900     DISPLAY '*'.
013000*
013100     OPEN OUTPUT LYRICS-FILE.
013200*
013300     MOVE 99                         TO B2D-BOTTLES-1.
013400     MOVE 99                         TO B2D-BOTTLES-2.
013500     WRITE LYRICS-REC              FROM BEER-2-DIGIT.
013600     ADD +1                          TO WS-LYRICS-WRITTEN.
013700*
013800     PERFORM 1000-MATCHING-VERSES    THRU 1000-EXIT
013900         VARYING WS-BOTTLE-NUM FROM 98 BY -1
014000         UNTIL WS-BOTTLE-NUM < 2.
014100*
014200     WRITE LYRICS-REC              FROM TAKE-1-MORE.
014300     WRITE LYRICS-REC              FROM BLANK-LINE.
014400     ADD +2                          TO WS-LYRICS-WRITTEN.
014500*
014600     WRITE LYRICS-REC              FROM BEER-1-MORE.
014700     WRITE LYRICS-REC              FROM TAKE-NO-MORE.
014800     WRITE LYRICS-REC              FROM BLANK-LINE.
014900     ADD +3                          TO WS-LYRICS-WRITTEN.
015000*
015100     WRITE LYRICS-REC              FROM BEER-NO-MORE.
015200     WRITE LYRICS-REC              FROM BUY-SOME-MORE.
015300     ADD +2                          TO WS-LYRICS-WRITTEN.
015400*
015500     CLOSE LYRICS-FILE.
015600*
015700     DISPLAY '****************************************'
015800             '****************************************'.
015900     DISPLAY '**** RUN STATISTICS FOR PROGRAM BOTTLE99'.
016000     DISPLAY '****************************************'
016100             '****************************************'.
016200     DISPLAY '*'.
016300     MOVE WS-LYRICS-WRITTEN          TO WS-DISPLAY-NUM.
016400     DISPLAY '* LYRICS RECORDS WRITTEN = ' WS-DISPLAY-NUM.
016500     DISPLAY '*'.
016600*
016700     DISPLAY '****************************************'
016800             '****************************************'.
016900     DISPLAY '**** END PROGRAM BOTTLE99'.
017000     MOVE CURRENT-DATE TO WS-CURR-DATE.
017100     MOVE TIME-OF-DAY TO WS-CURR-TIME.
017200     DISPLAY '**** ENDED AT: '
017300             WS-CURR-YEAR '/' WS-CURR-MON '/' WS-CURR-DAY ' '
017400             WS-CURR-HOUR ':' WS-CURR-MIN ':'
017500             WS-CURR-SEC.
017600     DISPLAY '****************************************'
017700             '****************************************'.
017800*
017900     GOBACK.
018000*****************************************************************
018100*    THIS PARAGRAPH WRITES THE FIRST 98 MATCHING VERSES
018200*****************************************************************
018300 1000-MATCHING-VERSES.
018400*****************************************************************
018500     IF WS-BOTTLE-NUM > 9
018600         MOVE WS-BOTTLE-NUM          TO T2D-BOTTLES-1
018700         MOVE WS-BOTTLE-NUM          TO B2D-BOTTLES-1
018800         MOVE WS-BOTTLE-NUM          TO B2D-BOTTLES-2
018900
019000         WRITE LYRICS-REC          FROM TAKE-2-DIGIT
019100         WRITE LYRICS-REC          FROM BLANK-LINE
019200         WRITE LYRICS-REC          FROM BEER-2-DIGIT
019300         ADD +3                      TO WS-LYRICS-WRITTEN
019400     ELSE
019500         MOVE WS-BOTTLE-NUM          TO T1D-BOTTLES-1
019600         MOVE WS-BOTTLE-NUM          TO B1D-BOTTLES-1
019700         MOVE WS-BOTTLE-NUM          TO B1D-BOTTLES-2
019800         WRITE LYRICS-REC          FROM TAKE-1-DIGIT
019900         WRITE LYRICS-REC          FROM BLANK-LINE
020000         WRITE LYRICS-REC          FROM BEER-1-DIGIT
020100         ADD +3                      TO WS-LYRICS-WRITTEN.
020300 1000-EXIT. EXIT.
//COB.SYSLIB DD DSN=SYS1.COBLIB,DISP=SHR
//COB.SYSPUNCH DD DUMMY
//LKED.SYSLIB DD DSNAME=SYS1.COBLIB,DISP=SHR
//GO.LYRICS DD SYSOUT=*
//GO.SYSOUT DD SYSOUT=*
//
