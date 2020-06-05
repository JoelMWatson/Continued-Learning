package Collections;

import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Joel
 * Date: 12/12/2019
 * Project: Section 12
 * Description: ...
 */

public class Theater {

    private final String theaterName;
    private List<Seat> seats = new ArrayList<Seat>();

    static final Comparator<Seat> PRICE_ORDER;

    static {
        PRICE_ORDER = new Comparator<Seat>() {
            @Override
            public int compare(Seat seat1, Seat seat2) {
                if (seat1.getPrice() < seat2.getPrice()) {
                    return -1;
                } else if (seat1.getPrice() > seat2.getPrice()) {
                    return 1;
                } else {
                    return 0;
                }
            }
        };
    }

    public Theater(String theaterName, int numRows, int seatsPerRow) {
        this.theaterName = theaterName;

        int lastRow = 'A' + (numRows-1);
        for (char row = 'A'; row <= lastRow; row++) {
            for (int seatNum = 1; seatNum <= seatsPerRow; seatNum++) {

                double price = 12.00;
                 if ((row < 'D') && (seatNum >= 4 && seatNum <=9)) {
                     price = 14.00;
                } else if ((row > 'F') || (seatNum < 4 || seatNum > 9)) {
                    price = 7.00;
                }
                Seat seat = new Seat(row + String.format("%02d", seatNum), price);
                seats.add(seat);
            }
        }
    }

    public String getTheaterName() {
        return this.theaterName;
    }

    public boolean reserveSeat(String seatNumber) {
        Seat requested = new Seat(seatNumber, 0);
        int foundSeat = Collections.binarySearch(seats, requested, null);
        if (foundSeat >= 0) {
            return seats.get(foundSeat).reserve();
        } else {
            System.out.println("There is no seat " + seatNumber);
            return false;
        }
    }

    public List<Seat> getSeats() {
        return this.seats;
    }

    public class Seat implements Comparable<Seat> {

        private final String seatNumber;
        private boolean reserved = false;
        private double price;

        public Seat(String number, double price) {
            this.seatNumber = number;
            this.price = price;
        }

        @Override
        public int compareTo(Seat seat) {
            return this.seatNumber.compareToIgnoreCase(seat.getSeatNumber());
        }

        public String getSeatNumber() {
            return seatNumber;
        }

        public double getPrice() {
            return price;
        }

        public boolean reserve() {
            if (!this.reserved) {
                this.reserved = true;
                System.out.println(this.seatNumber + " Reserved");
                return true;
            } else {
                return false;
            }
        }

        public boolean cancel() {
            if (this.reserved) {
                this.reserved = false;
                System.out.println(this.seatNumber + " Reservation canceled");
                return true;
            } else {
                return false;
            }
        }
    }
}
