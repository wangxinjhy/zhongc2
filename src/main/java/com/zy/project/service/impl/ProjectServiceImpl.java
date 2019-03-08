package com.zy.project.service.impl;

import java.util.List;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.project.dao.ProjectDao;
import com.zy.project.pojo.Projects;
import com.zy.project.service.ProjectService;
@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectDao dao;

	@Override
	public List<Projects> getPro(Projects projects) {
		//System.out.println(projects);
		return dao.getPro(projects);

	}




}
