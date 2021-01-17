package ww.edu.assignment_2.chess;

import javax.servlet.*;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class MoveFilter implements Filter {
    public static final List<Character> characterList = Arrays.asList('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H');
    public static final int numberList = 8;
    public static final int correctMove=2;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        if (servletRequest.getParameter("from") != null && servletRequest.getParameter("to") != null) {
            String from = servletRequest.getParameter("from");
            String to = servletRequest.getParameter("to");


            if (from.length() == correctMove && to.length() == correctMove ) {
                System.out.println("Correct move");
                filterChain.doFilter(servletRequest, servletResponse);
            }else{
                servletResponse.getWriter().write("Wrong move");
            }

        } else {
            filterChain.doFilter(servletRequest,servletResponse);
        }
    }




    @Override
    public void destroy() {

    }
}
