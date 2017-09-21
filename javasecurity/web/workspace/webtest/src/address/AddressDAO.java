package address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class AddressDAO {
	public boolean updateFile(Map map){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt= null;
		int addressnum = (Integer)map.get("addressnum");
		String filename = (String)map.get("filename");
		StringBuffer sql = new StringBuffer();
		sql.append(" update address ");
		sql.append(" set ");
		sql.append(" filename = ? ");
		sql.append(" where address = ?  ");
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, filename);
			pstmt.setInt(2, addressnum);
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
	
	public boolean getRefnum(int addressnum){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from address ");
		sql.append(" where refnum = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setInt(1, addressnum);
			
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
	public boolean replyCreate(AddressDTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into address(addressnum,name,phone,zipcode,address1,address2,grpno,indent,ansnum,refnum) ");
		sql.append(" values ((select NVL(max(addressnum),0)+1 from address),?,?,?,?,?,?,?,?,?) ");
		
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setInt(6, dto.getGrpno());
			pstmt.setInt(7, dto.getIndent()+1);
			pstmt.setInt(8, dto.getAnsnum()+1);
			pstmt.setInt(9, dto.getAddressnum());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	
	public void upAnsnum(Map map){
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update address ");
		sql.append(" set ansnum = ansnum + 1 ");
		sql.append(" where grpno = ? and ansnum > ? ");
		
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
	
	public AddressDTO replyRead(int addressnum){
		AddressDTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select addressnum,name,phone,zipcode,address1,address2,grpno,indent,ansnum from address where addressnum = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, addressnum);
			rs =pstmt.executeQuery();
			if(rs.next()){
				dto = new AddressDTO();
				dto.setAddressnum(rs.getInt("addressnum"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
				
		return dto;
	}
	public List<AddressDTO> list(Map map){
		String col =(String)map.get("col");
		String word =(String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		List<AddressDTO> list = new ArrayList<AddressDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select addressnum,name,phone,grpno,Indent,ansnum,filename, r ");
		sql.append(" from( ");
		sql.append(" 	select addressnum,name,phone,grpno,Indent,ansnum,filename, rownum as r  ");
		sql.append(" 	from( ");
		sql.append(" 		select addressnum,name,phone,grpno,Indent,ansnum,filename ");
		sql.append(" 		from address ");
		if(word.trim().length()>0)
			sql.append(" 		where "+col+" like '%'||?||'%' ");
			sql.append(" 		order by grpno desc, ansnum asc ");
		sql.append(" 	) ");
		sql.append(" 	)where r>=? and r<=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			int i = 0;
			if(word.trim().length()>0)
				pstmt.setString(++i, word);
				pstmt.setInt(++i, sno);
				pstmt.setInt(++i, eno);
				rs = pstmt.executeQuery();
			
			while(rs.next()){
				AddressDTO dto = new AddressDTO();
				dto.setAddressnum(rs.getInt("addressnum"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setFilename(rs.getString("filename"));
				list.add(dto);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		return list;
	}
	public int total(String col, String word){
		int total=0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from address ");
		if(word.trim().length()>0)
		sql.append(" 		where "+col+" like '%'||?||'%' ");
		
		try {
			
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
			pstmt.setString(1, word);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				total=rs.getInt(1);
			}
									
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return total;
		
	}
	public AddressDTO read(int addressnum){
		AddressDTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from address where addressnum = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, addressnum);
			rs =pstmt.executeQuery();
			if(rs.next()){
				dto = new AddressDTO();
				dto.setAddressnum(rs.getInt("addressnum"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setFilename(rs.getString("filename"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
				
		return dto;
		
	}
	
	public boolean create(AddressDTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into address(addressnum,name,phone,zipcode,address1,address2,grpno,filename) ");
		sql.append(" values ((select NVL(max(addressnum),0)+1 from address), ");
		sql.append(" ?,?,?,?,?,(select nvl(max(grpno),0)+1 from address),?) ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getFilename());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	
	public boolean update(AddressDTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" update address set ");
		sql.append(" phone = ?, ");
		sql.append(" zipcode = ?, ");
		sql.append(" address1 = ?, ");
		sql.append(" address2 = ? ");
		sql.append(" where ");
		sql.append(" addressnum = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getPhone());
			pstmt.setString(2, dto.getZipcode());
			pstmt.setString(3, dto.getAddress1());
			pstmt.setString(4, dto.getAddress2());
			pstmt.setInt(5, dto.getAddressnum());
			
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
	
	public boolean delete(int addressnum){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from address where addressnum = ? ");
		
		try {
			pstmt =con.prepareStatement(sql.toString());
			pstmt.setInt(1, addressnum);
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt,con);
		}
		return flag;
			
	}
}
