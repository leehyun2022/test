package egovframework.example.sample.service;

import java.util.List;

public interface TestService {

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 SampleVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public String insertCode(CodeVO vo) throws Exception;
	public List<?> selectCodeList(CodeVO vo) throws Exception;
	public int selectCodesCount(CodeVO vo) throws Exception;
	public int deleteCode(String code) throws Exception;
	public CodeVO selectModify(String code) throws Exception;
	public int updateCode(CodeVO vo) throws Exception;
}