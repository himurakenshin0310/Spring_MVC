package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

public class UpdateCart implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String soInt = "[\\d]*";
		if(request.getParameter("quantity").toString().matches(soInt)) {
			return true;
		}else {
			JSONObject jsob = new JSONObject();
			jsob.put("kq", "Số lượng không hợp lệ");
			Gson gson = new Gson();
			String json = gson.toJson(jsob);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
			return false;
		}
	}
}
