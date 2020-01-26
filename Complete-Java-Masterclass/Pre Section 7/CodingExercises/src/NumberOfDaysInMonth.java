public class NumberOfDaysInMonth {

    public static void main(String[] args) {
        System.out.println(isLeapYear(-1600));
        System.out.println(isLeapYear(1600));
        System.out.println(isLeapYear(2017));
        System.out.println(isLeapYear(2000));

        System.out.println(getDaysInMonth(1, 2020));
        System.out.println(getDaysInMonth(2, 2020));
        System.out.println(getDaysInMonth(2, 2018));
        System.out.println(getDaysInMonth(-1, 2020));
        System.out.println(getDaysInMonth(1, -2020));
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

    public static int getDaysInMonth(int month, int year) {
        int days;
        if (month < 1 || month > 12 || year < 1 || year > 9999) {
            days = -1;
        } else {
            switch(month) {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    // JAN, MAR, MAY, JUL, AUG, OCT, DEC
                    days = 31;
                    break;

                case 2:
                    // FEB
                    if (isLeapYear(year)) {
                        days = 29;
                    } else {
                        days = 28;
                    }
                    break;

                default:
                    // APR, JUN, SEP, NOV
                    days = 30;
                    break;
            }
        }
        return days;
    }
}
