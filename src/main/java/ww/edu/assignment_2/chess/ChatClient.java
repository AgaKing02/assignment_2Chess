package ww.edu.assignment_2.chess;

import java.io.IOException;
import java.net.*;

public class ChatClient {
    private DatagramSocket socket;
    private InetAddress address;

    private byte[] buf=new byte[20];

    public ChatClient() throws SocketException, UnknownHostException {
        socket = new DatagramSocket();
        address = InetAddress.getByName("localhost");
    }


    public String send(String msg) {

        DatagramPacket packet
                = new DatagramPacket( msg.getBytes(), msg.getBytes().length, address, 4445);
        try {
            socket.send(packet);
        } catch (IOException e) {
            e.printStackTrace();
        }
        packet = new DatagramPacket(buf, buf.length);

        try {
            socket.receive(packet);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return new String(packet.getData(), 0, packet.getLength());
    }

    public void close() {
        socket.close();
    }
}
