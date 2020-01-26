public class AreaCalculator {

    public static void main(String[] args) {
        System.out.println(area(5.0));
        System.out.println(area(-1));
        System.out.println(area(5.0,4.0));
        System.out.println(area(-1.0,4.0));
    }

    public static double area(double radius) {
        double area;
        if (radius < 0) {
            area = -1;
        } else {
            area = Math.PI * Math.pow(radius, 2);
        }
        return area;
    }

    public static double area(double x, double y) {
        double area;
        if (x < 0 || y < 0) {
            area = -1;
        } else {
            area = x * y;
        }
        return area;
    }
}
