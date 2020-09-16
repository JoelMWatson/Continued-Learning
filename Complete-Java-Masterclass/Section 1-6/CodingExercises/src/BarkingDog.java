public class BarkingDog {

    public static void main(String[] args) {
        System.out.println(shouldWakeUp(true, 9));
        System.out.println(shouldWakeUp(true, 23));
        System.out.println(shouldWakeUp(true, 8));
        System.out.println(shouldWakeUp(true, 22));
        System.out.println(shouldWakeUp(true, 6));
        System.out.println(shouldWakeUp(false, 6));
        System.out.println(shouldWakeUp(false, 23));
    }

    public static boolean shouldWakeUp(boolean barking, int hourOfDay) {
        boolean wakeUp = false;
        if (barking && hourOfDay >= 0 && hourOfDay < 24) {
            if (hourOfDay < 8 || hourOfDay > 22) {
                wakeUp = true;
            }
        }
        return wakeUp;
    }
}
