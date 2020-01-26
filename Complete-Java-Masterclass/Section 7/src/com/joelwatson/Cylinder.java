package com.joelwatson;

public class Cylinder extends Circle {

    private double height;

    public Cylinder() {
        this(0,0);
    }

    public Cylinder(double radius, double height) {
        super(radius);
        if (height > 0) {
            this.height = height;
        } else {
            this.height = 0;
        }
    }

    public double getHeight() {
        return this.height;
    }

    public double getVolume() {
        return getArea() * this.height;
    }
}
