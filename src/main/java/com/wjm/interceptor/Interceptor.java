package com.wjm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.wjm.models.AccountInfo;

public class Interceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);

	/*
	 * Controller 이벤트 호출전
	 */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
    	//세션의 사용자 계정
    	AccountInfo account = (AccountInfo)request.getSession().getAttribute("account");
    	
    	try {
    		//계정이 존재 하지 않는 경우
            if(account == null ){
                    response.sendRedirect("/wjm/accounts/login"); 
                    return false;
            }
            else if(account.getAuthorized() == 0)
            {
                response.sendRedirect("/wjm/accounts/signup_verify"); 
                return false;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

    	//사용자 계정이 존재하는 경우, true 반환
    	return true;
    }
    
	/*
	 * controller 호출 후 view 페이지 출력전
	 */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
	/*
	 *  controller + view 페이지 모두 출력 후
	 */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
	/*
	 * ...
	 */
    @Override
    public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        super.afterConcurrentHandlingStarted(request, response, handler);
    }
}