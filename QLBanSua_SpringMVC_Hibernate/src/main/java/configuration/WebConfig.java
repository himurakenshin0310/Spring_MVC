package configuration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

public class WebConfig implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.register(SrpingConfiguration.class);
		ctx.setServletContext(servletContext);
		DispatcherServlet dispatcher = new DispatcherServlet(ctx);
		//set tra ve loi 404
		dispatcher.setThrowExceptionIfNoHandlerFound(true);
		ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcher);
		servlet.setLoadOnStartup(1);
		servlet.addMapping("/");
	}

}
