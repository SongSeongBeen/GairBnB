package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.MessageVo;

@Repository
public class MessageDao {
   
   @Autowired
   private SqlSession sqlsession;
   
   //유저타입
   public MessageVo getType(int usersNo) {
      
      return sqlsession.selectOne("message.getType", usersNo);
   }
   
   //리스트 가져오기
   public List<MessageVo> messageList(int usersNo) {
      List<MessageVo> getList = sqlsession.selectList("message.getList", usersNo);
      System.out.println(getList +"리스트 다오");
      return getList;
   }
   
   //메세지 정보 가져오기
   public MessageVo getMInfo(int usersNo) {
       
      MessageVo getMInfo = sqlsession.selectOne("message.getMInfo", usersNo);
        
      System.out.println(getMInfo+"메세지 정보 다오");
       
      return getMInfo; 
   }
   
   //메세지 가져오기
   public List<MessageVo> getMessage(MessageVo messageVo) {
      List<MessageVo> mList = sqlsession.selectList("message.getMessage", messageVo);
      System.out.println(mList+"mList다오");
      return mList;
   }
   
   //상대방 이름 가져오기
   public MessageVo getName(int target) {
	   
	   return sqlsession.selectOne("message.getName", target);
   }
   
   //메세지 인서트
   public int setM(MessageVo messageVo) {
      System.out.println("인서트 다오"+messageVo);
      return sqlsession.insert("message.insertM", messageVo);
   }
   
   //맨처음 대화 시작하기
   public int sentMFirst(MessageVo messageVo) {
	      System.out.println("인서트 다오"+messageVo);
	      return sqlsession.insert("message.sentMFirst", messageVo);
   }
    
//    public MessageVo getN(int usersNo) {
//       
//       MessageVo getN = sqlsession.selectOne("message.getMInfo", usersNo);
//        
//       System.out.println(getN+"getN다오");
//       
//       return getN; 
//       }
    
   
   
   
   
   
   
   
   
   
   
   

}