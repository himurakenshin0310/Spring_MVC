package controllers;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bussinesLogic.HangBL;
import bussinesLogic.SuaBL;
import entity.Sua;

@Controller
@RequestMapping(path = "/")
public class HomeController {
	// trang chu
	@RequestMapping(path = "")
	public String home(Model model ) {
		model.addAttribute("dss", SuaBL.docTatCa(0, 8));
		model.addAttribute("banChay", SuaBL.dsBanChay());
		return "home";
	}
	//san pham gan day 
	@RequestMapping(path = "LuuVaoSession.html")
	@ResponseBody
	public Map<String, String> sessionSave(@RequestParam String id, HttpServletRequest request) {	
		HttpSession session =  request.getSession();
		LinkedList<Sua> suaGanDay = new LinkedList<>();
		if(session.getAttribute("suaGanDay")!= null) {
			suaGanDay = (LinkedList<Sua>) session.getAttribute("suaGanDay");			
		}else
			suaGanDay = new LinkedList<>();
		suaGanDay.removeIf(s -> s.getMaSua().contains(id));
		if(suaGanDay.size() == 8)
			suaGanDay.removeFirst();
		suaGanDay.add(SuaBL.docTheoMa(id));
		session.setAttribute("suaGanDay", suaGanDay);
		
		Map<String, String> map = new LinkedHashMap<>();
		map.put("kq", "succsess");
		return map;
	}
	
	// trang chi tiet san pham
	@RequestMapping(path = "ChiTietSanPham.html")
	public String ctSanPham(@RequestParam String id, Model model) {
		model.addAttribute("ctSP", SuaBL.docTheoMa(id));
		model.addAttribute("tenHang", SuaBL.docTheoMa(id).getHangSua().getTenHangSua());
		model.addAttribute("tenLoai", SuaBL.docTheoMa(id).getLoaiSua().getTenLoai());
		return "chitiet";
	}
}
