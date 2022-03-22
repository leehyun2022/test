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

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

import org.springframework.stereotype.Repository;

/**
 * @Class Name : SampleDAO.java
 * @Description : Sample DAO Class
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

@Repository("deptDAO")
public class DeptDAO extends EgovAbstractDAO {

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertDeptSample(DeptVO vo) throws Exception {
		return (String) insert("deptDAO.insertDeptSample", vo);
	}
	public String insertCode(CodeVO vo) throws Exception {
		return (String) insert("deptDAO.insertCode", vo);
	}

	public List<?> selectDeptList(DeptVO vo) throws Exception {
		
		return list("deptDAO.selectDeptList",vo);
	}

	public DeptVO selectDeptDetil(String deptNo) {
		// TODO Auto-generated method stub
		return (DeptVO) select("deptDAO.selecDeptDetail",deptNo);
	}

	public int deleteDept(String deptNo) {
		// TODO Auto-generated method stub
		return delete("deptDAO.deleteDept",deptNo);
	}

	public int updateDept(DeptVO vo) {
		// TODO Auto-generated method stub
		return update("deptDAO.updateDept",vo);
	}

	

}
