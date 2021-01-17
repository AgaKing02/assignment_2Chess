package ww.edu.assignment_2.models;


public class ChessGame implements Chess {
    public volatile static Move move;
    private volatile boolean occupied = false;

    @Override
    public synchronized void putMove(Move data) throws InterruptedException {
        while (occupied) {
            System.out.println("Producer tries to write.");
            wait();
        }
        move = data;
        occupied = true;
        notifyAll();

    }

    @Override
    public synchronized Move getMove() throws InterruptedException {
        System.out.println(move);
        while (!occupied) {
            System.out.println("Consumer tries to read.");
            wait();
        }

        occupied = false;
        notifyAll();
        return move;
    }


}


