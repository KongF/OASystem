package com.oasystem.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oasystem.model.Sign;

@Repository
public interface SignDao {

	List<Sign> mlistsigns();
	Sign getHistory(@Param("userid")int userid);
	int newSign(@Param("lastModifyTime")String lastModifyTime,@Param("osignHistory")String osignHistory,
			@Param("nsignHistory")String nsignHistory,@Param("m_id")int m_id,@Param("scount")int scount);
}
