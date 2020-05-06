$(document).on('turbolinks:load', function() {
  $('.todo-tasks').sortable({
    axis: 'y',
    handle: '.drag',
    update: function() {
      $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  })
})
