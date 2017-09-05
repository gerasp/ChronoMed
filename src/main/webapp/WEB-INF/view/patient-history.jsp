<h3 class="text-primary text-center">
    <small><fmt:message key="history.title"/></small><br>
    ${patient.name}&nbsp;${patient.surname}%>
</h3>
<blockquote>
    <footer><fmt:message key="history.bloodType"/></footer>
    <p>${patient.medicalhistoryById.bloodType}</p>
</blockquote>
<blockquote>
    <footer><fmt:message key="history.pathologies"/></footer>
    <p>${patient.medicalhistoryById.pathologies}</p>
</blockquote>
<blockquote>
    <footer><fmt:message key="history.surgeries"/></footer>
    <p>${patient.medicalhistoryById.surgeries}</p>
</blockquote>
<blockquote>
    <footer><fmt:message key="history.allergies"/></footer>
    <p>${patient.medicalhistoryById.allergies}</p>
</blockquote>
<blockquote>
    <footer><fmt:message key="history.familyHistory"/></footer>
    <p>${patient.medicalhistoryById.familyHistory}</p>
</blockquote>
<blockquote>
    <footer><fmt:message key="history.others"/></footer>
    <p>${patient.medicalhistoryById.others}</p>
</blockquote>
<div class="row not-print">
    <div class="col-md-12">
        <button class="btn btn-primary btn-block" onclick="window.print()">
            <fmt:message key="action.export"/>&nbsp;<i class="fa  fa-print"></i>
        </button>
    </div>
</div>
