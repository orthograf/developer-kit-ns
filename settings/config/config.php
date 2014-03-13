<?php

$config['smarty']['dir']['templates'] = array(
    'themes' => '___path.skins.dir___/___view.skin___/themes/',
    'tpls'   => '___path.skins.dir___/___view.skin___/tpls/',
);

/* Theme */
$config['view']['theme'] = 'default';
//$config['view']['header']['top'] = 'static'; // static or fixed
$config['view']['header']['top'] = 'fixed'; // static or fixed
$config['view']['header']['banner'] = true;

$config['head']['default']['js'] = Config::Get('assets.ls.head.default.js');
$config['head']['default']['js'][] = '___path.skin.dir___/assets/js/template.js';

/* Bootstrap */
$config['head']['default']['js'][] = '___path.skin.dir___/assets/bootstrap/js/bootstrap.min.js';

$config['head']['default']['css'] = array(
	/* Bootstrap */
	"___path.skin.dir___/assets/bootstrap/css/bootstrap-2.min.css",
	"___path.skin.dir___/assets/bootstrap/css/bootstrap-3.min.css",
	"___path.skin.dir___/assets/bootstrap/css/bootstrap-responsive.min.css",
	/* Font-Awesome */
	//"___path.skin.dir___/assets/font-awesome/css/font-awesome.min.css",

/* Structure */
	"___path.skin.dir___/assets/css/base.css",
	"___path.frontend.dir___/libs/vendor/markitup/skins/default/style.css",
    "___path.frontend.dir___/libs/vendor/markitup/sets/default/style.css",
    "___path.frontend.dir___/libs/vendor/jcrop/jquery.Jcrop.css",
    "___path.frontend.dir___/libs/vendor/prettify/prettify.css",
	"___path.skin.dir___/assets/css/grid.css",
	"___path.skin.dir___/assets/css/common.css",
	"___path.skin.dir___/assets/css/text.css",
	"___path.skin.dir___/assets/css/forms.css",
	"___path.skin.dir___/assets/css/navs.css",
	"___path.skin.dir___/assets/css/icons.css",
	"___path.skin.dir___/assets/css/tables.css",
	"___path.skin.dir___/assets/css/topic.css",
	"___path.skin.dir___/assets/css/comments.css",
	"___path.skin.dir___/assets/css/blocks.css",
	"___path.skin.dir___/assets/css/blog.css",
	"___path.skin.dir___/assets/css/profile.css",
	"___path.skin.dir___/assets/css/wall.css",
	"___path.skin.dir___/assets/css/infobox.css",
	"___path.skin.dir___/assets/css/jquery.notifier.css",
	"___path.skin.dir___/assets/css/smoothness/jquery-ui.css",
	"___path.skin.dir___/assets/css/responsive.css",
	
	/* Theme */
	"___path.skin.url___/themes/___view.theme___/layouts/style.css",
	/* Themer Icons */
    '___path.skin.url___/assets/icons/css/fontello.css',

);

// Notifies/Emails
$config['module']['notify']['dir']           = '/notify/';
$config['module']['notify']['prefix']        = 'notify.';       // Префикс шаблонов писем

$config['module']['user']['profile_photo_size'] = 250;          // размер фотопрофиля по умолчанию
$config['module']['user']['profile_avatar_size'] = 80;          // размер аватара по умолчанию

return $config;
?>