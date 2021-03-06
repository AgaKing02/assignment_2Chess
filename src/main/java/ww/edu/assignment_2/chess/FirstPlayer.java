package ww.edu.assignment_2.chess;

import com.google.gson.Gson;
import ww.edu.assignment_2.models.MessageDispatcher;
import ww.edu.assignment_2.models.Move;
import ww.edu.assignment_2.models.MoveDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "FirstPlayer")
public class FirstPlayer extends HttpServlet {
    private ChessClient chessClient = null;
    private MoveDispatcher moveDispatcher = null;
    private MessageDispatcher messageDispatcher=null;

    @Override
    public void init() throws ServletException {
        ChessServer.startServer();
        chessClient = new ChessClient();
        chessClient.start();
        moveDispatcher = MoveDispatcher.getInstance();
        messageDispatcher=MessageDispatcher.getInstance();
        System.out.println("Started FirstPlayer");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("from") != null && request.getParameter("to") != null) {
            Move move = new Move(request.getParameter("from"), request.getParameter("to"));
            if (moveDispatcher != null) {
                moveDispatcher.putMoveAndWaitOpponent(move);
                String json = new Gson().toJson(move);
                response.getWriter().write(json);
            }
        } else if (request.getParameter("ready") != null) {
            Move move1 = moveDispatcher.getMoveAndReadyToMove();
            String json = new Gson().toJson(move1);
            response.getWriter().write(json);
        }else if(request.getParameter("message")!=null){
            String message=request.getParameter("message");
            String serverResponse=messageDispatcher.sendAndGetMessage(message);
            response.getWriter().write(serverResponse);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/chess.jsp").forward(request, response);
    }
}
