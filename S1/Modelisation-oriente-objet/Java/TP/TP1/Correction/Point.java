package src.td1;

public class Point {
    private double x;
    private double y;

    public Point(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public Point() {
        this.x = 0;
        this.y = 0;
    }


    public Point(Point p) {
        this.x = p.getX();
        this.y = p.getY();
    }

    @Override
    protected void finalize() throws Throwable {
        super.finalize();
        System.out.println("Objet Point est detritus");
    }

    @Override
    public String toString() { return "(" + x + "," + y + ")"; }

    public double getX() { return x; }

    public double getY() {
        return y;
    }

    public void setX(double x) {
        this.x = x;
    }

    public void setY(double y) {
        this.y = y;
    }

    public void translaterV(int d) {
        // Translation horizontal du point
        x += d;
    }

    public void translaterH(int d) {
        // Translation horizontal du point
        y += d;
    }


    public Point milieu(Point p) {
        return new Point((x + p.getX()) / 2, (y + p.getY()) / 2);
    }

    public double distance(Point p) {
        return Math.sqrt(Math.pow(p.getX() - x, 2) + Math.pow(p.getY() - y, 2));
    }
}
