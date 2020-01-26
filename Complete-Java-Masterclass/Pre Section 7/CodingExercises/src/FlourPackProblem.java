public class FlourPackProblem {

    public static void main(String[] args) {
        System.out.println(canPack(1,0,4));
    }

    public static boolean canPack(int bigCount, int smallCount, int goal) {
        boolean possible = false;
        int usedBig = 0;
        int usedSmall = 0;
        int total = 0;
        while (total < goal && (usedBig < bigCount || usedSmall < smallCount)) {
            if (goal - total >= 5 && usedBig < bigCount) {
                total += 5;
                usedBig++;
            } else if (goal - total >= 1 && usedSmall < smallCount) {
                total += 1;
                usedSmall++;
            } else {
                break;
            }
            if (total == goal) {
                possible = true;
            }
        }
        return possible;
    }


}
