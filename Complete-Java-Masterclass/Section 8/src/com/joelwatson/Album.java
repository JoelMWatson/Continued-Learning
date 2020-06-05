package com.joelwatson;

import java.util.ArrayList;

public class Album {

    private String title;
    private ArrayList<Song> songs;

    public Album() {
        this("untitled");
    }

    public Album(String title) {
        this.title = title;
        this.songs = new ArrayList<Song>();
    }

    public String getTitle() {
        return title;
    }

    public ArrayList<Song> getSongs() {
        return songs;
    }

    public static Album createAlbum(String title, int length) {
        Album album = new Album(title);
        for (int i=0; i < length; i++) {
            album.addSongToAlbum(Song.createSong(title + "-" + i, 180));
        }
        return album;
    }

    public void addSongToAlbum(Song song) {
        boolean exists = findSongOnAlbum(song);
        if (!exists) {
            System.out.println(song.getTitle() + " was added to album " + this.title);
            this.songs.add(song);
        } else {
            System.out.println(song.getTitle() +" was already on the album");
        }

    }

    public boolean findSongOnAlbum(Song song) {

//        for (Song checkedSong: this.songs) {}

        for (int i = 0; i < songs.size(); i++) {
            if (songs.get(i).getTitle().compareTo(song.getTitle()) == 0) {
                return true;
            }
        }
        return false;
    }
}
