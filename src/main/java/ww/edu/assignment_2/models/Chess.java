package ww.edu.assignment_2.models;

public interface Chess {
    void putMove(Move move) throws InterruptedException;
    Move getMove() throws InterruptedException;
}
