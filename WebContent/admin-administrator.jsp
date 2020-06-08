<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="css/style.css" />


<title>酒店管理系统-管理员列表</title>
</head>
<body>

<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> 
			<span class="logo navbar-slogan f-l mr-10 hidden-xs">酒店管理系统</span>
			
			
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A">${username}<i class="Hui-iconfont">&#xe6d5;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="${pageContext.request.contextPath}">退出</a> </li>
						</ul>
					</li>
					<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
							<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
							<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
							<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
							<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
							<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</header>

<aside class="Hui-aside">
	
	<div class="menu_dropdown bk_2">
		<dl id="menu-admin">
			<dt class="selected"><i class="Hui-iconfont">&#xe643;</i> 房间管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li class="current"><a href="${pageContext.request.contextPath}/room.action" title="房间管理">房间管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-admin">
			<dt class="selected"><i class="Hui-iconfont">&#xe60a;</i> 客户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="${pageContext.request.contextPath}/client.action" title="客户管理">客户管理</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-admin">
			<dt class="selected"><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd style="display: block;">
				<ul>
					<li><a href="${pageContext.request.contextPath}/admintor.action" title="管理员列表">管理员列表</a></li>
				</ul>
			</dd>
		</dl>
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<!--/_menu 作为公共模版分离出去-->

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span>管理员列表<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:window.location.reload();" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
			<div class="cl pd-5 bg-1 bk-gray" style="text-align:center"> 
				<span class="l"> 
					<a href="javascript:;" onclick="delectAll()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
					<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#addadministrator">
					<i class="Hui-iconfont">&#xe600;</i> 添加管理员</a> 
				</span> 
				<span class="r">共有数据：<strong>${ministersnum}</strong> 条</span> 
				
				<span >
						<form class="Huiform" method="post" action="${pageContext.request.contextPath}/findminister.action" target="_self">
							<input type="text" class="input-text" style="width:250px" placeholder="管理员ID" id="find_id" name="find_id">
							<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索管理员</button>
						</form>
				</span>
				
					
			</div>
					
			<div class="mt-10">
			
			<table class="table table-border table-bordered table-hover table-bg">
				<thead>
					<tr>
						<th scope="col" colspan="6">管理员列表</th>
					</tr>
					<tr class="text-c">
						<th width="25"><input type="checkbox" value="" name=""></th>
						<th>ID</th>
						<th>姓名</th>
						<th>账号</th>
						<th>密码</th>
						<th width="70">操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${ministerlist}" var="item">
					<tr class="text-c">
						<td><input type="checkbox" value="${item.id}" name="aitem"></td>
						<td>${item.id}</td>
						<td>${item.name}</td>
						<td>${item.countnum}</td>
						<td>${item.password}</td>
						<td class="f-14">
							<a title="编辑" data-toggle="modal" data-target="#updataminister" onclick="editminister(${item.id},&quot;${item.name}&quot;,${item.countnum})"><i class="Hui-iconfont">&#xe6df;</i></a> 
							<a title="删除" href="javascript:;" onclick="delectminister(${item.id})" class="ml-5" style="text-decoration:none" ><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
		</article>
	</div>
</section>

<div class="modal fade" id="addadministrator" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">添加管理员</h4></div>
		<div class="modal-body">
        <form action="" method="post" class="form form-horizontal" id="form-admin-minister-add">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
				<span class="c-red">*</span>姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder="" id="add_name" name="ministername" datatype="*4-16" >
				</div>
			</div>
			<div class="row cl">
              <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>账号：</label>
              <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="add_countnum" name="ministercountnum" datatype="*4-16" ></div>
            </div>
            <div class="row cl">
              <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>密码：</label>
              <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" value="" placeholder="" id="add_password" name="ministerpassword" datatype="*4-16" ></div>
            </div>
            <div class="row cl">
              <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>确认密码：</label>
              <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" value="" placeholder="" id="add_passwordagain" name="ministerpasswordagain" datatype="*4-16" ></div>
            </div>
        </form>
       </div>
		<div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          <button type="button" class="btn btn-primary" onclick="addminister()">添加管理员</button>
		</div>
    </div>
  </div>
</div>

<div class="modal fade" id="updataminister" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">修改管理员</h4></div>
		<div class="modal-body">
        <form action="" method="post" class="form form-horizontal" id="form-admin-minister-updata">
        	
			<input type="hidden" class="input-text" value="" id="updata_id" name="ministerid" datatype="*4-16" >
				
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
				<span class="c-red">*</span>姓名：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value=""  id="updata_name" name="ministername" datatype="*4-16" >
				</div>
			</div>
			<div class="row cl">
              <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>账号：</label>
              <div class="formControls col-xs-8 col-sm-9">
                <input type="text"  class="input-text" value="" placeholder="" id="updata_countnum" name="ministercountnum" datatype="*4-16" disabled="true"></div>
            </div>
            <div class="row cl">
              <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>新密码：</label>
              <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" value="" placeholder="" id="updata_password" name="ministerpassword" datatype="*4-16" ></div>
            </div>
            <div class="row cl">
              <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>确认密码：</label>
              <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" value="" placeholder="" id="updata_passwordagain" name="ministerpasswordagain" datatype="*4-16" ></div>
            </div>
        </form>
       </div>
		<div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          <button type="button" class="btn btn-primary" onclick="updataminister()">修改管理员</button>
		</div>
    </div>
  </div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="js/jquery.min.js"></script> 
<script type="text/javascript" src="js/layer/2.4/layer.js"></script> 
<script type="text/javascript" src="js/H-ui.js"></script> 
<script type="text/javascript" src="js/H-ui.admin.page.js"></script> 
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="js/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

function addminister(){
	var name= $("#add_name").val();　　
　　if(name== null ||name== ""){
　　　　alert("姓名不能为空");
　　　　return false;

　　}
	var counnumt = $("#add_countnum").val();　　
　　if(counnumt == null || counnumt == ""){
　　　　alert("账号不能为空");
　　　　return false;
　　}
	var password = $("#add_password").val();　　
　　if(password== null || password == ""){
　　　　alert("密码不能为空");
　　　　return false;
　　}
	var passwordagain = $("#add_passwordagain").val();　　
　　if(passwordagain == null ||passwordagain == ""){
　　　　alert("请确认密码");
　　　　return false;
　　}
　　if(password  !=passwordagain){
　　　　alert("密码确认错误");
　　　　return false;
　　}
	$.post("${pageContext.request.contextPath}/addminister.action",
	$("#form-admin-minister-add").serialize(),function(data){
	        if(data =="OK"){
	            alert("添加成功！");
	            window.location.reload();
	        }else{
	            alert("账号已存在！");
	        }
	    });

}
function editminister(id,name,countnum){
	$("#updata_id").val(id);
	$("#updata_name").val(name);
	$("#updata_countnum").val(countnum);
}

function updataminister(){
	var password = $("#updata_password").val();　　
　　if(password== null || password == ""){
　　　　alert("密码不能为空");
　　　　return false;
　　}
	var passwordagain = $("#updata_passwordagain").val();　　
　　if(passwordagain == null ||passwordagain == ""){
　　　　alert("请确认密码");
　　　　return false;
　　}
　　if(password  !=passwordagain){
　　　　alert("密码确认错误");
　　　　return false;
　　}
	$.post("${pageContext.request.contextPath}/updataminister.action",
	$("#form-admin-minister-updata").serialize(),function(data){
	        if(data =="OK"){
	            alert("修改成功！");
	            window.location.reload();
	        }else{
	            alert("修改失败！");
	            window.location.reload();
	        }
	    });
}

function delectminister(id){
	layer.confirm('删除须谨慎，确认要删除吗？',function(){
		$.post("${pageContext.request.contextPath}/delectminister.action?id="+id,
			function(data){
	        if(data =="OK"){
	            layer.msg('删除成功!',{icon:1,time:1000});
	        }else{
	            layer.msg('删除失败!',{icon:2,time:1000});
	        }
	    });
	    setTimeout(function () {
                        window.location.reload();
                    }, 300);
	});
}

function delectAll(){
	var ck = $("input:checked[name='aitem']");
	if(ck.length == 0){
		alert("请选择,然后进行删除");
		return;
	}
	var list=new Array();
	$("input:checked[name='aitem']").each(function(){
			//将标签的值放入数组中
			list.push($(this).val());
	});
	
	layer.confirm('删除须谨慎，确认要删除吗？',function(){
		$.post("${pageContext.request.contextPath}/delectministerAll.action?list="+list,function(data){
			if(data=="OK"){
				layer.msg('删除成功!',{icon:1,time:1000});
			}else{
				layer.msg('删除失败!',{icon:2,time:1000});
			}
		});
		setTimeout(function () {
                        window.location.reload();
                    }, 300);
		
	});

}

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>