package com.erp.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping; // ---	
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erp.service.AdminService;
import com.erp.vo.Users;

// 연결해주는 메인 컨트롤러
@Controller
public class MainController {
	
	@Inject
	AdminService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	// 시작 화면(로그인)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, HttpSession session) {
		
		session.invalidate();
		
		return "login";
	}

	// url -- loginAction일 경우
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public String loginAction(Users users, HttpSession session, RedirectAttributes ra) throws Exception {
		
		Users result = service.loginAction(users);
		String url = null;
		
		// user 값이 null 이면 로그인 안됌
		if(result == null) {

			ra.addFlashAttribute("msg", "로그인 정보가 일치하지 않습니다. ");
			url = "redirect:/";
			
		}
		
		// user user_num이 admin(관리자계정)	 이면 관리자 페이지로 로그인 후 이동
		else if(result.getUser_num().equals("admin")) {
			session.setAttribute("users", result);
			url = "redirect:/admin/adminMain";
		}
		
		else {
			session.setAttribute("users", result);
			url = "redirect:/user/userMain";
		}
		
		return url;
	}
	
	// url -- logout일 경우
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		
		// 세션 지우기
		session.invalidate();
		
		return "redirect:/";
	}

}