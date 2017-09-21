package spring.model.home;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDAO {	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
		
	public void setMybatis(SqlSessionTemplate mybatis) {
		
		this.mybatis = mybatis;
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> list() {
	
		return mybatis.selectList("home.list");
	}	
	
	
}
