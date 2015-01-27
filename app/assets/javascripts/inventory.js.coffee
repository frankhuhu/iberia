# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $('#inventory_in_date, #inventory_out_date, #inventory_paid_date, #inventory_cutoff_date, #inventory_erd').datepicker({
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
        window.location.href = "inventories?query_date=" + this.value;
        return
    .focus ->
        $(".ui-datepicker-calendar").hide();
        return
