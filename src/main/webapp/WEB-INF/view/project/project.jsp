<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>所有项目</title>
		<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="<%=path%>/js/bootstrap/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=path%>/js/layui/layui.js"></script>
		<link rel="stylesheet" href="<%=path%>/js/layui/css/layui.css">
	</head>
	<body>
	<div style="border:1px solid #98919b;">
			<form class="layui-form" id="ProWhere">
				<div class="layui-form-item" style="padding-top: 5px; margin-top: 5px;">
				    <div class="layui-input-inline">
				    	<input type="text" placeholder="项目名称" name="ps_name" class="layui-input">
				    </div>
				    <div class="layui-input-inline">
				    	<input type="text" placeholder="项目发起人" class="layui-input" name="ps_us">
				    </div>
				   <div class="layui-input-inline" >
						<select name="ps_pst_id">
							<option selected disable value="">项目类型</option>  <!-- disable:不能用的意思,不让选择 -->
							<option value="1">支教助学</option> 
							<option value="2">绿色环保</option>
							<option value="3">儿童关爱</option>
							<option value="4">社会企业</option>
							<option value="5">动物保护</option>
							<option value="6">扶老助孤</option>
							<option value="7">妇女家庭</option>
						</select>
					</div>
					<div class="layui-input-inline" name="ps_type">
						<select name="ps_type">
							<option selected disabled value="">项目状态</option>
							<option value="0">待审核</option>
							<option value="1">待上架</option>
							<option value="2">众筹中</option>
							<option value="3">众筹成功</option>
							<option value="4">众筹失败</option>
							<option value="5">审核未通过</option>
						</select>
					</div>
					<button class="layui-btn layui-btn-normal" lay-submit lay-filter="Prosub">查询</button>
				</div>
			</form>	
		</div>
		<font size="4" style="color: #0000FF">所有项目列表</font>
		<div style="border:1px solid  #98919b;">
			<table class="layui-hide" id="projectData"></table>	
		</div>
	</body>
	<script type="text/javascript">
	layui.use(['form','table'],function(){
		var form = layui.form,
		table = layui.table;
		table.render({
			//数据表格返回的数据： code msg count data
			elem:'#projectData',
			url:"<%=path%>/project/getPro.do",
		    page: true,
		    height:360,//分页的高度   请结合index.jsp里的active对象里的content高度
			cols:[[
		        {field:'ps_id',  title: '项目ID', sort: true},
		        {field:'ps_pst_id',title: '项目类型',templet:function(d){
                    switch (d.ps_pst_id){
						case 1:return "支教助学";
                        case 2:return "绿色环保";
                        case 3:return "儿童关爱";
                        case 4:return "社会企业";
                        case 5:return "动物保护";
                        case 6:return "扶老助孤";
                        case 7:return "妇女家庭";
					}
                }},
		        {field:'ps_name',title: '项目名称'},
                {field:'ps_type',title: '项目状态',templet:function(d){//d是个形参，随便写
                    return  d.ps_type == '0' ? "待审核": d.ps_type == '1'?"待上架":d.ps_type  == '2'?"众筹中":d.ps_type == '3'?"众筹成功":d.ps_type == '4'?"众筹失败":"审核未通过";
                }},
                {field:'ps_getmoney1',title: '项目进度',templet: function(data){
                        var mm=data.ps_getmoney/data.ps_money*100;
                        return mm+"%";
                }},
		        {field:'ps_starttime',title: '开始日期'},
		        {field:'ps_endtime',title: '结束日期'},
                {field:'ps_getmoney',title: '已筹金额',sort: true,templet:function(d){
                    //return +d.ps_getmoney+'元';
					var dd=d.ps_getmoney;
					return dd+"元";
                }},
		        {fixed:'right',title: '操作',templet: function(data){
                	return "<input type='button' value='详情'  class=\"layui-btn layui-btn-normal\" onclick='getById("+data.ps_id+")'><input type='button' value='详情'  class=\"layui-btn layui-btn-normal\" onclick='getById2(alert("+data+"))'>"
		        }}
			]]
		});

		 
		  //监听提交
		  form.on('submit(Prosub)', function(data){
		  /*  layer.alert(JSON.stringify(data.field), {
		      title: '最终的提交信息'
		    })*/
		   //表格重载 
		     table.reload('projectData', {
			  where: data.field, //设定异步数据接口的额外参数
			  //,height: 300
			page:{
				  curr:1 //重新从第 1 页开始
				}
			});
		    return false;//表单不提交    使用ajax后台提交
		  });

	})
		//详情：通过id获取数据
		function getById(ps_id){
			$.ajax({
				url:"<%=path%>/project/getByPsId.do",
				type:'post',
				data:{"ps_id":ps_id},
				dataType:'json',
				success:function (data) {
					if(data.success){

					}else{
					    layui.alert("警告",'查看失败');
					}
                },
				error:function () {
					layui.alert("警告",'系统异常');
                }

			})

		}
		
	</script>
</html>