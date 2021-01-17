package ww.edu.assignment_2.models;

public class Move {
    public String from;
    public String to;

    public Move(String from, String to) {
        this.from = from;
        this.to = to;
    }

    public Move() {
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    @Override
    public String toString() {
        return "Move{" +
                "from='" + from + '\'' +
                ", to='" + to + '\'' +
                '}';
    }
}
