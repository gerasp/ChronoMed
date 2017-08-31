/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function filter() {
    var date = $("#from_date").val();
    var from = new Date((date === "") ? "01/01/1970" : date);
    date = $("#to_date").val();
    var to = date === "" ? new Date() : new Date(date);
    $(".timeline").children().each(function () {
        var actual = new Date($(this).find("time").attr("datetime"));
        if (from <= actual && actual <= to)
            $(this).show();
        else
            $(this).hide();
    });
}
