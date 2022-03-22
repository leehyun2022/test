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
import egovframework.example.sample.service.DeptVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("testDAO")
public class TestDAO extends EgovAbstractDAO {

	public String insertCode(CodeVO vo) throws Exception {
		return (String) insert("testDAO.insertCode", vo);
	}

	public List<?> selectCodeList(CodeVO vo) {
		// TODO Auto-generated method stub
		return list("testDAO.selectCodeList",vo);
	}

	public int selectCodesCount(CodeVO vo) {
		// TODO Auto-generated method stub
		return (int)select("testDAO.selectCodesCount",vo);
	}

	public int deleteCode(String code) {
		// TODO Auto-generated method stub
		return delete("testDAO.deleteCode",code);
	}

	public CodeVO selectModify(String code) {
		// TODO Auto-generated method stub
		return (CodeVO) select("testDAO.selectModify",code);
	}

	public int updateCode(CodeVO vo) {
		// TODO Auto-generated method stub
		return update("testDAO.updateCode",vo);
	}

	

}
