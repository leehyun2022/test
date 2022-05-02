package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.MemberVO;

@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO {

	public String insertMember(MemberVO vo) {
		return (String) insert("memberDAO.insertMember",vo);
	}

	public int selectMemberIdCheck(String userid) {
		// TODO Auto-generated method stub
		return (int)select("memberDAO.selectMemberIdCheck",userid);
	}

	public List<?> serlectPostList(String dong) {
		// TODO Auto-generated method stub
		return list("memberDAO.selectPostList",dong);
	}

	public int selectMemberCount(MemberVO vo) {
		// TODO Auto-generated method stub
		return (int)select("memberDAO.selectMemberCount",vo);
	}

}
