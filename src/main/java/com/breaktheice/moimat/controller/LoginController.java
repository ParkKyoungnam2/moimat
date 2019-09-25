package com.breaktheice.moimat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.breaktheice.moimat.domain.LoginDomain;
import com.breaktheice.moimat.service.LoginService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("auth")
public class LoginController {

	@Autowired
	LoginService loginService; 
	
	
	@GetMapping("/login") // 사용자에게 로그인 입력 양식을 주는 페이지
	public String login(Model model) {
		
		log.info("loginPage 호출.... "); // Stem.out.println 써버에 부담 증가 .. log로 사용
		
		return "login/loginPage";
	}
	
	@PostMapping("/login") // 로그인 처리... post로 받았기 때문에 PostMapping으로 처리
	public String login(Model model, LoginDomain loginVo, HttpServletRequest request) {

		log.info("loginAction 호출.... ");
		log.info("login.." + loginVo.toString());

		// 성공시 로그인 성공 페이지, 실패시 로그인 페이지로 다시 이동
		boolean result = loginService.loginCheck(loginVo, request);

		if (result) { // 성공한 경우 세션성립 후 성공시 로그인 성공 페이지l
			return "index";			//
		} else { // 실패의 경우 실패시 로그인 페이지와 메시지 전송 			
			model.addAttribute("msg", "아이디 또는 비밀번호를 다시 확인하세요.");
			return "redirect:/login/loginPage";
		}
	}
	
	@GetMapping("/logout") // 테스트로그아웃페이지
	public String logout(Model model) {
		
		log.info("logOut 호출.... "); 
		
		return "login/logoutPage";
	}
	
	@PostMapping("/logout") // 로그인 처리... post로 받았기 때문에 PostMapping으로 처리
	public String logout(HttpServletRequest request) {
		 log.info("logoutAction 호출.... "); 
		 
		 HttpSession session = request.getSession(); //세션을 가져와서 
	     session.invalidate();  //세션을 지운다
		
		return "index";
	}

	
}