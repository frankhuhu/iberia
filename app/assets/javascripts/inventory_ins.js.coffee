# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $('#inventory_in_in_date, #inventory_in_paid_date').datepicker({
        format: 'mm/dd/yyyy'
    });
    $('#query_date').datepicker({
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        onClose: (dateText, inst) ->
            month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $(this).datepicker('setDate', new Date(year, month, 1));
            $(this).change();
            return
    })
    .change ->
        window.location.href = "inventory_ins?query_date=" + this.value;
        return
    .focus ->
        $(".ui-datepicker-calendar").hide();
        return
