package src.td1;

public class Complexe {
    private double a;
    private double b;

    public Complexe(double a, double b) {
        this.a = a;
        this.b = b;
    }

    public void affiche() {
        System.out.println(a + " i" + b);
    }

}
