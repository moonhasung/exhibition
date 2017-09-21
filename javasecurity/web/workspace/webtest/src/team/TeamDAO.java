package team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;



public class TeamDAO {
	public boolean updateFile(Map map){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt= null;
		int teamno = (Integer)map.get("teamno");
		String filename = (String)map.get("filename");
		StringBuffer sql = new StringBuffer();
		sql.append(" update TEAM ");
		sql.append(" set ");
		sql.append(" filename = ? ");
		sql.append(" where team = ?  ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, filename);
			pstmt.setInt(2, teamno);
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag=true;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
			
		}
		
		
		return flag;
		
	}
	
	public boolean delete(int teamno){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from team ");
		sql.append(" where teamno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, teamno);
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0) flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}

		return flag;
	}
	public boolean update(TeamDTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update TEAM ");
		sql.append(" set ");
		sql.append(" phone =    ?, ");
		sql.append(" zipcode =  ?, ");
		sql.append(" address1 = ?, ");
		sql.append(" address2 = ?, ");
		sql.append(" skill =    ?, ");
		sql.append(" hobby =    ?, ");
		sql.append(" filename = ?  ");
		sql.append(" where ");
		sql.append(" teamno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPhone());
			pstmt.setString(2, dto.getZipcode());
			pstmt.setString(3, dto.getAddress1());
			pstmt.setString(4, dto.getAddress2());
			pstmt.setString(5, dto.getSkill());
			pstmt.setString(6, dto.getHobby());
			pstmt.setString(7, dto.getFilename());
			pstmt.setInt(7, dto.getTeamno());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag=true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}

		return flag;
	}
	public boolean create(TeamDTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into team ");
		sql.append(" (teamno,name,gender,phone,zipcode,address1,address2, ");
		sql.append("  skill,hobby,filename) ");
		sql.append(" values ");
		sql.append(" ((select NVL(Max(teamno),0)+1 from team), ");
		sql.append(" ?,?,?,?,?,?,?,?,?,) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getGender());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getZipcode());
			pstmt.setString(5, dto.getAddress1());
			pstmt.setString(6, dto.getAddress2());
			pstmt.setString(7, dto.getSkill());
			pstmt.setString(8, dto.getHobby());
			pstmt.setString(9, dto.getFilename());
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
	
	public TeamDTO read(int teamno){
		TeamDTO dto=null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from team ");
		sql.append(" where teamno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, teamno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new TeamDTO();
				dto.setTeamno(rs.getInt("teamno"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setHobby(rs.getString("hobby"));
				dto.setSkill(rs.getString("skill"));
				dto.setFilename(rs.getString("filename"));
				dto.setGender(rs.getString("gender"));
			}		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
	}
	public List<TeamDTO> list(Map map){
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		List<TeamDTO> list = new ArrayList<TeamDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select teamno,name,phone,skill,filename, r ");
		sql.append(" from ( ");
		sql.append(" 	select teamno,name,phone,skill,filename, rownum as r ");
		sql.append(" 	from( ");
		sql.append(" 		select teamno, name, phone, skill, filename ");
		sql.append(" 		from team ");
		if(word.trim().length()>0)
		sql.append(" 		where "+col+" like '%'||?||'%' ");
		sql.append(" 		order by teamno desc ");
		sql.append(" 	) ");
		sql.append(" )where r>= ? and r <=? ");
		try {
			int i= 0;
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0)
				pstmt.setString(++i, word);
			
				pstmt.setInt(++i, sno);
				pstmt.setInt(++i, eno);
			
			
				rs = pstmt.executeQuery();
			
			
			while(rs.next()){
				TeamDTO dto = new TeamDTO();
				dto.setTeamno(rs.getInt("teamno"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setSkill(rs.getString("skill"));
				dto.setFilename(rs.getString("filename"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return list;
	}
	public int total (Map map){
		int total = 0;
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from team ");
		if(word.trim().length()>0)
		sql.append(" 		where "+col+" like '%'||?||'%' ");
		sql.append(" 		order by teamno desc ");
		try {
			int i=0; 
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0){
			pstmt.setString(i++, word);
		}
				
			
			
				rs = pstmt.executeQuery();
			
			
			rs.next();
			total=rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		return total;
		
	}
}




