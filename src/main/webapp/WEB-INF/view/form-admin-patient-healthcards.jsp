<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
               href="#collapse-admin-patient-healthcards"><fmt:message key="form.healthcards"/></a>
        </h4>
    </div>
    <div id="collapse-admin-patient-healtchards" class="panel-collapse collapse">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <ul class="list-unstyled" id="healthCards">
                            <c:forEach items="${healthcardsById}" var="item">
                                <li class='card-item'>
                                    <input value="${item.number}>" name='healthCardsList'
                                           style='border:0; background:none;' readonly>
                                    <button type='button' onclick='deleteHealthCard(this)'
                                            class='btn btn-danger btn-xs pull-right'><i
                                            class='fa  fa-remove'></i> Eliminar
                                    </button>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input type="number" class="form-control" id="inputHealthCard"
                               placeholder="23461256012578">
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