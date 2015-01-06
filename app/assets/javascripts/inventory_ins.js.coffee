# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $('#inventory_in_in_date, #inventory_in_paid_date').datepicker({
        format: 'mm/dd/yyyy'
    });
