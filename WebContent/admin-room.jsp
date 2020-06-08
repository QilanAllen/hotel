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
<link rel="stylesheet" type="text/css" href="css/style.css" />

<title>酒店管理系统-房间管理</title>
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
							<li><a href="${pageContext.request.contextPath}">退出</a></li>
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
			<dd style="display: block;">
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
			<dd>
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
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 房间管理 <span class="c-gray en">&gt;</span> 房间管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:window.location.reload();" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
			<div class="cl pd-5 bg-1 bk-gray" style="text-align:center"> 
				<span class="l"> 
					<a href="javascript:;" onclick="delectAll()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
					<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#addroom">
					<i class="Hui-iconfont">&#xe600;</i> 添加房间</a> 
				</span> 
				<span class="r">共有数据：<strong>${room_countnum}</strong> 条</span> 
				
				<span >
						<form class="Huiform" method="post" action="${pageContext.request.contextPath}/findroom.action" target="_self">
							<input type="text" class="input-text" style="width:250px" placeholder="房间号" id="find_roomnum" name="find_roomnum">
							<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索房间</button>
						</form>
				</span>
				
					
			</div>
					
			<div class="mt-10">
			
			<table class="table table-border table-bordered table-hover table-bg">
				<thead>
					<tr>
						<th scope="col" colspan="6">房间管理</th>
					</tr>
					<tr class="text-c">
						<th width="25"><input type="checkbox" value="" name=""></th>
						<th>房间号</th>
						<th>是否已入住</th>
						<th>价格</th>
						<th width="70">操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${roomlist}" var="item">
					<tr class="text-c">
						<td><input type="checkbox" value="${item.id}" name="aitem"></td>
						<td>${item.roomnum}</td>
						<c:if test="${item.isuse==1}">
							<td>是</td>
						</c:if>
						<c:if test="${item.isuse==0}">
							<td>否</td>
						</c:if>
						<td><a href="#">${item.price}</a></td>
						
						<td class="f-14">
							<a title="编辑" data-toggle="modal" data-target="#updataroom" onclick= "editRoom(${item.roomnum},${item.isuse},${item.price})"><i class="Hui-iconfont">&#xe6df;</i></a> 
							<a title="删除" href="javascript:;" onclick="delectroom(${item.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
		</article>
	</div>
	
</section>
<div class="modal fade" id="addroom" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">添加房间</h4></div>
		<div class="modal-body">
        <form action="" method="post" class="form form-horizontal" id="form-admin-room-add">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
				<span class="c-red">*</span>房间号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder="" id="add_roomnum" name="roomnum" datatype="*4-16" >
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">已住：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<div class="radio">
						<label><input type="radio" name="isuse" id="add_yes" value="yes" checked>是</label>
					</div>
					<div class="radio">
						<label><input type="radio" name="isuse" id="add_no" value="no">否</label>
					</div>
				</div>
            </div>
            <div class="row cl">
              <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>价格：</label>
              <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="add_price" name="price" datatype="*4-16" ></div>
            </div>
        </form>
       </div>
		<div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          <button type="button" class="btn btn-primary" onclick="addroom()">添加房间</button>
		</div>
    </div>
  </div>
</div>


<div class="modal fade" id="updataroom" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">修改房间</h4></div>
		<div class="modal-body">
        <form action="" method="post" class="form form-horizontal" id="form-admin-room-updata">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
				<span class="c-red">*</span>房间号：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" placeholder="" id="updata_roomnum" name="roomnum" datatype="*4-16" >
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">已住：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<div class="radio">
						<label><input type="radio" name="isuse" id="updata_yes" value="yes" checked>是</label>
					</div>
					<div class="radio">
						<label><input type="radio" name="isuse" id="updata_no" value="no">否</label>
					</div>
				</div>
            </div>
            <div class="row cl">
              <label class="form-label col-xs-4 col-sm-3">
                <span class="c-red">*</span>价格：</label>
              <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="updata_price" name="price" datatype="*4-16" ></div>
            </div>
        </form>
       </div>
		<div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          <button type="button" class="btn btn-primary" onclick="updataroom()">修改房间</button>
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
function addroom() {
	var roomnum = $("#add_roomnum").val();　　
　　if(roomnum == null || roomnum == ""){
　　　　alert("房间号不能为空");
　　　　return false;

　　}
	var price = $("#add_price").val();　　
　　if(price == null || price == ""){
　　　　alert("价格不能为空");
　　　　return false;

　　}
	$.post("${pageContext.request.contextPath}/addroom.action",
	$("#form-admin-room-add").serialize(),function(data){
	        if(data =="OK"){
	            alert("添加成功！");
	            window.location.reload();
	        }else{
	            alert("添加失败！");
	            window.location.reload();
	        }
	    });
}

function editRoom(roomnum,isuse,price){
	$("#updata_roomnum").val(roomnum);
	if(isuse==1){
		$("#updata_no").prop("checked",false);
     	$("#updata_yes").prop("checked",true);
	}else{
		$("#updata_no").prop("checked",true);
     	$("#updata_yes").prop("checked",false);
	}
	$("#updata_price").val(price);

}

function updataroom(){
	var roomnum = $("#updata_roomnum").val();　　
　　if(roomnum == null || roomnum == ""){
　　　　alert("房间号不能为空");
　　　　return false;

　　}
	var price = $("#updata_price").val();　　
　　if(price == null || price == ""){
　　　　alert("价格不能为空");
　　　　return false;

　　}
	$.post("${pageContext.request.contextPath}/updataroom.action",
	$("#form-admin-room-updata").serialize(),function(data){
	        if(data =="OK"){
	            alert("修改成功！");
	            window.location.reload();
	        }else{
	            alert("修改失败！");
	            window.location.reload();
	        }
	    });
}


function delectroom(id){
	layer.confirm('删除须谨慎，确认要删除吗？',function(){
		$.post("${pageContext.request.contextPath}/delectroom.action?id="+id,
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
		$.post("${pageContext.request.contextPath}/delectroomAll.action?list="+list,function(data){
	        if(data =="OK"){
	            layer.msg('删除成功!',{icon:1,time:1000});
	        }else{
	            layer.msg('删除失败!',{icon:2,time:1000});
	        }
	        setTimeout(function () {
                        window.location.reload();
                    }, 300);
		});
	}); 
	
}
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>