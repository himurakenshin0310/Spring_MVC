package controllers;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.query.internal.NativeQueryReturnBuilderFetchImpl;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String postAddCart(@RequestParam String id, @RequestParam int quantity, HttpServletRequest rq, Model model) {
		Cart cart;
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

	@RequestMapping(path = "XoaGioHang.html", method = RequestMethod.POST)
	@ResponseBody
	public JsonObject deleteCart(@RequestParam(value = "id[]") String[] id, HttpServletRequest rq) {
		HttpSession session = rq.getSession();
		Cart cart = (Cart) session.getAttribute("gioHang");
		for (String s : id) {
			cart.deleteCart(s);
		}
		JsonObject jsob = new JsonObject();
		NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
		if(cart.tongSpMua() == 0)
			session.removeAttribute("gioHang");
		jsob.addProperty("tongTien", nf.format(cart.tongTien()));
		jsob.addProperty("soLuongMua", cart.tongSpMua());
		return jsob;
	}
	
	@RequestMapping(path = "CapNhatGioHang.html", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject updateCart(@RequestParam String id, @RequestParam(value = "quantity") int qty, HttpServletRequest rq) {
		JSONObject jsob = new JSONObject();
		HttpSession session = rq.getSession();
		Cart cart = (Cart) session.getAttribute("gioHang");
		cart.updateCart(id, qty);
		NumberFormat nfm = NumberFormat.getInstance(new Locale("vi","VN"));
		List<String> thanhTien = new ArrayList<>();
		for(double s : cart.thanhTien()) {
			thanhTien.add(nfm.format(s));
		}
//		thanhTien.forEach(s -> System.out.println(s));
		jsob.put("thanhTien", thanhTien);
		jsob.put("tongTien", nfm.format(cart.tongTien())+" ₫");
		return jsob;
	}
}
