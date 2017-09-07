<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
               href="#patient-healthcards"><fmt:message key="form.healthcards"/></a>
        </h4>
    </div>
    <div id="patient-healthcards" class="panel-collapse collapse">
        <div class="panel-footer">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <ul class="list-unstyled" id="healthCards">
                            <c:forEach items="${patient.healthcardsById}" var="item">
                                <li class='card-item'>
                                    <input value="${item.number}>" name='healthCardsList' readonly>
                                    <button type='button' onclick='deleteHealthCard(this)'
                                            class='btn btn-danger btn-xs pull-right'><i
                                            class='fa  fa-remove'></i> <fmt:message key="action.remove"/>
                                    </button>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input type="number" class="form-control" id="inputHealthCard"
                               placeholder="<fmt:message key="form.healthcard"/>">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <button type="button" onclick="addHealthCard()"
                                class="btn btn-primary btn-block"><i
                                class="fa  fa-plus-circle"></i>&nbsp;<fmt:message
                                key="form.healthcards.add"/>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>