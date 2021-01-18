package ww.edu.assignment_2.chess;

import javax.servlet.*;
import javax.servlet.annotation.WebListener;
import java.util.HashMap;
import java.util.Map;

@WebListener
public class ChessConfiguration implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();

        String simpleFilterName = "moveFilter";

        context.addFilter(simpleFilterName, MoveFilter.class);
    }
}
