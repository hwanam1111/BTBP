package btbp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class XXXXXDao {
	
	@Autowired
	private SqlSessionTemplate ss;

	public void testInsert(){
		int result = ss.insert("testInsert");
	}
}
