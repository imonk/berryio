
<script type="text/javascript">

  function startTimer(event, type, id, value, set_function) {
    var timer = document.getElementById(id+'_img');
    toggle.src = '/images/layout/timer/'+type+'_on_off/'+value+'.png';

    var initialOffset = '81';
    var i = 1

    /* Need initial run as interval hasn't yet occured... */
    timer.circle_animation.css('stroke-dashoffset', initialOffset-(1*(initialOffset/value)));

    var interval = setInterval(function() {
        timer.h2.text(i);
        if (i == value) {    
          clearInterval(interval);
          return;
        }
        timer.circle_animation.css('stroke-dashoffset', initialOffset-((i+1)*(initialOffset/value)));
        i++;  
    }, 1000);
    
    if(set_function != '') {
      window[set_function](id, value);
    }
  }

</script>
