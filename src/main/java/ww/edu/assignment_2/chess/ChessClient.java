package ww.edu.assignment_2.chess;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

public class ChessClient extends Thread {
    public Socket connection;
    public static final int PORT = 1234;
    public ObjectOutputStream out;
    public ObjectInputStream in;


    @Override
    public void run() {
        try {
            connection = new Socket("localhost", PORT);
            System.out.println("Connected to localhost in port "+PORT);
            //2. get Input and Output streams
            out = new ObjectOutputStream(connection.getOutputStream());
            out.flush();
            in = new ObjectInputStream(connection.getInputStream());
        } catch (IOException e) {
            e.printStackTrace();
//        } finally {
//            try {
//                closeConnections();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
        }
    }

    public void closeConnections() throws IOException {
        in.close();
        out.close();
        connection.close();
    }

//    public static void main(String[] args) {
//        ChessClient client = new ChessClient();
//        client.start();
//    }
}
