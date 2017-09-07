<script>
    function addHealthCard() {
        var healthcard = $("#inputHealthCard").val();
        if (healthcard === "")
            return;
        var html = "<li class='card-item'> <input value='" + healthcard + "'name='addedHealthCards' " +
            "style='border:0; background:none;' readonly> <button type='button' onclick='deleteHealthCard(this)' " +
            "class='btn btn-danger btn-xs pull-right'><i class='fa  fa-remove'>" +
            "</i>&nbsp;<fmt:message key='action.remove'/></button></li>";
        $("#healthCards").append(html);
        $("#inputHealthCard").val("");
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
        var boardNumber = $("#inputDoctor").val();
        if (boardNumber === "")
            return;
        var html = "<li class='card-item'> <input value='" + boardNumber + "'name='addedBoardNumbers' " +
            "style='border:0; background:none;' readonly> <button type='button' onclick='deleteDoctor(this)'" +
            " class='btn btn-danger btn-xs pull-right'><i class='fa  fa-remove'>" +
            "</i>&nbsp;<fmt:message key='action.remove'/></button></li>";
        $("#doctorList").append(html);
        $("#inputDoctor").val("");
    }

    function deleteDoctor(button) {
        if (button.previousElementSibling.getAttribute("name") !== "addedBoardNumbers")
            button.previousElementSibling.setAttribute("name", "deletedBoardNumbers");
        else
            button.previousElementSibling.setAttribute("name", "trashDoctor");
        button.previousElementSibling.attributes["2"].nodeValue += "text-decoration: line-through;";
        button.remove();
    }

</script>