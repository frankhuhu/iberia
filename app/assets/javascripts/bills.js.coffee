# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $('#bill_bill_date, #bill_paid_date').datepicker({
        format: 'mm/dd/yyyy',
        beforeShow: (input, inst) ->
            if ($(this).attr('readonly') == 'readonly')
                $(this).datepicker.prop("readonly", true);
            return
    });
    $('#bill_query_date').datepicker({
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
        window.location.href = "bills?query_date=" + this.value;
        return
    .focus ->
        $(".ui-datepicker-calendar").hide();
        return
