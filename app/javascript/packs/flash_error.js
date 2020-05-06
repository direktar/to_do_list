$(document).on('turbolinks:load', function() {
  setTimeout(function(){
    $('.flash').fadeOut('slow', function(){
      $(this).remove();
    })
    },1500);
});
