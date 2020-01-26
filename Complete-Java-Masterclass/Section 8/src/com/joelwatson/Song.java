package com.joelwatson;

import java.util.ArrayList;

public class Song {

    private String title;
    private int duration; // seconds

    public Song() {
        this("Untitled", 180);
    }

    public Song(String title, int duration) {
        this.title = title;
        this.duration = duration;
    }

    public String getTitle() {
        return title;
    }

    public int getDuration() {
        return duration;
    }

    public static Song createSong(String title, int duration) {
        return new Song(title, duration);
    }
}
