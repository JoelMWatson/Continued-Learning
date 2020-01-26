package com.joelwatson;

public class Rectangle {

    private double width;
    private double length;

    public Rectangle(double width, double length) {
        if (width > 0) {
            this.width = width;
        } else {
            this.width = 0;
        }
        if (length > 0) {
            this.length = length;
        }
    }

    public double getWidth() {
        return this.width;
    }

    public double getLength() {
        return this.length;
    }

    public double getArea() {
        return (this.width * this.length);
    }
}
