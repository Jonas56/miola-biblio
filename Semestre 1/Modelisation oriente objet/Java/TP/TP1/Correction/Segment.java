package src.td1;

public class Segment {

    private Point a;
    private Point b;

    public Segment(Point a, Point b) {
        this.a = a;
        this.b = b;
    }

    public Point getA() {
        return a;
    }

    public Point getB() {
        return b;
    }

    public void setA(Point a) {
        this.a = a;
    }

    public void setB(Point b) {
        this.b = b;
    }

    public double longueur() {
        return a.distance(b);
    }

    public boolean appartient(Point p) {
        return false;
    }

    @Override
    public String toString(){
        return "A("+a.getX() + "," + a.getY()+")" + " B("+b.getX() + "," + b.getY()+")";
    }
}
