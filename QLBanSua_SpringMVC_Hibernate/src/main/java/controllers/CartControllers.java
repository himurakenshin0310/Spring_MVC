package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;

import javabean.Cart;

@Controller
@RequestMapping(path = "/")
public class CartControllers {
	@RequestMapping(path = "ThemVaoGioHang.html", method = RequestMethod.GET)
	@ResponseBody
	public JsonObject addCart(HttpServletRequest rq, Cart cart, @RequestParam(name = "id") String id) {
		HttpSession session = rq.getSession();
		if (session.getAttribute("gioHang") == null)
			cart = new Cart();
		else
			cart = (Cart) session.getAttribute("gioHang");
		JsonObject jsob = new JsonObject();
		if (cart.addCart(id, 1) != null) {
			session.setAttribute("gioHang", cart);
			jsob.addProperty("soLuongSP", cart.tongSpMua());
		} else
			jsob.addProperty("thongBao", "Có lỗi vui lòng thử lại sau.");
		return jsob;
	}

	@RequestMapping(path = "ThemVaoGioHang.html", method = RequestMethod.POST)
	public String postAddCart(@RequestParam String id, @RequestParam int quantity, HttpServletRequest rq, Cart cart,
			Model model) {
		HttpSession session = rq.getSession();
		if (session.getAttribute("gioHang") == null)
			cart = new Cart();
		else
			cart = (Cart) session.getAttribute("gioHang");
		cart.addCart(id, quantity);
		session.setAttribute("gioHang", cart);
		session.setAttribute("kq", "Thêm thành công!");
		return "redirect:TrangGioHang.html";

	}

	@RequestMapping(path = "TrangGioHang.html", method = RequestMethod.GET)
	public String cartPage() {
		return "giohang";
	}
}