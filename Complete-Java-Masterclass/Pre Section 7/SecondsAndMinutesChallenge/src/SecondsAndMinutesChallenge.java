public class SecondsAndMinutesChallenge {

    public static void main(String[] args) {
        System.out.println(getDurationString(186, 55));
        System.out.println(getDurationString(67, 5));
    }

    public static String getDurationString(int minutes, int seconds) {
        String duration;
        if (minutes >= 0 && seconds >= 0 && seconds <=59) {
            int hours = minutes / 60;
            String hoursString, minutesString, secondsString;
            minutes = minutes % 60;
            if (hours < 10) {
                hoursString = "0" + hours + "h ";
            } else {
                hoursString = hours + "h ";
            }
            if (minutes < 10) {
                minutesString = "0" + minutes + "m ";
            } else {
                minutesString = minutes + "m ";
            }
            if (seconds < 10) {
                secondsString = "0" + seconds + "s";
            } else {
                secondsString = seconds + "s";
            }
            duration = hoursString + minutesString + secondsString;
        } else {
            duration = "Invalid value";
        }
        return duration;
    }

    public static String getDurationString(int seconds) {
        String duration;
        if (seconds >= 0) {
            int minutes = seconds / 60;
            seconds = seconds % 60;
            duration = getDurationString(minutes, seconds);
        } else {
            duration = "Invalid value";
        }
        return duration;
    }
}
