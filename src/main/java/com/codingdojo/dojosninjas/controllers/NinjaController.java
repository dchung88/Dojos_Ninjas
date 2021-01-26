package com.codingdojo.dojosninjas.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.dojosninjas.models.Ninja;
import com.codingdojo.dojosninjas.services.DojoService;
import com.codingdojo.dojosninjas.services.NinjaService;

@Controller
public class NinjaController {
	
	private final NinjaService ninjaService;
	private final DojoService dojoService;
	
	public NinjaController(NinjaService ninjaService, DojoService dojoService) {
		this.ninjaService = ninjaService;
		this.dojoService = dojoService;
	}
	
	@GetMapping("/ninjas/new")
	public String newNinja(@ModelAttribute("ninjaObject") Ninja ninja, Model model) {
		model.addAttribute("dojos", dojoService.getAllDojos());
		return "/dojosninjas/newninja.jsp";
	}
	
	@PostMapping("/addingninja")
	public String addNinja(@Valid @ModelAttribute("ninjaObject") Ninja ninja, BindingResult result) {
		if(result.hasErrors()) {
			return "/dojosninjas/newninja.jsp";
		}
		else {
			ninjaService.addNinja(ninja);
			return "redirect:/dojos/" + ninja.getDojo().getId();
		}
	}

}
