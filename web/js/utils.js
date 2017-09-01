
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
function addHealthCard() {
    var healthcard = $("#inputHealthCard").val();
    if (healthcard === "")
        return;
    var html = "<li class='health-card-item'> <input value='" + healthcard + "' name='addedHealthCards' style='border:0; background:none;' readonly> <button type='button' onclick='deleteHealthCard(this)' class='btn btn-danger btn-xs pull-right'><i class='fa  fa-remove'></i> Eliminar</button></li>";
    $("#healthCards").append(html);
}

function deleteHealthCard(button) {
    if (button.previousElementSibling.getAttribute("name") !== "addedHealthCards")
        button.previousElementSibling.setAttribute("name", "deletedHealthCards");
    else
        button.previousElementSibling.setAttribute("name", "trashHealthCardsList");
    button.previousElementSibling.attributes["2"].nodeValue += "text-decoration: line-through;";
    button.remove();
}

function addDoctor() {
    var healthcard = $("#inputDoctor").val();
    if (healthcard === "")
        return;
    var html = "<li class='health-card-item'> <input value='" + healthcard + "' name='addedBoardNumbers' style='border:0; background:none;' readonly> <button type='button' onclick='deleteDoctor(this)' class='btn btn-danger btn-xs pull-right'><i class='fa  fa-remove'></i> Eliminar</button></li>";
    $("#doctorList").append(html);
}

function deleteDoctor(button) {
    if (button.previousElementSibling.getAttribute("name") !== "addedBoardNumbers")
        button.previousElementSibling.setAttribute("name", "deletedBoardNumbers");
    else
        button.previousElementSibling.setAttribute("name", "trashDoctor");
    button.previousElementSibling.attributes["2"].nodeValue += "text-decoration: line-through;";
    button.remove();
}