<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>首页</title>
		<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="<%=path%>/js/bootstrap/css/bootstrap.min.css">
		<script type="text/javascript" src="<%=path%>/js/layui/layui.js"></script>
		<link rel="stylesheet" href="<%=path%>/js/layui/css/layui.css">
	</head>
	<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">众筹管理平台</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">     
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
        	${user.lusername}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">项目管理</a>
          <dl class="layui-nav-child">
            <dd><a href="#" class="menu" url="<%=path%>/toProject.do" title="所有项目"> 所有项目</a></dd>
            <dd><a href="#" class="menu" url="<%=path%>/toProject.do" title="项目审核">项目审核</a></dd>
            <dd><a href="javascript:;">项目跟踪</a></dd>
            <dd><a href="">项目评论</a></dd>
            <dd><a href="">项目分类</a></dd>
            <dd><a href="">项目推荐</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">注册用户管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">注册用户</a></dd>
            <dd><a href="javascript:;">用户资金</a></dd>
            <dd><a href="">用户日志</a></dd>
            <dd><a href="javascript:;">实名审核</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">系统管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">新闻管理</a></dd>
            <dd><a href="javascript:;">问题管理</a></dd>
            <dd><a href="">管理用户</a></dd>
            <dd><a href="javascript:;">管理日志</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  <div class="layui-body">
  <!--使用选项卡   lay-id：默认选中的tab标签 -->
  	<div class="layui-tab layui-tab-brief" lay-filter="demo" lay-allowclose="true">
  		<ul class="layui-tab-title">
  			<li class="layui-this" lay-id="11">今日众筹</li>
  		</ul>
  		<!--打开页面：页面内容首先显示的是一个巨幕：bootstrap组件里有  -->
  		<div class="layui-tab-content">
    		<div class="layui-tab-item layui-show">
    			<div class="jumbotron" style="padding-top:15px;padding-bottom:15px;">
  					<div style="padding-left:30px;">
  						<font size="5">今日新增众筹资金：</font><font size="5" color="blue">208,965¥</font><br/>
  						昨日总众筹基金<br/>
  						<font size="5">今日新增众筹项目：10</font><br/>
  						昨日新增众筹项目<br>
  						&nbsp;<button class="layui-btn layui-btn-normal layui-btn-sm">查看详情</button>
  					</div>
  				</div>
  				<font size="5">实时数据</font>(每5秒自动刷新)
  					<table class="table table-striped" style="padding-left:15px;">
					
					 	<tr>
					 		<td>时间</td>
					 		<td>类型</td>
					 		<td>记录</td>
					 		<td>操作</td>
				 	    </tr>
				 	    <tr>
				 	    	<td>10s前</td>
				 	    	<td>新众筹项目</td>
				 	    	<td>1</td>
				 	    	<td>查看项目</td>			 	    
				 	    </tr>
				 	     <tr>
				 	    	<td>15s前</td>
				 	    	<td>项目达标</td>
				 	    	<td>1</td>
				 	    	<td>1</td>			 	    
				 	    </tr>
				 	     <tr>
				 	    	<td>20s前</td>
				 	    	<td>众筹基金</td>
				 	    	<td>1</td>
				 	    	<td>1</td>			 	    
				 	    </tr>
				 	     <tr>
				 	    	<td>1分前</td>
				 	    	<td>项目达标</td>
				 	    	<td>1</td>
				 	    	<td>查看项目</td>			 	    
				 	    </tr>
				 	     <tr>
				 	    	<td>5分前</td>
				 	    	<td>众筹基金</td>
				 	    	<td>1</td>
				 	    	<td>1</td>			 	    
				 	    </tr>					 	
					</table>
    		</div>		
  		</div>
    </div>
   </div>
   <div class="layui-footer">
    	<!-- 底部固定区域 -->
   		 © layui.com - 底部固定区域：原谅我太可爱啦
  </div>
  </div>
	<script>
		//JavaScript代码区域
		layui.use('element', function(){
		  var element = layui.element;//Tab的切换功能，切换事件监听等，需要依赖element模块
		  //前边可以看见选项卡的名字为demo  active是一个对象  对象里定义几个方法（tabAdd，tabDelete， tabChange）
		  var active = {
	                tabAdd: function (url, id, name) {
	                    element.tabAdd('demo', {
	                        title: name,
	                        content: '<iframe data-frameid="' + id + '" src="' + url + '" frameborder="0" width="100%" height="455px;" scrolling="no"></iframe>',
	                        id: id
	                    })
	                    //FrameWH();
	                },    
	                tabChange: function (id) {
	                    element.tabChange('demo', id);
	                },
	                tabDelete: function (id) {
	                    element.tabDelete("demo", id);
	                }
	            };
		  $(".menu").on("click",function(){
		    	//给所有的menu类绑定一个单击事件
		    	//获取一下他的几个属性
			    var url = $(this).attr("url");
		    	var title = $(this).attr("title");
		    	//判断标签页是否已经打开
		    	//选择器  这里用的是综合选择器   (jquery用的是选择器定位)
		    	if($(".layui-tab-title [lay-id='"+title+"']").length>0){
		    		//如果已经打开了选项卡，长度>0,   则跳转到该选项卡
		    		active.tabChange(title);
		    	}else{
		    		//没有打开选项卡tab的话，打开并且选中
		    		active.tabAdd(url,title,title);
			    	active.tabChange(title);
		    	}
		    	
		    })
		
		});
	</script>
	</body>
</html>