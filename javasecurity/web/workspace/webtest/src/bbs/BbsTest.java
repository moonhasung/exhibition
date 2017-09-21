package bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BbsTest {

	public static void main(String[] args) {
		BbsDAO dao = new BbsDAO();
		//create(dao);
		//read(dao);
		//update(dao);
		list(dao);
		//delete(dao);
		//passwdCheck(dao);//비번확인(update,delete 시)
		//upViewcnt(dao);
		//total(dao);
	}

	private static void total(BbsDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "");
		int total = dao.total(map);
		p("레코드갯수:"+total);
	}

	private static void upViewcnt(BbsDAO dao) {
		int bbsno = 2;
		dao.upViewcnt(bbsno );
		
	}

	private static void passwdCheck(BbsDAO dao) {
		
		Map map = new HashMap();
		map.put("bbsno", 2);
		map.put("passwd", "123");
			
		if(dao.passwdCheck(map)){
			p("올바른비밀번호입니다.");
		}else{
			p("잘못된비밀번호입니다.");
		}
		
	}


	private static void delete(BbsDAO dao) {
		int bbsno=1;
		if(dao.delete(bbsno)){
			p("성공");
		}else{
			p("실패");
		}
		
	}

	private static void list(BbsDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "");
		map.put("sno",1);
		map.put("eno", 3);
		List<BbsDTO> list = dao.list(map);
		
		for(int i = 0;i<list.size();i++){
			BbsDTO dto = list.get(i);
			p(dto);
			p("-------------------");
		}
		
	}

	private static void update(BbsDAO dao) {
		int bbsno=1;
		BbsDTO dto = dao.read(bbsno);
		dto.setWname("쿠팡맨");
		dto.setTitle("제목변경");
		dto.setContent("내용변경");
		
		if(dao.update(dto)){
			p("성공");
		}else{
			p("실패");
		}
		
	}

	private static void read(BbsDAO dao) {
		int bbsno=1;
		BbsDTO dto = dao.read(bbsno);
		p(dto);
	}

	private static void create(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setWname("홍길동");
		dto.setTitle("게시판 제목");
		dto.setContent("게시판 내용");
		dto.setPasswd("123");
		
		if(dao.create(dto)){
			p("성공");
		}else{
			p("실패");
	}

}

	private static void p(String string) {
		System.out.println(string);
		
	}
	private static void p(BbsDTO dto) {
		p("번호:"+dto.getBbsno());
		p("이름:"+dto.getWname());
		p("제목:"+dto.getTitle());
		p("내용:"+dto.getContent());
		p("조회수"+dto.getViewcnt());
		p("등록날짜"+dto.getWdate());
		
	}
}
