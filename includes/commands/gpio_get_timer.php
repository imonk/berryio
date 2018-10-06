<?
/*------------------------------------------------------------------------------
  BerryIO GPIO Get Timer Command
------------------------------------------------------------------------------*/

$title = 'GPIO Control';

// Load the GPIO functions
require_once(FUNCTIONS.'gpio.php');

// Check the args
if(count($args) != 1)
{
  $content .= usage('Please provide pin number');
  return FALSE;
}

// Get the timer
$date = gpio_get_timer($args[0]);
if($date === FALSE)
{
  $content .= message('No timer set for GPIO pin "'.$args[0].'"', 'gpio_status');
  return FALSE;
} else {
	$content .= $date->format('U = Y-m-d H:i:s');
}

if($GLOBALS['EXEC_MODE'] != 'api')
  $content .= go_to('gpio_status');
