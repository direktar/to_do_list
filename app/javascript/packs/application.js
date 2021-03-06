// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery-ui")
require("packs/flash_error")
require("packs/sortable")

$(document).on('turbolinks:load', function() {

  // HIDE EDIT TASK
  $(document).ready(()=> {
    $('.toggle').on('click', (e)=> {
      e.stopPropagation();
      e.preventDefault();
      $('#' + e.target.getAttribute('aria-controls')).toggleClass('hidden');
    })
  })

  $(function () {
    var nowDate = new Date();
    $('.deadline').datepicker({
      minDate: nowDate,
      todayHighlight: true,
      autoclose: true,
      dateFormat: 'dd-mm-yy'
    });
  });
})
