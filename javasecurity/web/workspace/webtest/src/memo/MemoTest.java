package memo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemoTest {
	public static void main(String[] args){
		MemoDAO dao = new MemoDAO();
		create(dao);
		list(dao);
		//read(dao);
		//read(dao);
		//read(dao);
		//read(dao);
	}

	private static void list(MemoDAO dao) {
		int sno = 1;
		int eno = 5;
		String col = "";
		String word = "";
		Map map = new HashMap();
		List<MemoDTO> list = dao.list(map);
		map.put("sno", "sno");
		map.put("eno", "eno");
		map.put("col", "col");
		map.put("word", "word");
		for(int i = 0; i<list.size(); i++){
			MemoDTO dto= list.get(i);
			p(dto);
			p("------------------------------");
		}
	}

	private static void create(MemoDAO dao) {
		
		MemoDTO dto = new MemoDTO();
		if(dao.create(dto)){
		if(dao.create(dto)){
			p("성공");
		}else{
			p("실패");
		}
	}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}
}
