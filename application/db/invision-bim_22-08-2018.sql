-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 23, 2018 at 05:53 PM
-- Server version: 5.5.60-0+deb8u1-log
-- PHP Version: 5.6.36-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `invision-bim`
--
CREATE DATABASE IF NOT EXISTS `invision-bim` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `invision-bim`;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
`id` int(11) unsigned NOT NULL,
  `owner` varchar(50) NOT NULL,
  `alias` varchar(250) NOT NULL,
  `number` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `coin_id` int(11) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

CREATE TABLE IF NOT EXISTS `account_type` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE IF NOT EXISTS `actions` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL,
  `route` varchar(50) DEFAULT NULL,
  `assigned` int(11) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `binnacle`
--

CREATE TABLE IF NOT EXISTS `binnacle` (
`id` int(11) unsigned NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `ip` varchar(15) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `detail` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coins`
--

CREATE TABLE IF NOT EXISTS `coins` (
`id` int(11) unsigned NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `abbreviation` varchar(5) DEFAULT NULL,
  `symbol` varchar(5) DEFAULT NULL,
  `decimals` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `coin_rate`
--

CREATE TABLE IF NOT EXISTS `coin_rate` (
`id` int(11) unsigned NOT NULL,
  `coin` varchar(10) NOT NULL,
  `rate` float NOT NULL,
  `d_create` date DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE IF NOT EXISTS `contracts` (
`id` int(11) unsigned NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `project_transactions_id` int(11) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `finished_on` timestamp NULL DEFAULT NULL,
  `payback` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contract_rules`
--

CREATE TABLE IF NOT EXISTS `contract_rules` (
`id` int(11) unsigned NOT NULL,
  `var1` text,
  `cond` int(11) DEFAULT NULL,
  `var2` text,
  `contracts_id` int(11) DEFAULT NULL,
  `segment` varchar(150) NOT NULL,
  `result` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

CREATE TABLE IF NOT EXISTS `icons` (
`id` int(11) unsigned NOT NULL,
  `class` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `investorgroups`
--

CREATE TABLE IF NOT EXISTS `investorgroups` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `investorgroups_accounts`
--

CREATE TABLE IF NOT EXISTS `investorgroups_accounts` (
`id` int(11) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `investorgroups_projects`
--

CREATE TABLE IF NOT EXISTS `investorgroups_projects` (
`id` int(11) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `investorgroups_users`
--

CREATE TABLE IF NOT EXISTS `investorgroups_users` (
`id` int(11) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lang`
--

CREATE TABLE IF NOT EXISTS `lang` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `route` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
`id` int(11) unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `detail` varchar(250) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `ip` int(11) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `logo` varchar(100) DEFAULT NULL,
  `route` varchar(50) DEFAULT NULL,
  `action_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
`id` int(11) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `parameter_permit` varchar(5) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profile_actions`
--

CREATE TABLE IF NOT EXISTS `profile_actions` (
`id` int(11) unsigned NOT NULL,
  `profile_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `parameter_permit` varchar(5) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `amount_r` float DEFAULT NULL,
  `amount_min` float DEFAULT NULL,
  `amount_max` float DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `date_r` timestamp NULL DEFAULT NULL,
  `date_v` timestamp NULL DEFAULT NULL,
  `public` int(11) DEFAULT NULL,
  `coin_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_detail`
--

CREATE TABLE IF NOT EXISTS `project_detail` (
`id` int(11) unsigned NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `button` varchar(100) NOT NULL,
  `title` varchar(256) NOT NULL,
  `subtitle` varchar(256) NOT NULL,
  `content` text,
  `order` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_documents`
--

CREATE TABLE IF NOT EXISTS `project_documents` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_news`
--

CREATE TABLE IF NOT EXISTS `project_news` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `description` text,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_photos`
--

CREATE TABLE IF NOT EXISTS `project_photos` (
`id` int(11) unsigned NOT NULL,
  `project_id` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_readings`
--

CREATE TABLE IF NOT EXISTS `project_readings` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_rules`
--

CREATE TABLE IF NOT EXISTS `project_rules` (
`id` int(11) unsigned NOT NULL,
  `var1` text,
  `cond` int(11) DEFAULT NULL,
  `var2` text,
  `project_id` int(11) DEFAULT NULL,
  `segment` varchar(150) NOT NULL,
  `result` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_transactions`
--

CREATE TABLE IF NOT EXISTS `project_transactions` (
`id` int(11) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `observation` text,
  `amount` float DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_transactions_relations`
--

CREATE TABLE IF NOT EXISTS `project_transactions_relations` (
`id` int(11) unsigned NOT NULL,
  `transactions_parent_id` int(11) DEFAULT NULL,
  `transactions_projects_id` int(11) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_types`
--

CREATE TABLE IF NOT EXISTS `project_types` (
`id` int(11) unsigned NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submenus`
--

CREATE TABLE IF NOT EXISTS `submenus` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `logo` varchar(100) DEFAULT NULL,
  `route` varchar(20) DEFAULT NULL,
  `menu_id` int(11) NOT NULL,
  `action_id` int(11) NOT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
`id` int(11) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_create_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `observation` text,
  `amount` float DEFAULT NULL,
  `real` int(11) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_relations`
--

CREATE TABLE IF NOT EXISTS `transaction_relations` (
`id` int(11) unsigned NOT NULL,
  `transaction_from_id` int(11) DEFAULT NULL,
  `transaction_to_id` int(11) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) unsigned NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(100) NOT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `coin_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT '1',
  `image` varchar(50) DEFAULT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_relations`
--

CREATE TABLE IF NOT EXISTS `user_relations` (
`id` int(11) unsigned NOT NULL,
  `adviser_id` int(11) NOT NULL,
  `investor_id` int(11) NOT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE IF NOT EXISTS `user_sessions` (
`id` int(11) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `d_create` timestamp NULL DEFAULT NULL,
  `d_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `account_type`
--
ALTER TABLE `account_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `binnacle`
--
ALTER TABLE `binnacle`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `coins`
--
ALTER TABLE `coins`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coin_rate`
--
ALTER TABLE `coin_rate`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
 ADD PRIMARY KEY (`id`), ADD KEY `project_id` (`project_id`), ADD KEY `project_transactions_id` (`project_transactions_id`);

--
-- Indexes for table `contract_rules`
--
ALTER TABLE `contract_rules`
 ADD PRIMARY KEY (`id`), ADD KEY `contracts_id` (`contracts_id`);

--
-- Indexes for table `icons`
--
ALTER TABLE `icons`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investorgroups`
--
ALTER TABLE `investorgroups`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `investorgroups_accounts`
--
ALTER TABLE `investorgroups_accounts`
 ADD PRIMARY KEY (`id`), ADD KEY `group_id` (`group_id`), ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `investorgroups_projects`
--
ALTER TABLE `investorgroups_projects`
 ADD PRIMARY KEY (`id`), ADD KEY `group_id` (`group_id`), ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `investorgroups_users`
--
ALTER TABLE `investorgroups_users`
 ADD PRIMARY KEY (`id`), ADD KEY `group_id` (`group_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `lang`
--
ALTER TABLE `lang`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
 ADD PRIMARY KEY (`id`), ADD KEY `action_id` (`action_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `action_id` (`action_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_actions`
--
ALTER TABLE `profile_actions`
 ADD PRIMARY KEY (`id`), ADD KEY `profile_id` (`profile_id`), ADD KEY `action_id` (`action_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
 ADD PRIMARY KEY (`id`), ADD KEY `coin_id` (`coin_id`);

--
-- Indexes for table `project_detail`
--
ALTER TABLE `project_detail`
 ADD PRIMARY KEY (`id`), ADD KEY `lang_id` (`lang_id`), ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `project_documents`
--
ALTER TABLE `project_documents`
 ADD PRIMARY KEY (`id`), ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `project_news`
--
ALTER TABLE `project_news`
 ADD PRIMARY KEY (`id`), ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `project_photos`
--
ALTER TABLE `project_photos`
 ADD PRIMARY KEY (`id`), ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `project_readings`
--
ALTER TABLE `project_readings`
 ADD PRIMARY KEY (`id`), ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `project_rules`
--
ALTER TABLE `project_rules`
 ADD PRIMARY KEY (`id`), ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `project_transactions`
--
ALTER TABLE `project_transactions`
 ADD PRIMARY KEY (`id`), ADD KEY `project_id` (`project_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `project_transactions_relations`
--
ALTER TABLE `project_transactions_relations`
 ADD PRIMARY KEY (`id`), ADD KEY `transactions_parent_id` (`transactions_parent_id`), ADD KEY `transactions_projects_id` (`transactions_projects_id`);

--
-- Indexes for table `project_types`
--
ALTER TABLE `project_types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submenus`
--
ALTER TABLE `submenus`
 ADD PRIMARY KEY (`id`), ADD KEY `menu_id` (`menu_id`), ADD KEY `action_id` (`action_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transaction_relations`
--
ALTER TABLE `transaction_relations`
 ADD PRIMARY KEY (`id`), ADD KEY `transaction_id` (`transaction_from_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD KEY `profile_id` (`profile_id`);

--
-- Indexes for table `user_relations`
--
ALTER TABLE `user_relations`
 ADD PRIMARY KEY (`id`), ADD KEY `adviser_id` (`adviser_id`), ADD KEY `investor_id` (`investor_id`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `account_type`
--
ALTER TABLE `account_type`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `binnacle`
--
ALTER TABLE `binnacle`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `coins`
--
ALTER TABLE `coins`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `coin_rate`
--
ALTER TABLE `coin_rate`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=199;
--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contract_rules`
--
ALTER TABLE `contract_rules`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `icons`
--
ALTER TABLE `icons`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=598;
--
-- AUTO_INCREMENT for table `investorgroups`
--
ALTER TABLE `investorgroups`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `investorgroups_accounts`
--
ALTER TABLE `investorgroups_accounts`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `investorgroups_projects`
--
ALTER TABLE `investorgroups_projects`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `investorgroups_users`
--
ALTER TABLE `investorgroups_users`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `lang`
--
ALTER TABLE `lang`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `profile_actions`
--
ALTER TABLE `profile_actions`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `project_detail`
--
ALTER TABLE `project_detail`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `project_documents`
--
ALTER TABLE `project_documents`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_news`
--
ALTER TABLE `project_news`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_photos`
--
ALTER TABLE `project_photos`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `project_readings`
--
ALTER TABLE `project_readings`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_rules`
--
ALTER TABLE `project_rules`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_transactions`
--
ALTER TABLE `project_transactions`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_transactions_relations`
--
ALTER TABLE `project_transactions_relations`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project_types`
--
ALTER TABLE `project_types`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `submenus`
--
ALTER TABLE `submenus`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `transaction_relations`
--
ALTER TABLE `transaction_relations`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_relations`
--
ALTER TABLE `user_relations`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
