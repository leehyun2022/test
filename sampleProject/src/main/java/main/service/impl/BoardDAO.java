package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.BoardVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO {

	public String inserNBoard(BoardVO vo) {
		return (String) insert("boardDAO.inserNBoard",vo);
	}

	public List<?> selectNBoardList(BoardVO vo) {
		return list("boardDAO.selectNBoardList",vo);
	}

	public int selectNBoardTotal(BoardVO vo) {
		// TODO Auto-generated method stub
		return (int) select("boardDAO.selectNBoardToal",vo);
	}

	public BoardVO selectNBoardDetail(int unq) {
		// TODO Auto-generated method stub
		return  (BoardVO) select("boardDAO.selectNBoardDetail",unq);
	}

	public int updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return update("boardDAO.updateBoard",vo);
	}

	public int deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return delete("boardDAO.deleteBoard",vo);
	}

	public int updateBoardHits(int unq) {
		// TODO Auto-generated method stub
		return update("boardDAO.updateBoardHits",unq);
	}

	public int selectNBoardPass(BoardVO vo) {
		// TODO Auto-generated method stub
		return (int) select("boardDAO.selectNBoardPass",vo);
	}


}
