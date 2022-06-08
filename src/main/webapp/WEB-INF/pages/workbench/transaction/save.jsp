<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="../../jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="../../jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="../../jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="../../jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="../../jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="../../jquery/bs_typeahead/bootstrap3-typeahead.min.js"></script>
	<script type="text/javascript">

		$(function () {
			//日期查询插件
			$(".mydate").datetimepicker({
				language: 'zh-CN',//语言
				format: 'yyyy-mm-dd',//日期格式
				minView: 'month',//日期选择器上最小能选择的日期的视图
				initialDate: new Date(),// 日历的初始化显示日期，此处默认初始化当前系统时间
				autoclose: true,//选择日期之后，是否自动关闭日历
				todayBtn: true,//是否显示当前日期的按钮
				clearBtn: true //是否显示清空按钮
			});

			$("#contactsByName").keydown(function (e) {
				if(e.keyCode==13){
					$.ajax({
						url:"select/ContactsList",
						data:{name:$("#contactsByName").val()},
						success:function (result) {
							var html='';
							$.each(result.data,function (i,item) {
								html+=`
								<tr>
                                <td><input class="contactsByName" type="radio" name="contacts" data-id="${'${item.id}'}" data-name="${'${item.fullName}'}"/></td>
                                    <td>${'${item.fullName}'}</td>
                                    <td>${'${item.email}'}</td>
                                <td>${'${item.mphone}'}</td>
                                </tr>
								`;
							})
							$("#ContactsList").html(html);
						}
					});
					return false;
				}
			})

            $("#ContactsList").delegate(".contactsByName","click",function () {
                $("#create-contactsName").val($(this).attr("data-name"));
                $("#contactsId").val($(this).attr("data-id"));
            });

            $("#selectActivityList").keydown(function (e) {
                if(e.keyCode==13){
                    $.ajax({
                        url:"select/ActivityList",
                        data:{name:$("#selectActivityList").val()},
                        success:function (result) {
                            var html='';
                            $.each(result.data,function (i,item) {
                                html+=`
								<tr>
								<td><input class="activityId" type="radio" name="ddd" data-name="${'${item.name}'}" data-id="${'${item.id}'}" /></td>
								<td>${'${item.name}'}</td>
								<td>${'${item.startDate}'}</td>
								<td>${'${item.endDate}'}</td>
								<td>${'${item.owner}'}</td>
							</tr>
								`;
                            })
                            $("#activityList").html(html);

                        }
                    });
                    return false;
                }
            })
			//未来元素事件注册
			$("#activityList").delegate(".activityId","click",function () {
				$("#create-activitySrc").val($(this).attr("data-name"));
				$("#activityId").val($(this).attr("data-id"));
			});
			//自动补全功能
			$("#create-accountName").typeahead({
				source: function (query,process)  {
					$.ajax({
						url:"select/ByName",
						data:{name:query},
						success:function (result) {
							var names=result.data.map(x=>x.name);
							process(names);
						}
					});
				}
			});

			//保存按钮事件
			$("#btuAdd").click(function () {
				$.ajax({
					url:"api/tranAdd",
					data:$("#addForm").serialize(),
					type:"post",
					success:function (result) {
						if(result.code==2000){
							alert("操作成功")
							window.location="index";
						}else{
							alert(result.message)``````````````````````````````````````````````````````````````````````````
						}
					}
				});
			});

			//取消按钮事件
			$("#butCancel").click(function () {
				window.history.go(-1);
			});
		})




	</script>
</head>
<body>

	<!-- 查找市场活动 -->	
	<div class="modal fade" id="findMarketActivity" role="dialog">
		<div class="modal-dialog" role="document" style="width: 80%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">查找市场活动</h4>
				</div>
				<div class="modal-body">
					<div class="btn-group" style="position: relative; top: 18%; left: 8px;">
						<form class="form-inline" role="form">
						  <div class="form-group has-feedback">
						    <input id="selectActivityList" type="text" class="form-control" style="width: 300px;" placeholder="请输入市场活动名称，支持模糊查询">
						    <span class="glyphicon glyphicon-search form-control-feedback"></span>
						  </div>
						</form>
					</div>
					<table id="activityTable3" class="table table-hover" style="width: 900px; position: relative;top: 10px;">
						<thead>
							<tr style="color: #B3B3B3;">
								<td></td>
								<td>名称</td>
								<td>开始日期</td>
								<td>结束日期</td>
								<td>所有者</td>
							</tr>
						</thead>
						<tbody id="activityList">


						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- 查找联系人 -->	
	<div class="modal fade" id="findContacts" role="dialog">
		<div class="modal-dialog" role="document" style="width: 80%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">查找联系人</h4>
				</div>
				<div class="modal-body">
					<div class="btn-group" style="position: relative; top: 18%; left: 8px;">
						<form class="form-inline" role="form">
						  <div class="form-group has-feedback">
						    <input type="text" id="contactsByName" class="form-control" style="width: 300px;" placeholder="请输入联系人名称，支持模糊查询">
						    <span class="glyphicon glyphicon-search form-control-feedback"></span>
						  </div>
						</form>
					</div>
					<table id="activityTable" class="table table-hover" style="width: 900px; position: relative;top: 10px;">
						<thead>
							<tr style="color: #B3B3B3;">
								<td></td>
								<td>名称</td>
								<td>邮箱</td>
								<td>手机</td>
							</tr>
						</thead>
						<tbody id="ContactsList">


						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	
	<div style="position:  relative; left: 30px;">
		<h3>创建交易</h3>
	  	<div style="position: relative; top: -40px; left: 70%;">
			<button type="button" class="btn btn-primary" id="btuAdd">保存</button>
			<button type="button" class="btn btn-default" id="butCancel">取消</button>
		</div>
		<hr style="position: relative; top: -40px;">
	</div>
	<form class="form-horizontal" role="form" style="position: relative; top: -30px;" id="addForm">
		<div class="form-group">
			<label for="create-transactionOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
			<div class="col-sm-10" style="width: 300px;">
				<select class="form-control" id="create-transactionOwner" name="owner">
					<option></option>
				  <c:forEach var="u" items="${users}">
					  <option value="${u.id}">${u.name}</option>
				  </c:forEach>
				</select>
			</div>
			<label for="create-amountOfMoney" class="col-sm-2 control-label">金额</label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control" id="create-amountOfMoney">
			</div>
		</div>
		
		<div class="form-group">
			<label for="create-transactionName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control" id="create-transactionName" name="name">
			</div>
			<label for="create-expectedClosingDate" class="col-sm-2 control-label">预计成交日期<span style="font-size: 15px; color: red;">*</span></label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control mydate" id="create-expectedClosingDate" name="expectedDate">
			</div>
		</div>
		
		<div class="form-group">
			<label for="create-accountName" class="col-sm-2 control-label">客户名称<span style="font-size: 15px; color: red;">*</span></label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control" id="create-accountName" placeholder="支持自动补全" name="customerId">
			</div>
			<label for="create-transactionStage" class="col-sm-2 control-label">阶段<span style="font-size: 15px; color: red;">*</span></label>
			<div class="col-sm-10" style="width: 300px;">
			  <select class="form-control" id="create-transactionStage" name="stage">
			  	<option></option>
			  	<c:forEach var="d" items="${dicValues}">
					<option value="${d.id}">${d.value}</option>
				</c:forEach>
			  </select>
			</div>
		</div>
		
		<div class="form-group">
			<label for="create-transactionType" class="col-sm-2 control-label">类型</label>
			<div class="col-sm-10" style="width: 300px;">
				<select class="form-control" id="create-transactionType" name="type">
				  <option></option>
				  <c:forEach items="${transactionTypes}" var="t">
					  <option value="${t.id}">${t.value}</option>
				  </c:forEach>
				</select>
			</div>
			<label for="create-possibility" class="col-sm-2 control-label">可能性</label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control" id="create-possibility" >
			</div>
		</div>
		
		<div class="form-group">
			<label for="create-clueSource" class="col-sm-2 control-label">来源</label>
			<div class="col-sm-10" style="width: 300px;">
				<select class="form-control" id="create-clueSource" name="source">
				  <option></option>
				  <c:forEach var="s" items="${sources}">
					  <option value="${s.id}">${s.value}</option>
				  </c:forEach>

				</select>
			</div>
			<label for="create-activitySrc" class="col-sm-2 control-label">市场活动源&nbsp;&nbsp;<a  data-toggle="modal" data-target="#findMarketActivity"><span class="glyphicon glyphicon-search"></span></a></label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="hidden" id="activityId" name="activityId" />
				<input type="text" class="form-control"  id="create-activitySrc"  readonly>
			</div>
		</div>
		
		<div class="form-group">
			<label for="create-contactsName" class="col-sm-2 control-label">联系人名称&nbsp;&nbsp;<a

					data-toggle="modal" data-target="#findContacts"><span class="glyphicon glyphicon-search"></span></a></label>
			<div class="col-sm-10" style="width: 300px;">
                <input type="hidden" id="contactsId" name="contactsId" />
				<input type="text" class="form-control" id="create-contactsName"  readonly>
			</div>
		</div>
		
		<div class="form-group">
			<label for="create-describe" class="col-sm-2 control-label">描述</label>
			<div class="col-sm-10" style="width: 70%;">
				<textarea class="form-control" rows="3" id="create-describe" name="description"></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label for="create-contactSummary" class="col-sm-2 control-label">联系纪要</label>
			<div class="col-sm-10" style="width: 70%;">
				<textarea class="form-control" rows="3" id="create-contactSummary" name="contactSummary"></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control mydate" id="create-nextContactTime" name="nextContactTime">
			</div>
		</div>
		
	</form>
</body>
</html><%@ page contentType="text/html;charset=UTF-8" language="java" %>