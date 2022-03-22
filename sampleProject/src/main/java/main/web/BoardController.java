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
		
		List<?> list = boardService.selectNBoardList(vo);
		
		System.out.println("liset::"+ list);
		
		model.addAttribute("resultList",list);
		
		return "board/boardList";
	}
	
	
	
}
