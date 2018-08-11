package com.oasystem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oasystem.model.Organ;

@Repository
public interface OrganDao {
	List<Organ> getOrgans();
	int addOrgan(@Param("o_name")String o_name);
	int updateorgan(@Param("id")int id,@Param("oname")String oname,@Param("oldname")String oldname);
	
}
