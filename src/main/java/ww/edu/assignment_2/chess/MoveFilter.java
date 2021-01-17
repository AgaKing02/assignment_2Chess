package ww.edu.assignment_2.chess;

import javax.servlet.*;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class MoveFilter implements Filter {
    public static final List<Character> characterList = Arrays.asList('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H');
    public static final int numberList = 8;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        if (servletRequest.getParameter("from") != null && servletRequest.getParameter("to") != null) {
            String from = servletRequest.getParameter("from");
            String to = servletRequest.getParameter("to");


            if ((from.length() == 2 && characterList.contains(from.charAt(1)) && from.charAt(0) <= numberList) &&
                    (to.length() == 2 && characterList.contains(to.charAt(1)) && to.charAt(0) <= numberList)) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                servletResponse.getWriter().println("Wrong move");
            }
        }else {
            filterChain.doFilter(servletRequest, servletResponse);
        }


    }

    @Override
    public void destroy() {

    }
}
