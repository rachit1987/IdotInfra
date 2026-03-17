/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.16-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: wordpress
-- ------------------------------------------------------
-- Server version	10.11.16-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT 0,
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_options`
--

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;
INSERT INTO `wp_options` VALUES
(1,'cron','a:7:{i:1771994309;a:2:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1771994311;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1771997909;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1771999709;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1772001509;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1772080709;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','on'),
(2,'siteurl','http://idotinfra.infinityfreeapp.me','on'),
(3,'home','http://idotinfra.infinityfreeapp.me','on'),
(4,'blogname','I-Dot Infra','on'),
(5,'blogdescription','Trust, Opportunity, Dreams, Innovation','on'),
(6,'users_can_register','0','on'),
(7,'admin_email','admin@idotinfra.com','on'),
(8,'start_of_week','1','on'),
(9,'use_balanceTags','0','on'),
(10,'use_smilies','1','on'),
(11,'require_name_email','1','on'),
(12,'comments_notify','1','on'),
(13,'posts_per_rss','10','on'),
(14,'rss_use_excerpt','0','on'),
(15,'mailserver_url','mail.example.com','on'),
(16,'mailserver_login','login@example.com','on'),
(17,'mailserver_pass','','on'),
(18,'mailserver_port','110','on'),
(19,'default_category','1','on'),
(20,'default_comment_status','open','on'),
(21,'default_ping_status','open','on'),
(22,'default_pingback_flag','1','on'),
(23,'posts_per_page','10','on'),
(24,'date_format','F j, Y','on'),
(25,'time_format','g:i a','on'),
(26,'links_updated_date_format','F j, Y g:i a','on'),
(27,'comment_moderation','0','on'),
(28,'moderation_notify','1','on'),
(29,'permalink_structure','/%postname%/','on'),
(30,'rewrite_rules','a:112:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:35:\"project/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"project/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"project/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"project/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"project/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"project/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"project/([^/]+)/embed/?$\";s:40:\"index.php?project=$matches[1]&embed=true\";s:28:\"project/([^/]+)/trackback/?$\";s:34:\"index.php?project=$matches[1]&tb=1\";s:36:\"project/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?project=$matches[1]&paged=$matches[2]\";s:43:\"project/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?project=$matches[1]&cpage=$matches[2]\";s:32:\"project/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?project=$matches[1]&page=$matches[2]\";s:24:\"project/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"project/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"project/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"project/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"project/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"project/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:12:\"sitemap\\.xml\";s:23:\"index.php?sitemap=index\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=4&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}','on'),
(31,'hack_file','0','on'),
(32,'blog_charset','UTF-8','on'),
(33,'moderation_keys','','off'),
(34,'active_plugins','a:1:{i:0;s:36:\"contact-form-7/wp-contact-form-7.php\";}','on'),
(35,'category_base','','on'),
(36,'ping_sites','https://rpc.pingomatic.com/','on'),
(37,'comment_max_links','2','on'),
(38,'gmt_offset','0','on'),
(39,'default_email_category','1','on'),
(40,'recently_edited','','off'),
(41,'template','astra','on'),
(42,'stylesheet','idotinfra-theme','on'),
(43,'comment_registration','0','on'),
(44,'html_type','text/html','on'),
(45,'use_trackback','0','on'),
(46,'default_role','subscriber','on'),
(47,'db_version','60717','on'),
(48,'uploads_use_yearmonth_folders','1','on'),
(49,'upload_path','','on'),
(50,'blog_public','1','on'),
(51,'default_link_category','2','on'),
(52,'show_on_front','page','on'),
(53,'tag_base','','on'),
(54,'show_avatars','1','on'),
(55,'avatar_rating','G','on'),
(56,'upload_url_path','','on'),
(57,'thumbnail_size_w','150','on'),
(58,'thumbnail_size_h','150','on'),
(59,'thumbnail_crop','1','on'),
(60,'medium_size_w','300','on'),
(61,'medium_size_h','300','on'),
(62,'avatar_default','mystery','on'),
(63,'large_size_w','1024','on'),
(64,'large_size_h','1024','on'),
(65,'image_default_link_type','none','on'),
(66,'image_default_size','','on'),
(67,'image_default_align','','on'),
(68,'close_comments_for_old_posts','0','on'),
(69,'close_comments_days_old','14','on'),
(70,'thread_comments','1','on'),
(71,'thread_comments_depth','5','on'),
(72,'page_comments','0','on'),
(73,'comments_per_page','50','on'),
(74,'default_comments_page','newest','on'),
(75,'comment_order','asc','on'),
(76,'sticky_posts','a:0:{}','on'),
(77,'widget_categories','a:0:{}','on'),
(78,'widget_text','a:0:{}','on'),
(79,'widget_rss','a:0:{}','on'),
(80,'uninstall_plugins','a:0:{}','off'),
(81,'timezone_string','Asia/Kolkata','on'),
(82,'page_for_posts','0','on'),
(83,'page_on_front','4','on'),
(84,'default_post_format','0','on'),
(85,'link_manager_enabled','0','on'),
(86,'finished_splitting_shared_terms','1','on'),
(87,'site_icon','12','on'),
(88,'medium_large_size_w','768','on'),
(89,'medium_large_size_h','0','on'),
(90,'wp_page_for_privacy_policy','3','on'),
(91,'show_comments_cookies_opt_in','1','on'),
(92,'admin_email_lifespan','1787546309','on'),
(93,'disallowed_keys','','off'),
(94,'comment_previously_approved','1','on'),
(95,'auto_plugin_theme_update_emails','a:0:{}','off'),
(96,'auto_update_core_dev','enabled','on'),
(97,'auto_update_core_minor','enabled','on'),
(98,'auto_update_core_major','enabled','on'),
(99,'wp_force_deactivated_plugins','a:0:{}','on'),
(100,'wp_attachment_pages_enabled','0','on'),
(101,'wp_notes_notify','1','on'),
(102,'initial_db_version','60717','on'),
(103,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','on'),
(104,'fresh_site','0','off'),
(105,'user_count','1','off'),
(106,'widget_block','a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}','auto'),
(107,'sidebars_widgets','a:9:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:15:\"footer-widget-1\";a:0:{}s:15:\"footer-widget-2\";a:0:{}s:24:\"advanced-footer-widget-1\";a:0:{}s:24:\"advanced-footer-widget-2\";a:0:{}s:24:\"advanced-footer-widget-3\";a:0:{}s:24:\"advanced-footer-widget-4\";a:0:{}s:13:\"array_version\";i:3;}','auto'),
(108,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(109,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(110,'widget_archives','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(111,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(112,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(113,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(114,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(115,'widget_meta','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(116,'widget_search','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(117,'widget_recent-posts','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(118,'widget_recent-comments','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(119,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(120,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(121,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','auto'),
(122,'_transient_wp_core_block_css_files','a:2:{s:7:\"version\";s:5:\"6.9.1\";s:5:\"files\";a:584:{i:0;s:31:\"accordion-heading/style-rtl.css\";i:1;s:35:\"accordion-heading/style-rtl.min.css\";i:2;s:27:\"accordion-heading/style.css\";i:3;s:31:\"accordion-heading/style.min.css\";i:4;s:28:\"accordion-item/style-rtl.css\";i:5;s:32:\"accordion-item/style-rtl.min.css\";i:6;s:24:\"accordion-item/style.css\";i:7;s:28:\"accordion-item/style.min.css\";i:8;s:29:\"accordion-panel/style-rtl.css\";i:9;s:33:\"accordion-panel/style-rtl.min.css\";i:10;s:25:\"accordion-panel/style.css\";i:11;s:29:\"accordion-panel/style.min.css\";i:12;s:23:\"accordion/style-rtl.css\";i:13;s:27:\"accordion/style-rtl.min.css\";i:14;s:19:\"accordion/style.css\";i:15;s:23:\"accordion/style.min.css\";i:16;s:23:\"archives/editor-rtl.css\";i:17;s:27:\"archives/editor-rtl.min.css\";i:18;s:19:\"archives/editor.css\";i:19;s:23:\"archives/editor.min.css\";i:20;s:22:\"archives/style-rtl.css\";i:21;s:26:\"archives/style-rtl.min.css\";i:22;s:18:\"archives/style.css\";i:23;s:22:\"archives/style.min.css\";i:24;s:20:\"audio/editor-rtl.css\";i:25;s:24:\"audio/editor-rtl.min.css\";i:26;s:16:\"audio/editor.css\";i:27;s:20:\"audio/editor.min.css\";i:28;s:19:\"audio/style-rtl.css\";i:29;s:23:\"audio/style-rtl.min.css\";i:30;s:15:\"audio/style.css\";i:31;s:19:\"audio/style.min.css\";i:32;s:19:\"audio/theme-rtl.css\";i:33;s:23:\"audio/theme-rtl.min.css\";i:34;s:15:\"audio/theme.css\";i:35;s:19:\"audio/theme.min.css\";i:36;s:21:\"avatar/editor-rtl.css\";i:37;s:25:\"avatar/editor-rtl.min.css\";i:38;s:17:\"avatar/editor.css\";i:39;s:21:\"avatar/editor.min.css\";i:40;s:20:\"avatar/style-rtl.css\";i:41;s:24:\"avatar/style-rtl.min.css\";i:42;s:16:\"avatar/style.css\";i:43;s:20:\"avatar/style.min.css\";i:44;s:21:\"button/editor-rtl.css\";i:45;s:25:\"button/editor-rtl.min.css\";i:46;s:17:\"button/editor.css\";i:47;s:21:\"button/editor.min.css\";i:48;s:20:\"button/style-rtl.css\";i:49;s:24:\"button/style-rtl.min.css\";i:50;s:16:\"button/style.css\";i:51;s:20:\"button/style.min.css\";i:52;s:22:\"buttons/editor-rtl.css\";i:53;s:26:\"buttons/editor-rtl.min.css\";i:54;s:18:\"buttons/editor.css\";i:55;s:22:\"buttons/editor.min.css\";i:56;s:21:\"buttons/style-rtl.css\";i:57;s:25:\"buttons/style-rtl.min.css\";i:58;s:17:\"buttons/style.css\";i:59;s:21:\"buttons/style.min.css\";i:60;s:22:\"calendar/style-rtl.css\";i:61;s:26:\"calendar/style-rtl.min.css\";i:62;s:18:\"calendar/style.css\";i:63;s:22:\"calendar/style.min.css\";i:64;s:25:\"categories/editor-rtl.css\";i:65;s:29:\"categories/editor-rtl.min.css\";i:66;s:21:\"categories/editor.css\";i:67;s:25:\"categories/editor.min.css\";i:68;s:24:\"categories/style-rtl.css\";i:69;s:28:\"categories/style-rtl.min.css\";i:70;s:20:\"categories/style.css\";i:71;s:24:\"categories/style.min.css\";i:72;s:19:\"code/editor-rtl.css\";i:73;s:23:\"code/editor-rtl.min.css\";i:74;s:15:\"code/editor.css\";i:75;s:19:\"code/editor.min.css\";i:76;s:18:\"code/style-rtl.css\";i:77;s:22:\"code/style-rtl.min.css\";i:78;s:14:\"code/style.css\";i:79;s:18:\"code/style.min.css\";i:80;s:18:\"code/theme-rtl.css\";i:81;s:22:\"code/theme-rtl.min.css\";i:82;s:14:\"code/theme.css\";i:83;s:18:\"code/theme.min.css\";i:84;s:22:\"columns/editor-rtl.css\";i:85;s:26:\"columns/editor-rtl.min.css\";i:86;s:18:\"columns/editor.css\";i:87;s:22:\"columns/editor.min.css\";i:88;s:21:\"columns/style-rtl.css\";i:89;s:25:\"columns/style-rtl.min.css\";i:90;s:17:\"columns/style.css\";i:91;s:21:\"columns/style.min.css\";i:92;s:33:\"comment-author-name/style-rtl.css\";i:93;s:37:\"comment-author-name/style-rtl.min.css\";i:94;s:29:\"comment-author-name/style.css\";i:95;s:33:\"comment-author-name/style.min.css\";i:96;s:29:\"comment-content/style-rtl.css\";i:97;s:33:\"comment-content/style-rtl.min.css\";i:98;s:25:\"comment-content/style.css\";i:99;s:29:\"comment-content/style.min.css\";i:100;s:26:\"comment-date/style-rtl.css\";i:101;s:30:\"comment-date/style-rtl.min.css\";i:102;s:22:\"comment-date/style.css\";i:103;s:26:\"comment-date/style.min.css\";i:104;s:31:\"comment-edit-link/style-rtl.css\";i:105;s:35:\"comment-edit-link/style-rtl.min.css\";i:106;s:27:\"comment-edit-link/style.css\";i:107;s:31:\"comment-edit-link/style.min.css\";i:108;s:32:\"comment-reply-link/style-rtl.css\";i:109;s:36:\"comment-reply-link/style-rtl.min.css\";i:110;s:28:\"comment-reply-link/style.css\";i:111;s:32:\"comment-reply-link/style.min.css\";i:112;s:30:\"comment-template/style-rtl.css\";i:113;s:34:\"comment-template/style-rtl.min.css\";i:114;s:26:\"comment-template/style.css\";i:115;s:30:\"comment-template/style.min.css\";i:116;s:42:\"comments-pagination-numbers/editor-rtl.css\";i:117;s:46:\"comments-pagination-numbers/editor-rtl.min.css\";i:118;s:38:\"comments-pagination-numbers/editor.css\";i:119;s:42:\"comments-pagination-numbers/editor.min.css\";i:120;s:34:\"comments-pagination/editor-rtl.css\";i:121;s:38:\"comments-pagination/editor-rtl.min.css\";i:122;s:30:\"comments-pagination/editor.css\";i:123;s:34:\"comments-pagination/editor.min.css\";i:124;s:33:\"comments-pagination/style-rtl.css\";i:125;s:37:\"comments-pagination/style-rtl.min.css\";i:126;s:29:\"comments-pagination/style.css\";i:127;s:33:\"comments-pagination/style.min.css\";i:128;s:29:\"comments-title/editor-rtl.css\";i:129;s:33:\"comments-title/editor-rtl.min.css\";i:130;s:25:\"comments-title/editor.css\";i:131;s:29:\"comments-title/editor.min.css\";i:132;s:23:\"comments/editor-rtl.css\";i:133;s:27:\"comments/editor-rtl.min.css\";i:134;s:19:\"comments/editor.css\";i:135;s:23:\"comments/editor.min.css\";i:136;s:22:\"comments/style-rtl.css\";i:137;s:26:\"comments/style-rtl.min.css\";i:138;s:18:\"comments/style.css\";i:139;s:22:\"comments/style.min.css\";i:140;s:20:\"cover/editor-rtl.css\";i:141;s:24:\"cover/editor-rtl.min.css\";i:142;s:16:\"cover/editor.css\";i:143;s:20:\"cover/editor.min.css\";i:144;s:19:\"cover/style-rtl.css\";i:145;s:23:\"cover/style-rtl.min.css\";i:146;s:15:\"cover/style.css\";i:147;s:19:\"cover/style.min.css\";i:148;s:22:\"details/editor-rtl.css\";i:149;s:26:\"details/editor-rtl.min.css\";i:150;s:18:\"details/editor.css\";i:151;s:22:\"details/editor.min.css\";i:152;s:21:\"details/style-rtl.css\";i:153;s:25:\"details/style-rtl.min.css\";i:154;s:17:\"details/style.css\";i:155;s:21:\"details/style.min.css\";i:156;s:20:\"embed/editor-rtl.css\";i:157;s:24:\"embed/editor-rtl.min.css\";i:158;s:16:\"embed/editor.css\";i:159;s:20:\"embed/editor.min.css\";i:160;s:19:\"embed/style-rtl.css\";i:161;s:23:\"embed/style-rtl.min.css\";i:162;s:15:\"embed/style.css\";i:163;s:19:\"embed/style.min.css\";i:164;s:19:\"embed/theme-rtl.css\";i:165;s:23:\"embed/theme-rtl.min.css\";i:166;s:15:\"embed/theme.css\";i:167;s:19:\"embed/theme.min.css\";i:168;s:19:\"file/editor-rtl.css\";i:169;s:23:\"file/editor-rtl.min.css\";i:170;s:15:\"file/editor.css\";i:171;s:19:\"file/editor.min.css\";i:172;s:18:\"file/style-rtl.css\";i:173;s:22:\"file/style-rtl.min.css\";i:174;s:14:\"file/style.css\";i:175;s:18:\"file/style.min.css\";i:176;s:23:\"footnotes/style-rtl.css\";i:177;s:27:\"footnotes/style-rtl.min.css\";i:178;s:19:\"footnotes/style.css\";i:179;s:23:\"footnotes/style.min.css\";i:180;s:23:\"freeform/editor-rtl.css\";i:181;s:27:\"freeform/editor-rtl.min.css\";i:182;s:19:\"freeform/editor.css\";i:183;s:23:\"freeform/editor.min.css\";i:184;s:22:\"gallery/editor-rtl.css\";i:185;s:26:\"gallery/editor-rtl.min.css\";i:186;s:18:\"gallery/editor.css\";i:187;s:22:\"gallery/editor.min.css\";i:188;s:21:\"gallery/style-rtl.css\";i:189;s:25:\"gallery/style-rtl.min.css\";i:190;s:17:\"gallery/style.css\";i:191;s:21:\"gallery/style.min.css\";i:192;s:21:\"gallery/theme-rtl.css\";i:193;s:25:\"gallery/theme-rtl.min.css\";i:194;s:17:\"gallery/theme.css\";i:195;s:21:\"gallery/theme.min.css\";i:196;s:20:\"group/editor-rtl.css\";i:197;s:24:\"group/editor-rtl.min.css\";i:198;s:16:\"group/editor.css\";i:199;s:20:\"group/editor.min.css\";i:200;s:19:\"group/style-rtl.css\";i:201;s:23:\"group/style-rtl.min.css\";i:202;s:15:\"group/style.css\";i:203;s:19:\"group/style.min.css\";i:204;s:19:\"group/theme-rtl.css\";i:205;s:23:\"group/theme-rtl.min.css\";i:206;s:15:\"group/theme.css\";i:207;s:19:\"group/theme.min.css\";i:208;s:21:\"heading/style-rtl.css\";i:209;s:25:\"heading/style-rtl.min.css\";i:210;s:17:\"heading/style.css\";i:211;s:21:\"heading/style.min.css\";i:212;s:19:\"html/editor-rtl.css\";i:213;s:23:\"html/editor-rtl.min.css\";i:214;s:15:\"html/editor.css\";i:215;s:19:\"html/editor.min.css\";i:216;s:20:\"image/editor-rtl.css\";i:217;s:24:\"image/editor-rtl.min.css\";i:218;s:16:\"image/editor.css\";i:219;s:20:\"image/editor.min.css\";i:220;s:19:\"image/style-rtl.css\";i:221;s:23:\"image/style-rtl.min.css\";i:222;s:15:\"image/style.css\";i:223;s:19:\"image/style.min.css\";i:224;s:19:\"image/theme-rtl.css\";i:225;s:23:\"image/theme-rtl.min.css\";i:226;s:15:\"image/theme.css\";i:227;s:19:\"image/theme.min.css\";i:228;s:29:\"latest-comments/style-rtl.css\";i:229;s:33:\"latest-comments/style-rtl.min.css\";i:230;s:25:\"latest-comments/style.css\";i:231;s:29:\"latest-comments/style.min.css\";i:232;s:27:\"latest-posts/editor-rtl.css\";i:233;s:31:\"latest-posts/editor-rtl.min.css\";i:234;s:23:\"latest-posts/editor.css\";i:235;s:27:\"latest-posts/editor.min.css\";i:236;s:26:\"latest-posts/style-rtl.css\";i:237;s:30:\"latest-posts/style-rtl.min.css\";i:238;s:22:\"latest-posts/style.css\";i:239;s:26:\"latest-posts/style.min.css\";i:240;s:18:\"list/style-rtl.css\";i:241;s:22:\"list/style-rtl.min.css\";i:242;s:14:\"list/style.css\";i:243;s:18:\"list/style.min.css\";i:244;s:22:\"loginout/style-rtl.css\";i:245;s:26:\"loginout/style-rtl.min.css\";i:246;s:18:\"loginout/style.css\";i:247;s:22:\"loginout/style.min.css\";i:248;s:19:\"math/editor-rtl.css\";i:249;s:23:\"math/editor-rtl.min.css\";i:250;s:15:\"math/editor.css\";i:251;s:19:\"math/editor.min.css\";i:252;s:18:\"math/style-rtl.css\";i:253;s:22:\"math/style-rtl.min.css\";i:254;s:14:\"math/style.css\";i:255;s:18:\"math/style.min.css\";i:256;s:25:\"media-text/editor-rtl.css\";i:257;s:29:\"media-text/editor-rtl.min.css\";i:258;s:21:\"media-text/editor.css\";i:259;s:25:\"media-text/editor.min.css\";i:260;s:24:\"media-text/style-rtl.css\";i:261;s:28:\"media-text/style-rtl.min.css\";i:262;s:20:\"media-text/style.css\";i:263;s:24:\"media-text/style.min.css\";i:264;s:19:\"more/editor-rtl.css\";i:265;s:23:\"more/editor-rtl.min.css\";i:266;s:15:\"more/editor.css\";i:267;s:19:\"more/editor.min.css\";i:268;s:30:\"navigation-link/editor-rtl.css\";i:269;s:34:\"navigation-link/editor-rtl.min.css\";i:270;s:26:\"navigation-link/editor.css\";i:271;s:30:\"navigation-link/editor.min.css\";i:272;s:29:\"navigation-link/style-rtl.css\";i:273;s:33:\"navigation-link/style-rtl.min.css\";i:274;s:25:\"navigation-link/style.css\";i:275;s:29:\"navigation-link/style.min.css\";i:276;s:33:\"navigation-submenu/editor-rtl.css\";i:277;s:37:\"navigation-submenu/editor-rtl.min.css\";i:278;s:29:\"navigation-submenu/editor.css\";i:279;s:33:\"navigation-submenu/editor.min.css\";i:280;s:25:\"navigation/editor-rtl.css\";i:281;s:29:\"navigation/editor-rtl.min.css\";i:282;s:21:\"navigation/editor.css\";i:283;s:25:\"navigation/editor.min.css\";i:284;s:24:\"navigation/style-rtl.css\";i:285;s:28:\"navigation/style-rtl.min.css\";i:286;s:20:\"navigation/style.css\";i:287;s:24:\"navigation/style.min.css\";i:288;s:23:\"nextpage/editor-rtl.css\";i:289;s:27:\"nextpage/editor-rtl.min.css\";i:290;s:19:\"nextpage/editor.css\";i:291;s:23:\"nextpage/editor.min.css\";i:292;s:24:\"page-list/editor-rtl.css\";i:293;s:28:\"page-list/editor-rtl.min.css\";i:294;s:20:\"page-list/editor.css\";i:295;s:24:\"page-list/editor.min.css\";i:296;s:23:\"page-list/style-rtl.css\";i:297;s:27:\"page-list/style-rtl.min.css\";i:298;s:19:\"page-list/style.css\";i:299;s:23:\"page-list/style.min.css\";i:300;s:24:\"paragraph/editor-rtl.css\";i:301;s:28:\"paragraph/editor-rtl.min.css\";i:302;s:20:\"paragraph/editor.css\";i:303;s:24:\"paragraph/editor.min.css\";i:304;s:23:\"paragraph/style-rtl.css\";i:305;s:27:\"paragraph/style-rtl.min.css\";i:306;s:19:\"paragraph/style.css\";i:307;s:23:\"paragraph/style.min.css\";i:308;s:35:\"post-author-biography/style-rtl.css\";i:309;s:39:\"post-author-biography/style-rtl.min.css\";i:310;s:31:\"post-author-biography/style.css\";i:311;s:35:\"post-author-biography/style.min.css\";i:312;s:30:\"post-author-name/style-rtl.css\";i:313;s:34:\"post-author-name/style-rtl.min.css\";i:314;s:26:\"post-author-name/style.css\";i:315;s:30:\"post-author-name/style.min.css\";i:316;s:25:\"post-author/style-rtl.css\";i:317;s:29:\"post-author/style-rtl.min.css\";i:318;s:21:\"post-author/style.css\";i:319;s:25:\"post-author/style.min.css\";i:320;s:33:\"post-comments-count/style-rtl.css\";i:321;s:37:\"post-comments-count/style-rtl.min.css\";i:322;s:29:\"post-comments-count/style.css\";i:323;s:33:\"post-comments-count/style.min.css\";i:324;s:33:\"post-comments-form/editor-rtl.css\";i:325;s:37:\"post-comments-form/editor-rtl.min.css\";i:326;s:29:\"post-comments-form/editor.css\";i:327;s:33:\"post-comments-form/editor.min.css\";i:328;s:32:\"post-comments-form/style-rtl.css\";i:329;s:36:\"post-comments-form/style-rtl.min.css\";i:330;s:28:\"post-comments-form/style.css\";i:331;s:32:\"post-comments-form/style.min.css\";i:332;s:32:\"post-comments-link/style-rtl.css\";i:333;s:36:\"post-comments-link/style-rtl.min.css\";i:334;s:28:\"post-comments-link/style.css\";i:335;s:32:\"post-comments-link/style.min.css\";i:336;s:26:\"post-content/style-rtl.css\";i:337;s:30:\"post-content/style-rtl.min.css\";i:338;s:22:\"post-content/style.css\";i:339;s:26:\"post-content/style.min.css\";i:340;s:23:\"post-date/style-rtl.css\";i:341;s:27:\"post-date/style-rtl.min.css\";i:342;s:19:\"post-date/style.css\";i:343;s:23:\"post-date/style.min.css\";i:344;s:27:\"post-excerpt/editor-rtl.css\";i:345;s:31:\"post-excerpt/editor-rtl.min.css\";i:346;s:23:\"post-excerpt/editor.css\";i:347;s:27:\"post-excerpt/editor.min.css\";i:348;s:26:\"post-excerpt/style-rtl.css\";i:349;s:30:\"post-excerpt/style-rtl.min.css\";i:350;s:22:\"post-excerpt/style.css\";i:351;s:26:\"post-excerpt/style.min.css\";i:352;s:34:\"post-featured-image/editor-rtl.css\";i:353;s:38:\"post-featured-image/editor-rtl.min.css\";i:354;s:30:\"post-featured-image/editor.css\";i:355;s:34:\"post-featured-image/editor.min.css\";i:356;s:33:\"post-featured-image/style-rtl.css\";i:357;s:37:\"post-featured-image/style-rtl.min.css\";i:358;s:29:\"post-featured-image/style.css\";i:359;s:33:\"post-featured-image/style.min.css\";i:360;s:34:\"post-navigation-link/style-rtl.css\";i:361;s:38:\"post-navigation-link/style-rtl.min.css\";i:362;s:30:\"post-navigation-link/style.css\";i:363;s:34:\"post-navigation-link/style.min.css\";i:364;s:27:\"post-template/style-rtl.css\";i:365;s:31:\"post-template/style-rtl.min.css\";i:366;s:23:\"post-template/style.css\";i:367;s:27:\"post-template/style.min.css\";i:368;s:24:\"post-terms/style-rtl.css\";i:369;s:28:\"post-terms/style-rtl.min.css\";i:370;s:20:\"post-terms/style.css\";i:371;s:24:\"post-terms/style.min.css\";i:372;s:31:\"post-time-to-read/style-rtl.css\";i:373;s:35:\"post-time-to-read/style-rtl.min.css\";i:374;s:27:\"post-time-to-read/style.css\";i:375;s:31:\"post-time-to-read/style.min.css\";i:376;s:24:\"post-title/style-rtl.css\";i:377;s:28:\"post-title/style-rtl.min.css\";i:378;s:20:\"post-title/style.css\";i:379;s:24:\"post-title/style.min.css\";i:380;s:26:\"preformatted/style-rtl.css\";i:381;s:30:\"preformatted/style-rtl.min.css\";i:382;s:22:\"preformatted/style.css\";i:383;s:26:\"preformatted/style.min.css\";i:384;s:24:\"pullquote/editor-rtl.css\";i:385;s:28:\"pullquote/editor-rtl.min.css\";i:386;s:20:\"pullquote/editor.css\";i:387;s:24:\"pullquote/editor.min.css\";i:388;s:23:\"pullquote/style-rtl.css\";i:389;s:27:\"pullquote/style-rtl.min.css\";i:390;s:19:\"pullquote/style.css\";i:391;s:23:\"pullquote/style.min.css\";i:392;s:23:\"pullquote/theme-rtl.css\";i:393;s:27:\"pullquote/theme-rtl.min.css\";i:394;s:19:\"pullquote/theme.css\";i:395;s:23:\"pullquote/theme.min.css\";i:396;s:39:\"query-pagination-numbers/editor-rtl.css\";i:397;s:43:\"query-pagination-numbers/editor-rtl.min.css\";i:398;s:35:\"query-pagination-numbers/editor.css\";i:399;s:39:\"query-pagination-numbers/editor.min.css\";i:400;s:31:\"query-pagination/editor-rtl.css\";i:401;s:35:\"query-pagination/editor-rtl.min.css\";i:402;s:27:\"query-pagination/editor.css\";i:403;s:31:\"query-pagination/editor.min.css\";i:404;s:30:\"query-pagination/style-rtl.css\";i:405;s:34:\"query-pagination/style-rtl.min.css\";i:406;s:26:\"query-pagination/style.css\";i:407;s:30:\"query-pagination/style.min.css\";i:408;s:25:\"query-title/style-rtl.css\";i:409;s:29:\"query-title/style-rtl.min.css\";i:410;s:21:\"query-title/style.css\";i:411;s:25:\"query-title/style.min.css\";i:412;s:25:\"query-total/style-rtl.css\";i:413;s:29:\"query-total/style-rtl.min.css\";i:414;s:21:\"query-total/style.css\";i:415;s:25:\"query-total/style.min.css\";i:416;s:20:\"query/editor-rtl.css\";i:417;s:24:\"query/editor-rtl.min.css\";i:418;s:16:\"query/editor.css\";i:419;s:20:\"query/editor.min.css\";i:420;s:19:\"quote/style-rtl.css\";i:421;s:23:\"quote/style-rtl.min.css\";i:422;s:15:\"quote/style.css\";i:423;s:19:\"quote/style.min.css\";i:424;s:19:\"quote/theme-rtl.css\";i:425;s:23:\"quote/theme-rtl.min.css\";i:426;s:15:\"quote/theme.css\";i:427;s:19:\"quote/theme.min.css\";i:428;s:23:\"read-more/style-rtl.css\";i:429;s:27:\"read-more/style-rtl.min.css\";i:430;s:19:\"read-more/style.css\";i:431;s:23:\"read-more/style.min.css\";i:432;s:18:\"rss/editor-rtl.css\";i:433;s:22:\"rss/editor-rtl.min.css\";i:434;s:14:\"rss/editor.css\";i:435;s:18:\"rss/editor.min.css\";i:436;s:17:\"rss/style-rtl.css\";i:437;s:21:\"rss/style-rtl.min.css\";i:438;s:13:\"rss/style.css\";i:439;s:17:\"rss/style.min.css\";i:440;s:21:\"search/editor-rtl.css\";i:441;s:25:\"search/editor-rtl.min.css\";i:442;s:17:\"search/editor.css\";i:443;s:21:\"search/editor.min.css\";i:444;s:20:\"search/style-rtl.css\";i:445;s:24:\"search/style-rtl.min.css\";i:446;s:16:\"search/style.css\";i:447;s:20:\"search/style.min.css\";i:448;s:20:\"search/theme-rtl.css\";i:449;s:24:\"search/theme-rtl.min.css\";i:450;s:16:\"search/theme.css\";i:451;s:20:\"search/theme.min.css\";i:452;s:24:\"separator/editor-rtl.css\";i:453;s:28:\"separator/editor-rtl.min.css\";i:454;s:20:\"separator/editor.css\";i:455;s:24:\"separator/editor.min.css\";i:456;s:23:\"separator/style-rtl.css\";i:457;s:27:\"separator/style-rtl.min.css\";i:458;s:19:\"separator/style.css\";i:459;s:23:\"separator/style.min.css\";i:460;s:23:\"separator/theme-rtl.css\";i:461;s:27:\"separator/theme-rtl.min.css\";i:462;s:19:\"separator/theme.css\";i:463;s:23:\"separator/theme.min.css\";i:464;s:24:\"shortcode/editor-rtl.css\";i:465;s:28:\"shortcode/editor-rtl.min.css\";i:466;s:20:\"shortcode/editor.css\";i:467;s:24:\"shortcode/editor.min.css\";i:468;s:24:\"site-logo/editor-rtl.css\";i:469;s:28:\"site-logo/editor-rtl.min.css\";i:470;s:20:\"site-logo/editor.css\";i:471;s:24:\"site-logo/editor.min.css\";i:472;s:23:\"site-logo/style-rtl.css\";i:473;s:27:\"site-logo/style-rtl.min.css\";i:474;s:19:\"site-logo/style.css\";i:475;s:23:\"site-logo/style.min.css\";i:476;s:27:\"site-tagline/editor-rtl.css\";i:477;s:31:\"site-tagline/editor-rtl.min.css\";i:478;s:23:\"site-tagline/editor.css\";i:479;s:27:\"site-tagline/editor.min.css\";i:480;s:26:\"site-tagline/style-rtl.css\";i:481;s:30:\"site-tagline/style-rtl.min.css\";i:482;s:22:\"site-tagline/style.css\";i:483;s:26:\"site-tagline/style.min.css\";i:484;s:25:\"site-title/editor-rtl.css\";i:485;s:29:\"site-title/editor-rtl.min.css\";i:486;s:21:\"site-title/editor.css\";i:487;s:25:\"site-title/editor.min.css\";i:488;s:24:\"site-title/style-rtl.css\";i:489;s:28:\"site-title/style-rtl.min.css\";i:490;s:20:\"site-title/style.css\";i:491;s:24:\"site-title/style.min.css\";i:492;s:26:\"social-link/editor-rtl.css\";i:493;s:30:\"social-link/editor-rtl.min.css\";i:494;s:22:\"social-link/editor.css\";i:495;s:26:\"social-link/editor.min.css\";i:496;s:27:\"social-links/editor-rtl.css\";i:497;s:31:\"social-links/editor-rtl.min.css\";i:498;s:23:\"social-links/editor.css\";i:499;s:27:\"social-links/editor.min.css\";i:500;s:26:\"social-links/style-rtl.css\";i:501;s:30:\"social-links/style-rtl.min.css\";i:502;s:22:\"social-links/style.css\";i:503;s:26:\"social-links/style.min.css\";i:504;s:21:\"spacer/editor-rtl.css\";i:505;s:25:\"spacer/editor-rtl.min.css\";i:506;s:17:\"spacer/editor.css\";i:507;s:21:\"spacer/editor.min.css\";i:508;s:20:\"spacer/style-rtl.css\";i:509;s:24:\"spacer/style-rtl.min.css\";i:510;s:16:\"spacer/style.css\";i:511;s:20:\"spacer/style.min.css\";i:512;s:20:\"table/editor-rtl.css\";i:513;s:24:\"table/editor-rtl.min.css\";i:514;s:16:\"table/editor.css\";i:515;s:20:\"table/editor.min.css\";i:516;s:19:\"table/style-rtl.css\";i:517;s:23:\"table/style-rtl.min.css\";i:518;s:15:\"table/style.css\";i:519;s:19:\"table/style.min.css\";i:520;s:19:\"table/theme-rtl.css\";i:521;s:23:\"table/theme-rtl.min.css\";i:522;s:15:\"table/theme.css\";i:523;s:19:\"table/theme.min.css\";i:524;s:24:\"tag-cloud/editor-rtl.css\";i:525;s:28:\"tag-cloud/editor-rtl.min.css\";i:526;s:20:\"tag-cloud/editor.css\";i:527;s:24:\"tag-cloud/editor.min.css\";i:528;s:23:\"tag-cloud/style-rtl.css\";i:529;s:27:\"tag-cloud/style-rtl.min.css\";i:530;s:19:\"tag-cloud/style.css\";i:531;s:23:\"tag-cloud/style.min.css\";i:532;s:28:\"template-part/editor-rtl.css\";i:533;s:32:\"template-part/editor-rtl.min.css\";i:534;s:24:\"template-part/editor.css\";i:535;s:28:\"template-part/editor.min.css\";i:536;s:27:\"template-part/theme-rtl.css\";i:537;s:31:\"template-part/theme-rtl.min.css\";i:538;s:23:\"template-part/theme.css\";i:539;s:27:\"template-part/theme.min.css\";i:540;s:24:\"term-count/style-rtl.css\";i:541;s:28:\"term-count/style-rtl.min.css\";i:542;s:20:\"term-count/style.css\";i:543;s:24:\"term-count/style.min.css\";i:544;s:30:\"term-description/style-rtl.css\";i:545;s:34:\"term-description/style-rtl.min.css\";i:546;s:26:\"term-description/style.css\";i:547;s:30:\"term-description/style.min.css\";i:548;s:23:\"term-name/style-rtl.css\";i:549;s:27:\"term-name/style-rtl.min.css\";i:550;s:19:\"term-name/style.css\";i:551;s:23:\"term-name/style.min.css\";i:552;s:28:\"term-template/editor-rtl.css\";i:553;s:32:\"term-template/editor-rtl.min.css\";i:554;s:24:\"term-template/editor.css\";i:555;s:28:\"term-template/editor.min.css\";i:556;s:27:\"term-template/style-rtl.css\";i:557;s:31:\"term-template/style-rtl.min.css\";i:558;s:23:\"term-template/style.css\";i:559;s:27:\"term-template/style.min.css\";i:560;s:27:\"text-columns/editor-rtl.css\";i:561;s:31:\"text-columns/editor-rtl.min.css\";i:562;s:23:\"text-columns/editor.css\";i:563;s:27:\"text-columns/editor.min.css\";i:564;s:26:\"text-columns/style-rtl.css\";i:565;s:30:\"text-columns/style-rtl.min.css\";i:566;s:22:\"text-columns/style.css\";i:567;s:26:\"text-columns/style.min.css\";i:568;s:19:\"verse/style-rtl.css\";i:569;s:23:\"verse/style-rtl.min.css\";i:570;s:15:\"verse/style.css\";i:571;s:19:\"verse/style.min.css\";i:572;s:20:\"video/editor-rtl.css\";i:573;s:24:\"video/editor-rtl.min.css\";i:574;s:16:\"video/editor.css\";i:575;s:20:\"video/editor.min.css\";i:576;s:19:\"video/style-rtl.css\";i:577;s:23:\"video/style-rtl.min.css\";i:578;s:15:\"video/style.css\";i:579;s:19:\"video/style.min.css\";i:580;s:19:\"video/theme-rtl.css\";i:581;s:23:\"video/theme-rtl.min.css\";i:582;s:15:\"video/theme.css\";i:583;s:19:\"video/theme.min.css\";}}','on'),
(125,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1772098110;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:3:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"5.6\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:53:\"http://downloads.wordpress.org/plugin/akismet.5.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463\";s:2:\"1x\";s:60:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/akismet/assets/banner-1544x500.png?rev=2900731\";s:2:\"1x\";s:62:\"https://ps.w.org/akismet/assets/banner-772x250.png?rev=2900731\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"6.1.5\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:62:\"http://downloads.wordpress.org/plugin/contact-form-7.6.1.5.zip\";s:5:\"icons\";a:2:{s:2:\"1x\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";s:3:\"svg\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"6.7\";}s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:59:\"http://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}}s:7:\"checked\";a:3:{s:19:\"akismet/akismet.php\";s:3:\"5.6\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"6.1.5\";s:9:\"hello.php\";s:5:\"1.7.2\";}}','off'),
(126,'_site_transient_timeout_theme_roots','1771996113','off'),
(127,'_site_transient_theme_roots','a:5:{s:5:\"astra\";s:7:\"/themes\";s:15:\"idotinfra-theme\";s:7:\"/themes\";s:16:\"twentytwentyfive\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";}','off'),
(128,'_transient_doing_cron','1773733348.3669741153717041015625','on'),
(129,'theme_mods_twentytwentyfive','a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1771994314;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}','off'),
(130,'current_theme','I-Dot Infra Theme','auto'),
(131,'theme_switched','','auto'),
(136,'theme_mods_idotinfra-theme','a:3:{s:18:\"custom_css_post_id\";i:-1;s:20:\"idotinfra_hero_image\";s:66:\"http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/hero-building.jpg\";s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:2;}}','auto'),
(137,'wp_calendar_block_has_published_posts','1','auto'),
(138,'site_logo','12','auto'),
(139,'_site_transient_update_themes','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1771994329;s:7:\"checked\";a:5:{s:5:\"astra\";s:6:\"4.12.3\";s:15:\"idotinfra-theme\";s:5:\"1.0.0\";s:16:\"twentytwentyfive\";s:3:\"1.4\";s:16:\"twentytwentyfour\";s:3:\"1.4\";s:17:\"twentytwentythree\";s:3:\"1.6\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:4:{s:5:\"astra\";a:6:{s:5:\"theme\";s:5:\"astra\";s:11:\"new_version\";s:6:\"4.12.3\";s:3:\"url\";s:35:\"https://wordpress.org/themes/astra/\";s:7:\"package\";s:53:\"http://downloads.wordpress.org/theme/astra.4.12.3.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.3\";}s:16:\"twentytwentyfive\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfive\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfive/\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/theme/twentytwentyfive.1.4.zip\";s:8:\"requires\";s:3:\"6.7\";s:12:\"requires_php\";s:3:\"7.2\";}s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:61:\"http://downloads.wordpress.org/theme/twentytwentyfour.1.4.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:62:\"http://downloads.wordpress.org/theme/twentytwentythree.1.6.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}','off'),
(140,'wpcf7','a:1:{s:7:\"version\";s:5:\"6.1.5\";}','auto'),
(141,'astra-settings','a:2:{s:18:\"theme-auto-version\";s:6:\"4.12.3\";s:22:\"is_theme_queue_running\";b:0;}','auto'),
(143,'_transient_wp_styles_for_blocks','a:2:{s:4:\"hash\";s:32:\"3199e2537fbad380fa221e097719f7c6\";s:6:\"blocks\";a:6:{s:11:\"core/button\";s:0:\"\";s:14:\"core/site-logo\";s:0:\"\";s:18:\"core/post-template\";s:0:\"\";s:18:\"core/term-template\";s:0:\"\";s:12:\"core/columns\";s:0:\"\";s:14:\"core/pullquote\";s:69:\":root :where(.wp-block-pullquote){font-size: 1.5em;line-height: 1.6;}\";}}','on'),
(159,'bsf_usage_migrated','1','off'),
(180,'_transient_is_multi_author','0','on'),
(191,'_site_transient_timeout_wp_theme_files_patterns-cb55973370f7d308bc9e7a41ab7154b2','1773735148','off'),
(192,'_site_transient_wp_theme_files_patterns-cb55973370f7d308bc9e7a41ab7154b2','a:2:{s:7:\"version\";s:5:\"1.0.0\";s:8:\"patterns\";a:0:{}}','off'),
(193,'_site_transient_timeout_wp_theme_files_patterns-bcf70849d4b9b932360d3029c53c6af3','1773735148','off'),
(194,'_site_transient_wp_theme_files_patterns-bcf70849d4b9b932360d3029c53c6af3','a:2:{s:7:\"version\";s:6:\"4.12.3\";s:8:\"patterns\";a:0:{}}','off'),
(195,'_transient_timeout_astra-theme-cron-test-ok','1773736948','off'),
(196,'_transient_astra-theme-cron-test-ok','1','off');
/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES
(3,5,'_wp_page_template','page-about.php'),
(4,6,'_wp_page_template','page-projects.php'),
(13,9,'_menu_item_type','post_type'),
(14,9,'_menu_item_menu_item_parent','0'),
(15,9,'_menu_item_object_id','5'),
(16,9,'_menu_item_object','page'),
(17,9,'_menu_item_target',''),
(18,9,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(19,9,'_menu_item_xfn',''),
(20,9,'_menu_item_url',''),
(21,10,'_menu_item_type','post_type'),
(22,10,'_menu_item_menu_item_parent','0'),
(23,10,'_menu_item_object_id','6'),
(24,10,'_menu_item_object','page'),
(25,10,'_menu_item_target',''),
(26,10,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(27,10,'_menu_item_xfn',''),
(28,10,'_menu_item_url',''),
(29,11,'_menu_item_type','post_type'),
(30,11,'_menu_item_menu_item_parent','0'),
(31,11,'_menu_item_object_id','7'),
(32,11,'_menu_item_object','page'),
(33,11,'_menu_item_target',''),
(34,11,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(35,11,'_menu_item_xfn',''),
(36,11,'_menu_item_url',''),
(37,12,'_wp_attached_file','2026/02/logo.jpg'),
(38,12,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1024;s:6:\"height\";i:585;s:4:\"file\";s:16:\"2026/02/logo.jpg\";s:8:\"filesize\";i:24875;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:16:\"logo-300x171.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4552;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:16:\"logo-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3569;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:16:\"logo-768x439.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:439;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:13773;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(39,13,'_hash','79332ba2bbdbec785385014707f2af963d99ebe9224c7c7a7377e9fdc469d265'),
(40,15,'project_type','2 Blocks Residential Apartment'),
(41,15,'project_location','Station Road, Saheb Bagan, Bhadreswar, Hooghly'),
(42,15,'project_config','2 BHK'),
(43,15,'project_area','635 - 893 sq. ft.'),
(44,15,'project_status','Completed'),
(45,15,'project_proximity','Less than 1 minute from Bhadreswar Station | Less than 6 km from Chandannagar'),
(46,15,'project_amenities','2 BHK Flats,Verandah in All Flats,Well Ventilated Flats,Commercial Space at Ground Floor,Pollution Free Environment,Well Decorated Entrance and Lobby,Well Lit Paved Drive Ways & Path Ways,Water Proofing Treatment on Terrace,24 hrs Water Supply,Quality Elevators,Beautiful Temple,Bar-B-Q at Roof-Top,Cable/DTH Wiring,Broadband/Telephone Line,24 hrs Security with CCTV,Four & Two Wheeler Parking,Well Lit Rooftop with Canopy & Sitting Arrangement'),
(47,15,'project_specs','Foundation:RCC Foundation,Walls:External - Brickwall with Cement Plaster and Paint | Internal - Brickwall with POP Finish,Flooring:Marble / Tiles Flooring,Windows:Aluminium Sliding Windows with Glass Panels and Iron Grill,Doors:Wooden Frame with Flushed Door Shutters,Kitchen:Black Stone Cooking Platform | 2 Tiles above Cooking Platform | 1 Stainless Steel Sink,Bathroom:PVC Door with Frame | PVC Pipe of Reputed Brand | Indian/Western Commode with Polythene Cistern | 1 Wash Basin Shower Rose and 2 CP Bib Cock,Electrical:Concealed Copper Wiring with Fittings & Switches of Reputed Brand'),
(48,16,'project_type','Residential and Commercial Apartment'),
(49,16,'project_location','Library Road, Bhadreswar, Hooghly'),
(50,16,'project_config','2 BHK & 3 BHK'),
(51,16,'project_area','703 - 1075 sq. ft.'),
(52,16,'project_status','Completed'),
(53,16,'project_proximity','5 minutes from Bhadreswar Station | Less than 6 km from Chandannagar'),
(54,16,'project_amenities','2 BHK and 3 BHK Flats,Verandah in All Flats,Well Ventilated Flats,Community Hall,Lift,Security System,Open Terrace,Car Parking,Water Proofing Treatment on Terrace,24 hrs Water Supply,24 hrs Security'),
(55,16,'project_specs','Foundation:RCC Foundation,Walls:External - Brickwall with Cement Plaster and Paint | Internal - Brickwall with POP Finish,Flooring:Marble / Tiles Flooring,Windows:Aluminium Sliding Windows with Glass Panels and Iron Grill,Doors:Wooden Frame with Flushed Door Shutters,Kitchen:Black Stone Cooking Platform | 2 Tiles above Cooking Platform | 1 Stainless Steel Sink,Bathroom:PVC Door with Frame | PVC Pipe of Reputed Brand | Indian/Western Commode with Polythene Cistern | 1 Wash Basin Shower Rose and 2 CP Bib Cock,Electrical:Concealed Copper Wiring with Fittings & Switches of Reputed Brand'),
(56,17,'project_type','Residential Apartment'),
(57,17,'project_location','Bhadreswar, Hooghly'),
(58,17,'project_config','Details coming soon'),
(59,17,'project_area','Details coming soon'),
(60,17,'project_status','Completed'),
(61,17,'project_proximity','Near Bhadreswar, Hooghly'),
(62,18,'project_type','Residential Apartment'),
(63,18,'project_location','R.K.B. Sarani, Mankundu, Bhadreswar, Hooghly'),
(64,18,'project_config','2 BHK'),
(65,18,'project_area','681 - 725 sq. ft.'),
(66,18,'project_status','Completed'),
(67,18,'project_proximity','2 minutes from Bhadreswar Railway Station'),
(68,18,'project_amenities','1 BHK Well Ventilated Flats,Verandah in All Flats,Well Lit Rooftop with Canopy,Well Decorated Entrance and Lobby,Water Proofing Treatment on Terrace,Beautiful Temple,Bar-B-Q at Roof-Top,24 hrs Security,24 hrs Water Supply,Four & Two Wheeler Parking'),
(69,18,'project_specs','Foundation:RCC Foundation,Walls:External - Brickwall with Cement Plaster and Paint | Internal - Brickwall with POP Finish,Flooring:Marble / Tiles Flooring,Windows:Aluminium Sliding Windows with Glass Panels and Iron Grill,Doors:Wooden Frame with Flushed Door Shutters,Kitchen:Black Stone Cooking Platform | 2 Tiles above Cooking Platform | 1 Stainless Steel Sink,Toilet:PVC Door | CP Bib Cock of Reputed Brand | Wash Basin | Western Commode with Polythene Cistern,Electrical:Concealed Copper Wiring with Fittings & Switches of Reputed Brand,Water Supply:24 hrs Water Supply through Deep Tubewell and Storage Tank'),
(70,19,'_menu_item_type','post_type'),
(71,19,'_menu_item_menu_item_parent','23'),
(72,19,'_menu_item_object_id','15'),
(73,19,'_menu_item_object','project'),
(74,19,'_menu_item_target',''),
(75,19,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(76,19,'_menu_item_xfn',''),
(77,19,'_menu_item_url',''),
(78,20,'_menu_item_type','post_type'),
(79,20,'_menu_item_menu_item_parent','23'),
(80,20,'_menu_item_object_id','16'),
(81,20,'_menu_item_object','project'),
(82,20,'_menu_item_target',''),
(83,20,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(84,20,'_menu_item_xfn',''),
(85,20,'_menu_item_url',''),
(86,21,'_menu_item_type','post_type'),
(87,21,'_menu_item_menu_item_parent','23'),
(88,21,'_menu_item_object_id','17'),
(89,21,'_menu_item_object','project'),
(90,21,'_menu_item_target',''),
(91,21,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(92,21,'_menu_item_xfn',''),
(93,21,'_menu_item_url',''),
(94,22,'_menu_item_type','post_type'),
(95,22,'_menu_item_menu_item_parent','23'),
(96,22,'_menu_item_object_id','18'),
(97,22,'_menu_item_object','project'),
(98,22,'_menu_item_target',''),
(99,22,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
(100,22,'_menu_item_xfn',''),
(101,22,'_menu_item_url',''),
(102,23,'_menu_item_type','custom'),
(103,23,'_menu_item_menu_item_parent','10'),
(104,23,'_menu_item_object_id','23'),
(105,23,'_menu_item_object','custom'),
(106,23,'_menu_item_target',''),
(107,23,'_menu_item_classes','a:1:{i:0;s:10:\"menu-label\";}'),
(108,23,'_menu_item_xfn',''),
(109,23,'_menu_item_url','#'),
(110,19,'_wp_old_date','2026-02-25'),
(111,20,'_wp_old_date','2026-02-25'),
(112,21,'_wp_old_date','2026-02-25'),
(113,22,'_wp_old_date','2026-02-25'),
(114,24,'_menu_item_type','custom'),
(115,24,'_menu_item_menu_item_parent','10'),
(116,24,'_menu_item_object_id','24'),
(117,24,'_menu_item_object','custom'),
(118,24,'_menu_item_target',''),
(119,24,'_menu_item_classes','a:1:{i:0;s:10:\"menu-label\";}'),
(120,24,'_menu_item_xfn',''),
(121,24,'_menu_item_url','#'),
(123,9,'_wp_old_date','2026-02-25'),
(124,10,'_wp_old_date','2026-02-25'),
(125,11,'_wp_old_date','2026-02-25'),
(126,25,'_wp_attached_file','2026/02/hero-banner.jpg'),
(127,25,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:600;s:4:\"file\";s:23:\"2026/02/hero-banner.jpg\";s:8:\"filesize\";i:58227;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:23:\"hero-banner-300x150.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8693;}s:5:\"large\";a:5:{s:4:\"file\";s:24:\"hero-banner-1024x512.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:53568;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:23:\"hero-banner-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5309;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:23:\"hero-banner-768x384.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:384;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:34546;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 319\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 319\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(128,26,'_wp_attached_file','2026/02/project-shakuntala.jpg'),
(129,26,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:600;s:4:\"file\";s:30:\"2026/02/project-shakuntala.jpg\";s:8:\"filesize\";i:72111;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:30:\"project-shakuntala-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:12946;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:30:\"project-shakuntala-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5043;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:30:\"project-shakuntala-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:74825;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 612\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 612\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(130,27,'_wp_attached_file','2026/02/project-anupama.jpg'),
(131,27,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:600;s:4:\"file\";s:27:\"2026/02/project-anupama.jpg\";s:8:\"filesize\";i:50996;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:27:\"project-anupama-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11440;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:27:\"project-anupama-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4644;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:27:\"project-anupama-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:53721;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 297\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 297\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(132,28,'_wp_attached_file','2026/02/project-vishnupriya.jpg'),
(133,28,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:600;s:4:\"file\";s:31:\"2026/02/project-vishnupriya.jpg\";s:8:\"filesize\";i:35123;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:31:\"project-vishnupriya-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8154;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:31:\"project-vishnupriya-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3301;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:31:\"project-vishnupriya-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:37821;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 194\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 194\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(134,29,'_wp_attached_file','2026/02/project-bhitikavilla.jpg'),
(135,29,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:800;s:6:\"height\";i:600;s:4:\"file\";s:32:\"2026/02/project-bhitikavilla.jpg\";s:8:\"filesize\";i:39016;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:32:\"project-bhitikavilla-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8542;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:32:\"project-bhitikavilla-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3590;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:32:\"project-bhitikavilla-768x576.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:41840;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 421\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 421\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(136,17,'_thumbnail_id','28'),
(137,18,'_thumbnail_id','29'),
(138,16,'_thumbnail_id','27'),
(139,15,'_thumbnail_id','26'),
(140,33,'_wp_attached_file','2026/02/shak-1.jpg'),
(141,33,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/shak-1.jpg\";s:8:\"filesize\";i:59959;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"shak-1-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:10230;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"shak-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4940;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"shak-1-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:50831;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 621\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 621\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(142,34,'_wp_attached_file','2026/02/shak-2.jpg'),
(143,34,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/shak-2.jpg\";s:8:\"filesize\";i:37707;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"shak-2-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7266;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"shak-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3589;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"shak-2-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:33879;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 583\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 583\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(144,35,'_wp_attached_file','2026/02/shak-3.jpg'),
(145,35,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/shak-3.jpg\";s:8:\"filesize\";i:99040;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"shak-3-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:19004;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"shak-3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8231;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"shak-3-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:86458;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 161\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 161\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(146,36,'_wp_attached_file','2026/02/shak-4.jpg'),
(147,36,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/shak-4.jpg\";s:8:\"filesize\";i:65269;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"shak-4-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11076;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"shak-4-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4991;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"shak-4-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:56387;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 468\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 468\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(148,37,'_wp_attached_file','2026/02/shak-5.jpg'),
(149,37,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/shak-5.jpg\";s:8:\"filesize\";i:51638;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"shak-5-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:12168;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"shak-5-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6562;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"shak-5-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:47463;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 580\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 580\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(150,38,'_wp_attached_file','2026/02/shak-6.jpg'),
(151,38,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/shak-6.jpg\";s:8:\"filesize\";i:70541;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"shak-6-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:13677;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"shak-6-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6824;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"shak-6-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:61543;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 785\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 785\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(152,39,'_wp_attached_file','2026/02/shak-7.jpg'),
(153,39,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/shak-7.jpg\";s:8:\"filesize\";i:61307;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"shak-7-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9128;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"shak-7-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4366;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"shak-7-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:50117;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 936\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 936\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(154,15,'project_gallery','33,34,35,36,37,38,39'),
(155,40,'_wp_attached_file','2026/02/anup-1.jpg'),
(156,40,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/anup-1.jpg\";s:8:\"filesize\";i:78047;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"anup-1-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:12170;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"anup-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4950;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"anup-1-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:66092;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 890\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 890\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(157,41,'_wp_attached_file','2026/02/anup-2.jpg'),
(158,41,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/anup-2.jpg\";s:8:\"filesize\";i:33196;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"anup-2-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7717;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"anup-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3935;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"anup-2-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:31164;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 661\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 661\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(159,42,'_wp_attached_file','2026/02/anup-3.jpg'),
(160,42,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/anup-3.jpg\";s:8:\"filesize\";i:36323;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"anup-3-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8445;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"anup-3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3872;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"anup-3-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:33894;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:15:\"Picsum ID: 1056\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:15:\"Picsum ID: 1056\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(161,43,'_wp_attached_file','2026/02/anup-4.jpg'),
(162,43,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/anup-4.jpg\";s:8:\"filesize\";i:72579;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"anup-4-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11953;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"anup-4-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5312;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"anup-4-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:61006;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 675\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 675\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(163,44,'_wp_attached_file','2026/02/vish-1.jpg'),
(164,44,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/vish-1.jpg\";s:8:\"filesize\";i:93855;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"vish-1-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14567;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"vish-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5697;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"vish-1-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:77705;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 905\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 905\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(165,45,'_wp_attached_file','2026/02/anup-5.jpg'),
(166,45,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/anup-5.jpg\";s:8:\"filesize\";i:26050;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"anup-5-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4984;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"anup-5-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:2693;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"anup-5-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:23287;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 310\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 310\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(167,46,'_wp_attached_file','2026/02/vish-2.jpg'),
(168,46,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/vish-2.jpg\";s:8:\"filesize\";i:65050;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"vish-2-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11293;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"vish-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5127;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"vish-2-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:56113;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 142\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 142\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(169,47,'_wp_attached_file','2026/02/anup-6.jpg'),
(170,47,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/anup-6.jpg\";s:8:\"filesize\";i:129253;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"anup-6-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:17742;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"anup-6-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7530;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"anup-6-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:105055;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 571\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 571\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(171,48,'_wp_attached_file','2026/02/vish-3.jpg'),
(172,48,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/vish-3.jpg\";s:8:\"filesize\";i:63325;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"vish-3-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9253;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"vish-3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4085;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"vish-3-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:49915;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 620\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 620\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(173,49,'_wp_attached_file','2026/02/bhit-1.jpg'),
(174,49,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/bhit-1.jpg\";s:8:\"filesize\";i:138364;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"bhit-1-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:17538;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"bhit-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6824;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"bhit-1-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:111513;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 640\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 640\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(175,50,'_wp_attached_file','2026/02/anup-7.jpg'),
(176,50,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/anup-7.jpg\";s:8:\"filesize\";i:52310;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"anup-7-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9127;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"anup-7-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4031;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"anup-7-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:44680;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 477\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 477\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(177,51,'_wp_attached_file','2026/02/vish-4.jpg'),
(178,51,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/vish-4.jpg\";s:8:\"filesize\";i:52103;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"vish-4-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:10544;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"vish-4-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4789;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"vish-4-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:46132;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 430\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 430\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(179,52,'_wp_attached_file','2026/02/bhit-2.jpg'),
(180,52,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/bhit-2.jpg\";s:8:\"filesize\";i:16439;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"bhit-2-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3379;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"bhit-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:1787;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"bhit-2-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:15098;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 926\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 926\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(181,16,'project_gallery','40,41,42,43,45,47,50'),
(182,53,'_wp_attached_file','2026/02/vish-5.jpg'),
(183,53,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/vish-5.jpg\";s:8:\"filesize\";i:105910;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"vish-5-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:16146;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"vish-5-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6742;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"vish-5-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:86607;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 133\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 133\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(184,54,'_wp_attached_file','2026/02/bhit-3.jpg'),
(185,54,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/bhit-3.jpg\";s:8:\"filesize\";i:33275;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"bhit-3-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7021;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"bhit-3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3505;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"bhit-3-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:30113;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 875\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 875\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(186,55,'_wp_attached_file','2026/02/vish-6.jpg'),
(187,55,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/vish-6.jpg\";s:8:\"filesize\";i:46503;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"vish-6-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9064;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"vish-6-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4128;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"vish-6-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:41626;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:15:\"Picsum ID: 1001\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:15:\"Picsum ID: 1001\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(188,56,'_wp_attached_file','2026/02/bhit-4.jpg'),
(189,56,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/bhit-4.jpg\";s:8:\"filesize\";i:81269;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"bhit-4-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11287;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"bhit-4-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5047;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"bhit-4-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:65047;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 182\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 182\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(190,57,'_wp_attached_file','2026/02/vish-7.jpg'),
(191,57,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/vish-7.jpg\";s:8:\"filesize\";i:114994;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"vish-7-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:17905;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"vish-7-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7703;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"vish-7-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:95972;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 585\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 585\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(192,58,'_wp_attached_file','2026/02/bhit-5.jpg'),
(193,58,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/bhit-5.jpg\";s:8:\"filesize\";i:81449;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"bhit-5-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14303;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"bhit-5-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6193;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"bhit-5-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:70040;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 492\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 492\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(194,17,'project_gallery','44,46,48,51,53,55,57'),
(195,59,'_wp_attached_file','2026/02/bhit-6.jpg'),
(196,59,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/bhit-6.jpg\";s:8:\"filesize\";i:74892;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"bhit-6-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:15036;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"bhit-6-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6182;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"bhit-6-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:65836;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 274\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 274\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(197,60,'_wp_attached_file','2026/02/bhit-7.jpg'),
(198,60,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:900;s:6:\"height\";i:600;s:4:\"file\";s:18:\"2026/02/bhit-7.jpg\";s:8:\"filesize\";i:75757;s:5:\"sizes\";a:3:{s:6:\"medium\";a:5:{s:4:\"file\";s:18:\"bhit-7-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:15798;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:18:\"bhit-7-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7483;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:18:\"bhit-7-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:68405;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:14:\"Picsum ID: 340\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:14:\"Picsum ID: 340\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(199,18,'project_gallery','49,52,54,56,58,59,60'),
(200,61,'_wp_attached_file','2026/02/hero-building.jpg'),
(201,61,'_wp_attachment_metadata','a:6:{s:5:\"width\";i:1400;s:6:\"height\";i:700;s:4:\"file\";s:25:\"2026/02/hero-building.jpg\";s:8:\"filesize\";i:214913;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:25:\"hero-building-300x150.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:11617;}s:5:\"large\";a:5:{s:4:\"file\";s:26:\"hero-building-1024x512.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:126352;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:25:\"hero-building-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5716;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:25:\"hero-building-768x384.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:384;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:70309;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:13:\"Picsum ID: 93\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:13:\"Picsum ID: 93\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(202,13,'_form','<div class=\"idot-contact-row\">\n<div class=\"idot-contact-col\">\n<label>Your Name <span class=\"required\">*</span>\n    [text* your-name autocomplete:name placeholder \"Your full name\"] </label>\n</div>\n<div class=\"idot-contact-col\">\n<label>Your Email <span class=\"required\">*</span>\n    [email* your-email autocomplete:email placeholder \"Your email address\"] </label>\n</div>\n</div>\n\n<div class=\"idot-contact-row\">\n<div class=\"idot-contact-col\">\n<label>Phone Number <span class=\"required\">*</span>\n    [tel* your-phone autocomplete:tel placeholder \"Your phone number\"] </label>\n</div>\n<div class=\"idot-contact-col\">\n<label>Interested Project\n    [select project first_as_label \"Select a Project\" \"Shakuntala\" \"Anupama\" \"VishnuPriya\" \"BhitikaVilla\" \"Other\"] </label>\n</div>\n</div>\n\n<label>Your Message\n    [textarea your-message placeholder \"Tell us what you are looking for...\"] </label>\n\n[submit \"Send Enquiry\"]'),
(203,13,'_mail','a:8:{s:7:\"subject\";s:42:\"[_site_title] New Enquiry from [your-name]\";s:6:\"sender\";s:35:\"[_site_title] <admin@idotinfra.com>\";s:4:\"body\";s:175:\"Name: [your-name]\nEmail: [your-email]\nPhone: [your-phone]\nInterested Project: [project]\n\nMessage:\n[your-message]\n\n--\nThis enquiry was submitted on [_site_title] ([_site_url]).\";s:9:\"recipient\";s:19:\"[_site_admin_email]\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(204,13,'_mail_2','a:0:{}'),
(205,13,'_messages','a:23:{s:12:\"mail_sent_ok\";s:60:\"Thank you for your enquiry! We will get back to you shortly.\";s:12:\"mail_sent_ng\";s:64:\"There was an error sending your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:64:\"There was an error sending your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:27:\"Please fill out this field.\";s:16:\"invalid_too_long\";s:32:\"This field has a too long input.\";s:17:\"invalid_too_short\";s:33:\"This field has a too short input.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:31:\"The uploaded file is too large.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";s:12:\"invalid_date\";s:41:\"Please enter a date in YYYY-MM-DD format.\";s:14:\"date_too_early\";s:32:\"This field has a too early date.\";s:13:\"date_too_late\";s:31:\"This field has a too late date.\";s:14:\"invalid_number\";s:22:\"Please enter a number.\";s:16:\"number_too_small\";s:34:\"This field has a too small number.\";s:16:\"number_too_large\";s:34:\"This field has a too large number.\";s:23:\"quiz_answer_not_correct\";s:36:\"The answer to the quiz is incorrect.\";s:17:\"captcha_not_match\";s:31:\"Your entered code is incorrect.\";s:13:\"invalid_email\";s:30:\"Please enter an email address.\";s:11:\"invalid_url\";s:19:\"Please enter a URL.\";s:11:\"invalid_tel\";s:32:\"Please enter a telephone number.\";}'),
(206,13,'_additional_settings','');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `type_status_author` (`post_type`,`post_status`,`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES
(4,0,'2026-02-25 10:08:37','2026-02-25 04:38:37','','Home','','publish','closed','closed','','home','','','2026-02-25 10:08:37','2026-02-25 04:38:37','',0,'http://idotinfra.infinityfreeapp.me/?page_id=4',0,'page','',0),
(5,0,'2026-02-25 10:08:37','2026-02-25 04:38:37','','About Us','','publish','closed','closed','','about-us','','','2026-02-25 10:08:37','2026-02-25 04:38:37','',0,'http://idotinfra.infinityfreeapp.me/?page_id=5',0,'page','',0),
(6,0,'2026-02-25 10:08:37','2026-02-25 04:38:37','','Projects','','publish','closed','closed','','projects','','','2026-02-25 10:08:37','2026-02-25 04:38:37','',0,'http://idotinfra.infinityfreeapp.me/?page_id=6',0,'page','',0),
(7,0,'2026-02-25 10:08:38','2026-02-25 04:38:38','<h2>Get In Touch</h2>\n<p>We would love to hear from you! Whether you are interested in one of our projects, have questions about availability, or just want to know more about I-Dot Infra, please fill out the form below or reach us directly.</p>\n\n[contact-form-7 id=\"13\" title=\"Contact Form\"]\n\n<div style=\"margin-top:40px;\">\n<h3>Contact Information</h3>\n<p><strong>Address:</strong> Bhadreswar, Hooghly, West Bengal, India</p>\n<p><strong>Phone:</strong> +91 99999 99999</p>\n<p><strong>Email:</strong> info@idotinfra.com</p>\n</div>','Contact Us','','publish','closed','closed','','contact-us','','','2026-02-25 10:08:41','2026-02-25 04:38:41','',0,'http://idotinfra.infinityfreeapp.me/?page_id=7',0,'page','',0),
(9,0,'2026-02-26 12:33:46','2026-02-25 04:38:40',' ','','','publish','closed','closed','','9','','','2026-02-26 12:33:46','2026-02-26 07:03:46','',0,'http://idotinfra.infinityfreeapp.me/9/',1,'nav_menu_item','',0),
(10,0,'2026-02-26 12:33:46','2026-02-25 04:38:40',' ','','','publish','closed','closed','','10','','','2026-02-26 12:33:46','2026-02-26 07:03:46','',0,'http://idotinfra.infinityfreeapp.me/10/',2,'nav_menu_item','',0),
(11,0,'2026-02-26 12:33:48','2026-02-25 04:38:40',' ','','','publish','closed','closed','','11','','','2026-02-26 12:33:48','2026-02-26 07:03:48','',0,'http://idotinfra.infinityfreeapp.me/11/',9,'nav_menu_item','',0),
(12,0,'2026-02-25 10:08:40','2026-02-25 04:38:40','','I-Dot Infra Logo','','inherit','open','closed','','i-dot-infra-logo','','','2026-02-25 10:08:40','2026-02-25 04:38:40','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/logo.jpg',0,'attachment','image/jpeg',0),
(13,0,'2026-02-25 10:08:41','2026-02-25 04:38:41','<div class=\"idot-contact-row\">\n<div class=\"idot-contact-col\">\n<label>Your Name <span class=\"required\">*</span>\n    [text* your-name autocomplete:name placeholder \"Your full name\"] </label>\n</div>\n<div class=\"idot-contact-col\">\n<label>Your Email <span class=\"required\">*</span>\n    [email* your-email autocomplete:email placeholder \"Your email address\"] </label>\n</div>\n</div>\n\n<div class=\"idot-contact-row\">\n<div class=\"idot-contact-col\">\n<label>Phone Number <span class=\"required\">*</span>\n    [tel* your-phone autocomplete:tel placeholder \"Your phone number\"] </label>\n</div>\n<div class=\"idot-contact-col\">\n<label>Interested Project\n    [select project first_as_label \"Select a Project\" \"Shakuntala\" \"Anupama\" \"VishnuPriya\" \"BhitikaVilla\" \"Other\"] </label>\n</div>\n</div>\n\n<label>Your Message\n    [textarea your-message placeholder \"Tell us what you are looking for...\"] </label>\n\n[submit \"Send Enquiry\"]\n[_site_title] New Enquiry from [your-name]\n[_site_title] <admin@idotinfra.com>\nName: [your-name]\nEmail: [your-email]\nPhone: [your-phone]\nInterested Project: [project]\n\nMessage:\n[your-message]\n\n--\nThis enquiry was submitted on [_site_title] ([_site_url]).\n[_site_admin_email]\nReply-To: [your-email]\n\n0\n0\nThank you for your enquiry! We will get back to you shortly.\nThere was an error sending your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error sending your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nPlease fill out this field.\nThis field has a too long input.\nThis field has a too short input.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe uploaded file is too large.\nThere was an error uploading the file.\nPlease enter a date in YYYY-MM-DD format.\nThis field has a too early date.\nThis field has a too late date.\nPlease enter a number.\nThis field has a too small number.\nThis field has a too large number.\nThe answer to the quiz is incorrect.\nYour entered code is incorrect.\nPlease enter an email address.\nPlease enter a URL.\nPlease enter a telephone number.','Contact Form','','publish','closed','closed','','contact-form','','','2026-02-26 15:03:39','2026-02-26 09:33:39','',0,'http://idotinfra.infinityfreeapp.me/?p=13',0,'wpcf7_contact_form','',0),
(14,0,'2026-02-25 10:08:41','2026-02-25 04:38:41','<h2>Get In Touch</h2>\n<p>We would love to hear from you! Whether you are interested in one of our projects, have questions about availability, or just want to know more about I-Dot Infra, please fill out the form below or reach us directly.</p>\n\n[contact-form-7 id=\"13\" title=\"Contact Form\"]\n\n<div style=\"margin-top:40px;\">\n<h3>Contact Information</h3>\n<p><strong>Address:</strong> Bhadreswar, Hooghly, West Bengal, India</p>\n<p><strong>Phone:</strong> +91 99999 99999</p>\n<p><strong>Email:</strong> info@idotinfra.com</p>\n</div>','Contact Us','','inherit','closed','closed','','7-revision-v1','','','2026-02-25 10:08:41','2026-02-25 04:38:41','',7,'http://idotinfra.infinityfreeapp.me/?p=14',0,'revision','',0),
(15,0,'2026-02-25 10:09:18','2026-02-25 04:39:18','This is a 2 Blocks residential apartment on Station Road, Saheb Bagan at Bhadreswar in Hooghly. This Project is at a distance of about less than one minute from Bhadreswar Station and it is at a distance of less than 6 km from the Chandannagar. Local transportation includes Bus, Auto and Taxi are also more than easily available.\n\nThis Project consists of 2 BHK, 2 Bedrooms flat dimension ranges from 635 sq. ft. to 893 sq. ft. approx.\n\nCar Parking is also available with the flats. Amenities include the lift, security system, open terrace etc. It is a very good project for the end users.','Shakuntala','','publish','closed','closed','','shakuntala','','','2026-02-25 10:09:18','2026-02-25 04:39:18','',0,'http://idotinfra.infinityfreeapp.me/project/shakuntala/',1,'project','',0),
(16,0,'2026-02-25 10:10:12','2026-02-25 04:40:12','This is a residential and commercial apartment on Library Road on Bhadreswar in Hooghly. This Project is at a distance of about 5 minutes from Bhadreswar Station and it is at a distance of less than 6 km from the Chandannagar. Local transportation includes Bus, Auto and Taxi are also more than easily available.\n\nThis Project consists of 2 BHK and 3 BHK flats. 2 Bedrooms flat dimension ranges from 703 sq. ft. to 991 sq. ft. whereas the 3 bedroom flats range from 971 sq. ft. to 1075 sq. ft. approx.\n\nCar Parking are also available with the flats. Amenities include Community Hall, etc. Other amenities also includes lift, security system, open terrace etc. It is a very good project for the end users.','Anupama','','publish','closed','closed','','anupama','','','2026-02-25 10:10:12','2026-02-25 04:40:12','',0,'http://idotinfra.infinityfreeapp.me/project/anupama/',2,'project','',0),
(17,0,'2026-02-25 10:10:32','2026-02-25 04:40:32','VishnuPriya is a residential project by I-Dot Infra in the Hooghly district. More details about this project will be updated soon. Please contact us for more information.','VishnuPriya','','publish','closed','closed','','vishnupriya','','','2026-02-25 10:10:32','2026-02-25 04:40:32','',0,'http://idotinfra.infinityfreeapp.me/project/vishnupriya/',3,'project','',0),
(18,0,'2026-02-25 10:10:49','2026-02-25 04:40:49','BhitikaVilla is a residential apartment project by I-Dot Infra located on R.K.B. Sarani, Mankundu in Hooghly, West Bengal. Featuring well-designed 2 BHK well ventilated flats with modern amenities and quality construction, the project offers comfortable living spaces with thoughtfully planned layouts across a super built-up area of 681-725 sq. ft. Situated just 2 minutes from Bhadreswar Railway Station, BhitikaVilla provides excellent connectivity and convenience for daily commuters.','BhitikaVilla','','publish','closed','closed','','bhitikavilla','','','2026-02-26 14:53:58','2026-02-26 09:23:58','',0,'http://idotinfra.infinityfreeapp.me/project/bhitikavilla/',4,'project','',0),
(19,0,'2026-02-26 12:33:47','2026-02-25 04:41:24',' ','','','publish','closed','closed','','19','','','2026-02-26 12:33:47','2026-02-26 07:03:47','',0,'http://idotinfra.infinityfreeapp.me/19/',4,'nav_menu_item','',0),
(20,0,'2026-02-26 12:33:47','2026-02-25 04:41:24',' ','','','publish','closed','closed','','20','','','2026-02-26 12:33:47','2026-02-26 07:03:47','',0,'http://idotinfra.infinityfreeapp.me/20/',5,'nav_menu_item','',0),
(21,0,'2026-02-26 12:33:47','2026-02-25 04:41:25',' ','','','publish','closed','closed','','21','','','2026-02-26 12:33:47','2026-02-26 07:03:47','',0,'http://idotinfra.infinityfreeapp.me/21/',6,'nav_menu_item','',0),
(22,0,'2026-02-26 12:33:48','2026-02-25 04:41:25',' ','','','publish','closed','closed','','22','','','2026-02-26 12:33:48','2026-02-26 07:03:48','',0,'http://idotinfra.infinityfreeapp.me/22/',7,'nav_menu_item','',0),
(23,0,'2026-02-26 12:33:46','2026-02-26 07:03:02','','Completed','','publish','closed','closed','','completed','','','2026-02-26 12:33:46','2026-02-26 07:03:46','',0,'http://idotinfra.infinityfreeapp.me/completed/',3,'nav_menu_item','',0),
(24,0,'2026-02-26 12:33:48','2026-02-26 07:03:25','','Ongoing','','publish','closed','closed','','ongoing','','','2026-02-26 12:33:48','2026-02-26 07:03:48','',0,'http://idotinfra.infinityfreeapp.me/ongoing/',8,'nav_menu_item','',0),
(25,0,'2026-02-26 12:40:24','2026-02-26 07:10:24','','Hero Banner - Real Estate','Picsum ID: 319','inherit','open','closed','','hero-banner-real-estate','','','2026-02-26 12:40:24','2026-02-26 07:10:24','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/hero-banner.jpg',0,'attachment','image/jpeg',0),
(26,0,'2026-02-26 12:40:34','2026-02-26 07:10:34','','Shakuntala Project','Picsum ID: 612','inherit','open','closed','','shakuntala-project','','','2026-02-26 12:40:34','2026-02-26 07:10:34','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/project-shakuntala.jpg',0,'attachment','image/jpeg',0),
(27,0,'2026-02-26 12:40:35','2026-02-26 07:10:35','','Anupama Project','Picsum ID: 297','inherit','open','closed','','anupama-project','','','2026-02-26 12:40:35','2026-02-26 07:10:35','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/project-anupama.jpg',0,'attachment','image/jpeg',0),
(28,0,'2026-02-26 12:40:36','2026-02-26 07:10:36','','VishnuPriya Project','Picsum ID: 194','inherit','open','closed','','vishnupriya-project','','','2026-02-26 12:40:36','2026-02-26 07:10:36','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/project-vishnupriya.jpg',0,'attachment','image/jpeg',0),
(29,0,'2026-02-26 12:40:38','2026-02-26 07:10:38','','BhitikaVilla Project','Picsum ID: 421','inherit','open','closed','','bhitikavilla-project','','','2026-02-26 12:40:38','2026-02-26 07:10:38','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/project-bhitikavilla.jpg',0,'attachment','image/jpeg',0),
(30,0,'2026-02-26 14:43:48','2026-02-26 09:13:48','<p>Welcome to I-Dot Infra. By accessing and using our website <strong>idotinfra.com</strong>, you agree to the following terms and conditions. Please read them carefully before using our services or making any property-related decisions.</p>\n\n<h3>1. General</h3>\n<p>These terms govern your use of our website and any property enquiries, bookings, or transactions made through it. I-Dot Infra reserves the right to update these terms at any time without prior notice. Continued use of the website constitutes acceptance of the revised terms.</p>\n\n<h3>2. Property Information &amp; Pricing</h3>\n<p>All property details, specifications, floor plans, images, and pricing displayed on this website are for informational and illustrative purposes only. While we strive for accuracy, actual deliverables may vary slightly. Final pricing, configurations, and specifications will be confirmed in the official agreement of sale.</p>\n\n<h3>3. Bookings &amp; Site Visits</h3>\n<p>Property bookings are subject to availability and are confirmed only upon execution of a formal booking agreement and receipt of the booking amount. Site visits can be scheduled through our Contact Us page, email, or phone. I-Dot Infra reserves the right to modify visit schedules based on construction activity and safety requirements.</p>\n\n<h3>4. Construction &amp; Possession Timelines</h3>\n<p>Estimated construction and possession timelines are shared in good faith based on current project status. These timelines may be affected by regulatory approvals, weather conditions, force majeure events, or other factors beyond our control. I-Dot Infra shall not be held liable for delays arising from such circumstances.</p>\n\n<h3>5. Payment Terms</h3>\n<p>Payment schedules are outlined in the individual agreement of sale for each property. All payments must be made as per the agreed schedule. Failure to make timely payments may result in cancellation of the booking as per the terms of the agreement.</p>\n\n<h3>6. Cancellation &amp; Refunds</h3>\n<p>Cancellation and refund policies are governed by the terms specified in the booking or sale agreement. Any applicable deductions will be as per the agreement terms and prevailing regulations.</p>\n\n<h3>7. Intellectual Property</h3>\n<p>All content on this website — including text, images, logos, designs, floor plans, and brochures — is the property of I-Dot Infra and may not be reproduced, distributed, or used without prior written permission.</p>\n\n<h3>8. Limitation of Liability</h3>\n<p>I-Dot Infra shall not be liable for any indirect, incidental, or consequential damages arising from the use of this website or reliance on the information provided herein. Users are advised to independently verify all information before making purchase decisions.</p>\n\n<h3>9. Governing Law</h3>\n<p>These terms shall be governed by and construed in accordance with the laws of India. Any disputes arising shall be subject to the exclusive jurisdiction of the courts in Hooghly, West Bengal.</p>\n\n<h3>10. Contact</h3>\n<p>For questions regarding these terms, please contact us at <a href=\"mailto:info@idotinfra.com\">info@idotinfra.com</a> or call <a href=\"tel:+919999999999\">+91 99999 99999</a>.</p>','Terms and Conditions','','publish','closed','closed','','terms-and-conditions','','','2026-02-26 14:43:48','2026-02-26 09:13:48','',0,'http://idotinfra.infinityfreeapp.me/terms-and-conditions/',0,'page','',0),
(31,0,'2026-02-26 14:44:09','2026-02-26 09:14:09','<p>I-Dot Infra (\"we\", \"us\", \"our\") is committed to protecting your privacy. This policy explains how we collect, use, and safeguard your personal information when you visit <strong>idotinfra.com</strong> or interact with us.</p>\n\n<h3>1. Information We Collect</h3>\n<p>We may collect the following information when you use our website, schedule a site visit, or contact us:</p>\n<ul>\n<li>Name and family details</li>\n<li>Email address and phone number</li>\n<li>Residential address</li>\n<li>Property enquiry and preference details</li>\n<li>Site visit scheduling information</li>\n</ul>\n\n<h3>2. How We Use Your Information</h3>\n<p>Your information is used to:</p>\n<ul>\n<li>Respond to property enquiries and schedule site visits</li>\n<li>Share project updates, pricing, and availability information</li>\n<li>Process bookings and maintain customer records</li>\n<li>Improve our website and service offerings</li>\n<li>Send promotional communications about new projects (only with your consent)</li>\n</ul>\n\n<h3>3. Data Protection</h3>\n<p>We implement appropriate security measures to protect your personal data from unauthorised access, alteration, or disclosure. We do not sell, trade, or rent your personal information to third parties. Your data may be shared with authorised partners only as necessary to fulfil your property enquiry or transaction.</p>\n\n<h3>4. Cookies</h3>\n<p>Our website may use cookies to enhance your browsing experience and analyse site traffic. You can choose to disable cookies through your browser settings, though this may affect certain site functionality.</p>\n\n<h3>5. Third-Party Links</h3>\n<p>Our website may contain links to external sites such as mapping services, government portals, or partner websites. We are not responsible for the privacy practices or content of those sites.</p>\n\n<h3>6. Your Rights</h3>\n<p>You have the right to access, correct, or request deletion of your personal data held by us. To exercise these rights, contact us at <a href=\"mailto:info@idotinfra.com\">info@idotinfra.com</a>.</p>\n\n<h3>7. Data Retention</h3>\n<p>We retain your personal information only for as long as necessary to fulfil the purposes outlined in this policy, or as required by applicable laws and regulations.</p>\n\n<h3>8. Updates to This Policy</h3>\n<p>We may update this privacy policy from time to time. Changes will be posted on this page with the updated date. We encourage you to review this page periodically.</p>\n\n<h3>9. Contact</h3>\n<p>For any privacy-related concerns, reach us at <a href=\"mailto:info@idotinfra.com\">info@idotinfra.com</a> or call <a href=\"tel:+919999999999\">+91 99999 99999</a>.</p>','Privacy Policy','','publish','closed','closed','','privacy-policy','','','2026-02-26 14:44:09','2026-02-26 09:14:09','',0,'http://idotinfra.infinityfreeapp.me/privacy-policy/',0,'page','',0),
(32,0,'2026-02-26 14:44:50','2026-02-26 09:14:50','<p style=\"font-size:18px;line-height:1.8;max-width:800px;margin:0 auto 40px;text-align:center;\">At I-Dot Infra, our name carries our commitment. Every letter in <strong>i-DOT</strong> stands for a principle we build upon — not just in concrete and steel, but in every relationship we form with our homeowners.</p>\n\n<h2>T — Trust</h2>\n<p>Trust is the foundation of everything we do. We believe that buying a home is one of the most important decisions a family makes, and we honour that trust with complete transparency.</p>\n<ul>\n<li><strong>No hidden costs</strong> — What we quote is what you pay. Our pricing is straightforward with no surprise charges at any stage.</li>\n<li><strong>Clear documentation</strong> — Every agreement, approval, and title document is shared openly. We maintain full legal compliance with all municipal and state regulations.</li>\n<li><strong>On-site verification</strong> — We encourage buyers to visit construction sites at any stage. Our doors are always open because we have nothing to hide.</li>\n<li><strong>Proven track record</strong> — Multiple successfully delivered projects with happy homeowners across the Hooghly district speak to our reliability.</li>\n</ul>\n\n<h2>O — Opportunity</h2>\n<p>We create opportunities for families who dream of owning their own home. Our mission is to make quality housing accessible and affordable.</p>\n<ul>\n<li><strong>Affordable pricing</strong> — Our projects are designed and priced for middle-class families. We optimise costs without compromising on quality, passing the savings to our buyers.</li>\n<li><strong>Prime locations</strong> — Every I-Dot Infra project is strategically located near railway stations, schools, hospitals, and markets — ensuring convenience and strong investment value.</li>\n<li><strong>Flexible payment plans</strong> — We work with buyers to create payment schedules that fit their financial situation, making the journey to homeownership smoother.</li>\n<li><strong>Growing value</strong> — Properties in our chosen locations have consistently appreciated, making an I-Dot Infra home both a residence and a sound investment.</li>\n</ul>\n\n<h2>D — Dreams</h2>\n<p>Every home we build is someone\'s dream taking shape. We pour care and attention into every detail so that the finished home exceeds expectations.</p>\n<ul>\n<li><strong>Thoughtful design</strong> — Our floor plans maximise natural light, ventilation, and usable space. Every room is planned with real family living in mind.</li>\n<li><strong>Quality finishes</strong> — From vitrified tile flooring to premium bathroom fittings, we use branded materials that look beautiful and last for decades.</li>\n<li><strong>Green spaces</strong> — Our projects include landscaped common areas, giving residents a breath of fresh air right at their doorstep.</li>\n<li><strong>Community living</strong> — We design not just individual flats but complete communities with shared amenities that bring neighbours together.</li>\n</ul>\n\n<h2>I — Innovation</h2>\n<p>We embrace modern construction practices and innovative thinking to deliver homes that are safe, durable, and built for the future.</p>\n<ul>\n<li><strong>Earthquake-resistant structures</strong> — All our buildings are designed with RCC framed structures and proper reinforcement to withstand seismic activity, ensuring your family\'s safety.</li>\n<li><strong>Quality materials</strong> — We use TMT steel bars, premium-grade cement, and tested aggregates. Every batch of material is quality-checked before use on site.</li>\n<li><strong>Modern construction techniques</strong> — From proper curing processes to waterproofing treatments, we follow engineering best practices at every stage of construction.</li>\n<li><strong>Sustainable approach</strong> — Rainwater harvesting provisions, energy-efficient common area lighting, and waste management systems are integrated into our project designs.</li>\n</ul>\n\n<hr />\n\n<h2 style=\"text-align:center;\">Our Construction Quality Standards</h2>\n<p style=\"text-align:center;max-width:700px;margin:0 auto 30px;\">Every I-Dot Infra home is built to last. Here are the standards we maintain across all our projects:</p>\n\n<table style=\"width:100%;border-collapse:collapse;margin:30px 0;\">\n<tr style=\"background:#1B3A5C;color:#fff;\">\n<th style=\"padding:12px 16px;text-align:left;\">Component</th>\n<th style=\"padding:12px 16px;text-align:left;\">Our Standard</th>\n</tr>\n<tr style=\"border-bottom:1px solid #eee;\">\n<td style=\"padding:12px 16px;font-weight:600;\">Foundation</td>\n<td style=\"padding:12px 16px;\">RCC framed structure with deep pile/raft foundation as per soil test reports</td>\n</tr>\n<tr style=\"border-bottom:1px solid #eee;background:#f9f9f9;\">\n<td style=\"padding:12px 16px;font-weight:600;\">Walls</td>\n<td style=\"padding:12px 16px;\">AAC blocks / solid concrete blocks with proper curing and plastering</td>\n</tr>\n<tr style=\"border-bottom:1px solid #eee;\">\n<td style=\"padding:12px 16px;font-weight:600;\">Flooring</td>\n<td style=\"padding:12px 16px;\">Vitrified tiles in living areas, anti-skid ceramic tiles in bathrooms</td>\n</tr>\n<tr style=\"border-bottom:1px solid #eee;background:#f9f9f9;\">\n<td style=\"padding:12px 16px;font-weight:600;\">Doors &amp; Windows</td>\n<td style=\"padding:12px 16px;\">Hardwood/engineered wood frames with powder-coated aluminium sliding windows</td>\n</tr>\n<tr style=\"border-bottom:1px solid #eee;\">\n<td style=\"padding:12px 16px;font-weight:600;\">Electrical</td>\n<td style=\"padding:12px 16px;\">Concealed copper wiring with branded modular switches and MCB protection</td>\n</tr>\n<tr style=\"border-bottom:1px solid #eee;background:#f9f9f9;\">\n<td style=\"padding:12px 16px;font-weight:600;\">Plumbing</td>\n<td style=\"padding:12px 16px;\">CPVC/uPVC piping with branded CP fittings and sanitary ware</td>\n</tr>\n<tr style=\"border-bottom:1px solid #eee;\">\n<td style=\"padding:12px 16px;font-weight:600;\">Waterproofing</td>\n<td style=\"padding:12px 16px;\">Double-layer waterproofing treatment on terrace, bathrooms, and external walls</td>\n</tr>\n</table>\n\n<p style=\"text-align:center;font-size:18px;font-weight:600;color:#1B3A5C;margin-top:40px;\">I-Dot Infra — Building homes that families are proud to call their own.</p>','Our Promise','','publish','closed','closed','','our-promise','','','2026-02-26 14:44:50','2026-02-26 09:14:50','',0,'http://idotinfra.infinityfreeapp.me/our-promise/',0,'page','',0),
(33,0,'2026-02-26 14:46:32','2026-02-26 09:16:32','','Shakuntala Gallery 1','Picsum ID: 621','inherit','open','closed','','shakuntala-gallery-1','','','2026-02-26 14:46:32','2026-02-26 09:16:32','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/shak-1.jpg',0,'attachment','image/jpeg',0),
(34,0,'2026-02-26 14:46:33','2026-02-26 09:16:33','','Shakuntala Gallery 2','Picsum ID: 583','inherit','open','closed','','shakuntala-gallery-2','','','2026-02-26 14:46:33','2026-02-26 09:16:33','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/shak-2.jpg',0,'attachment','image/jpeg',0),
(35,0,'2026-02-26 14:46:33','2026-02-26 09:16:33','','Shakuntala Gallery 3','Picsum ID: 161','inherit','open','closed','','shakuntala-gallery-3','','','2026-02-26 14:46:33','2026-02-26 09:16:33','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/shak-3.jpg',0,'attachment','image/jpeg',0),
(36,0,'2026-02-26 14:46:34','2026-02-26 09:16:34','','Shakuntala Gallery 4','Picsum ID: 468','inherit','open','closed','','shakuntala-gallery-4','','','2026-02-26 14:46:34','2026-02-26 09:16:34','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/shak-4.jpg',0,'attachment','image/jpeg',0),
(37,0,'2026-02-26 14:46:34','2026-02-26 09:16:34','','Shakuntala Gallery 5','Picsum ID: 580','inherit','open','closed','','shakuntala-gallery-5','','','2026-02-26 14:46:34','2026-02-26 09:16:34','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/shak-5.jpg',0,'attachment','image/jpeg',0),
(38,0,'2026-02-26 14:46:34','2026-02-26 09:16:34','','Shakuntala Gallery 6','Picsum ID: 785','inherit','open','closed','','shakuntala-gallery-6','','','2026-02-26 14:46:34','2026-02-26 09:16:34','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/shak-6.jpg',0,'attachment','image/jpeg',0),
(39,0,'2026-02-26 14:46:35','2026-02-26 09:16:35','','Shakuntala Gallery 7','Picsum ID: 936','inherit','open','closed','','shakuntala-gallery-7','','','2026-02-26 14:46:35','2026-02-26 09:16:35','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/shak-7.jpg',0,'attachment','image/jpeg',0),
(40,0,'2026-02-26 14:46:42','2026-02-26 09:16:42','','Anupama Gallery 1','Picsum ID: 890','inherit','open','closed','','anupama-gallery-1','','','2026-02-26 14:46:42','2026-02-26 09:16:42','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/anup-1.jpg',0,'attachment','image/jpeg',0),
(41,0,'2026-02-26 14:46:43','2026-02-26 09:16:43','','Anupama Gallery 2','Picsum ID: 661','inherit','open','closed','','anupama-gallery-2','','','2026-02-26 14:46:43','2026-02-26 09:16:43','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/anup-2.jpg',0,'attachment','image/jpeg',0),
(42,0,'2026-02-26 14:46:43','2026-02-26 09:16:43','','Anupama Gallery 3','Picsum ID: 1056','inherit','open','closed','','anupama-gallery-3','','','2026-02-26 14:46:43','2026-02-26 09:16:43','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/anup-3.jpg',0,'attachment','image/jpeg',0),
(43,0,'2026-02-26 14:46:43','2026-02-26 09:16:43','','Anupama Gallery 4','Picsum ID: 675','inherit','open','closed','','anupama-gallery-4','','','2026-02-26 14:46:43','2026-02-26 09:16:43','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/anup-4.jpg',0,'attachment','image/jpeg',0),
(44,0,'2026-02-26 14:46:43','2026-02-26 09:16:43','','VishnuPriya Gallery 1','Picsum ID: 905','inherit','open','closed','','vishnupriya-gallery-1','','','2026-02-26 14:46:43','2026-02-26 09:16:43','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/vish-1.jpg',0,'attachment','image/jpeg',0),
(45,0,'2026-02-26 14:46:44','2026-02-26 09:16:44','','Anupama Gallery 5','Picsum ID: 310','inherit','open','closed','','anupama-gallery-5','','','2026-02-26 14:46:44','2026-02-26 09:16:44','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/anup-5.jpg',0,'attachment','image/jpeg',0),
(46,0,'2026-02-26 14:46:44','2026-02-26 09:16:44','','VishnuPriya Gallery 2','Picsum ID: 142','inherit','open','closed','','vishnupriya-gallery-2','','','2026-02-26 14:46:44','2026-02-26 09:16:44','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/vish-2.jpg',0,'attachment','image/jpeg',0),
(47,0,'2026-02-26 14:46:44','2026-02-26 09:16:44','','Anupama Gallery 6','Picsum ID: 571','inherit','open','closed','','anupama-gallery-6','','','2026-02-26 14:46:44','2026-02-26 09:16:44','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/anup-6.jpg',0,'attachment','image/jpeg',0),
(48,0,'2026-02-26 14:46:44','2026-02-26 09:16:44','','VishnuPriya Gallery 3','Picsum ID: 620','inherit','open','closed','','vishnupriya-gallery-3','','','2026-02-26 14:46:44','2026-02-26 09:16:44','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/vish-3.jpg',0,'attachment','image/jpeg',0),
(49,0,'2026-02-26 14:46:45','2026-02-26 09:16:45','','BhitikaVilla Gallery 1','Picsum ID: 640','inherit','open','closed','','bhitikavilla-gallery-1','','','2026-02-26 14:46:45','2026-02-26 09:16:45','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/bhit-1.jpg',0,'attachment','image/jpeg',0),
(50,0,'2026-02-26 14:46:45','2026-02-26 09:16:45','','Anupama Gallery 7','Picsum ID: 477','inherit','open','closed','','anupama-gallery-7','','','2026-02-26 14:46:45','2026-02-26 09:16:45','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/anup-7.jpg',0,'attachment','image/jpeg',0),
(51,0,'2026-02-26 14:46:45','2026-02-26 09:16:45','','VishnuPriya Gallery 4','Picsum ID: 430','inherit','open','closed','','vishnupriya-gallery-4','','','2026-02-26 14:46:45','2026-02-26 09:16:45','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/vish-4.jpg',0,'attachment','image/jpeg',0),
(52,0,'2026-02-26 14:46:45','2026-02-26 09:16:45','','BhitikaVilla Gallery 2','Picsum ID: 926','inherit','open','closed','','bhitikavilla-gallery-2','','','2026-02-26 14:46:45','2026-02-26 09:16:45','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/bhit-2.jpg',0,'attachment','image/jpeg',0),
(53,0,'2026-02-26 14:46:45','2026-02-26 09:16:45','','VishnuPriya Gallery 5','Picsum ID: 133','inherit','open','closed','','vishnupriya-gallery-5','','','2026-02-26 14:46:45','2026-02-26 09:16:45','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/vish-5.jpg',0,'attachment','image/jpeg',0),
(54,0,'2026-02-26 14:46:45','2026-02-26 09:16:45','','BhitikaVilla Gallery 3','Picsum ID: 875','inherit','open','closed','','bhitikavilla-gallery-3','','','2026-02-26 14:46:45','2026-02-26 09:16:45','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/bhit-3.jpg',0,'attachment','image/jpeg',0),
(55,0,'2026-02-26 14:46:46','2026-02-26 09:16:46','','VishnuPriya Gallery 6','Picsum ID: 1001','inherit','open','closed','','vishnupriya-gallery-6','','','2026-02-26 14:46:46','2026-02-26 09:16:46','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/vish-6.jpg',0,'attachment','image/jpeg',0),
(56,0,'2026-02-26 14:46:46','2026-02-26 09:16:46','','BhitikaVilla Gallery 4','Picsum ID: 182','inherit','open','closed','','bhitikavilla-gallery-4','','','2026-02-26 14:46:46','2026-02-26 09:16:46','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/bhit-4.jpg',0,'attachment','image/jpeg',0),
(57,0,'2026-02-26 14:46:46','2026-02-26 09:16:46','','VishnuPriya Gallery 7','Picsum ID: 585','inherit','open','closed','','vishnupriya-gallery-7','','','2026-02-26 14:46:46','2026-02-26 09:16:46','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/vish-7.jpg',0,'attachment','image/jpeg',0),
(58,0,'2026-02-26 14:46:46','2026-02-26 09:16:46','','BhitikaVilla Gallery 5','Picsum ID: 492','inherit','open','closed','','bhitikavilla-gallery-5','','','2026-02-26 14:46:46','2026-02-26 09:16:46','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/bhit-5.jpg',0,'attachment','image/jpeg',0),
(59,0,'2026-02-26 14:46:47','2026-02-26 09:16:47','','BhitikaVilla Gallery 6','Picsum ID: 274','inherit','open','closed','','bhitikavilla-gallery-6','','','2026-02-26 14:46:47','2026-02-26 09:16:47','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/bhit-6.jpg',0,'attachment','image/jpeg',0),
(60,0,'2026-02-26 14:46:47','2026-02-26 09:16:47','','BhitikaVilla Gallery 7','Picsum ID: 340','inherit','open','closed','','bhitikavilla-gallery-7','','','2026-02-26 14:46:47','2026-02-26 09:16:47','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/bhit-7.jpg',0,'attachment','image/jpeg',0),
(61,0,'2026-02-26 14:47:07','2026-02-26 09:17:07','','Homepage Hero - Residential Building','Picsum ID: 93','inherit','open','closed','','homepage-hero-residential-building','','','2026-02-26 14:47:07','2026-02-26 09:17:07','',0,'http://idotinfra.infinityfreeapp.me/wp-content/uploads/2026/02/hero-building.jpg',0,'attachment','image/jpeg',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES
(9,2,0),
(10,2,0),
(11,2,0),
(19,2,0),
(20,2,0),
(21,2,0),
(22,2,0),
(23,2,0),
(24,2,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES
(1,1,'category','',0,0),
(2,2,'nav_menu','',0,9);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_termmeta`
--

LOCK TABLES `wp_termmeta` WRITE;
/*!40000 ALTER TABLE `wp_termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES
(1,'Uncategorized','uncategorized',0),
(2,'Primary Menu','primary-menu',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES
(1,1,'nickname','admin'),
(2,1,'first_name',''),
(3,1,'last_name',''),
(4,1,'description',''),
(5,1,'rich_editing','true'),
(6,1,'syntax_highlighting','true'),
(7,1,'comment_shortcuts','false'),
(8,1,'admin_color','fresh'),
(9,1,'use_ssl','0'),
(10,1,'show_admin_bar_front','true'),
(11,1,'locale',''),
(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
(13,1,'wp_user_level','10'),
(14,1,'dismissed_wp_pointers',''),
(15,1,'show_welcome_panel','1');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_users`
--

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;
INSERT INTO `wp_users` VALUES
(1,'admin','$wp$2y$10$uQ.TCbloM3VJy1cM5gyEMuLiPPeXqKri5.lw8l5/9IG4W1Vn1P8C2','admin','admin@idotinfra.com','http://idotinfra.infinityfreeapp.me','2026-02-25 04:38:29','',0,'admin');
/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-17  7:43:00
