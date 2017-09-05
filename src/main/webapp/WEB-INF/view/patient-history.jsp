<h3 class="text-primary text-center">
    <small><fmt:message key="history.title"/></small>
    <br>
    ${patient.name}&nbsp;${patient.surname}
</h3>
<div class="col-md-6">
    <blockquote>
        <footer><fmt:message key="history.allergies"/></footer>
        <p>${patient.allergies}</p>
    </blockquote>
    <blockquote>
        <footer><fmt:message key="history.familyHistory"/></footer>
        <p>${patient.familyHistory}</p>
    </blockquote>
    <blockquote>
        <footer><fmt:message key="history.others"/></footer>
        <p>${patient.others}</p>
    </blockquote>
</div>
<div class="col-md-6">
    <blockquote>
        <footer><fmt:message key="history.bloodType"/></footer>
        <p>${patient.bloodType}</p>
    </blockquote>
    <blockquote>
        <footer><fmt:message key="history.pathologies"/></footer>
        <p>${patient.pathologies}</p>
    </blockquote>
    <blockquote>
        <footer><fmt:message key="history.surgeries"/></footer>
        <p>${patient.surgeries}</p>
    </blockquote>
</div>
<div class="row not-print">
    <div class="col-md-12">
        <button class="btn btn-primary btn-block" onclick="window.print()">
            <fmt:message key="action.export"/>&nbsp;<i class="fa  fa-print"></i>
        </button>
    </div>
</div>
