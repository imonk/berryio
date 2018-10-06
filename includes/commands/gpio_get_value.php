<?
/*------------------------------------------------------------------------------
  BerryIO GPIO Set Value Command
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

// Set the GPIO value
if(($value = gpio_get_value($args[0])) === FALSE)
{
  $content .= message('ERROR: Cannot set GPIO pin "'.$args[0].'"', 'gpio_status');
  return FALSE;
} else {
  $content .= $value;
}

if($GLOBALS['EXEC_MODE'] != 'api')
  $content .= go_to('gpio_status');
