package com.fiftyhertz.pns.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class UploadController {
	
	
	
	public String welcome(){
		System.out.println("hi .....");
		return "redirect:/app";
	}
	/*@RequestMapping(value="/")
		public String processFormUpload(){
		
			return "redirect:/";
		}
	*/
	@RequestMapping(value="/upload/list")
	public ModelMap hasUpload(){
		ModelMap mm = new ModelMap();
		return mm;
	}
}
