package egovframework.example.sample.service;

import java.util.List;

public interface DeptService {

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	String insertDeptSample(DeptVO vo) throws Exception;

	/**
	 * 글 리스트 조회.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public List<?> selectDeptList(DeptVO vo) throws Exception;
	
	public String insertCode(CodeVO vo) throws Exception;
	
	public DeptVO selectDeptDetail(String deptNo) throws Exception;

	public int deleteDept(String deptNo) throws Exception;	

	public int updateDept(DeptVO vo) throws Exception;
}