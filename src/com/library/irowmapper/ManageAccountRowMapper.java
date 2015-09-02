package com.library.irowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.library.vo.ManageAccountVo;

public class ManageAccountRowMapper implements IrowMapper {
	
	public Object mapper(ResultSet rs) {
		ManageAccountVo vo = new ManageAccountVo();
		try {
			vo.setAccountId(rs.getInt("accountId"));
			vo.setAccountLevel(rs.getString("accountLevel"));
			vo.setAccountPassWord(rs.getString("accountPassWord"));
			vo.setAccountUserName(rs.getString("accountUserName"));
			vo.setAddress(rs.getString("address"));
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
}
