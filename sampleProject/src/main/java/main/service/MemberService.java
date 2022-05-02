package main.service;

import java.util.List;

public interface MemberService {
   /*
	*회원등록처리(save)
	*/
	public 	String insertMember(MemberVO vo)throws Exception;

	
	public int selectMemberIdCheck(String userid)throws Exception;
	
	
	public List<?> selectPostList(String dong)throws Exception;
	
	public int selectMemberCount(MemberVO vo) throws Exception;
}
