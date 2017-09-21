package bbs;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.sql.Connection;

import utility.DBClose;
import utility.DBOpen;

public class BbsDAO {
	public int total(Map map){
		String col = (String)map.get("col");
		String word = (String)map.get("word");
			int total = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from bbs ");
		if(word.trim().length()>0)
		sql.append(" 	 where "+col+" like '%'|| ?||'%' ");

		
		
	
		
		try {
			
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
			pstmt.setString(1, word);
			
			rs=pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
			
			
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		
		
		return total;
	}
	
	public boolean getRefnum(int bbsno){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from bbs ");
		sql.append(" where refnum = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setInt(1, bbsno);
			
			rs=pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			
			if(cnt>0) flag = true;//부모글
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		
		return flag;
		
	}
	
	public void upAnsnum(Map map){
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE bbs ");
		sql.append(" SET ansnum = ansnum + 1 ");
		sql.append(" WHERE grpno=? and ansnum > ? ");
		
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
	}
	
	public boolean replyCreate(BbsDTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate, grpno, indent, ansnum, refnum) ");
		sql.append(" VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), ");
		sql.append(" ?, ?, ?, ?, sysdate, ?, ?, ?, ?) ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getGrpno());//부모의grpno
			pstmt.setInt(6, dto.getIndent()+1);//부모의indent+1
			pstmt.setInt(7, dto.getAnsnum()+1);//부모의ansnum+1
			pstmt.setInt(8, dto.getBbsno());//부모의 bbsno
			
			int cnt = pstmt.executeUpdate();
		
			if(cnt>0)flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
	public BbsDTO replyRead(int bbsno){
		BbsDTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT bbsno, title, grpno, indent, ansnum ");
		sql.append(" FROM bbs ");
		sql.append(" WHERE bbsno = ? ");
		
		try {
			pstmt =con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto=new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setTitle(rs.getString("title"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
	}
	

	public void upViewcnt(int bbsno){
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE bbs ");
		sql.append(" SET viewcnt = viewcnt + 1 ");
		sql.append(" WHERE bbsno=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0){
				System.out.println("조회수 증가 성공");
			}else{
				System.out.println("조회수 증가 실패");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
	}
	
	public List<BbsDTO> list(Map map){
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		List<BbsDTO> list = new ArrayList<BbsDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT bbsno, wname, title, viewcnt, wdate, grpno,  ");
		sql.append(" indent, ansnum, r  ");
		sql.append(" From( ");
		sql.append(" 	 SELECT bbsno, wname, title, viewcnt, wdate, grpno,  ");
		sql.append(" 	 indent, ansnum, rownum as r ");
		sql.append(" 	 FROM (  ");
		sql.append(" 		 SELECT bbsno, wname, title, viewcnt, wdate, grpno, ");
		sql.append("  		 indent, ansnum ");
		sql.append("  		 FROM bbs   ");
		if(word.trim().length()>0)
			sql.append(" 	 where "+col+" like '%'||?||'%' ");
		sql.append("  		 ORDER BY grpno DESC, ansnum ASC  ");		
		sql.append("  	 )  ");		
		sql.append(" ) ");
		sql.append(" where r >= ? and r <= ? ");

		
		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(++i, word);	
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BbsDTO dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				list.add(dto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return list;
	}
	
	public boolean delete(int bbsno){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" DELETE FROM bbs WHERE bbsno=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0)flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}

	public boolean update(BbsDTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
	
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE bbs ");
		sql.append(" SET wname=?, title=?, content=? ");
		sql.append(" WHERE bbsno = ? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getBbsno());
			
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
	
	public BbsDTO read(int bbsno){
		BbsDTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT bbsno, wname, title, content, viewcnt, wdate ");
		sql.append(" FROM bbs ");
		sql.append(" WHERE bbsno = ? ");
		
		try {
			pstmt =con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto=new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
	}
	
	public boolean create(BbsDTO dto){
		boolean flag =false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO bbs(bbsno, wname, title, content, passwd, wdate,grpno) ");
		sql.append(" VALUES((SELECT NVL(MAX(bbsno), 0) + 1 as bbsno FROM bbs), ");
		sql.append(" ?, ?, ?, ?, sysdate, ");
		sql.append(" (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM bbs)) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			
			int cnt = pstmt.executeUpdate();
		
			if(cnt>0)flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
	
/**게시글 삭제및 수정시 본인글 인증을 위한 패스워드 검증 @param map @return */
	public boolean passwdCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(bbsno) ");
		sql.append(" from bbs ");
		sql.append(" where bbsno = ? and passwd = ? ");
		
		int bbsno = (Integer)map.get("bbsno");
		String passwd = (String)map.get("passwd");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setInt(1, bbsno);
			pstmt.setString(2, passwd);
			
			rs=pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			
			if(cnt>0) flag = true;
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		
		return flag;
	}
}
