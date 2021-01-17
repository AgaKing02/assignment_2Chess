package ww.edu.assignment_2.models;

import java.util.concurrent.Callable;

public class Consumer implements Callable<Move> {
    public Chess chess;

    public Consumer(Chess chess) {
        this.chess = chess;
    }

    public Consumer() {
    }

    @Override
    public Move call() throws Exception {
        return chess.getMove();
    }
}
