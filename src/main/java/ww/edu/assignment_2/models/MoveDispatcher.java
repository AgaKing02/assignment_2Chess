package ww.edu.assignment_2.models;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class MoveDispatcher {
    public final ExecutorService executorService=Executors.newSingleThreadExecutor();
    public final Chess chess;
    private static MoveDispatcher instance;


    public MoveDispatcher(ChessGame chessGame) {
        this.chess = chessGame;
    }


    public static synchronized MoveDispatcher getInstance() {
        if (instance == null) {
            instance = new MoveDispatcher(new ChessGame());
        }
        return instance;
    }

    public void putMoveAndWaitOpponent(Move move) {
        executorService.execute(new Producer(chess, move));
    }

    public Move getMoveAndReadyToMove() {
        try {
            return executorService.submit(new Consumer(chess)).get();
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
        }
        return null;
    }


}
