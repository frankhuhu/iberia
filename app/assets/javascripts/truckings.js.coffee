# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $('#trucking_order_date, #trucking_received_date').datepicker({
        format: 'mm/dd/yyyy'
    });
