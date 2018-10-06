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
if(gpio_get_mode($args[0])
{
  $content .= message('ERROR: Cannot set GPIO pin "'.$args[0].'" into mode "'.$args[1].'"', 'gpio_status');
  return FALSE;
}

if($GLOBALS['EXEC_MODE'] != 'api')
  $content .= go_to('gpio_status');
