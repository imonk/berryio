<?
/*------------------------------------------------------------------------------
  BerryIO GPIO Set Timer Command
------------------------------------------------------------------------------*/

$title = 'GPIO Control';

// Load the GPIO functions
require_once(FUNCTIONS.'gpio.php');

// Check the args
if(count($args) != 2)
{
  $content .= usage('Please provide pin and duration');
  return FALSE;
}

// Set the Timer
if(gpio_set_timer($args[0], $args[1]) === FALSE)
{
  $content .= message('ERROR: Cannot set timer for GPIO pin "'.$args[0].'" for "'.$args[1].'" seconds', 'gpio_status');
  return FALSE;
}

//$GLOBALS['GPIO_TIMERS'][$args[0] = FALSE;

if($GLOBALS['EXEC_MODE'] != 'api')
  $content .= go_to('gpio_status');
