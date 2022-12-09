package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
	
	@RequestMapping("/")
	public @ResponseBody String index() {
		return "welcome home";
	}
	
	@RequestMapping("/hello")
	public  String hello(@RequestParam(required=false) String name, Model model) {
		String greetings ="Hello, " +name + "!";
		model.addAttribute("greetings",greetings);
		return "hello";
	}
}
	
