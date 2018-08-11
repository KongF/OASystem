package com.oasystem.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.oasystem.dao.OrganDao;
import com.oasystem.model.Organ;

@Service
public class OrganService {

	@Resource
	private OrganDao organdao;
	
	public List<Organ> getOrgan(){
		return organdao.getOrgans();
	}
	public int addOrgan(String o_name) {
		return organdao.addOrgan(o_name);
	}
	public int updateOrgan(int id,String oname,String oldname) {
		return organdao.updateorgan(id,oname,oldname);
	}
}
