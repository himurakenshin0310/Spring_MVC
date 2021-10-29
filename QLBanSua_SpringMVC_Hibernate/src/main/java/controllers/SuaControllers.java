package controllers;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bussinesLogic.PaginateBL;
import bussinesLogic.SuaBL;
import entity.Sua;

@Controller
public class SuaControllers {
	@RequestMapping(path = "/TrangSanPhamSua.html", method = RequestMethod.GET)
	public String trangSua(Model model) {
		model.addAttribute("dss", SuaBL.docTatCa(0, 8));
		return "trangsua";
	}

	@RequestMapping(path = "/TrangSanPhamSua.html", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject phanTrang(@RequestParam int page, HttpServletRequest rq) {
		JSONObject jsob = new JSONObject();
		List<String> data = new ArrayList<>();
		List<Sua> ds = PaginateBL.phanTrang(page);
			
		for (Sua s : ds) {
			String tpDinhDuong = "";
			if (s.getTpDinhDuong().length() > 25) {
				tpDinhDuong = s.getTpDinhDuong().substring(0, 25);
			} else
				tpDinhDuong = s.getTpDinhDuong().substring(0, s.getTpDinhDuong().length());
			NumberFormat nfm = NumberFormat.getInstance(new Locale("vi", "VN"));

			String div = "\r\n" + "<div id=\"div-\" class=\"col-md-3 mb-3\">\r\n"
					+ "	<div class=\"card\" style=\"\">\r\n"
					+ "		<img id=\"img-\" style=\"height: 200px; width: auto; padding: 10px;\"\r\n"
					+ "			class=\"card-img-top\"\r\n"
					+ "			src=\""+rq.getContextPath()+"/images/" + s.getHinh() + "\"\r\n"
					+ "			alt=\"Card image cap\">\r\n"
					+ "		<div class=\"card-body\" style=\"height: 15px;\">\r\n"
					+ "			<h5 id=\"tenSua-\" class=\"cartTitle\">" + s.getTenSua() + "</h5>\r\n"
					+ "			<p>\r\n"
					+ "				<span id=\"donGia-${count.index }\" class=\"spanDonGia\">Giá\r\n"
					+ "					Tiền: " + nfm.format(s.getDonGia()) + " ₫ </span>\r\n" + "			</p>\r\n"
					+ "\r\n" + "		</div>\r\n" + "		<br>\r\n" + "		<div class=\"card-body mt-3\">\r\n"
					+ "			<p id=\"tpDinhDuong-\" class=\"card-text\"\r\n"
					+ "				style=\"word-wrap: break-word;\">" + tpDinhDuong + "...</p>\r\n"
					+ "			<a id=\"linkCT- onclick=\"\r\n" + "				spGanDay('" + s.getMaSua() + "')\"\r\n"
					+ "				href=\"${pageContext.request.contextPath }/ChiTietSanPham.html?id=" + s.getMaSua()
					+ "\"\r\n" + "				class=\"btn btn-primary\"><i class=\"far fa-eye\"></i></a> <a\r\n"
					+ "				id=\"linkThem-\" href=\"javascript:them('" + s.getMaSua() + "')\"\r\n"
					+ "				class=\"btn btn-success\"><i class=\"fa fa-shopping-cart\"></i></a>\r\n"
					+ "		</div>\r\n" + "	</div>\r\n" + "</div>";
			data.add(div);
		}
		if(page == PaginateBL.tongSoTrang())
			jsob.putIfAbsent("full", 1);
		
		jsob.put("data", data);
		return jsob;
	}
}
