<?
/*------------------------------------------------------------------------------
  BerryIO GPIO Set Mode Command
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

// Set the GPIO Mode

if(($mode = gpio_get_mode($args[0])) === FALSE)
{
  $content .= message('ERROR: Cannot get GPIO pin "'.$args[0].'" mode', 'gpio_status');
  return FALSE;
} else {
  $content .= $mode;
}

if($GLOBALS['EXEC_MODE'] != 'api')
  $content .= go_to('gpio_status');
