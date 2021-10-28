package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bussinesLogic.SuaBL;

@Controller
public class SuaControllers {
	@RequestMapping(path = "/TrangSanPhamSua.html")
	public String trangSua(Model model) {
		model.addAttribute("dss", SuaBL.docTatCa(0, 8));
		return "trangsua";
	}
}
