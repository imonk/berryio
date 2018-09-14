
<div class="timer">
  <img id="<?=$id?>_img" src="/images/layout/timer/stopwatch.png" alt="<?= $value ? 'on' : 'off'?>" title="<?= $value ? 'on' : 'off'?>" />
  <div class="off" onclick="startTimer(event, '<?=$type?>', '<?=$id?>', 0, '<?=$set_function !== TRUE ? $set_function : ''?>')">&nbsp;</div>
  <div class="on"  onclick="startTimer(event, '<?=$type?>', '<?=$id?>', 1, '<?=$set_function !== TRUE ? $set_function : ''?>')">&nbsp;</div>
</div>
