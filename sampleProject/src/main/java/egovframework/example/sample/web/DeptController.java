/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.CodeVO;
import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class DeptController {
	@Resource(name="deptService")
	private DeptService deptService;

	@RequestMapping(value = "/deptWrite.do")
	public String deptWrite() throws Exception {
			System.out.println("부서정보 입력화면");

		return "dept/deptWrite";
	}
	@RequestMapping(value = "/deptWriteSave.do")
	public String deptWriteSave(DeptVO deptVo) throws Exception {
		System.out.println("deptno::"+deptVo.getDeptNo());
		System.out.println("deptno::"+deptVo.getDeptName());
		System.out.println("deptno::"+deptVo.getLoc());
		deptService.insertDeptSample(deptVo);

		return "redirect:/deptList.do";
	}
	
	@RequestMapping(value = "/deptList.do")
	public String selectDeptList(DeptVO vo, ModelMap model) throws Exception{
		
		List<?> list = deptService.selectDeptList(vo);
		model.addAttribute("resultList", list);	
		
		return "dept/deptList";
	}
	@RequestMapping(value ="/deptDetail.do")
	public String selectDeptDetail(String deptNo, ModelMap model) throws Exception{
		DeptVO vo = deptService.selectDeptDetail(deptNo);
		
		model.addAttribute("deptVO",vo);
		return "dept/deptDetail";
	}
	@RequestMapping(value ="/deptDelete.do")
	public String deleteDept(String deptNo) throws Exception{
		System.out.println("삭제");
		System.out.println("deptNo::"+deptNo);
		int result = deptService.deleteDept(deptNo);
		
		return "redirect:/deptList.do";
	}
	
	@RequestMapping(value ="/deptModifyWrite.do")
	public String selectDeptModify(String deptNo, ModelMap model)throws Exception{
		DeptVO vo = deptService.selectDeptDetail(deptNo);
		
		model.addAttribute("deptVO",vo);
		
		return "dept/deptModifyWrite";
	}
	
	@RequestMapping(value ="/deptModifySave.do")
	public String updateDept(DeptVO vo) throws Exception{
		deptService.updateDept(vo);
		return "redirect:/deptList.do"; 
	}
	
	/*
	 * @RequestMapping(value="/codeWrite.do") public String codeWrite() throws
	 * Exception{
	 * 
	 * return "code/codeWrite"; }
	 * 
	 * @RequestMapping(value ="/codeWriteSave.do") public String insertCode(CodeVO
	 * vo) throws Exception{
	 * 
	 * String result = deptService.insertCode(vo); return "redirect:/codeList.do"; }
	 */
	
	
}
