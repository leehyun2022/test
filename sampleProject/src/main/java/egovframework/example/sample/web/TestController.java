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
import egovframework.example.sample.service.DeptVO;
import egovframework.example.sample.service.TestService;

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
public class TestController {
	@Resource(name="testService")
	private TestService testService;
	
	@RequestMapping(value="/codeWrite.do")
	public String codeWrite2() throws Exception{
		
		return "code/codeWrite";
	}
	@RequestMapping(value ="/codeWriteSave.do")
	public String insertCode(CodeVO vo) throws Exception{
		String result = testService.insertCode(vo);
		return "redirect:/codeList.do";
	}
	@RequestMapping(value ="/codeList.do")
	public String codeList(CodeVO vo, ModelMap model) throws Exception{
		
		
		int total = testService.selectCodesCount(vo);
		
		List<?> list = testService.selectCodeList(vo);
		
		model.addAttribute("resultTotal",total);
		model.addAttribute("resultList",list);
		
		return "code/codeList";
	}
	
	@RequestMapping(value="/codeDelete.do")
	public String codeDelete(String code) throws Exception{
		
		int result = testService.deleteCode(code);
		
		return "redirect:/codeList.do";
	}
	@RequestMapping(value="/codeModifyWrite.do")
	public String codeModify(String code, ModelMap model)throws Exception{
		
		CodeVO vo = testService.selectModify(code);
		
		model.addAttribute("codeVO",vo);
		
		return "code/codeModifyWrite";
	}
	
	@RequestMapping(value="/codeModifySave.do")
	public String modifySave(CodeVO vo) throws Exception{
		
		int result =testService.updateCode(vo);
		
		return "redirect:/codeList.do";
	}
	
}
