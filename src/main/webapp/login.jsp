<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登录页面</title>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="js/bootstrap/css/bootstrap.min.css">
		<script type="text/javascript" src="js/layui/layui.js"></script>
		<link rel="stylesheet" href="js/layui/css/layui.css">
		<style type="text/css">
			img{
				height:100%;
				width:100%;
			}
			table{
				 border-collapse: separate; 
				border-spacing: 15px;
			}
			
		</style>
	</head>
	<body style="background-color:#f0f0f0;">
		<div class="layui-fluid" >
			<div class="layui-row" style="padding-top: 70px;">
				<div class="layui-col-md10 layui-col-md-offset1" style="height:420px;" >

    				<div style="float:left;width:60%;height:100%;background-color: aqua;">
    					<div class="layui-carousel" id="test1" style="height:100%;">
	    					<div carousel-item>
							    <div><img src= "img/lb/12.jpg" ></div>
							    <div><img src= "img/lb/3.jpg" alt=""  style="height:100%;width:100%;"></div>
							    <div><img src= "img/lb/11.jpg" alt=""  style="height:100%;width:100%;"></div>
							    <div><img src= "img/lb/15.jpg" alt=""  style="height:100%;width:100%;"></div>
							    <div><img src= "img/lb/5.jpg" alt=""  style="height:100%;width:100%;"></div>
							 </div> 
    					</div>
    				</div>
    				<div style="float:right;width:40%;height:100%;background-color:gray">
    					<center>
	    					<h1 style="padding-top:30px;"><font color="#ffffff">欢迎登入</font></h1>
		    					<form class="layui-form" style="padding-top: 20px;">
		    						<table style="text-align: center;">
		    							<tr>
		    								<td style="width:90px"><h3>用户名</h3></td>
		    								<td colspan="2">
		    									<div class="layui-input-inline" style="width:100%;">
									     			<input type="text" name="lusername"   lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
									    		</div>
		    								</td>
		    							</tr>					
		    							<tr>
		    								<td ><h3>密码</h3></td>
		    								<td colspan="2">
		    									<div class="layui-input-inline" style="width: 100%">
									     			<input type="text" name="lpassword"   lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
									    		</div>
		    								</td>
		    							</tr>	
		    							<tr>
		    								<td ><h3>验证码</h3></td>
		    								<td >
		    									<div class="layui-input-inline" >
									     			<input type="text" name="yzm"   lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
									    		</div>
		    								</td>
		    								<td width="">
		    									<img alt="验证码" id="img" style="width: 90px;height:40px;" src="<%=path%>/login/yzm.do" onclick="up()">
		    								</td>
		    							</tr>	
		    							<tr>
		    								<td colspan="3">
		    									<div class="layui-form-item">
												   <div class="layui-input-block">
												      <input type="button" class="layui-btn"  lay-submit lay-filter="formDemo" value="提交">
									      			  <button type="reset" class="layui-btn layui-btn-primary">重置</button>
												    </div>
												 </div>				
		    							</tr>
		    						</table>
				
		    					</form>
	    				</center> 				
    				</div>
    			</div>
    		</div>
		</div>
		<script type="text/javascript">
            window.onload=function (){
                setyzm(); //文章加载后执行方法
            }
		
		function setyzm(){//从后台获取验证码
			$.ajax({
				url:"<%=path%>/login/getYzm.do",
				type:"post",
				dataType:"json",
				success:function(data){
					yzm = data.yzm;  //不加var 是全局变量
				}
			})
		}
		
		function up(){//点击更新
			var date= new Date();
			$("#img").attr("src","<%=path%>/login/yzm.do?date="+date);//给属性赋值
			setyzm();
		}
		
			
			layui.use(['carousel','form'], function(){
				  var carousel = layui.carousel;
				  var form= layui.form;
				  //建造实例
				  carousel.render({
				    elem: '#test1'
				    ,width: '100%' //设置容器宽度
				    ,height:'100%'
				    ,arrow: 'hover' //悬停显示箭头
				    //,anim: 'updown' //切换动画方式
				  });
				
				  //监听提交
				  form.on('submit(formDemo)', function(data){
				   // layer.msg(JSON.stringify(data.field));  data.field代表对象
				   if (data.field.yzm!=yzm) {//输入的验证码   正确的验证码
						layer.alert("验证码输入有误！"+data.field.yzm+";"+yzm);
						up();//更新验证码
				   }else{
						//layer.alert("成功");
						$.ajax({
							url:'<%=path%>/login/login.do',
							type:'post',
							data:{"lusername":data.field.lusername,"lpassword":data.field.lpassword},
							dataType:'json',
							success:function(data){
								if (data.success) {
									location.href="<%=path%>/toIndex.do";//登录成功后跳转到首页
								} else {
									layer.alert(data.msg);
								}
							}							
						});
		
				}
				    return false;//表单不提交    使用ajax后台提交
				  });
				  
				});
		
		
		</script>
	</body>
</html>