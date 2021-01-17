package ww.edu.assignment_2;

import com.google.gson.Gson;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.EOFException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    ServerSocket server = null;
    Socket connection = null;
    ObjectOutputStream output;
    ObjectInputStream input;

    public void init() {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String move = request.getParameter("move");
        System.out.println("FROM FRONT END:" + move);
        try {
            if (server == null) {
                server = new ServerSocket(12345, 100);
                System.out.println("WAS NULL");
                System.out.println("before connection server");
                connection = server.accept();
                System.out.println("After connection server");
                output = new ObjectOutputStream(connection.getOutputStream());
                output.flush();
                input = new ObjectInputStream(connection.getInputStream());
            }
            String moveBack = runServer(move);
            String json = new Gson().toJson(moveBack);
            System.out.println("TO FRONT END:" + moveBack);
            response.getWriter().write(json);
            return;
        } catch (IOException ioexception) {
            ioexception.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
    }

    public void destroy() {
        System.out.println("DESTROYED");
    }

    public String runServer(String move) {
        String end = "";
        String messageOut = "Connection Successfull";
        String messageIn = "Connection Successfull";
        try {
            //while (!end.equals("END"))
            {
                try {
                    System.out.println("connection server");
                    messageOut = move;
                    output.writeObject("SERVER>>> " + messageOut);
                    output.flush();
                    String message = "";
                    do {
                        try {
                            messageIn = (String) input.readObject();
                            System.out.println("\n" + messageIn);
                            messageOut = move;
                            output.writeObject("SERVER>>> " + messageOut);
                            output.flush();
                            {
                                end = messageIn;
                                message = "TERMINATE";
                                return messageIn;
                            }
                        } catch (ClassNotFoundException classNotFoundException) {
                            classNotFoundException.printStackTrace();
                            System.out.println("ERROR CNFE SERVER");
                        }
                    }
                    while (!message.equals("TERMINATE"));
                } catch (EOFException eofexception) {
                    eofexception.printStackTrace();
                    System.out.println("ERROR EOF SERVER");
                } finally {
                    //try
                    {
                        //output.close();
                        //input.close();
                        //connection.close();
                    }
                    //catch (IOException ioexception)
                    {
                        //  ioexception.printStackTrace();
                    }
                }
            }
        } catch (IOException ioexception) {
            ioexception.printStackTrace();
        }
        return messageIn;
    }
}