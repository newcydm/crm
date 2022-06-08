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

<%--引入分页插件--%>
	<link href="../../jquery/bs_pagination-master/css/jquery.bs_pagination.min.css" type="text/css" rel="stylesheet"/>
	<script src="../../jquery/bs_pagination-master/js/jquery.bs_pagination.min.js" type="text/javascript"></script>
	<script src="../../jquery/bs_pagination-master/localization/en.js" type="text/javascript"></script>
<script type="text/javascript">
	//条件查询
	var fullName,company,phone,source,owner,mphone,state;
	var page=1;
	var pages=4;

	function load(){
		$.ajax({
			url:"api/clueList",
			type:"get",
			data:{
				page:page,pages:pages,fullName:fullName,company:company,phone:phone,source:source,
				owner:owner,mphone:mphone,state:state
			},
			success:function (result) {
				var html='';
				$.each(result.data.clues,function (i,obj) {
					html+=`
					<tr>
							<td><input class="clueId" type="checkbox" name="ids" value="${'${obj.id}'}"/></td>
							<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='detail?id=${'${obj.id}'}';">${'${obj.fullName}'}</a></td>
							<td>${'${obj.company}'}</td>
							<td>${'${obj.phone}'}</td>
							<td>${'${obj.mphone}'}</td>
							<td>${'${obj.source}'}</td>
							<td>${'${obj.owner}'}</td>
							<td>${'${obj.state}'}</td>
						</tr>
					`;
				});
				$("#clueList").html(html);
				//初始化分页插件
				$("#pagination").bs_pagination({
					currentPage:	page,		//当前页
					rowsPerPage: 	pages,		//每页大小
					totalPages: result.data.pageNumber,			//总页数
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
	$(function(){
		load();
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

		//保存按钮
		$("#butAdd").click(function () {
			$.ajax({
				url:"api/clueAdd",
				type:"post",
				data:$("#clueAdd").serialize(),
				success:function (result) {
					if(result.code==2000){
						//关闭模态框
						$("#createClueModal").modal("hide")
						//刷新数据
						load()
						//清空form表单中的元素
						$("#butAdd")[0].reset();
					}else{
						alert(result.message);
					}
				}
			});
		});

		//注册查询按钮事件
		$("#butQuery").click(function () {
			company=$("#companyQuery").val();
			fullName=$("#fullNameQuery").val();
			phone=$("#phoneQuery").val();
			source=$("#sourceQuery").val()
			;
			owner=$("#ownerQuery").val();
			mphone=$("#mphoneQuery").val();
			state=$("#stateQuery").val();
			load()
		});

		//修改回显按钮
		$("#clueEcho").click(function () {
			if($(".clueId:checked").length!=1){
				alert("请选择一个要修改的内容")
				return;
			}
			$.ajax({
				url:"api/clueEcho",
				data:{id:$(".clueId:checked").val()},
				success:function (result) {
					console.log(result.data);
					$("#ownerEcho").val(result.data.owner);
					$("#appellationEcho").val(result.data.appellation);
					$("#jobEcho").val(result.data.job);
					$("#phoneEcho").val(result.data.phone);
					$("#mphoneEcho").val(result.data.mphone);
					$("#sourceEcho").val(result.data.source);
					$("#companyEcho").val(result.data.company);
					$("#fullNameEcho").val(result.data.fullName);
					$("#emailEcho").val(result.data.email);
					$("#websiteEcho").val(result.data.website);
					$("#stateEcho").val(result.data.state);
					$("#descriptionEcho").val(result.data.description);
					$("#contactSummaryEcho").val(result.data.contactSummary);
					$("#nextContactTimeEcho").val(result.data.nextContactTime);
					$("#addressEcho").val(result.data.address);
					$("#editClueModal").modal("show");
				}
			});
		});

		//修改提交按钮
		$("#butClueUpdate").click(function () {
			$("#idUpdate").val($(".clueId:checked").val());
			$.ajax({
				url:"api/updateClue",
				type:"post",
				data:$("#updateForm").serialize(),
				success:function (result) {
					if(result.code==2000){
						$("#editClueModal").modal("hide");
						load();
					}else{
						alert("修改失败");
					}
				}
			});

		});
		
		//删除按钮
		$("#deleteBatch").click(function () {
			if($(".clueId:checked").length==0){
				return;
			}
			$.ajax({
				url:"api/deleteBatch",
				data:$("#deleteBatchForm").serialize(),
				success:function (result) {
					alert("删除成功");
					load();
				}
			});

		});

		//批量勾选
		$("#checkboxS").click(function () {
			$(".clueId").prop("checked",$(this).prop("checked"));
		});

		//单选未来元素点击事件
		$("#clueList").delegate(".clueId","click",function () {
			if($(".clueId").length==$(".clueId:checked").length){
				$("#checkboxS").prop("checked",true);
			}else{
				$("#checkboxS").prop("checked",false);
			}
		});
	});
	
</script>
</head>
<body>
	<!-- 创建线索的模态窗口 -->
	<div class="modal fade" id="createClueModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 90%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">创建线索</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form" id="clueAdd">
					
						<div class="form-group">
							<label for="create-clueOwner" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-clueOwner" name="owner">
								  <c:forEach var="u" items="${users}">
									  <option value="${u.id}">${u.name}</option>
								  </c:forEach>
								</select>
							</div>

							<label for="create-company" class="col-sm-2 control-label">公司<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-company" name="company">
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-call" class="col-sm-2 control-label">称呼</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-call" name="appellation">
								  <c:forEach var="a" items="${appellation}">
									  <option value="${a.id}">${a.value}</option>
								  </c:forEach>
								</select>
							</div>

							<label for="create-surname" class="col-sm-2 control-label">姓名<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-surname" name="fullName">
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-job" class="col-sm-2 control-label">职位</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-job" name="job">
							</div>
							<label for="create-email" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-email" name="email">
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-phone" class="col-sm-2 control-label">公司座机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-phone" name="phone">
							</div>
							<label for="create-website" class="col-sm-2 control-label">公司网站</label>
							<div class="col-sm-10" style="width: 300px;">


								<input type="text" class="form-control" id="create-website" name="website">
							</div>
						</div>

						<div class="form-group">
							<label for="create-mphone" class="col-sm-2 control-label">手机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="create-mphone" name="mphone">
							</div>
							<label for="create-status" class="col-sm-2 control-label">线索状态</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-status" name="state">
									<c:forEach var="c" items="${clueState}">
										<option value="${c.id}">${c.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label for="create-source" class="col-sm-2 control-label">线索来源</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="create-source" name="source">
									<c:forEach var="s" items="${source}">
										<option value="${s.id}">${s.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						

						<div class="form-group">

							<label for="create-describe" class="col-sm-2 control-label">线索描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="create-describe" name="description"></textarea>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>
						
						<div style="position: relative;top: 15px;">
							<div class="form-group">
								<label for="create-contactSummary" class="col-sm-2 control-label">联系纪要</label>
								<div class="col-sm-10" style="width: 81%;">
									<textarea class="form-control" rows="3" id="create-contactSummary" name="contactSummary"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="create-nextContactTime" class="col-sm-2 control-label">下次联系时间</label>
								<div class="col-sm-10" style="width: 300px;">
									<input type="text" class="form-control mydate" id="create-nextContactTime" name="nextContactTime">
								</div>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>
						
						<div style="position: relative;top: 20px;">
							<div class="form-group">
                                <label for="create-address" class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="1" id="create-address" name="address"></textarea>
                                </div>
							</div>
						</div>
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="butAdd">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改线索的模态窗口 -->
	<div class="modal fade" id="editClueModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 90%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">修改线索</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form" id="updateForm">
						<input type="hidden" name="id" id="idUpdate"/>
						<div class="form-group">
							<label for="ownerEcho" class="col-sm-2 control-label">所有者<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="ownerEcho" name="owner">
									<c:forEach var="u" items="${users}">
									<option value="${u.id}">${u.name}</option>
									</c:forEach>
								</select>
							</div>
							<label for="companyEcho" class="col-sm-2 control-label">公司<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="companyEcho" name="company">
							</div>
						</div>
						
						<div class="form-group">
							<label for="appellationEcho" class="col-sm-2 control-label">称呼</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="appellationEcho" name="appellation">
									<c:forEach var="a" items="${appellation}">
										<option value="${a.id}">${a.value}</option>
									</c:forEach>
								</select>
							</div>
							<label for="fullNameEcho" class="col-sm-2 control-label">姓名<span style="font-size: 15px; color: red;">*</span></label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="fullNameEcho" name="fullName">
							</div>
						</div>
						
						<div class="form-group">
							<label for="jobEcho" class="col-sm-2 control-label">职位</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="jobEcho" name="job">
							</div>
							<label for="emailEcho" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="emailEcho" name="email">
							</div>
						</div>
						
						<div class="form-group">

							<label for="phoneEcho" class="col-sm-2 control-label">公司座机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="phoneEcho" name="phone">
							</div>
							<label for="websiteEcho" class="col-sm-2 control-label">公司网站</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="websiteEcho" name="website">
							</div>
						</div>
						
						<div class="form-group">
							<label for="mphoneEcho" class="col-sm-2 control-label">手机</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="mphoneEcho" name="mphone">
							</div>
							<label for="stateEcho" class="col-sm-2 control-label">线索状态</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="stateEcho" name="state">
									<c:forEach var="c" items="${clueState}">
										<option value="${c.id}">${c.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label for="sourceEcho" class="col-sm-2 control-label">线索来源</label>
							<div class="col-sm-10" style="width: 300px;">
								<select class="form-control" id="sourceEcho" name="source">
									<c:forEach var="s" items="${source}">
										<option value="${s.id}">${s.value}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label for="descriptionEcho" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10" style="width: 81%;">
								<textarea class="form-control" rows="3" id="descriptionEcho" name="description"></textarea>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative;"></div>
						
						<div style="position: relative;top: 15px;">
							<div class="form-group">
								<label for="contactSummaryEcho" class="col-sm-2 control-label">联系纪要</label>
								<div class="col-sm-10" style="width: 81%;">
									<textarea class="form-control" rows="3" id="contactSummaryEcho" name="contactSummary"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="nextContactTimeEcho" class="col-sm-2 control-label">下次联系时间</label>
								<div class="col-sm-10" style="width: 300px;">
									<input type="text" class="form-control mydate" id="nextContactTimeEcho" name="nextContactTime">
								</div>
							</div>
						</div>
						
						<div style="height: 1px; width: 103%; background-color: #D5D5D5; left: -13px; position: relative; top : 10px;"></div>

                        <div style="position: relative;top: 20px;">
                            <div class="form-group">
                                <label for="addressEcho" class="col-sm-2 control-label">详细地址</label>
                                <div class="col-sm-10" style="width: 81%;">
                                    <textarea class="form-control" rows="1" id="addressEcho" name="addressEcho"></textarea>
                                </div>
                            </div>
                        </div>
					</form>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="butClueUpdate">更新</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<div>
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>线索列表</h3>
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
				      <input class="form-control" type="text" id="fullNameQuery">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">公司</div>
				      <input class="form-control" type="text" id="companyQuery">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">公司座机</div>
				      <input class="form-control" type="text" id="phoneQuery">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">线索来源</div>
					  <select class="form-control" id="sourceQuery">
					  	  <option></option>
						  <c:forEach var="s" items="${source}">
							  <option value="${s.id}">${s.value}</option>
						  </c:forEach>
					  </select>
				    </div>
				  </div>
				  
				  <br>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">所有者</div>
						<select class="form-control" id="ownerQuery">
							<option></option>
						<c:forEach var="u" items="${users}">
							<option value="${u.id}">${u.name}</option>
						</c:forEach>
						</select>
				    </div>
				  </div>
				  
				  
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">手机</div>
				      <input class="form-control" type="text" id="mphoneQuery">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">线索状态</div>
					  <select class="form-control" id="stateQuery">
					  	<option></option>
						  <c:forEach var="c" items="${clueState}">
							  <option value="${c.id}">${c.value}</option>
						  </c:forEach>
					  </select>
				    </div>
				  </div>

				  <button type="button" class="btn btn-default" id="butQuery">查询</button>
				  
				</form>
			</div>
			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 40px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createClueModal"><span class="glyphicon glyphicon-plus"></span> 创建</button>
				  <button type="button" class="btn btn-default"  id="clueEcho"><span class="glyphicon glyphicon-pencil"></span> 修改</button>
				  <button type="button" class="btn btn-danger" id="deleteBatch"><span class="glyphicon glyphicon-minus"></span> 删除</button>
				</div>
				
				
			</div>
			<div style="position: relative;top: 50px;">
				<form id="deleteBatchForm">
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input id="checkboxS" type="checkbox" /></td>
							<td>名称</td>
							<td>公司</td>
							<td>公司座机</td>
							<td>手机</td>
							<td>线索来源</td>
							<td>所有者</td>
							<td>线索状态</td>
						</tr>
					</thead>
					<tbody id="clueList">

					</tbody>
				</table>
				</form>
			</div>

			<div style="height: 50px; position: relative;top: 60px;" id="pagination">

			</div>
			
		</div>
		
	</div>
</body>
</html><%@ page contentType="text/html;charset=UTF-8" language="java" %>