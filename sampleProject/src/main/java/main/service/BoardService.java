package main.service;

import java.util.List;

public interface BoardService {

		/*
		 * 일반 게시판 저장처리
		 * @param vo
		 * @return
		 * @throws Exception
		 */
		public String inserNBoard(BoardVO vo) throws Exception;
		
		/*
		 *일반 게시판 조회 
		 * @param vo
		 * @return
		 * @throws Exception
		 */
		public List<?> selectNBoardList(BoardVO vo)throws Exception;
}
