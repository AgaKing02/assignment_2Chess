package ww.edu.assignment_2.chess;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

public class ChatServer extends Thread {
    private DatagramSocket socket;
    private static String message="";
    private boolean running;
    private byte[] buf = new byte[1024];

    public ChatServer() throws SocketException {
        socket = new DatagramSocket(4445);
    }

    public static String getMessage() {
        return message;
    }

    public void run() {
        running = true;

        while (running) {
            DatagramPacket packet
                    = new DatagramPacket(buf, buf.length);
            try {
                socket.receive(packet);
            } catch (IOException e) {
                e.printStackTrace();
            }

            InetAddress address = packet.getAddress();
            int port = packet.getPort();
            packet = new DatagramPacket(buf, buf.length, address, port);
            String received
                    = new String(packet.getData(), 0, packet.getLength());

            if (received.equals("end")) {
                running = false;
                continue;
            }
            try {
                if (!message.equals(received) && !message.equals("")) {
                    socket.send(new DatagramPacket(message.getBytes(), message.length(), address, port));
                    message = received;
                } else {
                    message=received;
                    socket.send(packet);
                }

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        socket.close();
    }
}
