package ww.edu.assignment_2.chess;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ChessConfiguration implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
//        ServletContext context = sce.getServletContext();
//        FilterRegistration.Dynamic registration = context.addFilter(MoveFilter.class.getSimpleName(), new MoveFilter());
//        registration.setAsyncSupported(true);
//        registration.addMappingForUrlPatterns(null, false, "/second", "/first");
    }
}
