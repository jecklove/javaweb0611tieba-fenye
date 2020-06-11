package org.jgs1905.test;

import java.sql.SQLException;

import org.jgs1905.dao.PostDao;
import org.junit.Test;

/**
 * 
 * @author junki
 * @date 2020年6月11日
 */
public class Test01 {
	
	@Test
	public void test01() {
		PostDao postDao = new PostDao();
		try {
			System.out.println(postDao.count());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
