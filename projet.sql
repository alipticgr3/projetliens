-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  ven. 18 mai 2018 à 01:34
-- Version du serveur :  10.1.26-MariaDB-0+deb9u1
-- Version de PHP :  7.2.5-1+0~20180505045740.21+stretch~1.gbpca2fa6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `logo`) VALUES
(1, 'Informatique', 'fa-laptop'),
(2, 'Jeux', 'fa-gamepad');

-- --------------------------------------------------------

--
-- Structure de la table `keywords`
--

CREATE TABLE `keywords` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `keywords`
--

INSERT INTO `keywords` (`id`, `name`) VALUES
(1, 'Responsive'),
(2, 'Design'),
(3, 'Blizzard'),
(4, 'Cartes');

-- --------------------------------------------------------

--
-- Structure de la table `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `idcategory_id` int(11) DEFAULT NULL,
  `iduser_id` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci,
  `url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datecreate` datetime NOT NULL,
  `dateupdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `links`
--

INSERT INTO `links` (`id`, `idcategory_id`, `iduser_id`, `name`, `tagline`, `detail`, `url`, `image`, `datecreate`, `dateupdate`) VALUES
(1, 1, 1, 'Bootstrap', 'Tout ce que vous avez toujours voulu savoir sur le responsive...', ' Build responsive, mobile-first projects on the web with the world\'s most popular front-end component library.\r\n\r\nBootstrap is an open source toolkit for developing with HTML, CSS, and JS. Quickly prototype your ideas or build your entire app with our Sass variables and mixins, responsive grid system, extensive prebuilt components, and powerful plugins built on jQuery. ', 'http://getbootstrap.com/', 'https://upload.wikimedia.org/wikipedia/fr/1/13/TwitterBootstrap.png', '2018-05-18 01:33:20', '2018-05-18 01:33:20'),
(2, 2, 2, 'Hearthstone', 'Le jeu de collection de cartes de Blizzard', 'La traque a commencé\r\nAventurez-vous en forêt et arrachez le mal à la racine une bonne fois pour toutes avec la nouvelle aventure solo du Bois Maudit : la Chasse aux monstres. Quatre nouveaux héros, quelques nouveaux ennemis et un défi au-delà de toute imagination vous attendent !', 'https://playhearthstone.com/fr-fr/', 'https://upload.wikimedia.org/wikipedia/fr/f/f2/Hearthstone_2016_logo.png', '2018-05-18 01:33:20', '2018-05-18 01:33:20');

-- --------------------------------------------------------

--
-- Structure de la table `links_keywords`
--

CREATE TABLE `links_keywords` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `links_keywords_keywords`
--

CREATE TABLE `links_keywords_keywords` (
  `links_keywords_id` int(11) NOT NULL,
  `keywords_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `links_keywords_links`
--

CREATE TABLE `links_keywords_links` (
  `links_keywords_id` int(11) NOT NULL,
  `links_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passwd` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datecreate` datetime NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `lastname`, `firstname`, `mail`, `passwd`, `datecreate`, `admin`) VALUES
(1, 'PLOP', 'Kevin', 'didier@aliptic.net', 'kevin', '2018-05-18 01:28:09', 1),
(2, 'SEBBAN', 'Frédéric', 'sebban.f@orange.fr', 'hpets1810', '2018-05-18 01:28:09', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D182A118D487ED4D` (`idcategory_id`),
  ADD KEY `IDX_D182A118786A81FB` (`iduser_id`);

--
-- Index pour la table `links_keywords`
--
ALTER TABLE `links_keywords`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `links_keywords_keywords`
--
ALTER TABLE `links_keywords_keywords`
  ADD PRIMARY KEY (`links_keywords_id`,`keywords_id`),
  ADD KEY `IDX_8965689CE7D3108A` (`links_keywords_id`),
  ADD KEY `IDX_8965689C6205D0B8` (`keywords_id`);

--
-- Index pour la table `links_keywords_links`
--
ALTER TABLE `links_keywords_links`
  ADD PRIMARY KEY (`links_keywords_id`,`links_id`),
  ADD KEY `IDX_713DF5F1E7D3108A` (`links_keywords_id`),
  ADD KEY `IDX_713DF5F1C0DE588D` (`links_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `links_keywords`
--
ALTER TABLE `links_keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `FK_D182A118786A81FB` FOREIGN KEY (`iduser_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_D182A118D487ED4D` FOREIGN KEY (`idcategory_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `links_keywords_keywords`
--
ALTER TABLE `links_keywords_keywords`
  ADD CONSTRAINT `FK_8965689C6205D0B8` FOREIGN KEY (`keywords_id`) REFERENCES `keywords` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8965689CE7D3108A` FOREIGN KEY (`links_keywords_id`) REFERENCES `links_keywords` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `links_keywords_links`
--
ALTER TABLE `links_keywords_links`
  ADD CONSTRAINT `FK_713DF5F1C0DE588D` FOREIGN KEY (`links_id`) REFERENCES `links` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_713DF5F1E7D3108A` FOREIGN KEY (`links_keywords_id`) REFERENCES `links_keywords` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
