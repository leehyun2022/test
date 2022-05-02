package egovframework.com.cmm.interceptor;

import java.util.Enumeration;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import egovframework.com.cmm.LoginVO;
import egovframework.com.sym.mnu.mpm.service.EgovMenuManageService;
import egovframework.com.sym.mnu.mpm.service.MenuManageVO;
import egovframework.com.utl.cas.service.EgovSessionCookieUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;

public class MenuInfoInjectionInterceptor extends HandlerInterceptorAdapter {

	
	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /** EgovMenuManageService */
	@Resource(name = "meunManageService")
    private EgovMenuManageService menuManageService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		String requestURI = request.getRequestURI();
		
		Enumeration<String> param = request.getParameterNames();
		
		
		 MenuManageVO menuManageVO = new MenuManageVO();
		while (param.hasMoreElements()) {
			String name = (String)param.nextElement();
		}
		
		/*
		 * if(isFirstPage(request.getContextPath(), requestURI)) { Cookie cookie = new
		 * Cookie("curMenuNo",""); cookie.setPath("/"); cookie.setMaxAge(0);
		 * response.addCookie(cookie); }
		 */
		
		LoginVO user = null;
		
		if(EgovUserDetailsHelper.isAuthenticated()) {
			user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
			
			if(user !=null) {
				
				if(EgovSessionCookieUtil.getSessionAttribute(request, "userInfo") == null) {
					EgovSessionCookieUtil.setSessionAttribute(request, "userInfo", user);
				}else if (EgovSessionCookieUtil.getSessionAttribute(request, "userInfo") == request.getParameter("userId")) {
					
				}
				
			}
			
		}else {
			user =new LoginVO();
			
		}
		menuManageVO.setTmpUniqId("USRCNFRM_00000000001");
    	List<?> list_menulist = menuManageService.selectMainMenuLeft(menuManageVO);
    	request.setAttribute("list_menulist", list_menulist);
		return true;

	}
	
}
