$(document).on('turbolinks:load', function() {
  jQuery(function() {
    return $('.todo-tasks').sortable({
      axis: 'y',
      update: function() {
        return $.post($(this).data('update-url'), $(this).sortable('serialize'));
      }
    })
  })
})
