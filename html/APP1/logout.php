<?php
	session_start();
	session_destroy();
	header("Location: /APP1/index.php");
?>
