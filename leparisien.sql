-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 04:18 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leparisien`
--

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(128) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `autentifikacija` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`id`, `username`, `password`, `admin`, `autentifikacija`) VALUES
(1, 'TeoH', '12345', 1, '2d2e8ed7a22f178f'),
(2, 'Knele', '12345', 0, '6905bd3a9a65ad6a'),
(3, 'Kneza', 'knez', 1, 'e102bf064265ad22'),
(4, 'Oet', '123', 0, '5e1cc08fd14a1131'),
(5, 'Oethrsak', '12345', 0, 'b155ca0e7bd7f49b'),
(6, 'Oethrsak1', '12345', 0, '2dcbbfe241305a83'),
(7, 'asdas', 'asdasdas', 0, '8833e453dccd5d36'),
(8, 'TeoJ', 'jan', 1, '120901dd46e5a4e1');

-- --------------------------------------------------------

--
-- Table structure for table `slike`
--

CREATE TABLE `slike` (
  `id_slike` int(11) NOT NULL,
  `naziv` varchar(255) NOT NULL,
  `putanja` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `slike`
--

INSERT INTO `slike` (`id_slike`, `naziv`, `putanja`) VALUES
(11, 'BRFICL7AMVAV5OIAEE7K23O7UQ.jpg', 'uploads/'),
(12, 'BOSZ6FPRBFFXROIUXUIVRLW6KI.jpg', 'uploads/'),
(13, 'TZRREC2PNFBPRI42YEMTQ66LSM.jpg', 'uploads/'),
(14, 'FALZRSRFYNBGTCDGLAHAH66VLM.jpg', 'uploads/'),
(15, '47ISYNKZEBF6FOOJ5SS2ENZKDQ.jpg', 'uploads/'),
(16, '4LNDSLL4ZVHAFP57V47PXEHXMY.jpg', 'uploads/'),
(17, 'EDIO7OKYRRHGJKZCSI2RRQ5KLE.jpg', 'uploads/'),
(18, 'BSPO65XFHFAOFGVJVWUFANAO2M.jpg', 'uploads/'),
(19, 'AORMMAQPTWB7XTWAZTVM5N4F7A.jpg', 'uploads/'),
(21, 'TIKDWNY7VRE7NBZ73V5W7WPL44.jpg', 'uploads/'),
(24, '637P63VUZO5VPZYOGSHCU4UBZE.jpg', 'uploads/'),
(25, '3HDXUHXGA36QO3E2KOBOAMBHQA.jpg', 'uploads/'),
(27, '4SWU2QNXXTDINNT5AJMEYJ6SXQ.jpg', 'uploads/'),
(28, 'Y5LCNZMUBJDE3BZFW6GMYZGLAE.jpg', 'uploads/'),
(29, 'altars-within-the-egyptian-pyramids-torchlight-casting-dynamic-shadows-on-the-walls-yearned-creati.png', 'uploads/'),
(31, 'ancient-egypt-throngs-of-people-extending-for-miles-lined-up-bring-offerings-to-the-head-god-art.png', 'uploads/'),
(32, 'dark-tunnels-beneath-the-pyramids-dimly-lit-by-sporadic-flickers-of-torchlight-ancient-hieroglyphs.png', 'uploads/'),
(33, 'riscomapping-capturing-a-quirky-endearing-moment-where-a-raccoon-fiercely-engages-in-a-handshake-w.png', 'uploads/'),
(34, 'jersey-city-downtown-skyline-at-dusk-skyscrapers-infused-with-the-vibrant-blue-hues-of-the-twilight.png', 'uploads/'),
(36, 'raccoon-slumped-over-in-slumber-midst-piles-of-discarded-alleyway-detritus-overturned-bin-spilled (1).png', 'uploads/'),
(37, 'raccoon-slumped-over-in-slumber-midst-piles-of-discarded-alleyway-detritus-overturned-bin-spilled.png', 'uploads/'),
(38, 'aerial-perspective-of-an-amazon-jungle-split-by-a-winding-river-flowing-from-left-center-to-lower-ri.png', 'uploads/'),
(42, 'ancient-egypt-setting-head-god-enthroned-professional-ominous-concept-art-in-the-style-of-artgerm-.png', 'uploads/'),
(43, 'macro-photography-of-the-vibrant-ecosystem-under-the-amazon-rainforest-canopy-close-up-on-lush-flor.png', 'uploads/'),
(45, 'Tunnel.jpg', 'uploads/'),
(48, 'Erasmus-praksa.jpg', 'uploads/'),
(50, 'lone-archaeologist-seated-by-a-flickering-campfire-in-the-unyielding-darkness-of-night-engaged-in-c.png', 'uploads/'),
(51, '', ''),
(52, 'a-20-year-old-relatively-youthful-soldier-receiving-his-well-deserved-medals-at-the-end-of-world-wa.png', 'uploads/'),
(53, 'New Project.jpg', 'uploads/'),
(54, 'youtube-thumbnail-featuring-a-human-figure-pressing-a-key-on-a-massive-futuristic-keyboard-floating-.png', 'uploads/'),
(56, 'New Project.png', 'uploads/'),
(58, 'banner_2_1.jpg', 'uploads/');

-- --------------------------------------------------------

--
-- Table structure for table `vijesti`
--

CREATE TABLE `vijesti` (
  `id` int(11) NOT NULL,
  `naslov` varchar(255) NOT NULL,
  `tekst` longtext NOT NULL,
  `slika_id` int(11) NOT NULL,
  `arhiva` tinyint(1) NOT NULL,
  `kategorija` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vijesti`
--

INSERT INTO `vijesti` (`id`, `naslov`, `tekst`, `slika_id`, `arhiva`, `kategorija`) VALUES
(1, 'Euro 2024 : quels sont les dix stades de la compétition ?', 'Entre le 14 juin et le 14 juillet prochain, l’Allemagne vibrera pour son Euro à domicile. Dix stades dans 10 villes différentes ont été retenus pour accueillir la compétition. Tour d’horizon.\n\nLe coup d’envoi de cet Euro 2024 sera donné le 14 juin prochain à la Fussball Arena de Munich, plus connue sous le nom d’Allianz Arena le reste de l’année (le naming des stades n’est pas autorisé durant l’Euro), l’antre du Bayern Munich. L’Allemagne accueillera l’Écosse pour ce premier match du tournoi et la première rencontre à Munich. Cinq autres matchs suivront dont un huitième de finale et la première demi-finale.\n\nMais la Munich Football Arena n’est pas le plus grand stade de cet Euro en termes de capacité. Avec ses 66 000 places, l’enceinte est dépassée par l’Olympiastadion de Berlin (71 000 places). Le vieux stade olympique accueille également les rencontres du Herta Berlin en championnat et sera l’hôte de trois matchs de poule, un huitième de finale, un quart-de-finale et surtout de la finale le 14 juillet.\n\nÀ Leipzig, le plus petit stade\nLes huit autres stades sont bien connus des fans de football et des suiveurs de la Bundesliga. À commencer par le BVB Stadion de Dortmund où réside le fameux mur jaune, l’une des ambiances les plus chaudes d’Europe. Quatre matchs de poule, un huitième de finale et la deuxième demi-finale y seront disputés.\n\nOutre le stade olympique de Berlin, trois autres stades accueilleront un quart de finale. Le Volksparkstadion de Hambourg, hôte également de quatre matchs de groupe ; la Düsseldorf Arena (trois matchs de groupe) et la Stuttgart Arena (quatre matchs de groupe).\n\nLa Frankfurt Arena et le Cologne Stadium recevront eux quatre matchs de groupe et un huitième de finale. L’Arena AufSchalke de Gelsenkirchen et le Leipzig Stadium (plus petite enceinte avec une capacité de 40 000 places) ont également été retenus.\n\nL’Equipe de France jouera contre l’Autriche le 18 juin à 21 heures à la Düsseldorf Arena, contre les Pays-Bas le 21 juin à 21 heures au Leipzig Stadium et contre la Pologne le 25 juin à 18 heures au BVB Stadion avant un éventuel huitième de finale.', 11, 0, 'sport'),
(2, 'Euro 2024 : qui sont les pays qui ont le plus souvent gagné la compétition ?', 'En seize éditions, le Championnat d’Europe de football a couronné dix nations différentes. L’Espagne et l’Allemagne dominent le classement.\r\n\r\nDepuis la première édition de l’Euro en 1960, le trophée Henri Delaunay a été remis à dix nations différentes. Les principaux pays au classement UEFA sont parmi les plus titrés, sauf un, l’Angleterre. L’Espagne et l’Allemagne comptent trois titres chacun.\r\n\r\nL’Espagne a remporté le trophée en 1964, puis dans une histoire plus récente, en 2008 et en 2012 pour un doublé historique. Là où l’Allemagne a remporté le trophée en 1972 et en 1980 en tant qu’Allemagne de l’Ouest, puis en 1996.\r\n\r\nAngleterre et Belgique absents\r\nDeux autres nations ont soulevé le trophée plus d’une fois. La France évidemment, derrière Michel Platini en 1984 et Didier Deschamps en 2000, les Bleus ont soulevé le trophée à deux reprises. Avant une troisième fois cet été ?\r\n\r\nL’Italie sera également en lice pour remporter un troisième trophée et pour réaliser le doublé après la victoire en 2021. Les Italiens avaient déjà remporté la compétition en 1968.\r\n\r\nSix nations n’ont remporté le trophée qu’une fois. L’Union soviétique lors de la première édition (1960), la Tchécoslovaquie (1976), les Pays-Bas (1988), le Danemark (1992), la Grèce (2004) et le Portugal de Cristiano Ronaldo, en 2016, aux dépens de la France en finale.\r\n\r\nDeux nations majeures du football européen sont aux abonnées absentes : la Belgique et l’Angleterre. Malgré des éditions achevées sur le podium, elles n’ont jamais terminé sur la plus haute marche.', 12, 0, 'sport'),
(3, 'Euro 2024 : la liste officielle de l’équipe de France et les numéros des Bleus pour la compétition', 'Didier Deschamps a officiellement transmis ce vendredi à l’UEFA sa liste pour l’Euro en Allemagne, sans modification par rapport à celle annoncée mi-mai. N’Golo Kanté récupère bien son numéro 13 et Kylian Mbappé porte toujours le 10.\r\n\r\nLe sélectionneur de l’équipe de France a envoyé sa liste définitive pour l’Euro ce vendredi à l’UEFA. Sans surprise, Didier Deschamps n’a pas apporté de modification par rapport à la sélection annoncée le 16 mai sur le plateau du 20h de TF1.\r\n\r\nLe revenant N’Golo Kanté (33 ans, 54 sélections) sera bien présent en Allemagne, tout comme Bradley Barcola (21 ans, 1 sélection) pour sa première compétition avec les Bleus.\r\n\r\nPas de surprise non plus concernant les numéros attribués aux joueurs. Comme annoncé sur notre site fin mai, N’Golo Kanté récupère bel et bien son numéro 13 déjà porté mercredi soir lors du match amical contre le Luxembourg (3-0). Absent des rassemblements de l’équipe de France depuis juin 2022, le milieu de terrain retrouve ainsi le numéro qu’il portait lors de la Coupe du monde 2018, remportée par les Bleus en Russie.\r\n\r\nIbrahima Konaté, qui avait hérité du numéro 13 lors du dernier rassemblement de l’équipe de France, doit donc opter pour un nouveau numéro. Le défenseur central de Liverpool portera le 24.\r\n\r\nKylian Mbappé garde le numéro 10 qu’il devrait également porter dans un an au Real Madrid. Celui-ci est actuellement sur les épaules de Luka Modric, qui a récemment prolongé d’une saison chez les Merengues. Il faudra donc attendre 2025 pour voir le capitaine des Bleus porter le même numéro en sélection qu’en club.\r\n\r\nNouvel appelé, Bradley Barcola a opté pour le 25. Warren Zaïre-Emery, son coéquipier au PSG, a choisi le 18 comme son âge. Pour le reste, pas de nouveauté : Griezmann garde le 7 et Olivier Giroud, pour sa dernière compétition internationale, le 9.', 13, 0, 'sport'),
(4, '80 ans du Débarquement : un vétéran américain de 102 ans meurt en se rendant aux commémorations', 'Robert Persichitti avait fait le voyage en avion avec un accompagnant et naviguait sur un bateau le long des côtes françaises lorsqu’il a subi une « urgence médicale ». Il devait assister aux commémorations en Normandie.\r\n\r\nUn ancien combattant américain de la Seconde Guerre mondiale est décédé la semaine dernière lors de son voyage pour assister aux commémorations du Débarquement allié du 6 juin 1944, a annoncé une association américaine.\r\n\r\nRobert Persichitti, dit Bob « Al » Persichitti, 102 ans, avait fait le voyage en avion. Mais c’est lors de la suite de son voyage, sur le bateau en route vers la Normandie, qu’il a subi une « urgence médicale », a déclaré l’association Honor Flight dans une publication Facebook, sans préciser la nature de cette urgence.\r\n\r\nUn ancien opérateur radio\r\nL’ancien combattant a ensuite été évacué par les airs vers l’Allemagne, mais est décédé peu après, le 31 mai, selon l’association qui cite d’autres vétérans ayant voyagé avec lui.\r\n\r\nRobert Persichitti était opérateur radio pour l’US Navy à bord du navire de commandement USS Eldorado, et il a servi sous les drapeaux sur le front du Pacifique, notamment à Iwo Jima, Okinawa et Guam, où les forces américaines affrontaient l’armée japonaise. Après la guerre, il était devenu enseignant dans l‘État de New York.\r\n\r\nUn ancien combattant canadien William Cameron, qui avait participé au 6 juin 1944, est décédé à l’âge de 100 ans la veille de son retour en Normandie, où il devait assister aux festivités du 80e anniversaire du Débarquement.\r\n\r\nQuelque 180 anciens combattants nonagénaires voire centenaires participent aux commémorations jeudi du Débarquement allié du 6 juin 1944, qui a ouvert la voie à la défaite de l’Allemagne nazie lors de la Seconde Guerre mondiale.', 14, 0, 'kultura'),
(5, '80 ans du Débarquement : à Bayeux, Macron célèbre De Gaulle et la « renaissance » de la France', 'Lors du troisième et dernier jour des commémorations, Emmanuel Macron a évoqué le 14 juin 1944, ce jour où le chef de la France libre avait réaffirmé l’autorité du pays.\r\n\r\nEmmanuel Macron a célébré vendredi à Bayeux (Calvados), au dernier jour des commémorations du Débarquement de 1944, le rôle du général de Gaulle et la « renaissance » de la France « universelle et fière » qu’il « incarne ».\r\n\r\nC’est dans cette ville du Calvados que le chef de la France libre, à peine arrivé d’Angleterre quelques jours après le débarquement allié sur les plages normandes voisines, vint affirmer l’autorité de l’État le 14 juin 1944, pour bien signifier aux Américains et aux Britanniques que le pays libéré devrait recouvrer immédiatement sa souveraineté.\r\n\r\n« Ici, sur cette place de Bayeux, dans l’après-midi du 14 juin, la voix du général de Gaulle salua la foule et par-delà la France et le monde », a déclaré le chef de l’État 80 ans plus tard.\r\n\r\n« Cette voix, les Français la connaissaient. Voix de la France. Voix reconnaissable entre mille. Voix que les patriotes avaient appris à tenir pour celle de l’honneur », a-t-il ajouté. « Mais l’homme, ils le découvrent » : « À Bayeux, en juin 1944, une voix prend visage humain. » « Il incarne la renaissance. Ce jour-là, la France est là. Elle renaît », a lancé le président de la République.\r\n\r\nRéférence à l’extrême droite\r\nAprès avoir rendu hommage mercredi à la résistance bretonne et aux premiers parachutés de la France libre, aux victimes civiles, puis jeudi aux vétérans du Débarquement, Emmanuel Macron termine sa « pérégrination mémorielle » en exaltant la République.\r\n\r\n« La France reparaît alors universelle et fière. La France renaît par la force de l’État. La France renaît dans l’ordre de la République », a-t-il énoncé. « La France renaît à Bayeux autour de ce qui nous fonde comme Nation : une histoire millénaire, l’indépendance du pays, la souveraineté du peuple, l’autorité de l’État. »\r\n\r\nÀ deux jours des élections européennes de dimanche, pour lesquelles l’extrême droite fait figure de grande favorite malgré l’implication personnelle du président, il a exhorté les Français à n’« oublier jamais » qu’ils sont « toutes et tous les citoyens d’une nation, d’une République plus grande que nous, parce qu’elle est le fruit d’une volonté, chaque jour, chaque jour réinventée ».\r\n\r\n« Alors quand les temps sont difficiles et quand la peur ou la résignation menacent de vaincre, toujours, toujours, voilà la France, notre devoir et notre chance », a-t-il conclu.', 15, 0, 'politika'),
(6, 'Météo : quatre départements du sud-ouest placés en vigilance orange « orages » et « pluie-inondation »', 'Un « épisode pluvio-orageux intense » est attendu sur le Gers, les Hautes-Pyrénées, les Landes et les Pyrénées-Atlantiques ce samedi et jusqu’à dimanche.\r\n\r\nDes orages, de la pluie et même de la grêle. Le temps samedi sera marqué par des pluies à caractère orageux sur les trois quarts du pays, excepté le Nord-Ouest, selon Météo France. Trois départements ont été placés en vigilance orange « orages » et « pluie-inondation » pour ce samedi et dimanche.\r\n\r\nLes départements concernés par « l’épisode pluvio-orageux intense » sont les Landes, le Gers, les Hautes-Pyrénées et les Pyrénées-Atlantiques, a indiqué le service météorologique, précisant que de la grêle est aussi attendue. Sur la totalité de l’épisode, les cumuls de pluie pourront atteindre ou dépasser en pointe 100 mm, a ajouté Météo France dans son dernier bulletin publié à 6 heures.\r\n\r\nEn matinée, sous un ciel chaotique, des averses parfois mêlées de coups de tonnerre circuleront du nord de l’Aquitaine et du Limousin à l’Auvergne Rhône-Alpes et plus localement du pourtour du golfe du Lion au littoral provençal. Dans l’après-midi, les ondées orageuses régresseront dans l’intérieur de la Paca puis vers les Alpes du Sud et un temps plus ensoleillé ou voilé reviendra sur les régions méditerranéennes.\r\n\r\nEn revanche, l’activité orageuse se renforcera sur les Pyrénées avec quelques débordements en plaine au sud de la Garonne, ainsi que du Limousin et de l’Auvergne au nord de Rhône-Alpes, à la Franche-Comté et au sud de l’Alsace. Grêle et fortes pluies seront possibles localement sous orages.\r\n\r\nLes températures en baisse\r\nAu cours de la nuit suivante, alors que les conditions se calmeront sur le Centre-Est, des pluies orageuses soutenues et durables envahiront le sud de l’Aquitaine et l’ouest de Midi-Pyrénées donnant des cumuls parfois importants d’ici dimanche matin.\r\n\r\nSur le nord-ouest du pays, le temps restera plus calme et sec. Les nuages seront toutefois plus nombreux près de la Manche dès le matin, puis de la Bretagne à la frontière belge l’après-midi. De plus larges éclaircies résisteront du Poitou au nord-est. Le vent d’autan se lèvera l’après-midi et soufflera jusqu’à 50/60 km/h en son domaine. Au nord de la Seine, le vent d’ouest soufflera autour de 50 km/h.\r\n\r\nLes températures minimales seront comprises entre 7 et 10 degrés de la Bretagne au Benelux avec localement 4 ou 5 de la Picardie à la Lorraine. Ailleurs elles iront de 10 à 16 degrés, localement 18 à 20 sur le Sud-Ouest et sur les côtes méditerranéennes.\r\n\r\nLes maximales atteindront 17 à 23 degrés sur le Nord-Ouest, 23 à 27 du Poitou-Charentes aux frontières allemandes et à la Bourgogne-Franche-Comté, 26 à 30 sur le Sud avec localement 31/32 en Provence et parfois jusqu’à 33/35 sur la Corse-du-Sud.', 16, 0, 'kultura'),
(7, 'Nouvelle-Calédonie : un huitième mort après une fusillade impliquant des gendarmes lundi dernier', 'Depuis le début de la crise et des émeutes en Nouvelle-Calédonie, le 13 mai, huit personnes ont été tuées, dont deux gendarmes.\n\nL’un des deux hommes blessés par balles par des gendarmes, lundi 3 juin, en Nouvelle-Calédonie, est décédé des suites de ses blessures, portant à huit le nombre de morts au total dans l’archipel depuis le début des émeutes, a annoncé le procureur de la République de Nouméa, Yves Dupas, dans un communiqué de presse, ce samedi 8 juin.\n\nLundi à Païta, au nord de Nouméa, deux hommes qui faisaient partie d’un groupe ayant ouvert le feu sur des gendarmes ont été blessés par balles, avait fait savoir le procureur de la République de Nouméa en début de semaine.\n\nUne enquête, confiée à la Section de recherches de Nouméa, avait été ouverte pour « tentative de meurtre sur personne dépositaire de l’autorité publique », avait précisé le procureur, ajoutant que « les enquêteurs procèdent également à l’audition des gendarmes ayant fait usage de leur arme ».\n\nUne « action de riposte »\nLes faits se sont déroulés à 16h05 locales (7h05 à Paris) dans le secteur du col de la Pirogue, à Païta, un point névralgique sur la route menant de Nouméa à l’aéroport international qui a longtemps été bloquée par les indépendantistes.\n\nSelon le communiqué du procureur, les gendarmes au repos circulaient à bord d’un véhicule de location quand « après le passage d’un barrage », leur véhicule « a été délibérément percuté par l’arrière, par un véhicule de type pick-up ».\n\n« Plusieurs hommes armés ouvrent le feu en direction du véhicule, ce qui conduit deux gendarmes à faire usage de leur arme de service, dans une action de riposte », poursuit le communiqué, expliquant qu’un « agresseur » a été blessé à la tête et un autre au bras et que le véhicule ayant heurté les gendarmes a pris la fuite et n’a pas été retrouvé.\n\nUn homme grièvement blessé jeudi\nDans un communiqué, la Cellule de coordination des actions de terrain (CCAT) de Païta a pour sa part donné une autre version des faits. Selon celle-ci, qui accuse « les milices », ce sont des automobilistes qui ont profité du déblaiement de la route par les forces de l’ordre pour passer « à vive allure en ouvrant le feu avec des balles réelles sur nos jeunes positionnés aux abords de la route ».\n\n« Les informations diffusées ce soir par le relais CCAT Pwoyta (Païta en langue kanak ajië, ndlr) sur cette affaire ne correspondent aucunement aux constatations faites et aux premiers actes d’enquête », a démenti le procureur dans son communiqué.\n\nJeudi, un homme avait déjà été grièvement blessé par le GIGN dans une fusillade à Dumbéa, dans le Grand Nouméa. Depuis le début de la crise et des émeutes en Nouvelle-Calédonie, le 13 mai, huit personnes ont donc été tuées, dont deux gendarmes.\n\n', 17, 0, 'politika'),
(8, 'Cérémonie à l’Arc de Triomphe, dîner de gala… Le programme de la visite d’État de Joe Biden à Paris', 'Le président américain est arrivé mercredi en France et a participé jeudi aux commémorations du D-Day, sa visite d’État officielle à Paris se déroule ce samedi. Il s’agit de la plus longue visite à l’étranger de son mandat.\r\n\r\nDescente des Champs-Élysées avec la Garde Républicaine, dîner à l’Élysée… Emmanuel Macron déploie ce samedi tous les fastes de la République pour Joe Biden, en visite officielle à Paris. Le président américain est arrivé mercredi en France, mais il n’a pris part à aucun événement public ce jour-là. Il s’est rendu jeudi en Normandie où il a participé avec le président français aux commémorations du débarquement allié de 1944.\r\n\r\nLa visite d’État elle-même se déroule donc ce samedi. Le chef de l’État français et son homologue américain, après une cérémonie à l’Arc de Triomphe prévue à 12h30, seront encadrés sur la plus célèbre avenue du monde, pavoisée aux couleurs de leurs deux pays, par 140 chevaux et 38 motards.\r\n\r\nLa visite se poursuivra par un déjeuner de travail et sera conclue par un dîner de gala à l’Élysée. Joe Biden repartira dimanche après la visite d’un cimetière américain. La venue du chef d’État américain a rendu compliquée la circulation des automobilistes parisiens.\r\n\r\nDes annonces sur la sécurité maritime\r\nTout est fait, d’un côté comme de l’autre, pour bien montrer que « nous sommes plus proches que nous n’avons jamais été », comme l’a dit vendredi un porte-parole de la Maison Blanche, John Kirby. Côté français, l’on se félicite d’avoir droit à la plus longue visite à l’étranger du démocrate de 81 ans et ce en pleine campagne pour l’élection présidentielle américaine de novembre, qui le verra affronter Donald Trump.\r\n\r\nJoe Biden et Emmanuel Macron feront seulement samedi des déclarations à la presse. Washington a promis des annonces sur la sécurité maritime dans la zone Asie-Pacifique. Des partenariats dans la lutte contre le changement climatique seront aussi évoqués.', 18, 0, 'politika'),
(9, 'Bricolage à domicile : des pros pour monter vos meubles en kit', 'Filiale d’Ikea, la plateforme TaskRabbit a ouvert mercredi en France. Elle propose de vous mettre en relation avec des entrepreneurs pour vos petits travaux.\r\n\r\nBesoin d\'un coup de main pour monter un meuble, accrocher votre télé au mur ou déboucher un évier? Un nouveau concurrent a rejoint les Needhelp, Frizbiz et autres Youpijob sur le créneau des plateformes de jobbeurs.\r\n\r\nTaskRabbit, qui appartient au géant du meuble suédois Ikea, a ouvert mercredi en France, son premier pays francophone, via un site et une application. Déjà présente aux Etats-Unis, au Canada et au Royaume-Uni, la plateforme met en relation des clients peu bricoleurs avec des entrepreneurs individuels, qu\'elle appelle « taskers ». Une fois la prestation effectuée, la plateforme ajoute une commission de 30 %.\r\n\r\nLIRE AUSSI > Jobbing : le business des bricoleurs du dimanche\r\n\r\n« Plus de 60 000 taskers travaillent avec nous dans les 70 villes où nous sommes présents, explique Stacy Brown-Philpot, PDG de TaskRabbit. Nous avons un protocole de vérification de l\'identité, de l\'expérience, des informations bancaires de nos taskers. Chacun d\'entre eux crée un profil, fixe son prix à l\'heure, ses disponibilités et les missions qu\'il veut effectuer. »\r\n\r\nQuarante-cinq catégories de missions sont proposées par TaskRabbit : réparation de robinet, peinture, montage de meuble, entretien du jardin, garde d\'animaux… « Le montage de meubles est la catégorie la plus populaire, note la présidente, qui refuse de donner des chiffres. C\'était déjà le cas avant notre acquisition par Ikea en 2007. »', 19, 0, 'zabava'),
(11, 'Connaissez-vous les quatre TOC les plus fréquents ?', 'Le spécialiste et psychiatre Lionel Dantin nous décrypte la nature de ces troubles obsessionnels.\r\n\r\nDes TOC, il peut y en avoir mille sortes. Certains plus discrets que d\'autres. Mais tous un point commun « un profond sentiment d\'insécurité à la base, explique le psychiatre Lionel Dantin, si bien que pour se rassurer, la personne va vouloir tout contrôler. Elle a honte, elle en souffre, mais c\'est plus fort qu\'elle. » L\'auteur de « Tout savoir sur les TOC pour mieux les vaincre » (Ed. In Press) nous détaille les quatre les plus fréquents.\r\n\r\n1. L\'obsession de la propreté\r\nSi vous êtes atteint de ce TOC, votre maison doit être encore plus propre que celle de Bree Van De Kamp, le personnage de la série « Desperate Housewives », car vous êtes un hypermaniaque du ménage et de la propreté ; de même, vous vous lavez sans doute les mains et le corps plusieurs fois par jour pour vous débarrasser des bactéries en tout genre et être sûre d\'avoir une hygiène parfaitement irréprochable. Dans le jargon médical, on appelle ça « l\'obsession de la contamination ». Les patients qui en souffrent redoutent les contacts avec les personnes malades, « ils préféreraient mourir que de toucher la barre du métro ou le bouton d\'ascenseur », précise Lionel Dantin, quitte à utiliser d\'incroyables stratagèmes « comme la langue au lieu du doigt pour commander l\'ascenseur ».\r\n\r\n2. La peur de se tromper\r\nC\'est le deuxième le plus fréquent. Là, c\'est la peur permanente d\'avoir oublié de faire quelque chose et/ou de l\'avoir mal fait. « On se met alors vérifier et revérifier tout en permanence, par exemple, 5 fois si on a bien verrouillé la porte ou si le fer à repasser, puis le grille-pain ou le four sont bien éteints », explique-t-il. Ce TOC peut également se traduire par le fait de relire une dizaine de fois un texte pour vérifier qu\'il n\'y a pas d\'erreur.\r\n\r\n3. L\'obsession du malheur\r\nLà, c\'est la crainte qu\'un malheur se produise ou de porter malheur qui vous étreint. Et pour vous, pas de hasard ! Vous êtes passés devant une école. Vous avez entendu un cri d\'enfant. Peut-être l\'avez-vous écrasé ? Vous détestez le chiffre cinq, les hommes qui portent une moustache. Vous en croisez un justement. Alors vous faites demi-tour pour aller voir s\'il y a eu réellement un accident. Et tant que vous ne verrez pas un bon signe, vous resterez dans le doute. « Ce TOC est très handicapant car avec, on finit par abandonner toute conduite jugée à risque comme conduire une voiture, travailler avec des outils potentiellement dangereux. »\r\n\r\n4. La symétrie parfaite\r\nAu boulot, impossible de se mettre à l\'ouvrage si votre clavier n\'est pas bien parallèle à votre bureau et à votre écran d\'ordinateur. Un dossier est posé de travers ? Horreur ! Dans le jargon médical, on appelle cela « l\'obsession de la symétrie ». Quand elle devient un TOC, elle conduit à ranger invariablement les mêmes étagères, à ordonner les objets toujours de la même façon. Et chaque « désordre » apparent, déclenche une immense angoisse. Vite, il faut remettre chaque chose, à « sa bonne place ». « Ce désir d\'ordre parfait peut prendre d\'autres formes. Il devient très vite invivable pour la personne, ses collègues, sa famille », souligne le praticien.\r\n\r\nSi vous vous inquiétez pour un proche qui manifeste ce type de symptômes, l\'Aftoc (Association française de personnes souffrant de TOC) peut vous conseiller. Elle oriente également vers des thérapeutes efficaces.', 21, 0, 'zabava'),
(13, 'Amazon n’a pas respecté les délais de livraison, que faire?', 'Chaque semaine, un expert répond à une question posée par l’un de nos lecteurs.\r\n\r\n« J\'ai commandé un interrupteur d\'extérieur sur Amazon, avec l\'option livré en 24 heures, à 3,90 €. Le lendemain soir, à l\'heure convenue, rien. Le surlendemain, appel à 10 heures sur mon mobile : Je suis devant chez vous, je peux vous livrer ? Étant à mon travail, je recale la livraison le soir. Rien. Le lendemain, 11 heures, coup de fil : Je suis près de chez vous, je peux livrer ? Là, je me démène pour trouver un voisin sympa. Pour Amazon, d\'après le suivi de la livraison, j\'ai été livré le surlendemain de la commande. Pourtant, pas de remboursement des 3,90 €. Quel recours ai-je ? », nous demande Daniel, un lecteur de Paris.\r\n\r\nLaure Littardi, juriste à l\'UFC-Que choisir, lui répond.\r\n\r\n« En tout état de cause, il faut contester auprès d\'Amazon. L\'article devant être livré un jour donné à une heure donnée, vous êtes en droit de réclamer un dédommagement.\r\n\r\nEn pratique, vu le montant, le mieux est d\'adresser un mail ou les contacter via votre espace personnel sur le site, afin de garder une trace. Il faut demander le remboursement des frais de livraison et un geste commercial pour la gêne occasionnée, comme un avoir sur un prochain achat, par exemple.\r\n\r\nIl est toutefois possible qu\'Amazon se contente de rembourser le montant de la livraison. En l\'absence de réponse satisfaisante ou en l\'absence de réponse sous deux mois, ce lecteur peut saisir la Fevad (Fédération d\'e-commerce et de la vente à distance) qui interviendra en tant que médiateur. La saisine se fait sur le site, onglet Médiation. »', 24, 0, 'zabava'),
(14, 'Au restaurant, si le vin est mauvais, puis-je renvoyer la bouteille?', 'Chaque semaine, un expert répond à une question posée par l’un de nos lecteurs.\r\n\r\n« J\'ai commandé une bouteille de vin (un AOP Gigondas) au restaurant cet été. Le vin était consommable (il n\'était pas bouchonné) mais franchement mauvais. Ai-je la possibilité de renvoyer la bouteille après que le serveur m\'a fait goûter le vin ? », nous demande François, un lecteur de Paris.\r\n\r\nMurielle Gasnier, juriste à UFC-Que Choisir, lui répond.\r\n\r\n« Oui, d\'après le Code civil, le restaurateur est tenu de vous faire goûter le vin mais également de s\'assurer qu\'il vous convient, avant de vous le servir ou de vous laisser la bouteille. Vous pouvez donc en principe le renvoyer s\'il n\'est pas personnellement à votre goût et ce, bien qu\'il ne soit pas bouchonné.\r\n\r\nDans ce cas, la bouteille ne peut vous être facturée. Mais en pratique, mieux vaut le signaler immédiatement, voire inviter le restaurateur à le goûter lui aussi. En effet, si vous tardez à le signaler, il peut vous reprocher votre mauvaise foi notamment si vous avez fait vous-même le choix du vin.\r\n\r\nSi vous avez en tête un type de vin en particulier, n\'hésitez pas à demander conseils au sommelier ou au restaurateur pour vous aider dans votre choix (exemple : type de cépage, arômes recherchés, souhait d\'un vin charpenté…). Sachez que les restaurateurs ont tout intérêt à ce que vous appréciez votre dégustation pour espérer vous compter comme clients voire éviter d\'éventuels mauvais commentaires sur les sites en ligne. »', 25, 1, 'zabava'),
(15, 'Chez Franprix, on pourra aussi… faire la cuisine', 'Après les machines à jus d’orange et le bar à salade, Franprix teste un nouveau service : la possibilité pour les clients de cuisiner directement en magasin.\r\n\r\nQuatre plaques de cuisson, un frigidaire, un évier, un four, une machine à laver, des casseroles et une batterie d\'ustensiles, le tout dans une petite cuisine de six mètres carrés entourée de murs couleur brique… Un espace de démonstration à la mode Ikea ? Eh bien non : cette cuisine d\'un nouveau genre, qui sera inaugurée ce vendredi, est implantée au cœur d\'un… Franprix parisien.\r\n\r\nNous sommes rue Réaumur, à deux pas de la très passante rue Montorgueil, au centre de la capitale. Le concept est nouveau en France, et les responsables de l\'enseigne de proximité ne cessent de le répéter : dans leur laboratoire à idées qui fonctionne à plein, il s\'agit bien là d\'un test, dont on saura vite s\'il marche, ou non.\r\n\r\nMatin, midi et soir\r\nL\'idée de départ est étonnante et novatrice : « Proposer à tous les clients qui le souhaitent de cuisiner sur place, matin, midi ou soir, les produits qu\'ils viennent d\'acheter. Franprix doit devenir la cuisine du Parisien », s\'enthousiasme Cécile Guillou, sa directrice générale.\r\n\r\nLe public visé peut être un étudiant, qui n\'a pas de four chez lui par exemple, ou un cadre du quartier « qui en a marre de manger tout le temps la même chose, et vient se préparer son steak haché/pâtes ».\r\n\r\nUne façon originale d\'enrichir l\'offre « restauration », déjà très large, et qui représente en moyenne 10 % du chiffre d\'affaires des quelque 890 magasins du réseau. Certaines tendances actuelles font penser aux responsables de Franprix, filiale de casino, qu\'il peut y avoir une demande. « Nous nous sommes notamment inspirés des magasins américains de vêtements de yoga, Lululemon, qui proposent désormais des cours de yoga. Le service vient compléter le produit », décrypte Cécile Guillou.\r\n\r\nInvestissements massifs\r\nDans un premier temps, seuls les clients ayant une carte de fidélité pourront accéder à la cuisine. Mais au fait, qui nettoiera les casseroles et autres cuillères une fois le repas élaboré ? « On avisera, mais on a d\'ores et déjà prévu de le faire dans les espaces réservés au nettoyage de nos rôtissoires », précise François-Xavier Germain, notamment en charge du marketing pour l\'enseigne, qui n\'exclut pas, à terme, de faire venir un cuisinier professionnel pour assurer l\'animation de cet espace.', 27, 1, 'zabava'),
(16, 'Européennes 2024 : dans les Yvelines, peu de nouveaux inscrits sur les listes électorales… sauf à Versailles', 'TEST', 28, 1, 'politika'),
(31, 'asdasd', 'aedfdf', 52, 1, 'zabava'),
(32, 'Testing', 'Testing num1', 53, 1, 'sport'),
(33, 'Testing', 'Testing num2', 54, 1, 'politika'),
(34, 'Testing', 'Testing num3', 56, 1, 'politika'),
(35, 'Testing', 'Testing num4', 58, 1, 'politika');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `slike`
--
ALTER TABLE `slike`
  ADD PRIMARY KEY (`id_slike`),
  ADD UNIQUE KEY `UC_Naziv` (`naziv`);

--
-- Indexes for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UC_Slika` (`id`),
  ADD KEY `slika_id` (`slika_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `slike`
--
ALTER TABLE `slike`
  MODIFY `id_slike` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `vijesti`
--
ALTER TABLE `vijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vijesti`
--
ALTER TABLE `vijesti`
  ADD CONSTRAINT `vijesti_ibfk_1` FOREIGN KEY (`slika_id`) REFERENCES `slike` (`id_slike`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
