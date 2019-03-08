package com.zy.project.controller;

import com.zy.project.pojo.Projects;
import com.zy.project.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	//去所有项目页面
	@RequestMapping("/toProject")
	public String toProject(){
		return "project/project";
	}

	@RequestMapping("/project/getPro")
	@ResponseBody
	public Map<String, Object> getPro(Integer page,Integer limit,Projects projects){
		Map<String, Object> map=new HashMap<>();
		List<Projects> list=service.getPro(projects);//获取所有的数据
		map.put("count",list.size());//将总记录放到map中
		map.put("code", 0);
		map.put("msg", "项目数据");
		//map.put("count", 100);
		map.put("data", list.subList((page-1)*limit>list.size()?0:(page-1)*limit, page*limit>list.size()?list.size():page*limit));
		//map.put("rows",list.subList((page-1)*rows>list.size()?0:(page-1)*rows, page*rows>list.size()?list.size():page*rows));
		return map;
	}

	
}
