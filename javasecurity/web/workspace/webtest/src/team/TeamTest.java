package team;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TeamTest {

	public static void main(String[] args) {
		
		TeamDAO dao = new TeamDAO();
		list(dao);
		//read(dao);
		//create(dao);
		//update(dao);
		//delete(dao);
		//total(dao);
	}

	private static void total(TeamDAO dao) {
		Map map = new HashMap();
		map.put("col", "name");
		map.put("word", "");
		int total = dao.total(map);
		p("레코드 갯수:"+total);
	}

	private static void delete(TeamDAO dao) {
		int teamno=1;
		if(dao.delete(teamno)){
			p("성공");
		}else{
			p("실패");
		}
		
	}

	private static void update(TeamDAO dao) {
		int teamno=1;
		TeamDTO dto= dao.read(teamno);
		dto.setPhone("000-0000-0000");
		dto.setZipcode("00000");
		dto.setAddress1("서울");
		dto.setAddress2("아파트");
		dto.setSkill("java");
		dto.setHobby("영화감상");
		dto.setFilename("member2.jpg");
		
		if(dao.update(dto)){
			p("성공");
		}else{
			p("실패");
		}
		
	}

	private static void create(TeamDAO dao) {
		
		TeamDTO dto = new TeamDTO();
		dto.setName("김길동");
		dto.setGender("남자");
		dto.setZipcode("12345");
		dto.setAddress1("서울시 종로구");
		dto.setAddress2("코아빌딩");
		dto.setPhone("010-7777-7777");
		dto.setHobby("영화감상");
		dto.setSkill("java,jsp");
		dto.setFilename("member.jpg");
		if(dao.create(dto )){
			p("성공");
		}else{
			p("실패");
		}
		
	}

	private static void read(TeamDAO dao) {
		int teamno = 1;
		TeamDTO dto = dao.read(teamno );
		p(dto);
		
	}

	private static void list(TeamDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<TeamDTO> list = dao.list(map);
		for(int i=0;i<list.size();i++){
			TeamDTO dto = list.get(i);
			p(dto);
			p("-------------");
			
		}
		
	}

	private static void p(TeamDTO dto) {
		p("번호(list):"+dto.getTeamno());
		p("성별:"+dto.getGender());
		p("이름(list):"+dto.getName());
		p("전화번호(list):"+dto.getPhone());
		p("우편번호:"+dto.getZipcode());
		p("주소:"+dto.getAddress1());
		p("상세주소:"+dto.getAddress2());
		p("보유기술(list):"+dto.getSkill());
		p("취미:"+dto.getHobby());
		p("사진명:"+dto.getFilename());
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}





