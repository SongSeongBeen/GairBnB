package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.SearchListDao;
import com.javaex.vo.SearchListVo;

@Service
public class SearchListService {
	
	@Autowired
	private SearchListDao searchListDao;
	//리스트
	public List<SearchListVo> searchListD(SearchListVo searchListVo) {
			
			System.out.println("searchListService.getSearchList()");
			System.out.println(searchListVo.getSearchData());
			
			if(searchListVo.getSearchData().equals("")) {
				
				return searchListDao.getSearchListD(searchListVo);
				
			}else {
				String[] array = searchListVo.getSearchData().split(" - ");
				searchListVo.setCheckin(array[0]);
				searchListVo.setCheckout(array[1]);
				
				return searchListDao.getSearchList(searchListVo);
				
			}	
		}
	
	public Map<String, Object> searchListD2(int crtPage){
		
			//페이지당 글개수
			int listCnt = 10;
			
			//현재페이지 처리
			crtPage = (crtPage>0) ? crtPage : (crtPage=1); 
			
			/*
			if(crtPage<0) {
				crtPage = 1;
			}
			*/
			//시작 글 번호
			int startRnum = (crtPage-1)*listCnt + 1; 
			//끝글 번호
			int endRnum = (startRnum+listCnt) -1;
			List<SearchListVo> SearchList = searchListDao.selectList2(startRnum, endRnum);
			
			////페이징 버튼
			//전체 글 갯수 가져오기
			int totalCnt = searchListDao.selectTotal();
			
			System.out.println(totalCnt);
			
			//페이지당 버튼 갯수
			int pageBtnCount = 5;
			
			int endPageBtnNo =(int) ( Math.ceil(crtPage/(double)pageBtnCount) )*pageBtnCount; 
			
			int startpageBtnNo = endPageBtnNo-(pageBtnCount-1);
			
			boolean next = false;
			
			
			//다음 화살표 유무
			if(endPageBtnNo*listCnt < totalCnt) {
				next = true;
			}else {//다음화살표가 안보이면 마지막 버튼값을 다시계산
				endPageBtnNo = (int) (Math.ceil(totalCnt/(double)listCnt));
			}
			boolean prev = false;
			//처음화살표 유무
			if (startpageBtnNo != 1) {
				prev = true;
			}
			
			Map<String, Object> pMap = new HashMap<String, Object>();
			pMap.put("prev", prev);
			pMap.put("startPageBtnNo", startpageBtnNo);
			pMap.put("endPageBtnNo", endPageBtnNo);
			pMap.put("next", next);
			pMap.put("SearchList", SearchList);
			System.out.print(pMap);
			
			return pMap;
		
	}
	
		
}
