public class LeapYearCalculator {

    public static void main(String[] args) {
        // false
        System.out.println(isLeapYear(1700));
        System.out.println(isLeapYear(1800));
        System.out.println(isLeapYear(2200));

        // true
        System.out.println(isLeapYear(1600));
        System.out.println(isLeapYear(2000));
        System.out.println(isLeapYear(2400));
    }

    public static boolean isLeapYear(int year) {
        boolean leapYear = false;
        if (year > 0 && year <= 9999) {
            if (year % 4 == 0) {
                leapYear = true;
                if ((year % 100 == 0) && (year % 400 != 0)) {
                    leapYear = false;
                }
            }
        }
        return leapYear;
    }
}
