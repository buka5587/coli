-- Created at 22.6.2025 8:30 using David Grudl MySQL Dump Utility
-- Host: localhost
-- MySQL Server: 8.4.5
-- Database: test

SET NAMES utf8;
SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
SET FOREIGN_KEY_CHECKS=0;
-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_acc_validations`;

CREATE TABLE `cl_acc_validations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `json` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `time` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_admin_permissions`;

CREATE TABLE `cl_admin_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `admin_permissions` varchar(3000) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_ads`;

CREATE TABLE `cl_ads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `cover` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `company` varchar(120) NOT NULL DEFAULT '',
  `target_url` varchar(1200) NOT NULL DEFAULT '',
  `status` enum('orphan','active','inactive') NOT NULL DEFAULT 'orphan',
  `approved` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `audience` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '[]',
  `description` varchar(600) NOT NULL DEFAULT '',
  `cta` varchar(300) NOT NULL DEFAULT '',
  `budget` varchar(15) NOT NULL DEFAULT '0.00',
  `clicks` int NOT NULL DEFAULT '0',
  `views` int NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0',
  `max_budget` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_affiliate_payouts`;

CREATE TABLE `cl_affiliate_payouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `email` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `amount` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.00',
  `bonuses` int NOT NULL DEFAULT '0',
  `status` enum('pending','paid') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'pending',
  `time` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_banktrans_requests`;

CREATE TABLE `cl_banktrans_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `amount` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0.00',
  `receipt_img` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message` varchar(1210) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `currency` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'USD',
  `trans_id` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_blocks`;

CREATE TABLE `cl_blocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `profile_id` int NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_bookmarks`;

CREATE TABLE `cl_bookmarks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `publication_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_chats`;

CREATE TABLE `cl_chats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_one` int NOT NULL DEFAULT '0',
  `user_two` int NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_configs`;

CREATE TABLE `cl_configs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `name` varchar(120) NOT NULL DEFAULT '',
  `value` varchar(3000) NOT NULL DEFAULT '',
  `regex` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb3;

INSERT INTO `cl_configs` (`id`, `title`, `name`, `value`, `regex`) VALUES
(1,	'Theme',	'theme',	'default',	''),
(2,	'Site name',	'name',	'测试',	'/^(.){0,50}$/'),
(3,	'Site title',	'title',	'测试',	'/^(.){0,150}$/'),
(4,	'Site description',	'description',	'ColibriSM - The Ultimate Modern Social Media Sharing Platform',	'/^(.){0,350}$/'),
(5,	'SEO keywords',	'keywords',	'测试seo',	''),
(6,	'Site logo',	'site_logo',	'statics/img/logo.png',	''),
(7,	'Site favicon',	'site_favicon',	'statics/img/favicon.png',	''),
(8,	'Chat wallpaper',	'chat_wp',	'statics/img/chatwp/default.png',	''),
(9,	'Sign-up confirmation status',	'acc_validation',	'off',	'/^(on|off)$/'),
(10,	'Default language',	'language',	'english',	''),
(11,	'AS3 storage',	'as3_storage',	'off',	'/^(on|off)$/'),
(12,	'E-mail address',	'email',	'2195299055@qq.com',	''),
(13,	'SMTP server',	'smtp_or_mail',	'smtp',	'/^(smtp|mail)$/'),
(14,	'SMTP host',	'smtp_host',	'',	''),
(15,	'SMTP password',	'smtp_password',	'',	'/^(.){0,50}$/'),
(16,	'SMTP encryption',	'smtp_encryption',	'tls',	'/^(ssl|tls)$/'),
(17,	'SMTP port',	'smtp_port',	'587',	'/^[0-9]{1,11}$/'),
(18,	'SMTP username',	'smtp_username',	'',	''),
(19,	'FFMPEG binary',	'ffmpeg_binary',	'core/libs/ffmpeg/ffmpeg',	'/^(.){0,550}$/'),
(20,	'Giphy api',	'giphy_api_key',	'EEoFiCosGuyEIWlXnRuw4McTLxfjCrl1',	'/^(.){0,150}$/'),
(21,	'Google analytics',	'google_analytics',	'',	''),
(22,	'Facebook API ID',	'facebook_api_id',	'',	'/^(.){0,150}$/'),
(23,	'Facebook API Key',	'facebook_api_key',	'',	'/^(.){0,150}$/'),
(24,	'Twitter API ID',	'twitter_api_id',	'',	'/^(.){0,150}$/'),
(25,	'Twitter API Key',	'twitter_api_key',	'',	'/^(.){0,150}$/'),
(26,	'Google API ID',	'google_api_id',	'',	'/^(.){0,150}$/'),
(27,	'Google API Key',	'google_api_key',	'',	'/^(.){0,150}$/'),
(28,	'Script version',	'version',	'1.4.3',	''),
(29,	'Last backup',	'last_backup',	'0',	''),
(30,	'Sitemap last update',	'sitemap_update',	'',	''),
(31,	'Affiliate bonus rate',	'aff_bonus_rate',	'0.10',	'/^([0-9]{1,3}\\.[0-9]{1,3}|[0-9]{1,3})$/'),
(32,	'Affiliates System',	'affiliates_system',	'on',	'/^(on|off)$/'),
(33,	'PayPal API Public key',	'paypal_api_key',	'',	''),
(34,	'PayPal API Secret key',	'paypal_api_pass',	'',	''),
(35,	'PayPal Payment Mode',	'paypal_mode',	'sandbox',	'/^(sandbox|live)$/'),
(36,	'Site currency',	'site_currency',	'usd',	' \r\n/^([a-zA-Z]){2,7}$/'),
(37,	'Advertising system',	'advertising_system',	'on',	'/^(on|off)$/'),
(38,	'Ad conversion rate',	'ad_conversion_rate',	'0.05',	'/^([0-9]{1,3}\\.[0-9]{1,3}|[0-9]{1,3})$/'),
(39,	'Max post length',	'max_post_len',	'600',	'/^[0-9]{1,11}$/'),
(40,	'Google oAuth',	'google_oauth',	'off',	'/^(on|off)$/'),
(41,	'Twitter oAuth',	'twitter_oauth',	'off',	'/^(on|off)$/'),
(42,	'Facebook oAuth',	'facebook_oauth',	'off',	'/^(on|off)$/'),
(43,	'Google ads (Horiz-banner)',	'google_ad_horiz',	'',	''),
(44,	'Google ads (Vert-banner)',	'google_ad_vert',	'',	''),
(45,	'Default country',	'country_id',	'1',	'/^[0-9]{1,11}$/'),
(46,	'Firebase API key',	'firebase_api_key',	'',	''),
(47,	'Push notifications',	'push_notifs',	'off',	'/^(on|off)$/'),
(48,	'Page update interval',	'page_update_interval',	'30',	'/^[0-9]{1,11}$/'),
(49,	'Chat update interval',	'chat_update_interval',	'5',	'/^[0-9]{1,11}$/'),
(50,	'Amazon S3 storage',	'as3_storage',	'off',	'/^(on|off)$/'),
(51,	'AS3 bucket name',	'as3_bucket_name',	'',	''),
(52,	'Amazon S3 API key',	'as3_api_key',	'',	''),
(53,	'Amazon S3 API secret key',	'as3_api_secret_key',	'',	''),
(54,	'AS3 bucket region',	'as3_bucket_region',	'us-east-1',	''),
(55,	'Max upload size',	'max_upload_size',	'24000000',	'/^[0-9]{1,11}$/'),
(56,	'Max post audio record length',	'post_arec_length',	'30',	'/^[0-9]{1,11}$/'),
(57,	'Wallet topup min amount',	'wallet_min_amount',	'50',	'/^([0-9]{1,3}\\.[0-9]{1,3}|[0-9]{1,3})$/'),
(58,	'',	'',	'',	''),
(59,	'Currency symbol position',	'currency_symbol_pos',	'after',	'/^(before|after)$/'),
(60,	'Aff payout min amount',	'aff_payout_min',	'50',	'/^([0-9]{1,3}\\\\.[0-9]{1,3}|[0-9]{1,3})$/'),
(61,	'Default color scheme',	'default_color_scheme',	'default',	''),
(62,	'Default BG color',	'default_bg_color',	'default',	''),
(63,	'Android app (Google play item URL)',	'android_app_url',	'',	''),
(64,	'IOS app (App store item URL)',	'ios_app_url',	'',	''),
(65,	'User registration system',	'user_signup',	'on',	'/^(on|off)$/'),
(66,	'Cookie warning popup',	'cookie_warning_popup',	'off',	'/^(on|off)$/'),
(67,	'Google reCAPTCHA',	'google_recaptcha',	'off',	'/^(on|off)$/'),
(68,	'Google reCAPTCHA Sitekey',	'google_recap_key1',	'',	''),
(69,	'Google reCAPTCHA Secret key',	'google_recap_key2',	'',	''),
(70,	'E-Mail notifications',	'email_notifications',	'off',	'/^(on|off)$/'),
(71,	'Swifts system status (Daily stories)',	'swift_system_status',	'on',	'/^(on|off)$/'),
(72,	'PayPal Payment Status',	'paypal_method_status',	'on',	'/^(on|off)$/'),
(73,	'PayStack API Public key',	'paystack_api_key',	'',	''),
(74,	'Paystack API Secret key',	'paystack_api_pass',	'',	''),
(75,	'Paystack Payment Status',	'paystack_method_status',	'off',	'/^(on|off)$/'),
(76,	'Stripe API Secret key',	'stripe_api_pass',	'',	''),
(77,	'Stripe API Public key',	'stripe_api_key',	'',	''),
(78,	'Stripe Payment Status',	'stripe_method_status',	'off',	'/^(on|off)$/'),
(79,	'AliPay Payment Status',	'alipay_method_status',	'off',	'/^(on|off)$/'),
(80,	'Timezone',	'timezone',	'UTC',	''),
(81,	'Bank transfer gateway',	'bank_method_status',	'on',	'/^(on|off)$/'),
(82,	'Bank account number',	'bt_bank_account_number',	'',	''),
(83,	'Routing code',	'bt_bank_routing_code',	'',	''),
(84,	'Bank account name',	'bt_bank_account_name',	'',	''),
(85,	'Bank country',	'bt_bank_country_name',	'1',	''),
(86,	'Bank address',	'bt_bank_address',	'',	''),
(87,	'Bank name',	'bt_bank_name',	'',	''),
(88,	'Bank SVG Logo',	'bt_bank_svg_logo',	'',	''),
(89,	'System API status',	'system_api_status',	'off',	'/^(on|off)$/'),
(90,	'Guest page status',	'guest_page_status',	'on',	'/^(on|off)$/'),
(91,	'Username restrictions',	'username_restrictions',	'',	''),
(92,	'User email restrictions',	'useremail_restrictions',	'',	''),
(93,	'Post video download system',	'post_video_download_system',	'on',	'/^(on|off)$/'),
(94,	'RazorPay payment method status',	'rzp_method_status',	'off',	'/^(on|off)$/'),
(95,	'RazorPay API Public key',	'rzp_api_key',	'',	''),
(96,	'RazorPay API Secret key',	'rzp_api_secret',	'',	''),
(97,	'LinkedIN oAuth status',	'linkedin_oauth',	'off',	'/^(on|off)$/'),
(98,	'LinkedIn API ID',	'linkedin_api_id',	'',	''),
(99,	'LinkedIn API Key',	'linkedin_api_key',	'',	''),
(100,	'Discord oAuth status',	'discord_status',	'off',	'/^(on|off)$/'),
(101,	'Discord API ID',	'discord_api_id',	'',	''),
(102,	'Discord API Key',	'discord_api_key',	'',	''),
(103,	'Vkontakte oAuth status',	'vkontakte_status',	'off',	'/^(on|off)$/'),
(104,	'Vkontakte API ID',	'vkontakte_api_id',	'',	''),
(105,	'Vkontakte API Key',	'vkontakte_api_key',	'',	''),
(106,	'Instagram oAuth status',	'instagram_status',	'off',	'/^(on|off)$/'),
(107,	'Instagram API ID',	'instagram_api_id',	'',	''),
(108,	'Instagram API Key',	'instagram_api_key',	'',	''),
(109,	'Premium account system status',	'prem_account_system_status',	'off',	'/^(on|off)$/'),
(110,	'Premium account m/price',	'premium_account_mprice',	'0.00',	'/^([0-9]{1,11}\\.[0-9]{1,11}|[0-9]{1,11})$/'),
(111,	'Non-binary gender',	'non_binary_gender',	'off',	'/^(on|off)$/'),
(112,	'Post audio download system',	'post_audio_download_system',	'on',	'/^(on|off)$/'),
(113,	'Wasaba S3 storage',	'ws3_storage',	'on',	'/^(on|off)$/'),
(114,	'WS3 bucket name',	'ws3_bucket_name',	'coli',	''),
(115,	'Wasabi S3 API key',	'ws3_api_key',	'ESv9jUZapEH8nHgc',	''),
(116,	'Wasabi S3 API secret key',	'ws3_api_secret_key',	'MNRSNdrcIO39oD1kIaxqTpkppzHNoW',	''),
(117,	'WS3 bucket region',	'ws3_bucket_region',	'us-west-1',	''),
(118,	'S3兼容存储自定义端点',	'ws3_endpoint_url',	'https://cn-nb1.rains3.com',	''),
(119,	'Auto follow user list',	'auto_follow_list',	'',	''),
(120,	'Withdrawal payment methods',	'withdrawal_payment_methods',	'Bank transfer, PayPal, Google Pay, Apple Pay, Bitcoin, Skrill',	''),
(121,	'OneSignal App ID',	'onesignal_app_id',	'',	''),
(122,	'OneSignal App Key',	'onesignal_app_key',	'',	''),
(123,	'Google AI vision',	'google_ai_vision_status',	'off',	'/^(on|off)$/'),
(124,	'Google AI vision Key',	'google_ai_vision_key',	'',	''),
(125,	'Donation system status',	'donation_system_status',	'on',	'/^(on|off)$/'),
(126,	'Post images system',	'post_images_system',	'on',	'/^(on|off)$/'),
(127,	'Post videos system',	'post_videos_system',	'on',	'/^(on|off)$/'),
(128,	'Post audio system',	'post_audio_system',	'on',	'/^(on|off)$/'),
(129,	'Post documents system',	'post_documents_system',	'on',	'/^(on|off)$/'),
(130,	'Post voice-record system',	'post_record_system',	'on',	'/^(on|off)$/'),
(131,	'Post polls system',	'post_polls_system',	'on',	'/^(on|off)$/'),
(132,	'Post gifs system',	'post_gifs_system',	'on',	'/^(on|off)$/'),
(133,	'Coinpayments method status',	'coinpayments_method_status',	'off',	'/^(on|off)$/'),
(134,	'Coinpayments API Public key',	'coinpayments_api_key',	'',	''),
(135,	'Coinpayments API Secret key',	'coinpayments_api_secret',	'',	''),
(136,	'Coinpayments method mode',	'coinpayments_api_mode',	'demo',	'/^(demo|live)$/'),
(137,	'Sign-up confirmation (Code) system',	'signup_conf_system',	'email',	'/^(phone|email)$/'),
(138,	'Twilio account SID',	'twilio_account_sid',	'',	''),
(139,	'Twilio auth token',	'twilio_auth_token',	'',	''),
(140,	'Twilio phone number',	'twilio_phone_number',	'',	''),
(141,	'Default SMS provider',	'default_sms_provider',	'',	''),
(142,	'Infobip API Key',	'infobip_api_key',	'',	''),
(143,	'Infobip Base URL',	'infobip_base_url',	'',	''),
(144,	'Infobip phone number',	'infobip_phone_number',	'',	''),
(145,	'Moneypoolscash API key',	'moneypoolscash_api_key',	'',	''),
(146,	'Moneypoolscash merchant e-mail',	'moneypoolscash_merchant_email',	'',	''),
(147,	'Moneypoolscash payment method status',	'moneypoolscash_status',	'off',	'/^(on|off)$/'),
(148,	'ЮKassa payment method status',	'yookassa_status',	'off',	'/^(on|off)$/'),
(149,	'ЮKassa API secret key',	'yookassa_api_secret_key',	'',	''),
(150,	'ЮKassa shop ID',	'yookassa_api_shop_id',	'',	''),
(151,	'Media files optimization system',	'media_optimization_status',	'off',	'/^(on|off)$/'),
(152,	'Post images compression (from 1 to 100)',	'post_images_compression',	'90',	'/^[0-9]{1,3}$/'),
(153,	'Coinpayments merchant ID',	'coinpayments_merchant_id',	'',	''),
(154,	'Coinpayments IPN code',	'coinpayments_ipn_code',	'',	''),
(155,	'Bank Transfer gateway icon',	'bt_bank_icon',	'',	''),
(156,	'iDrive S3 storage',	'idrive3_storage',	'off',	'/^(on|off)$/'),
(157,	'iDrive bucket name',	'idrive3_bucket_name',	'',	''),
(158,	'iDrive S3 API key',	'idrive3_api_key',	'',	''),
(159,	'iDrive S3 API secret key',	'idrive3_api_secret_key',	'',	''),
(160,	'iDrive S3 bucket region',	'idrive3_bucket_region',	'',	''),
(161,	'iDrive S3 endpoint URL',	'idrive3_endpoint_url',	'',	''),
(162,	'User wallet status',	'user_wallet_status',	'on',	'/^(on|off)$/'),
(163,	'Content sales commission',	'cont_sales_comrate',	'1',	'/^([0-9]{1,2}.[0-9]{1,2}|[0-9]{1,3}|)$/');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_connections`;

CREATE TABLE `cl_connections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `follower_id` int NOT NULL DEFAULT '0',
  `following_id` int NOT NULL DEFAULT '0',
  `status` enum('active','pending') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'active',
  `time` varchar(25) NOT NULL DEFAULT '25',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_hashtags`;

CREATE TABLE `cl_hashtags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `posts` int NOT NULL DEFAULT '0',
  `tag` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `time` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_invite_links`;

CREATE TABLE `cl_invite_links` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `role` set('user','admin') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'user',
  `mnu` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1',
  `expires_at` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `registered_users` int NOT NULL DEFAULT '0',
  `time` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_messages`;

CREATE TABLE `cl_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sent_by` int NOT NULL DEFAULT '0',
  `sent_to` int NOT NULL DEFAULT '0',
  `owner` int NOT NULL DEFAULT '0',
  `message` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `media_file` varchar(1000) NOT NULL DEFAULT '',
  `audio_record` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `media_type` varchar(25) NOT NULL DEFAULT 'none',
  `seen` varchar(25) NOT NULL DEFAULT '0',
  `deleted_fs1` enum('Y','N') NOT NULL DEFAULT 'N',
  `deleted_fs2` enum('Y','N') NOT NULL DEFAULT 'N',
  `time` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_notifications`;

CREATE TABLE `cl_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notifier_id` int NOT NULL DEFAULT '0',
  `recipient_id` int NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `subject` varchar(32) NOT NULL DEFAULT 'none',
  `entry_id` int NOT NULL DEFAULT '0',
  `json` varchar(1200) NOT NULL DEFAULT '[]',
  `time` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_pending_payments`;

CREATE TABLE `cl_pending_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `payment_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'none',
  `json_data` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '[]',
  `payment_id` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_posts`;

CREATE TABLE `cl_posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `publication_id` int NOT NULL DEFAULT '0',
  `type` enum('post','repost') NOT NULL DEFAULT 'post',
  `time` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

INSERT INTO `cl_posts` (`id`, `user_id`, `publication_id`, `type`, `time`) VALUES
(7,	1,	9,	'post',	'1750580751');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_profile_reports`;

CREATE TABLE `cl_profile_reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `profile_id` int NOT NULL DEFAULT '0',
  `reason` int NOT NULL DEFAULT '0',
  `comment` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `seen` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `time` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_pub_reports`;

CREATE TABLE `cl_pub_reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `post_id` int NOT NULL DEFAULT '0',
  `reason` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `seen` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `comment` varchar(1210) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `time` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_publications`;

CREATE TABLE `cl_publications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `title` varchar(130) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `type` enum('text','video','image','gif','poll','audio','document','donation') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'text',
  `replys_count` int NOT NULL DEFAULT '0',
  `reposts_count` int NOT NULL DEFAULT '0',
  `likes_count` int NOT NULL DEFAULT '0',
  `status` enum('active','inactive','deleted','orphan') NOT NULL DEFAULT 'active',
  `thread_id` int NOT NULL DEFAULT '0',
  `target` enum('publication','pub_reply') NOT NULL DEFAULT 'publication',
  `og_data` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `poll_data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `poll_status` enum('active','stopped') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'active',
  `priv_wcs` enum('everyone','followers') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'everyone',
  `priv_wcr` enum('everyone','followers','mentioned') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'everyone',
  `time` varchar(25) NOT NULL DEFAULT '0',
  `edited` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `admin_pinned` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `profile_pinned` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `donation_raised` varchar(25) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL DEFAULT '0.00',
  `donation_amount` varchar(25) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL DEFAULT '0.00',
  `is_donation_post` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `donations_total` int NOT NULL DEFAULT '0',
  `donation_raised_percent` int NOT NULL DEFAULT '0',
  `is_free_post` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

INSERT INTO `cl_publications` (`id`, `user_id`, `text`, `title`, `type`, `replys_count`, `reposts_count`, `likes_count`, `status`, `thread_id`, `target`, `og_data`, `poll_data`, `poll_status`, `priv_wcs`, `priv_wcr`, `time`, `edited`, `admin_pinned`, `profile_pinned`, `donation_raised`, `donation_amount`, `is_donation_post`, `donations_total`, `donation_raised_percent`, `is_free_post`) VALUES
(9,	1,	'',	'',	'image',	0,	0,	0,	'active',	0,	'publication',	'',	NULL,	'active',	'everyone',	'everyone',	'1750580750',	'0',	'N',	'N',	'0.00',	'0.00',	'N',	0,	0,	'N');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_publikes`;

CREATE TABLE `cl_publikes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pub_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL DEFAULT '0',
  `time` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_pubmedia`;

CREATE TABLE `cl_pubmedia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pub_id` int NOT NULL DEFAULT '0',
  `type` enum('image','video','gif','audio','document') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `src` varchar(1200) NOT NULL DEFAULT '',
  `is_safe` set('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y',
  `json_data` varchar(3000) NOT NULL DEFAULT '[]',
  `time` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

INSERT INTO `cl_pubmedia` (`id`, `pub_id`, `type`, `src`, `is_safe`, `json_data`, `time`) VALUES
(16,	9,	'image',	'upload/images/2025/06/Tlkpr2hFgkfPzxeEJYAH_22_5896a16db932e7d19ab364d47ab7b97f_image_original.jpg',	'Y',	'{\n    \"image_thumb\": \"upload\\/images\\/2025\\/06\\/uxcfxviCvPRi5DsQoH5q_22_5896a16db932e7d19ab364d47ab7b97f_image_512x512.jpg\"\n}',	'1750580741');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_sessions`;

CREATE TABLE `cl_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` varchar(120) NOT NULL DEFAULT '',
  `user_id` varchar(11) NOT NULL DEFAULT '0',
  `platform` varchar(15) NOT NULL DEFAULT 'web',
  `time` varchar(25) NOT NULL DEFAULT '0',
  `lifespan` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `cl_sessions` (`id`, `session_id`, `user_id`, `platform`, `time`, `lifespan`) VALUES
(1,	'b1258680c546e9d337a58e1bb65c805890e2e7761750577164d368424138a415d1d8e6d54463446621',	'1',	'web',	'1750577164',	'1782113164');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_subscriptions`;

CREATE TABLE `cl_subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subscriber_id` int NOT NULL,
  `creator_id` int NOT NULL,
  `subscription_start` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `subscription_end` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_ui_langs`;

CREATE TABLE `cl_ui_langs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `slug` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `status` set('1','0') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1',
  `is_rtl` set('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `is_native` set('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

INSERT INTO `cl_ui_langs` (`id`, `name`, `slug`, `status`, `is_rtl`, `is_native`) VALUES
(1,	'English',	'english',	'1',	'N',	'1'),
(2,	'French',	'french',	'1',	'N',	'1'),
(3,	'German',	'german',	'1',	'N',	'1'),
(4,	'Italian',	'italian',	'1',	'N',	'1'),
(5,	'Russian',	'russian',	'1',	'N',	'1'),
(6,	'Portuguese',	'portuguese',	'1',	'N',	'1'),
(7,	'Spanish',	'spanish',	'1',	'N',	'1'),
(8,	'Turkish',	'turkish',	'1',	'N',	'1'),
(9,	'Dutch',	'dutch',	'1',	'N',	'1'),
(10,	'Ukraine',	'ukraine',	'1',	'N',	'1'),
(11,	'Arabic',	'arabic',	'1',	'Y',	'1'),
(12,	'Japanese - 日本語',	'japanese',	'1',	'N',	'1');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_users`;

CREATE TABLE `cl_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `fname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `lname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `about` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `gender` enum('M','F','T','O') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'M',
  `email` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `phone` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `em_code` varchar(100) NOT NULL DEFAULT '',
  `email_conf_code` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `phone_conf_code` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `password` varchar(140) NOT NULL DEFAULT '',
  `joined` varchar(20) NOT NULL DEFAULT '0',
  `logged_in_with` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'system',
  `start_up` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'done',
  `last_active` varchar(20) NOT NULL DEFAULT '0',
  `ip_address` varchar(140) NOT NULL DEFAULT '0.0.0.0',
  `language` varchar(32) NOT NULL DEFAULT 'default',
  `avatar` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'upload/default/avatar.png',
  `cover` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'upload/default/cover.png',
  `cover_orig` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'upload/default/cover.png',
  `active` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `verified` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `admin` enum('0','1') NOT NULL DEFAULT '0',
  `posts` int NOT NULL DEFAULT '0',
  `followers` int NOT NULL DEFAULT '0',
  `following` int NOT NULL DEFAULT '0',
  `website` varchar(120) NOT NULL DEFAULT '',
  `country_id` int NOT NULL DEFAULT '1',
  `city` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `last_post` int NOT NULL DEFAULT '0',
  `last_swift` varchar(135) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `last_ad` int NOT NULL DEFAULT '0',
  `profile_privacy` enum('everyone','followers') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'everyone',
  `follow_privacy` enum('everyone','approved') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'everyone',
  `contact_privacy` enum('everyone','followed') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'everyone',
  `index_privacy` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'Y',
  `aff_bonuses` int NOT NULL DEFAULT '0',
  `wallet` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.00',
  `pnotif_token` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '{"token": "","type": "android"}',
  `refresh_token` varchar(220) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `settings` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '{"notifs":{"like":1,"subscribe":1,"subscribe_request":1,"subscribe_accept":1,"reply":1,"repost":1,"mention":1},"enotifs":{"like":0,"subscribe":0,"subscribe_request":0,"subscribe_accept":0,"reply":0,"repost":0,"mention":0}}',
  `display_settings` varchar(1200) NOT NULL DEFAULT '{"color_scheme": "default","background": "default"}',
  `swift` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `swift_update` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `info_file` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `is_premium` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `premium_settings` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '{"disable_native_ads": 0,"disable_adsense_ads": 0}',
  `premium_ex_date` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `web_device_id` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `cont_monetization` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `subscription_price` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.00',
  `rec_feed` set('on','off') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'off',
  `online_ind` set('on','off') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'on',
  `is_online` varchar(600) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '{"last_seen": "0", "online_ind": "off"}',
  `is_root` enum('Y','N') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'N',
  `facebook` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `twitter` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `youtube` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `instagram` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `vkontakte` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `tiktok` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `linkedin` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `posts` (`posts`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `cl_users` (`id`, `username`, `fname`, `lname`, `about`, `gender`, `email`, `phone`, `em_code`, `email_conf_code`, `phone_conf_code`, `password`, `joined`, `logged_in_with`, `start_up`, `last_active`, `ip_address`, `language`, `avatar`, `cover`, `cover_orig`, `active`, `verified`, `admin`, `posts`, `followers`, `following`, `website`, `country_id`, `city`, `last_post`, `last_swift`, `last_ad`, `profile_privacy`, `follow_privacy`, `contact_privacy`, `index_privacy`, `aff_bonuses`, `wallet`, `pnotif_token`, `refresh_token`, `settings`, `display_settings`, `swift`, `swift_update`, `info_file`, `is_premium`, `premium_settings`, `premium_ex_date`, `web_device_id`, `cont_monetization`, `subscription_price`, `rec_feed`, `online_ind`, `is_online`, `is_root`, `facebook`, `twitter`, `youtube`, `instagram`, `vkontakte`, `tiktok`, `linkedin`) VALUES
(1,	'administrator',	'Administrator',	'',	'',	'M',	'2195299055@qq.com',	'',	'',	'0',	'',	'$2y$10$C66BPl2ghZF3fpjfFV4ZYe3tUs.BVgyrGaCgvgFJxcMOiY7uUAyHy',	'1750577068',	'system',	'done',	'1750580966',	'::1',	'english',	'upload/default/admin-avatar.png',	'upload/default/cover.png',	'upload/default/cover.png',	'1',	'1',	'1',	1,	0,	0,	'',	1,	'',	0,	'',	0,	'everyone',	'everyone',	'everyone',	'Y',	0,	'0.00',	'{\"token\": \"\",\"type\": \"android\"}',	'0',	'{\"notifs\":{\"like\":1,\"subscribe\":1,\"subscribe_request\":1,\"subscribe_accept\":1,\"reply\":1,\"repost\":1,\"mention\":1},\"enotifs\":{\"like\":0,\"subscribe\":0,\"subscribe_request\":0,\"subscribe_accept\":0,\"reply\":0,\"repost\":0,\"mention\":0}}',	'{\"color_scheme\": \"default\",\"background\": \"default\"}',	NULL,	'0',	'',	'0',	'{\"disable_native_ads\": 0,\"disable_adsense_ads\": 0}',	'0',	'',	'N',	'0.00',	'off',	'on',	'{\"last_seen\": 1750580966,\"online_ind\": \"on\"}',	'Y',	'',	'',	'',	'',	'',	'',	'');


-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_verifications`;

CREATE TABLE `cl_verifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `full_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `text_message` varchar(1200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `video_message` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `time` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_wallet_history`;

CREATE TABLE `cl_wallet_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `operation` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `amount` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.00',
  `json_data` varchar(3000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '[]',
  `time` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `status` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'success',
  `trans_id` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- --------------------------------------------------------

DROP TABLE IF EXISTS `cl_wallet_payout`;

CREATE TABLE `cl_wallet_payout` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT '0',
  `amount` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0.00',
  `method` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'None',
  `requisites` varchar(620) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `time` varchar(25) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;



-- THE END
