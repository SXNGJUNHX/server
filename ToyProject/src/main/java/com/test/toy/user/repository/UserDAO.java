package com.test.toy.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.toy.user.model.LogDTO;
import com.test.toy.user.model.UserDTO;
import com.test.util.DBUtil;

public class UserDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public UserDAO() {
		//this.conn = DBUtil.open("localhost", "toy", "java1234");
		this.conn = DBUtil.open("192.168.10.47", "mainproject", "java1234");
	}

	public int register(UserDTO dto) {
		
		//queryParamNoReturn
		try {

			String sql = "insert into tblUser (id, pw, name, email, pic, intro, regdate, lv) values (?, ?, ?, ?, ?, ?, default, 1)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getEmail());
			pstat.setString(5, dto.getPic());
			pstat.setString(6, dto.getIntro());

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("UserDAO.register");
			e.printStackTrace();
		}
		
		return 0;
	}

	public UserDTO login(UserDTO dto) {
		
		//queryParamDTOReturn
		try {
			
			String sql = "select * from tblUser where id = ? and pw = ? and ing = 1";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				UserDTO result = new UserDTO();
				
				result.setName(rs.getString("name"));
				result.setLv(rs.getString("lv"));
				
//				result.setEmail(rs.getString("email"));
//				result.setPic(rs.getString("pic"));
//				result.setRegdate(rs.getString("register"));
				
				return result;	
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int unregister(String id) {
		
		//queryParamNoReturn
		try {

			String sql = "update tblUser set pw = '0000', name = '탈퇴', email = '탈퇴', pic = default, intro = null, ing = 0 where id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);

			return pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("UserDAO.unregister");
			e.printStackTrace();
		}
		
		return 0;
	}

	public UserDTO getUser(String id) {
		
		//queryParamDTOReturn
		try {
			
			String sql = "select * from tblUser where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				UserDTO dto = new UserDTO();
				
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setLv(rs.getString("lv"));
				dto.setIntro(rs.getString("intro"));
				dto.setPic(rs.getString("pic"));
				dto.setRegdate(rs.getString("regdate"));
				
				return dto;				
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public void addLog(LogDTO ldto) {
		try {

			String sql = "insert into tblLog (seq, id, regdate) values (seqLog.nextVal, ?, default)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, ldto.getId());

			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("UserDAO.addLog");
			e.printStackTrace();
		}
	}
	
	public void addLog(String id, String regdate) {
		try {

			String sql = "insert into tblLog (seq, id, regdate) values (seqLog.nextVal, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, regdate);

			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("UserDAO.addLog");
			e.printStackTrace();
		}
	}

	public ArrayList<HashMap<String, String>> loadCalendar(HashMap<String, String> map) {

		try {
			
			String sql = "select to_char(regdate, 'yyyy-mm-dd') as regdate, count(*) as cnt, (select count(*) from tblBoard where to_char(regdate, 'yyyy-mm-dd') = to_char(a.regdate, 'yyyy-mm-dd')) as bcnt, (select count(*) from tblComment where to_char(regdate, 'yyyy-mm-dd') = to_char(a.regdate, 'yyyy-mm-dd')) as ccnt from tblLog a where to_char(regdate, 'yyyy-mm') = ? and a.id = ? group by to_char(regdate, 'yyyy-mm-dd')";

			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, String.format("%s-%02d", map.get("year"), Integer.parseInt(map.get("month"))));
			pstat.setString(2, map.get("id"));
			
			rs = pstat.executeQuery();
			
			ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
			
			while (rs.next()) {
				
				HashMap<String, String> m = new HashMap<>();
	
				m.put("regdate", rs.getString("regdate"));
				m.put("cnt", rs.getString("cnt"));
				m.put("bcnt", rs.getString("bcnt"));
				m.put("ccnt", rs.getString("ccnt"));
				
				list.add(m);
			}	
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}








