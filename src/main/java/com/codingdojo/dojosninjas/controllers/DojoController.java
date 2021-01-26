package com.codingdojo.dojosninjas.controllers;

import javax.validation.Valid;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.dojosninjas.models.Dojo;
import com.codingdojo.dojosninjas.services.DojoService;

@Controller
public class DojoController {
	
	private final DojoService dojoService;
	
	public DojoController(DojoService dojoService) {
		this.dojoService = dojoService;
	}
	
	@GetMapping("/dojos/new")
	public String newDojo(@ModelAttribute("dojoObject") Dojo dojo) {
		return "/dojosninjas/newdojo.jsp";
	}
	
	@PostMapping("/addingdojo")
	public String addDojo(@Valid @ModelAttribute("dojoObject") Dojo dojo, BindingResult result) {
		if(result.hasErrors()) {
			return "/dojosninjas/newdojo.jsp";
		}
		else {
			dojoService.addDojo(dojo);
			return "redirect:/ninjas/new";
		}
	}
	
	@GetMapping("/dojos/{dojoId}")
	public String displayDojo(@PathVariable("dojoId") Long id, Model model) {
		Dojo dojo = dojoService.oneDojo(id);
		model.addAttribute("dojo", dojo);
		return "/dojosninjas/display.jsp";
	}

}
