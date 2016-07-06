<!DOCTYPE html>
<html>
<?php include('connection.php'); ?>

<?php

// first get http protocol if http or https
$admin_url = '';
$base_url = (isset($_SERVER['HTTPS']) &&

$_SERVER['HTTPS']!='off') ? 'https://' : 'http://';

// get default website root directory

$tmpURL = dirname(__FILE__);

// when use dirname(__FILE__) will return value like this "C:\xampp\htdocs\my_website",

//convert value to http url use string replace, 

// replace any backslashes to slash in this case use chr value "92"

$tmpURL = str_replace(chr(92),'/',$tmpURL);

// now replace any same string in $tmpURL value to null or ''

// and will return value like /localhost/my_website/ or just /my_website/

$tmpURL = str_replace($_SERVER['DOCUMENT_ROOT'],'',$tmpURL);

// delete any slash character in first and last of value

$tmpURL = ltrim($tmpURL,'/');

$tmpURL = rtrim($tmpURL, '/');


// check again if we find any slash string in value then we can assume its local machine

    if (strpos($tmpURL,'/')){

// explode that value and take only first value

       $tmpURL = explode('/',$tmpURL);

       $tmpURL = $tmpURL[0];

      }

// now last steps

// assign protocol in first value

   if ($tmpURL !== $_SERVER['HTTP_HOST']){

// if protocol its http then like this

      $base_url .= $_SERVER['HTTP_HOST'].'/'.$tmpURL;
      $admin_url .= $base_url.'/admin';
   }
    else

// else if protocol is https

      $base_url .= $tmpURL.'/';

?>

<?php 
$pageClass = $_SERVER['REQUEST_URI']; 
$pageClass = explode('/', $pageClass);
//print_r($pageClass);
?>
<head>
<title>Php Apache</title>
<link rel="stylesheet" type="text/css" href="<?php echo $admin_url; ?>/common/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="<?php echo $admin_url; ?>/common/fonts/stylesheet.css"/>
<link rel="stylesheet" type="text/css" href="<?php echo $admin_url; ?>/common/css/custom.css"/>
<link rel="stylesheet" type="text/css" href="<?php echo $admin_url; ?>/common/fonts/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="<?php echo $admin_url; ?>/common/css/go-to-top.css"/>
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
</head>
<body class="<?php echo $pageClass[2]; ?>">
<div class="layout-header">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-12 col-sm-12- col-lg-12 text-center header-main">
				<h2>Logo</h2>
			</div>
		</div>
	</div>
</div>
<?php include('nav.php'); ?>