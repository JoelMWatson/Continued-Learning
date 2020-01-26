package com.example.awtSample;

import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class MyWindow extends Frame {

    public MyWindow(String title) {
        super(title);
        setSize(500,140);
        addWindowListener(new WindowAdapter() {
            @Override
            public void windowClosing(WindowEvent e) {
                System.exit(0);
                //super.windowClosing(e);
            }
        });
    }

    @Override
    public void paint(Graphics g) {
        super.paint(g);
        Font sanSerifLarge = new Font("Sanserif", Font.BOLD, 18);
        Font sanSerifSmall = new Font("Sanserif", Font.BOLD, 12);
        g.setFont(sanSerifLarge);
        g.drawString("The Complete Java Developer Course", 60, 60);
        g.setFont(sanSerifSmall);
        g.drawString("by Tim Buchalka", 60, 100);

    }
}
