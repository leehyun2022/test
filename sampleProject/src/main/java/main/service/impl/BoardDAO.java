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

}
