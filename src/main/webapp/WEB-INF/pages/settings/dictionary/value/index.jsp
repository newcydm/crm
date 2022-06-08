<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../../jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="../../../jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="../../../jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function load(){
		$.ajax({
			url:"valueList",
			success:function (result) {
				var html='';
				$.each(result.data,function (i,item) {
					html+=`
						<tr class="active">
					<td><input class="valueId" type="checkbox" /></td>
					<td>${'${i+1}'}</td>
					<td>${'${item.value}'}</td>
					<td>${'${item.text}'}</td>
					<td>${'${item.orderNo}'}</td>
					<td>${'${item.typeCode}'}</td>
				</tr>
					`;
				});
			$("#valueList").html(html);
			}
		});
	}
	$(function () {
		load();

		$("#checkboxS").click(function () {
			$(".valueId").prop("checked",$(this).prop("checked"));
		});

		$("#valueList").delegate(".valueId","click",function () {
			if($(".valueId").length==$(".valueId:checked").length){
				$("#checkboxS").prop("checked",true);
			}else{
				$("#checkboxS").prop("checked",false);
			}
		});
	})

</script>

</head>
<body>

	<div>
		<div style="position: relative; left: 30px; top: -10px;">
			<div class="page-header">
				<h3>字典值列表</h3>
			</div>
		</div>
	</div>
	<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;left: 30px;">
		<div class="btn-group" style="position: relative; top: 18%;">
		  <button type="button" class="btn btn-primary" onclick="window.location.href='save.html'"><span class="glyphicon glyphicon-plus"></span> 创建</button>
		  <button type="button" class="btn btn-default" onclick="window.location.href='edit.html'"><span class="glyphicon glyphicon-edit"></span> 编辑</button>
		  <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
		</div>
	</div>
	<div style="position: relative; left: 30px; top: 20px;">
		<table class="table table-hover">
			<thead>
				<tr style="color: #B3B3B3;">
					<td><input type="checkbox" id="checkboxS"/></td>
					<td>序号</td>
					<td>字典值</td>
					<td>文本</td>
					<td>排序号</td>
					<td>字典类型编码</td>
				</tr>
			</thead>
			<tbody id="valueList">


			</tbody>
		</table>
	</div>
	
</body>
</html><%@ page contentType="text/html;charset=UTF-8" language="java" %>