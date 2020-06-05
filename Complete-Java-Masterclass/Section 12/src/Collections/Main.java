package Collections;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/12/2019
 * Project: Section 12
 * Description: ...
 */

public class Main {
    public static void main(String[] args) {
        Theater theater = new Theater("Olympian", 8, 12);

//        if (theater.reserveSeat("A02")) {
//            System.out.println("Reservation success");
//        } else {
//            System.out.println("Reservation failed");
//        }
//
//        if (theater.reserveSeat("H10")) {
//            System.out.println("Reservation success");
//        } else {
//            System.out.println("Reservation failed");
//        }
//
//        if (theater.reserveSeat("H10")) {
//            System.out.println("Reservation success");
//        } else {
//            System.out.println("Reservation failed: H10 Taken");
//        }
//
//        List<Theater.Seat> reverseSeats = new ArrayList<>(theater.getSeats());
//        Collections.reverse(reverseSeats);
//        printList(reverseSeats);

        List<Theater.Seat> priceSeats = new ArrayList<>(theater.getSeats());
        priceSeats.add(theater.new Seat("A13", 13.00));
        priceSeats.add(theater.new Seat("B13", 13.00));
        Collections.sort(priceSeats, Theater.PRICE_ORDER);
        printList(priceSeats);

    }

    public static void printList(List<Theater.Seat> list) {
        for (Theater.Seat seat : list) {
            System.out.print(" " + seat.getSeatNumber() + " $" + seat.getPrice());
        }
        System.out.println();
        System.out.println("==============================================");
    }

}
