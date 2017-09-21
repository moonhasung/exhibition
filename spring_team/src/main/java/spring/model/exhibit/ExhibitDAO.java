package spring.model.exhibit;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExhibitDAO {	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
		
	public void setMybatis(SqlSessionTemplate mybatis) {
		
		this.mybatis = mybatis;
	}
	
	@SuppressWarnings("rawtypes")
	public List<ExhibitDTO> list(Map map) {
	
		return mybatis.selectList("home.list");
	}
	@SuppressWarnings("rawtypes")
	public int total(Map map) {
		return mybatis.selectOne("home.total", map);
	}
	
}