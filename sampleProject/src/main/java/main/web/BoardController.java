package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping(value="/boardWrite.do")
	public String boardWrite()throws Exception{
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value="/boardWriteSave.do")
	@ResponseBody
	public String insertBoard(BoardVO vo) throws Exception {
		
		System.out.println("1111");
		String result = boardService.inserNBoard(vo);
		System.out.println("2222");
		String msg = "";
		if(result == null) msg = "ok";
		else msg = "fail";
		
		return msg;
	}
	@RequestMapping(value="/boardList.do")
	public String selectNBoardList(BoardVO vo, ModelMap model)throws Exception{
		
		if(vo.getUnit() == 0) {
			vo.setUnit(5);
		}
		System.out.println("getSearchGubun::"+vo.getSearchGubun());
		System.out.println("getSearchText::"+vo.getSearchText());
		
		int total = boardService.selectNBoardTotal(vo);
		int totalPage = (int) Math.ceil((double)total/vo.getUnit());
		
		int viewPage = vo.getViewPage();
		System.out.println("viewPage::"+viewPage);
		
		if(viewPage > totalPage || viewPage < 1) {
			viewPage = 1;
		}
		System.out.println("viewPage22::"+viewPage);
		
		int startIndex =(viewPage -1)*vo.getUnit()+1;
		int endIndex =startIndex+(vo.getUnit()-1);
		
		int startRowNo = total - (viewPage-1)*vo.getUnit(); 
		
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		List<?> list = boardService.selectNBoardList(vo);
		
		System.out.println("liset::"+ list);
		
		model.addAttribute("unit",vo.getUnit());
		model.addAttribute("startRowNo",startRowNo);
		model.addAttribute("resultList",list);
		model.addAttribute("total",total);
		model.addAttribute("boardVO",vo);
		model.addAttribute("totalPage",totalPage);
		
		return "board/boardList";
	}
	
	
	@RequestMapping(value="boardDetail")
	public String selectDetail(BoardVO vo, ModelMap model) throws Exception{
		
		BoardVO boardVO= boardService.selectNBoardDetail(vo.getUnq());
		
		model.addAttribute("boardVO", boardVO);
		
		return "board/boardDetail";
	}
	
	@RequestMapping(value="boardModifyWrite")
	public String selectModifyBoard(BoardVO vo, ModelMap model)throws Exception{
		
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		
			model.addAttribute("boardVO", boardVO);
		
		return "board/boardModifyWrite";
	}
	
	@RequestMapping(value="boardModifySave")
	public String updateBoard(BoardVO vo)throws Exception{
		int result = boardService.updateBoard(vo);
		
		return "redirect:/boardList.do"; 
	}
	
	@RequestMapping(value="boardDelete")
	public String deleteBoard(BoardVO vo)throws Exception{
		int result = boardService.deleteBoard(vo);
		
		return "redirect:/boardList.do"; 
	}
	
}
