package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {

	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "/boardWrite.do")
	public String boardWrite() throws Exception {

		return "board/boardWrite";
	}

	@RequestMapping(value = "/boardWriteSave.do")
	@ResponseBody
	public String insertBoard(BoardVO vo) throws Exception {
		System.out.println("insertBoard::");
		String result = boardService.inserNBoard(vo);
		String msg = "";
		if (result == null)
			msg = "ok";
		else
			msg = "fail";

		return msg;
	}

	@RequestMapping(value = "/boardList.do")
	public String selectNBoardList(BoardVO vo, ModelMap model) throws Exception {

		if (vo.getUnit() == 0) {
			vo.setUnit(5);
		}
		int total = boardService.selectNBoardTotal(vo);
		/*
		 * int totalPage = (int) Math.ceil((double)total/vo.getUnit());
		 * 
		 * int viewPage = vo.getViewPage(); System.out.println("viewPage::"+viewPage);
		 * 
		 * if(viewPage > totalPage || viewPage < 1) { viewPage = 1; }
		 * System.out.println("viewPage22::"+viewPage);
		 * 
		 * int startIndex =(viewPage -1)*vo.getUnit()+1; int endIndex
		 * =startIndex+(vo.getUnit()-1);
		 * 
		 * int startRowNo = total - (viewPage-1)*vo.getUnit();
		 * 
		 * 
		 * vo.setStartIndex(startIndex); vo.setEndIndex(endIndex);
		 */

		// PaginationInfo에 필수 정보를 넣어 준다.
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getViewPage()); // 현재 페이지 번호
		paginationInfo.setRecordCountPerPage(vo.getUnit()); // 한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(2); // 페이징 리스트의 사이즈

		int firstRecordIndex = paginationInfo.getFirstRecordIndex();
		int lastRecordIndex = paginationInfo.getLastRecordIndex();

		int recordCountPerPage = paginationInfo.getRecordCountPerPage();

		vo.setStartIndex(firstRecordIndex); // 게시물 조회 시작 숫자
		vo.setEndIndex(lastRecordIndex); // 게시물 조회 끝 숫자
		paginationInfo.setTotalRecordCount(total); // 전체 게시물 건 수

		// 페이징 관련 정보가 있는 PaginationInfo 객체를 모델에 반드시 넣어준다.
		List<?> list = boardService.selectNBoardList(vo);

		model.addAttribute("unit", vo.getUnit());
		model.addAttribute("resultList", list);
		model.addAttribute("startRowNo", firstRecordIndex);
		model.addAttribute("total", total);
		model.addAttribute("boardVO", vo);
		model.addAttribute("paginationInfo", paginationInfo);

		return "board/boardList";
	}

	@RequestMapping(value = "/boardDetail.do")
	public String selectDetail(BoardVO vo, ModelMap model) throws Exception {

		// 게시글 리스트 목록 조회
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		System.out.println("boardVO11::"+boardVO.getUnit());
		boardVO.setUnit(vo.getUnit());
		System.out.println("boardVO22::"+boardVO.getUnit());
		// 게시글 조회 수 증가
		int result = boardService.updateNBoardHits(vo.getUnq());

		String content = boardVO.getContent();
		boardVO.setContent(content.replace("\n", "<br>")); // \n -> <br>

		model.addAttribute("boardVO", boardVO);

		return "board/boardDetail";
	}

	@RequestMapping(value = "/boardModifyWrite.do")
	public String selectModifyBoard(BoardVO vo, ModelMap model) throws Exception {

		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());

		model.addAttribute("boardVO", boardVO);

		return "board/boardModifyWrite";
	}

	  @RequestMapping(value="/boardModifySave.do") 
	  public String updateBoard(BoardVO vo)throws Exception{
	  System.out.println("boardModifySave::"); 
	  int count = boardService.selectNBoardPass(vo);
	  
	  if(count ==1) {
		  int result = boardService.updateBoard(vo);
	  } 
	  
	  
	  return "redirect:/boardList.do"; }
	 

	@RequestMapping(value = "/boardModifySaveAjax.do")
	@ResponseBody
	public String updateBoardAjax(BoardVO vo) throws Exception {
		System.out.println("boardModifySaveAjax::");
		int result = 0;

		int count = boardService.selectNBoardPass(vo);

		System.out.println("count::" + count);
		if (count == 1) {
			System.out.println("업데이트 처리");
			result = boardService.updateBoard(vo);
		} else {
			System.out.println("업데이트 실패");
			result = -1;
		}
		System.out.println("result::" + result);

		return result + "";
	}

	@RequestMapping(value = "/boardDelete.do")
	@ResponseBody
	public String deleteBoard(BoardVO vo) throws Exception {
		int result = 0;	
		int count = boardService.selectNBoardPass(vo);
		if (count == 1) {
			result = boardService.deleteBoard(vo);
		} else {
			result = -1;
		}
		return result + "";
	}
	
	@RequestMapping(value="/passWrite.do")
	public String passWrite(int unq, ModelMap model)throws Exception{

		model.addAttribute("unq",unq); 
		
		return "board/passWrite";
	}
	

}
