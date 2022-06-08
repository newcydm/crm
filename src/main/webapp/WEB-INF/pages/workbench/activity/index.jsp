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

	<!--引入分页插件-->
	<link rel="stylesheet" href="../../jquery/bs_pagination-master/css/jquery.bs_pagination.min.css" />
	<script type="text/javascript" src="../../jquery/bs_pagination-master/js/jquery.bs_pagination.min.js"></script>
	<script type="text/javascript" src="../../jquery/bs_pagination-master/localization/en.js"></script>


<script type="text/javascript">

	//查询条件
	var namess,owner,startDate,endDate;
	var page=1;//当前页
	var pages=4;//每页显示数据
	function load(){
		$.ajax({
			url:"activity-list",
			data:{
				name:namess,
				owner:owner,
				startDate:startDate,
				endDate:endDate,
				page:page,
				pages:pages
			},
			success:function (result){
				var html='';
				$.each(result.data.activitys,function (i,obj) {
					html+=`
					<tr class="active">
                            <td><input type="checkbox" class="activityId" name='ids' value='${'${obj.id}'}'/></td>
                            <td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail?id=${'${obj.id}'}';">${'${obj.name}'}</a></td>
                            <td>${'${obj.owner}'}</td>
                            <td>${'${obj.startDate}'}</td>
                            <td>${'${obj.endDate}'}</td>
                        </tr>
					`;
				});
				$("#activity-list").html(html);
				$("#activitySize").text(result.data.size);
				//初始化分页插件
				$("#pagination").bs_pagination({
					currentPage:	page,		//页码
					rowsPerPage: 	pages,		//每页大小
					totalPages: result.data.pageSize,			//总页数
					totalRows: result.data.size,	//总行数
					maxRowsPerPage: 100,
					visiblePageLinks:5,				//显示的翻页卡片数
					showGoToPage:true, 				//是否显示"跳转到第几页"
					showRowsPerPage:true, 			//是否显示"每页显示条数"
					showRowsInfo:true,  			//是否显示"记录的信息",
					//翻页事件：每次切换页号都会自动触发此函数，函数的pageInfo参数能得到换之后的页号和每页显示条数
					onChangePage: function(e, pageInfo){
						page=pageInfo.currentPage;
						pages=pageInfo.rowsPerPage;
						load();
					}
				})
			}
		});
	}


	$(function() {
		load();
		//批量导出按钮
		$("#exportActivityAllBtn").click(function () {
			location="api/exportActivityBatch";
		});
		//选择导出按钮
		$("#exportActivityXzBtn").click(function () {
			if($(".activityId:checked").length==0){
				alert("请选择")
				return ;
			}
			location="api/exportActivityBatch?"+$("#activityDelForm").serialize();
		});

		//导入按钮
		$("#importActivityBtn").click(function () {
			var file=$("#activityFile").get(0).files[0];

			if($("#activityFile").get(0).files.length==0){
				alert("请上传文件")
				return;
			}
			if(file.name.substring(file.name.lastIndexOf(".")).toUpperCase()!=".XLS"){
				alert("文件格式不对")
				return;
			}
			if(file.size>(1024*1024*5)){
				alert("文件太大了")
				return;
			}
			var formDate=new FormData();
			formDate.append("activityFile",file);
			$.ajax({
				url:"api/importActivityExcel",
				data:formDate,
				type:"post",
				contentType:false,
				processData:false,
				success:function (result) {
					if(result.code==2000){
						page=1;
						load();
						alert("导入成功");
						$("#importActivityModal").modal("hide");
					}else{
						alert("导入失败"+result.message);
					}
				}
			});

		});

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

		//查询点击按钮
		$("#activity-query").click(function () {
			namess = $("#queryName").val();
			owner = $("#queryOwner").val();
			startDate = $("#queryStartDate").val();
			endDate = $("#queryEndDate").val();
			load();
		});

		//批量选中
		$("#checkboxS").click(function () {
			$(".activityId").prop("checked", $(this).prop("checked"));
		});

		//单选（未来事件）
		$("#activity-list").delegate(".activityId", "click", function () {
			if ($(".activityId").length == $(".activityId:checked").length) {
				$("#checkboxS").prop("checked", true);
			} else {
				$("#checkboxS").prop("checked", false);
			}
		});

		//保存按钮事件
		$("#butAdd").click(function () {
			var activity = {
				owner: $("#ownerAdd").val(),
				name: $("#nameAdd").val(),
				startDate: $("#startDateAdd").val(),
				endDate: $("#endDateAdd").val(),
				cost: $("#costAdd").val(),
				description: $("#descriptionAdd").val()
			};

			$.ajax({
				url: "api/activityAdd",
				type: "post",
				data: activity,
				success: function (result) {
					if (result.code == 2000) {
						//增加成功关闭模态框，清空数据，刷新页面
						$("#createActivityModal").modal("hide");
						$("#ownerAdd").val('');
						$("#nameAdd").val('');
						$("#startDateAdd").val('');
						$("#endDateAdd").val('');
						$("#costAdd").val('');
						$("#descriptionAdd").val('');
						load()
					} else {
						alert(result.message);
					}
				}
			});
		});

		//删除按钮事件
		$("#butDel").click(function () {
			//查找被选中元素
			var ids = $("#activityDelForm").serialize();
			$.ajax({
				url: "api/activityDelete",
				type: "post",
				data: ids,
				success: function (result) {
					if (result.code == 2000) {
						alert(result.message);
						$("#checkboxS").prop("checked",false);
						load()
					} else {
						alert(result.message)
					}
				}
			});

		});

		//修改按钮回显事件
		$("#butEcho").click(function () {
			if($(".activityId:checked").length!=1){//如果没选或选了多个则结束函数
				alert("请选择一个活动")
				return;
			}
			//找到被选中的值
			$.ajax({
				url:"api/activityEcho",
				data:{id:$(".activityId:checked").val()},
				success:function (result) {
					//显示修改模态框
					$("#editActivityModal").modal("show");
					//数据填入修改模态框
					$(`select>option[data-id='${'${result.data.owner}'}']`).prop({selected:true});
					$("#nameEcho").val(result.data.name);
					$("#startDateEcho").val(result.data.startDate);
					$("#endDateEcho").val(result.data.endDate);
					$("#costEcho").val(result.data.cost);
					$("#descriptionEcho").val(result.data.description);
				}
			});

		});

		//修改按钮修改事件
		$("#butUpdate").click(function () {

			//找到用户输入的值
			var activity={
				id:$(".activityId:checked").val(),
				owner:$("#ownerEcho").val(),
				name:$("#nameEcho").val(),
				startDate:$("#startDateEcho").val(),
				endDate:$("#endDateEcho").val(),
				cost:$("#costEcho").val(),
				description:$("#descriptionEcho").val()
			};
			$.ajax({
				url:"api/activityUpdate",
				type:"post",
				data:activity,
				success:function (result) {
					if(result.code==2000){
						alert(result.message)
						//模态框隐藏
						$("#editActivityModal").modal("hide");
						load()//刷新页面
					}else{
						alert(result.message)
					}
				}
			});

		});

	})
</script>
</head>
<body>

	<!-- 创建市场活动的模态窗口 -->
	<div class="modal fade" id="createActivityModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel1">创建市场活动</h4>
				</div>
				<div class="modal-body">
				
					<form class="form-horizontal" role="form">
					
						<div class="form-group">
							<label for="create-marketActivityOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">




								<select id="ownerAdd" class="form-control" id="create-marketActivityOwner">
								  <c:forEach var="u" items="${users}">
									  <option value="${u.id}">${u.name}</option>
								  </c:forEach>
								</select>
							</div>
                            <label for="create-marketActivityName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input id="nameAdd" type="text" class="form-control" id="create-marketActivityName">
                            </div>
						</div>
						
						<div class="form-group">
							<label for="create-startTime" class="col-sm-2 control-label">开始日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input id="startDateAdd" type="text" class="form-control mydate" id="create-startTime">
							</div>
							<label for="create-endTime" class="col-sm-2 control-label">结束日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input id="endDateAdd" type="text" class="form-control mydate" id="create-endTime">
							</div>
						</div>
                        <div class="form-group">

                            <label for="create-cost" class="col-sm-2 control-label">成本</label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input id="costAdd" type="text" class="form-control" id="create-cost">
                            </div>
                        </div>
						<div class="form-group">
							<label for="create-describe" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea id="descriptionAdd" class="form-control" rows="3" id="create-describe"></textarea>
							</div>
						</div>
						
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button id="butAdd" type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改市场活动的模态窗口 -->
	<div class="modal fade" id="editActivityModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 85%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel2">修改市场活动</h4>
				</div>
				<div class="modal-body">
				
					<form class="form-horizontal" role="form">
					
						<div class="form-group">
							<label for="edit-marketActivityOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select id="ownerEcho" class="form-control" id="edit-marketActivityOwner">
									<c:forEach var="u" items="${users}">
										<option value="${u.id}" data-id="${u.name}" >${u.name}</option>
									</c:forEach>
								</select>
							</div>

                            <label for="edit-marketActivityName" class="col-sm-2 control-label">名称<span style="font-size: 15px; color: red;">*</span></label>
                            <div class="col-sm-10" style="width: 300px;">
                                <input id="nameEcho" type="text" class="form-control" id="edit-marketActivityName" >
                            </div>
						</div>

						<div class="form-group">

							<label for="edit-startTime" class="col-sm-2 control-label mydate" >开始日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input id="startDateEcho" type="text" class="form-control mydate" id="edit-startTime" >
							</div>
							<label for="edit-endTime" class="col-sm-2 control-label mydate">结束日期</label>
							<div class="col-sm-10" style="width: 300px;">
								<input id="endDateEcho" type="text" class="form-control mydate" id="edit-endTime">
							</div>
						</div>
						
						<div class="form-group">
							<label for="edit-cost" class="col-sm-2 control-label">成本</label>
							<div class="col-sm-10" style="width: 300px;">
								<input id="costEcho" type="text" class="form-control" id="edit-cost" >
							</div>
						</div>
						
						<div class="form-group">
							<label for="descriptionEcho" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="descriptionEcho"></textarea>
							</div>
						</div>
						
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="butUpdate">更新</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 导入市场活动的模态窗口 -->
    <div class="modal fade" id="importActivityModal" role="dialog">
        <div class="modal-dialog" role="document" style="width: 85%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">导入市场活动</h4>
                </div>
                <div class="modal-body" style="height: 350px;">
                    <div style="position: relative;top: 20px; left: 50px;">
                        请选择要上传的文件：<small style="color: gray;">[仅支持.xls或.xlsx格式]</small>
                    </div>
                    <div style="position: relative;top: 40px; left: 50px;">
                        <input type="file" id="activityFile">
                    </div>
                    <div style="position: relative; width: 400px; height: 320px; left: 45% ; top: -40px;" >
                        <h3>重要提示</h3>
                        <ul>
                            <li>操作仅针对Excel，仅支持后缀名为XLS/XLSX的文件。</li>
                            <li>给定文件的第一行将视为字段名。</li>
                            <li>请确认您的文件大小不超过5MB。</li>
                            <li>日期值以文本形式保存，必须符合yyyy-MM-dd格式。</li>
                            <li>日期时间以文本形式保存，必须符合yyyy-MM-dd HH:mm:ss的格式。</li>
                            <li>默认情况下，字符编码是UTF-8 (统一码)，请确保您导入的文件使用的是正确的字符编码方式。</li>
                            <li>建议您在导入真实数据之前用测试文件测试文件导入功能。</li>
                        </ul>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="importActivityBtn" type="button" class="btn btn-primary">导入</button>
                </div>
            </div>
        </div>
    </div>
	
	
	<div>
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>市场活动列表</h3>
			</div>
		</div>
	</div>
	<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
		<div style="width: 100%; position: absolute;top: 5px; left: 10px;">
		
			<div class="btn-toolbar" role="toolbar" style="height: 80px;">
				<form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">名称</div>
				      <input id="queryName" class="form-control" type="text">
				    </div>
				  </div>

				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">所有者</div>
				      <input id="queryOwner" class="form-control" type="text">
				    </div>
				  </div>


				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">开始日期</div>
					  <input id="queryStartDate" class="form-control mydate" type="text" id="startTime" />
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">结束日期</div>
					  <input id="queryEndDate" class="form-control mydate" type="text" id="endTime">
				    </div>
				  </div>
				  
				  <button id="activity-query" type="button" class="btn btn-default">查询</button>
				  
				</form>
			</div>
			<form id="activityDelForm">
			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createActivityModal"><span class="glyphicon glyphicon-plus"></span> 创建</button>
				  <button type="button" id="butEcho" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> 修改</button>

				  <button id="butDel" type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
				</div>
				<div class="btn-group" style="position: relative; top: 18%;">
                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#importActivityModal" ><span class="glyphicon glyphicon-import"></span> 上传列表数据（导入）</button>
                    <button id="exportActivityAllBtn" type="button" class="btn btn-default"><span class="glyphicon glyphicon-export"></span> 下载列表数据（批量导出）</button>
                    <button id="exportActivityXzBtn" type="button" class="btn btn-default"><span class="glyphicon glyphicon-export"></span> 下载列表数据（选择导出）</button>
                </div>
			</div>
			<div style="position: relative;top: 10px;">
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input id="checkboxS" type="checkbox" /></td>
							<td>名称</td>
                            <td>所有者</td>
							<td>开始日期</td>
							<td>结束日期</td>
						</tr>
					</thead>
					<tbody id="activity-list">


					</tbody>
				</table>

			</div>
			</form>
			
			<%--<div style="height: 50px; position: relative;top: 30px;">--%>
				<%--<div>--%>
					<%--<button type="button" class="btn btn-default" style="cursor: default;">共<b id="activitySize"></b>条记录</button>--%>
				<%--</div>--%>
				<%--<div class="btn-group" style="position: relative;top: -34px; left: 110px;">--%>
					<%--<button  type="button" class="btn btn-default" style="cursor: default;" onclick="load()">显示</button>--%>
					<%--<div class="btn-group">--%>
						<%--<button id="show" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">--%>
							<%--5--%>
							<%--<span class="caret"></span>--%>
						<%--</button>--%>
						<%--<ul class="dropdown-menu" role="menu">--%>
							<%--<li><a href="#" onclick="sizeLoad(5)">5</a></li>--%>
							<%--<li><a href="#" onclick="sizeLoad(10)">10</a></li>--%>
							<%--<li><a href="#" onclick="sizeLoad(15)">15</a></li>--%>
						<%--</ul>--%>
					<%--</div>--%>
					<%--<button type="button" class="btn btn-default" style="cursor: default;">条/页</button>--%>
				<%--</div>--%>
				<%----%>
			<%--</div>--%>
			<div style="height: 50px; position: relative;top: 30px;" id="pagination">

			</div>
			
		</div>
		
	</div>
</body>
</html><%@ page contentType="text/html;charset=UTF-8" language="java" %>