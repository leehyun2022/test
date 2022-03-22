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
package egovframework.example.sample.service.impl;

import java.util.List;

import egovframework.example.sample.service.CodeVO;
import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.TestService;
import egovframework.example.sample.service.DeptVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
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

@Service("testService")
public class TestServiceImpl extends EgovAbstractServiceImpl implements TestService {

	private static final Logger LOGGER = LoggerFactory.getLogger(TestServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "testDAO")
	private TestDAO testDAO;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertCode(CodeVO vo) throws Exception {
		LOGGER.debug(vo.toString());
		
		/** ID Generation Service */
		//String id = egovIdGnrService.getNextStringId();
		//vo.setId(id);
		LOGGER.debug(vo.toString());
		
		return testDAO.insertCode(vo);
	}
	@Override
	public List<?> selectCodeList(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return testDAO.selectCodeList(vo);
	}
	@Override
	public int selectCodesCount(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return testDAO.selectCodesCount(vo);
	}
	@Override
	public int deleteCode(String code) throws Exception {
		// TODO Auto-generated method stub
		return testDAO.deleteCode(code);
	}
	@Override
	public CodeVO selectModify(String code) throws Exception {
		// TODO Auto-generated method stub
		return testDAO.selectModify(code);
	}
	@Override
	public int updateCode(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return testDAO.updateCode(vo);
	}
	
		
}
