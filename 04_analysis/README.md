# Information

Information concernant les dossiers :
     - CATH_annotation/ : contient le tableau CSV avec toutes les superfamilles CATH détecté lors de l'analyse avec HMMER
     - sequence_length/ : contient le graphique sur la distribution des protéines en conction de leur taille, ainsi que le script qui permet de le réaliser. Ce dossier contient également le tableau avec la taille de chaque séquence ainsi que le script qui a permis de les calculers

# CATH_annotation/

Ce dossier contient plusieurs fichiers :

# sequence_length/

Ce dossier contient plusieurs fichiers :
     - seq_len_known.sh : permet de caculer la taille des séquences connus présent dans les différents fichiers fasta (issu du script check_sequences.sh) => créer le fichier seq_len_known.txt
     - seq_len_unknown.sh : permet de calculer la taille des séquences inconnus présent dans les différents fichiers fasta (issu du script check_sequences.sh) => créer le fichier seq_len_unknown.txt
     - concat_seq_len.sh : permet de créer un seul fichier contenant à la fois les taille des séquences connus et des séquences inconnus
     - sequence_length.R : permet de créer le graphique sur la distribution des protéines en fonction de leur taille*



