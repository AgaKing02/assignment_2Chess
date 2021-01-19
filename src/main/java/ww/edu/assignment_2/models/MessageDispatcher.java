package ww.edu.assignment_2.models;

import ww.edu.assignment_2.chess.ChatClient;
import ww.edu.assignment_2.chess.ChatServer;

import java.net.SocketException;
import java.net.UnknownHostException;

public class MessageDispatcher {
    private static MessageDispatcher instance;
    private ChatClient client;


    public MessageDispatcher() {
        try {
            new ChatServer().start();
            System.out.println("Chat server is on");
        } catch (SocketException e) {
            e.printStackTrace();
        }
        try {
            client = new ChatClient();
            System.out.println("Chat client is on");

        } catch (SocketException | UnknownHostException e) {
            e.printStackTrace();
        }
    }

    public static synchronized MessageDispatcher getInstance() {
        if (instance == null) {
            instance = new MessageDispatcher();
        }
        return instance;
    }
    public String sendAndGetMessage(String message){
        return client.send(message);
    }

}