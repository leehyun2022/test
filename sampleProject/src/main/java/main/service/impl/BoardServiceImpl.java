package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.impl.DeptDAO;
import main.service.BoardService;
import main.service.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name = "boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public String inserNBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.inserNBoard(vo);
	}

	@Override
	public List<?> selectNBoardList(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectNBoardList(vo);
	}

	@Override
	public int selectNBoardTotal(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectNBoardTotal(vo);
	}

	@Override
	public BoardVO selectNBoardDetail(int unq) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectNBoardDetail(unq);
	}

	@Override
	public int updateBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.updateBoard(vo);
	}

	@Override
	public int deleteBoard(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.deleteBoard(vo);
	}

	@Override
	public int updateNBoardHits(int unq) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.updateBoardHits(unq);
	}

	@Override
	public int selectNBoardPass(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.selectNBoardPass(vo);
	}



}
