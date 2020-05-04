$(document).on('turbolinks:load', function() {
  $(document).ready(function(){
    setTimeout(function(){
      $('.flash').fadeOut('slow', function(){
        $(this).remove();
      })
      },1500);
  });
})
