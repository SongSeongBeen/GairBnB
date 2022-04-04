package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.SearchListVo;

@Repository
public class SearchListDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<SearchListVo> getSearchList(SearchListVo searchListVo) {
		
		System.out.println("SearchListDao");
		
		List<SearchListVo> searchList = sqlSession.selectList("searchList.selectSearchList", searchListVo);

		return searchList;
	}
	
	public List<SearchListVo> getSearchListD(SearchListVo searchListVo) {
		
		List<SearchListVo> searchListD = sqlSession.selectList("searchList.selectSearchListD", searchListVo);
		
		return searchListD;
	}
	
		//리스트 페이징(10개)
		public List<SearchListVo> selectList2(int startRnum, int endRnum){
			
			System.out.println(startRnum + endRnum);
			//형이 다를 경우  oj
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startRnum", startRnum);
			map.put("endRnum", endRnum);
			List<SearchListVo> searchListVo = sqlSession.selectList("searchList.selectSearchListD2", map);
		
			return searchListVo;
		} 
		public int selectTotal(){
		
			return sqlSession.selectOne("searchList.totalCnt");
			
		}
	
	
}
