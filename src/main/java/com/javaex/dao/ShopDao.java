package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ItemVo;

@Repository
public class ShopDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//판매 상품 리스트
	public List<ItemVo> getItemList(){
		System.out.println("[ShopDao.getItemList()]");
		
		return sqlSession.selectList("item.getItemList");
	}
	//판매 상품 리스트
	public List<ItemVo> getCategoryList(String category){
		System.out.println("[ShopDao.getCategoryList()]");
		
		return sqlSession.selectList("item.getCategoryList", category);
	}
	
	//판매 상품 Vo
	public ItemVo getItem(int itemNo){
		System.out.println("[ShopDao.getItem()]");
		
		return sqlSession.selectOne("item.getItem", itemNo);
	}
	
	//AdminList
	public List<ItemVo> getAdminList(int usersNo){
		System.out.println("[ShopDao.getAdmin()]");
		
		return sqlSession.selectList("item.getAdminList", usersNo);
	}
	
	//AdminList
	public List<ItemVo> getHistoryList(int usersNo){
		System.out.println("[ShopDao.getHistoryList()]");
		
		return sqlSession.selectList("item.getHistoryList", usersNo);
	}
	
	//결제
	public int payment(ItemVo itemVo){
		System.out.println("[ShopDao.payment()]");
		System.out.println(itemVo);
		return sqlSession.insert("item.historyInsert", itemVo);
	}
	//수량 -1
	public int useEa(int itemNo) {
		System.out.println("[ShopDao.useEa()]");
		
		return sqlSession.update("item.useEa", itemNo);
	}
	
	//상품 등록
	public int write(ItemVo itemVo){
		System.out.println("[ShopDao.cartInsert()]");
		
		return sqlSession.insert("item.itemInsert", itemVo);
	}
	
	//장바구니 추가
	public int cartInsert(ItemVo itemVo){
		System.out.println("[ShopDao.cartInsert()]");
		
		return sqlSession.insert("item.cartInsert", itemVo);
	}
	
	//재고 수정
	public int setea(ItemVo itemVo) {
		System.out.println("[ShopDao.setea()]");
		
		return sqlSession.update("item.setea", itemVo);
	}
	
	//상품 삭제
	public int delete(int itemNo) {
		System.out.println("[ShopDao.delete()]");
		
		return sqlSession.delete("item.delete", itemNo);
	}

}
