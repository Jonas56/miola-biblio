
10 '-----------------------------------
20 'ENSIAS
30 '
40 'TP COMMUNICATION ENTRE DEUX PCs
50 'programme basic pour la räception et le stockage d'un fichier sur pc.
60 'le fichier est Çmis par un ordinateur Ö une vitesse de 1200 bit/s,en serie
70 'asynchrone sans bit de paritä,un bit de STOP et avec un code de longueur 8.
80 '
90 '---------------------------------------
100 GOSUB 200: 'demande le nom du fichier
110 GOSUB 300: 'ouvre le fichier
120 GOSUB 400: 'ouvre la transmission
130 GOSUB 500: 'debute par un message
140 GOSUB 600: 'capture
142 GOSUB 800:
145 GOSUB 900:
150 GOSUB 1000: 'ferme les fichiers
160 GOSUB 1100: 'message de fin
165 INPUT m$
170 STOP
200 '-----------------------------------------
210 '       demande le nom du fichier
220 '
230 INPUT "entrer le nom du fichier a capturer:", F$
240 RETURN
300 '----------------------------------------------
310 '      ouvre la transmission
320 '
330 OPEN F$ FOR OUTPUT AS 2
340 RETURN
400 '-----------------------------------------
410 '       ouvre la transmission
420 '
430 OPEN "COM1:1200,N,8,1" FOR RANDOM AS 1 LEN = 1024
440 RETURN
500 '-------------------------------------------------
510 '           debute le message
520 '
530 PRINT
540 PRINT "VOUS POUVEZ A PRESENT DEMANDER A L'AUTRE APPAREIL D'EMETTRE "; F$
550 PRINT " APPUYEZ SUR ESCAPE POUR TERMINER LA CAPTURE"
560 RETURN
600 '-------------------------------------
610 '         capture
620 '
630 pause = 0: c$ = ""
640 WHILE c$ <> CHR$(27)
650 IF EOF(1) THEN GOTO 710: 'rien n'est reáu
655 b = LOC(1): 'nombres de caracteres dans le tampon
660 IF b > 674 THEN GOSUB 830: 'tampon>2/3 plein,cesser l'enträe
670 IF b < 337 AND pause = 1 THEN GOSUB 900: 'tampon<1/3 plein,la reprendre
680 In$ = INPUT$(LOC(1), #1): 'lire le tampon dans le fichier
690 PRINT In$; : 'l'afficher a l'ecran
700 PRINT #2, In$; : 'le sauvegarder dans le fichier
710 c$ = INKEY$: 'traiter toute touche frappäe
720 WEND
730 RETURN
800 '---------------------------------------------------
810 '      debranche le controle de flux
820 '
830 IF pause = 1 THEN GOTO 870: 'dejÖ dans le monde pause
840 OUT &H3FC, 0: 'abaisser DTR et RTS dans le reg. de controle du modem
860 pause = 1
870 RETURN
900 '------------------------------------------------------
910 '    rebranche le controle de flux
920 '
930 OUT &H3FC, 3: 'bits 1 et 2,DTR et RTS haut dans le reg .de controle du modem
950 pause = 0
960 RETURN
1000 '--------------------------------------------------------------------
1010 '   Fermeture
1020 '
1030 CLOSE #1: 'ferme le fichier correspondant a com1
1040 CLOSE #2: 'ferme le fichier disque
1050 RETURN
1100 '---------------------------------------------------------
1110 '     message de fin
1120 '
1130 PRINT
1140 PRINT "CAPTURE FINIE"
1145 PRINT
1150 RETURN
1160 '-------------------------------------------------------------------------



