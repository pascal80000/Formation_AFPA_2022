###########################
# hotel  lot 1		#######
###########################

# 1 - afficher la liste des hotels

#SELECT hot_nom, hot_ville
#FROM hotel;



# 2 - Afficher la ville de résidence de Mr White

#SELECT cli_nom, cli_prenom, cli_ville
#FROM client
#WHERE cli_nom = "White";


# 3 - Afficher la liste des stations dont l’altitude < 1000

#SELECT sta_nom, sta_altitude
#FROM station
#WHERE sta_altitude < 1000;


# 4 - Afficher la liste des chambres ayant une capacité > 1

#SELECT cha_numero, cha_capacite
#FROM chambre
#WHERE cha_capacite >1;


# 5 - Afficher les clients n’habitant pas à Londres

#SELECT cli_nom, cli_ville
#FROM hotel.client
#WHERE cli_ville != 'Londres';


# 6 - Afficher la liste des hôtels située sur la ville de Bretou et possédant une catégorie > 3

#SELECT hot_nom, hot_categorie, hot_ville
#FROM hotel.hotel
#WHERE (hot_categorie > 3) AND (hot_ville ='Bretou');



######################################################
#Lot 2 : JOIN		##################################
######################################################


# 7 - Afficher la liste des hôtels avec leur station

#SELECT sta_nom, hot_nom, hot_categorie, hot_ville 
#FROM hotel.station
#JOIN hotel.hotel ON hotel.hot_sta_id = station.sta_id;


# 8 - Afficher la liste des chambres et leur hôtel

#SELECT hot_nom, hot_categorie, hot_ville,cha_numero
#FROM chambre
#JOIN hotel.hotel ON chambre.cha_hot_id = hotel.hot_id;


# 9 - Afficher la liste des chambres de plus d une place dans des hôtels situés sur la ville de Bretou

#SELECT hot_nom, hot_categorie, hot_ville, cha_numero, cha_capacite
#FROM chambre
#JOIN hotel.hotel ON chambre.cha_hot_id = hotel.hot_id
#WHERE cha_capacite > 1;


# 10 - Afficher la liste des réservations avec le nom des clients

#SELECT cli_nom, hot_nom, res_date
#FROM reservation
#JOIN hotel.client ON client.cli_id = reservation.res_cli_id
#JOIN hotel.chambre ON chambre.cha_id = reservation.res_cha_id
#JOIN hotel.hotel ON hotel.hot_id = chambre.cha_hot_id;


# 11 - Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station

#SELECT sta_nom, hot_nom, cha_numero, cha_capacite
#FROM hotel.station
#JOIN hotel.hotel ON station.sta_id = hotel.hot_sta_id 
#JOIN hotel.chambre ON hotel.hot_id = chambre.cha_hot_id;


# 12 - Afficher les réservations avec le nom du client et le nom de l’hôtel avec datediff

#SELECT cli_nom, hot_nom, res_date_debut, datediff ( res_date_fin, res_date_debut)
#FROM hotel.client
#JOIN hotel.reservation ON client.cli_id = reservation.res_cli_id
#JOIN hotel.chambre ON reservation.res_cha_id = chambre.cha_id
#JOIN hotel.hotel ON hotel.hot_id = chambre.cha_hot_id;


################################################
# Lot 3 : fonctions d agrégation     ###########
################################################

# 13 - Compter le nombre d’hôtel par station

#SELECT sta_nom, COUNT(hot_id)
#FROM station
#JOIN hotel ON sta_id = hot_sta_id 
#GROUP BY sta_nom DESC;


# 14 - Compter le nombre de chambres par station

#SELECT sta_nom, COUNT(cha_numero)
#FROM station
#JOIN hotel ON hot_sta_id = sta_id
#JOIN chambre ON cha_hot_id = hot_id
#GROUP BY sta_id;


# 15 - Compter le nombre de chambres par station ayant une capacité > 1

#SELECT sta_nom, COUNT(cha_numero)
#FROM station
#JOIN hotel ON hot_sta_id = sta_id
#JOIN chambre ON cha_hot_id = hot_id
#WHERE cha_capacite > 1
#GROUP BY sta_id;


# 16 - Afficher la liste des hôtels pour lesquels Mr Squire a effectué une réservation

#SELECT cli_nom, hot_nom
#FROM client
#JOIN reservation ON cli_id = res_cli_id
#JOIN chambre ON cha_id = res_cha_id
#JOIN hotel ON hot_id = cha_hot_id
#WHERE cli_nom = 'Squire'
#GROUP BY hot_id;


# 17 - Afficher la durée moyenne des réservations par station

SELECT sta_nom, AVG(
        datediff ( res_date_fin, res_date_debut)
)
FROM reservation
JOIN client ON res_cli_id = cli_id
JOIN chambre ON cha_id = res_cha_id
JOIN hotel ON hot_id = cha_hot_id
JOIN station ON sta_id = hot_sta_id
GROUP BY sta_nom