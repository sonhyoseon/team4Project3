<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jspf" %>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<%--<script src="http://code.jquery.com/jquery-latest.js"></script>--%>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/Board/css/modify.css">--%>
<script src="${pageContext.request.contextPath}/resources/Board/js/modify.js"></script>
<script src="${pageContext.request.contextPath}/resources/Board/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">

</script>

<style>
    .fileDrop {
        width: 80%;
        height: 150px;
        border: 1px dotted gray;
        background-color: #a2a098;
        margin: auto;
    }

    .tab-content {
        margin: auto;
        width: 80%;
    }

</style>
<script>
    $(document).ready(function () {
        $('#category').val('${boardVO.category}').prop("selected", true);
        $('#part').val('${boardVO.part}').prop("selected", true);

        if ('${boardVO.budget}' == '-1') {
            $("input:checkbox[id='budget_undefined']").prop("checked", true);
            $('#budget_defined').val(" ");
        } else {
            $('#budget_defined').val("${boardVO.budget}");
        }

        if ('${boardVO.startDate}' == "0001-01-01 00:00:00.0") {
            $("input:checkbox[id='undefined_start']").prop("checked", true);
            $('#startDate').val(" ");
        } else {
            var str = "${boardVO.startDate}";
            var tmp = str.substring(0, 10);
            $('#startDate').val(tmp);

        }
        if ('${boardVO.endDate}' == "0001-01-01 00:00:00.0") {
            $("input:checkbox[id='undefined_end']").prop("checked", true);
            $('#endDate').val(" ");
        } else {
            var str = "${boardVO.endDate}";
            var tmp = str.substring(0, 10);
            $('#endDate').val(tmp);

        }

    });
</script>
<div class="page-head">
    <div class="container">
        <div class="row">
            <div class="page-head-content">
                <h1 class="page-title">???????????? ?????? ??????</h1>
            </div>
        </div>
    </div>
</div>
<!-- Content Wrapper. Contains page content -->
<div class="content-area submit-property" style="background-color: #FCFCFC;">&nbsp;
    <div class="container">
        <div class="clearfix">
            <div class="wizard-container">

                <div class="wizard-card ct-wizard-orange" id="wizardProperty">
                    <form id='modifyForm' role="form" method="post">
                        <div class="wizard-header">
                            <h3>
                                ???????????? ?????? ?????? ?????? <br/>
                            </h3>
                        </div>

                        <ul>
                            <li><a href="#step1" data-toggle="tab">Step 1 </a></li>
                            <li><a href="#step2" data-toggle="tab">Step 2 </a></li>
                            <li><a href="#step3" data-toggle="tab">Step 3 </a></li>
                            <li><a href="#step4" data-toggle="tab">Finished </a></li>
                        </ul>

                        <div class="tab-content">

                            <div class="tab-pane" id="step1">
                                <div class="row p-b-15  ">
                                    <%--                                    <h4 class="info-text"> ???????????? ?????? ??????</h4>--%>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>?????? :</label>
                                            <input type="text" class="form-control" name="title" id="title"
                                                   value='<c:out value="${boardVO.title}"/>'
                                                   placeholder="??????????????? ???????????? ??????????????? (20?????????)">
                                        </div>
                                    </div>

                                    <div class="form-group" style="width: 800px;">

                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>?????? :</label><br/>
                                                <select
                                                        class="form-control" name="sido1" id="sido1"
                                                        style="width: 160px; display: inline-block;"></select>
                                                <select
                                                        class="form-control" name="gugun1" id="gugun1"
                                                        style="width: 160px; display: inline-block;"></select>
                                                <input type="hidden" id="address" name="address" value="">
                                                <input type="hidden" id="aaa" value="${boardVO.address}"/>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>?????? ?????????</label><br/>
                                            <input type="date"
                                                   class="form-control" name="startDate" id="startDate"
                                                   style="width: 200px; margin-right: 50px; display: inline-block;"></input>
                                            <label>?????? ????????? ??????</label>
                                            <input type="checkbox" id="undefined_start" name="undefined_start"
                                                   style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;">
                                        </div>

                                        <div class="form-group">
                                            <label>?????? ?????????</label><br/>
                                            <input type="date"
                                                   class="form-control" name="endDate" id="endDate"
                                                   style="width: 200px; margin-right: 50px; display: inline-block;"/>
                                            <label>?????? ????????? ??????</label>
                                            <input type="checkbox" id="undefined_end"
                                                   name="undefined_end"
                                                   style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;">
                                        </div>

                                    </div>

                                </div>
                            </div>
                            <!--  End step 1 -->

                            <div class="tab-pane" id="step2">
                                <div class="row">

                                    <div class="col-sm-12">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>?????? :</label><br/>
                                                <div class="input-group"
                                                     style="width: 320px; margin: 0px;">
                                                    <div class="input-group-addon">??????</div>
                                                    <input type="number" class="form-control" name="area"
                                                           value='<c:out value="${boardVO.area}"/>'/>
                                                    <div class="input-group-addon">???</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-sm-12">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <div class="form-row">
                                                    <label>?????? ?????? :</label><br/>
                                                    <div class="input-group"
                                                         style="width: 320px; margin-top: 0px; margin-bottom: 0px;">
                                                        <div class="input-group-addon">??????</div>
                                                        <input type="number" class="form-control"
                                                               name="budget_defined" id="budget_defined"/>
                                                        <div class="input-group-addon">??????</div>
                                                    </div>
                                                    ?????? ??????
                                                    <input type="checkbox" id="budget_undefined"
                                                           name="budget_undefined">
                                                    <input type="hidden" id="budget" name="budget" value="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-sm-12">

                                        <div class="col-sm-3" style="width : 250px;">
                                            <div class="form-group">
                                                <label>????????????</label> <select class="selectpicker show-tick form-control"
                                                                            name="category" id="category"
                                                                            value='<c:out value="${boardVO.category}"/>'>
                                                <option value="" disabled selected>????????????</option>
                                                <option value="?????????">?????????</option>
                                                <option value="??????">??????</option>
                                                <option value="??????/??????">??????/??????</option>
                                                <option value="??????/?????????">??????/?????????</option>
                                                <option value="??????/??????">??????/??????</option>
                                                <option value="??????/??????">??????/??????</option>
                                                <option value="??????">??????</option>
                                            </select>
                                            </div>
                                        </div>

                                        <div class="col-sm-3" style="width : 250px;">
                                            <div class="form-group">
                                                <label>???????????? ??????</label>
                                                <select class="selectpicker show-tick form-control" name="part"
                                                        id="part" value='<c:out value="${boardVO.part}"/>'>
                                                    <option value="" disabled selected>???????????? ??????</option>
                                                    <option value="??????">??????</option>
                                                    <option value="??????">??????</option>
                                                    <option value="??????">??????</option>
                                                    <option value="??????">??????</option>
                                                    <option value="??????">??????</option>
                                                    <option value="??????">??????</option>
                                                    <option value="??????">??????</option>
                                                    <option value="??????">??????</option>
                                                </select>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="col-sm-12">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label>?????? ?????? ?????? :</label><span
                                                    style="text-align:left;  vertical-align: text-top;">
                                                <textarea class="form-control" name="require"
                                                          id="exampleFormControlTextarea1" rows="10"
                                                <%--         placeholder=" <??????????????? ?????? ??????>&#13;&#10;      ??????) ????????? ?????? ??????, ?????? ?????? ???&#13;&#10;&#13;&#10; <????????? ?????? ??????>&#13;&#10;     ??????) ????????????, ?????? &#13;&#10;&#13;&#10; <???????????? / ????????????>&#13;&#10;     ??????) ???????????????, ?????? ???????????? ???
                                                           "--%>
                                                >

                                                        <c:out value="${boardVO.require}"/>
                                                </textarea> </span>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </div>
                            <!-- End step 2 -->

                            <div class="tab-pane" id="step3">
                                <h4 class="info-text">???????????? ??????</h4>
                                <div class="row">
                                    <div class="col-sm-6" align="center">
                                        <label>???????????? ????????? ?????????</label>
                                        <div class="fileDrop"></div>
                                    </div>
                                    <hr>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <ul class="mailbox-attachments clearfix uploadedList">
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--  End step 3 -->


                            <div class="tab-pane" id="step4">
                                <h4 class="info-text"> ???????????? </h4>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="">
                                            <p>
                                                <label><strong>??????????????? ?????? ??? ????????????</strong></label><br/>
                                                ??????????????? ????????? ????????? ?????? ????????? ????????? ?????? ????????? ????????? ??????????????? ???????????? ????????????.<br/>
                                                - ??????????????? ???????????? ?????? ???????????? ??????<br/>
                                                - ???????????? ????????? ????????? ?????? ????????? ??????<br/>
                                                - ???????????? ????????? ????????? ?????? ????????????<br/><br/>
                                                <label><strong>???????????? ??????????????? ??????</strong></label><br/>
                                                ??? ???. ???????????????????????? ???????????? ????????? , ?????? ??? ???????????? ????????? ?????? ???????????? ??????????????? ???????????? ????????????.<br/>
                                                ??? ????????? . ?????????????????? ???????????????????????? ????????? ?????? ???????????? ???????????? ???????????? ????????? ??? ????????????.<br/><br/>
                                                <label><strong>??????????????? ?????? ??? ????????????</strong></label><br/>
                                                ????????? ??????????????? ??????????????? ??????????????? ?????? ??? ??????????????? ???????????? ?????? ?????? ???????????????.<br/>
                                                ??? ????????? , ????????? ???????????? ????????? ????????? ????????? ?????? ?????? ???????????????.<br/>
                                            </p>

                                            <div class="checkbox">
                                                <input type="checkbox" id="agree_policy" name="agree_policy"/> <strong>
                                                ?????????</strong>
                                            </div>
                                            <div class="checkbox">
                                                <input type="checkbox" id="disagree_policy" name="disagree_policy"
                                                       style="margin-left: 50px;"/> <strong> ???????????? ?????? </strong>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--  End step 4 -->

                        </div>

                        <div class="wizard-footer">
                            <div class="pull-right">
                                <input type='button' class='btn btn-next btn-primary' name='next' value='Next'/>
                                <input type='submit' class='btn btn-finish btn-primary ' name='finish' value='Finish'/>
                            </div>

                            <div class="pull-left">
                                <input type='button' class='btn btn-previous btn-default' name='previous'
                                       value='Previous'/>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </form>
                </div>
                <!-- End submit form -->
            </div>
        </div>
    </div>
</div>

<script id="template" type="text/x-handlebars-template">
    <li>
        <div class="mailbox-attachment-info">
            <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
            <a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
            <a href="{{fullName}}"
               class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
            </span>
        </div>
    </li>
</script>

<script>

    var template = Handlebars.compile($("#template").html());

    $(".fileDrop").on("dragenter dragover", function (event) {
        event.preventDefault();
    });


    $(".fileDrop").on("drop", function (event) {
        event.preventDefault();

        var image = event.originalEvent.dataTransfer.files;

        var file = image[0];

        var formData = new FormData();

        formData.append("file", file);


        $.ajax({
            url: '/uploadAjax',
            data: formData,
            dataType: 'text',
            processData: false,
            contentType: false,
            type: 'POST',
            success: function (data) {

                var fileInfo = getFileInfo(data);

                var html = template(fileInfo);

                $(".uploadedList").append(html);
            }
        });
    });


    $("#modifyForm").submit(function (event) {
        event.preventDefault();

        var that = $(this);

        var str = "";
        $(".uploadedList .delbtn").each(function (index) {
            str += "<input type='hidden' name='image[" + index + "]' value='" + $(this).attr("href") + "'> ";
        });

        that.append(str);

        budget_check();
        startDate_check();
        endDate_check();

        if (input_check()) {
            that.get(0).submit();
        }

    });


    $(".uploadedList").on("click", ".delbtn", function (event) {
        var that = $(this);
        $.ajax({
            url: "/deleteFile",
            type: "post",
            data: {fileName: $(this).attr("href")},
            dataType: "text",
            success: function (result) {
                if (result == 'deleted') {
                    that.parent("div").remove();
                }
            }
        });
        return false;
    });


</script>

<%@ include file="../include/footer.jspf" %>