package com.earth.sunny;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RequestMappingTest {
	
	//@RequestMapping({"/login/hello.do", "/login/hi.do"})
	@RequestMapping("/login/hello.do")
	public void test1() {
		System.out.println("urlpatten=/login/hello.do");
	}
	
	@RequestMapping("/login/*")		//  /login/hello, /login/hi
	public void test2() {
		System.out.println("urlpatten=/login/*");
	}
	
	@RequestMapping("/login/**/temp/*.do")
	public void test3() {
		System.out.println("urlpatten=login/**/temp/*.do");
	}
	
	@RequestMapping("/login/??")
	public void test4() {
		System.out.println("urlpatten=/login/??");
	}
	
	@RequestMapping("*.do")
	public void test5() {
		System.out.println("urlpatten=*.do");
	}
	
	@RequestMapping("/*.???")
	public void test6() {
		System.out.println("urlpatten=/*.???");
	}
	
}
