package ww.edu.assignment_2.models;

public class Producer implements Runnable{
    public Chess chess;
    public Move move;

    public Producer(Chess chess, Move move) {
        this.chess = chess;
        this.move = move;
    }

    public Producer() {
    }

    @Override
    public void run() {
        try {
            chess.putMove(move);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
