package main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {

	@Resource(name = "memberService")
	private MemberService memberService;
	/*
	 *회원등록 화면
	 */
	
	@RequestMapping(value = "/memberWrite.do")
	public String memberWrite()throws Exception{
		
		
		return "member/memberWrite";
	}

	/*
	 *회원등록처리 (저장) 
	 */
	@RequestMapping(value="/memberWriteSave.do")
	@ResponseBody
	public String insertMember(MemberVO vo)throws Exception{
		
		String message = "";
		
		String result = memberService.insertMember(vo);
		
		if(result == null) {
			message = "ok";
		}
		
		return message;
	}
	
	
	@RequestMapping(value="/idcheck.do")
	@ResponseBody
	public String selectMemberIdCheck(String userid)throws Exception{
		String message = "";
		
		int count = memberService.selectMemberIdCheck(userid);
		
		if(count == 0 ) {
			message ="ok";
		}
		
		return message;
	}
	
	@RequestMapping(value="/post1.do")
	public String post1()throws Exception{
		
		return "member/post1";
	}
	@RequestMapping(value="/post2.do")
	public String post2(String dong, ModelMap model)throws Exception{
			
		List<?> list = memberService.selectPostList(dong);
		model.addAttribute("resultList",list);
		
		return "member/post2";
	}
	@RequestMapping(value="/loginWrite.do")
	public String login()throws Exception{
		
		return "member/loginWrite";
	}
	
	
	@RequestMapping(value="/loginCheck.do")
	@ResponseBody
	public String selectMemberCount(MemberVO vo, HttpSession session)throws Exception{
		String message = "";
		
		int count = memberService.selectMemberCount(vo);
		
		if(count == 1) {
			session.setAttribute("SessionUserID", vo.getUserid());
			
			message ="ok";
		}
		
		return message;
	}
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session)throws Exception{
		
		session.removeAttribute("SessionUserID");
		
		return "member/loginWrite";
	}
	
}
