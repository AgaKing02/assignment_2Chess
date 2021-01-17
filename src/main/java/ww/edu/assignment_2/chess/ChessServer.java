package ww.edu.assignment_2.chess;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class ChessServer extends Thread {
    public ServerSocket serverSocket;
    public Socket[] sockets = new Socket[2];
    public Socket wait;
    public boolean isFull = false;
    public ObjectOutputStream out;
    public ObjectInputStream in;
    public static volatile boolean isGameEnded = false;


    @Override
    public void run() {
        try {
            serverSocket = new ServerSocket(ChessClient.PORT, 2);
            System.out.println("Waiting for connection");
            int i = -1;
            do {
                //2. Wait for connection
                Socket client = serverSocket.accept();
                System.out.println("Connection received from " + client.getInetAddress().getHostName());
                //3. get Input and Output streams
                out = new ObjectOutputStream(client.getOutputStream());
                out.flush();
//            in = new ObjectInputStream(connection.getInputStream());
                System.out.println("Connection successful");
                i++;
                sockets[i] = client;
            } while (i != sockets.length - 1);
            wait = serverSocket.accept();
        } catch (IOException e) {
            e.printStackTrace();
//        }finally {
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
        serverSocket.close();
    }

    public static void main(String[] args) {
        ChessServer server = new ChessServer();
        //while(true) {
        server.start();
        //}
    }
}
