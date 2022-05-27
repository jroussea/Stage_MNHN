# HMMER

Informations concernant les dossiers :

- **data_preparation/** : contient les scripts utilisé pour la préparation des jeux de données pour l'analyse HMMER
	- *split_multifasta.sh* : permet de séparer un fichier fasta contenant plusieurs séquences en plusieurs fichiers fasta (ici, chaque fichier contient 100 000 séquences maximum)
	- *removing_special_character.sh* : permet de supprimer les characters spéciaux à la fin des séquences
- **hmmer_analysis/** :
	- *HMMER.sh* : permet de réaliser l'analyse HMMER sur les différence séquence

# INFORMATIONS SUPPLÉMENTAIRES

*HMMER.sh* : les "?" sont remplacé par le numéro du fichier fasta à analyser par le script *run_HMMER.sh*

*check_sequences.sh* : les "?" sont remplacé par le numéro du fichier à analyser par le script *run\_check\_sequences.sh*

Les scripts *run\_HMMER.sh* et r*un\_check\_sequences.sh* sont présent dans le dossier **Params_Cluster/**.


