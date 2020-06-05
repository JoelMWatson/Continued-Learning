package com.joelwatson;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    private static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        ArrayList<Album> albums = new ArrayList<Album>();
        albums.add(Album.createAlbum("Smash Mouth", 10));
        albums.add(Album.createAlbum("Sum 41", 8));
        albums.add(Album.createAlbum("Britney Spears", 13));

        System.out.println();
        System.out.println("=====Albums Library Created=====");
        System.out.println();

        Playlist playlist = new Playlist("My Jams", albums);
        addSong(Song.createSong("Smash Mouth-5", 180), playlist);
        addSong(Song.createSong("Smash Mouth-7", 180), playlist);
        addSong(Song.createSong("Smash Mouth-2", 180), playlist);
        addSong(Song.createSong("Smash Mouth-3", 180), playlist);
        addSong(Song.createSong("Sum 41-3", 180), playlist);
        addSong(Song.createSong("Sum 41-8", 180), playlist);
        addSong(Song.createSong("Britney Spears-1", 180), playlist);
        addSong(Song.createSong("Britney Spears-2", 180), playlist);
        addSong(Song.createSong("Britney Spears-3", 180), playlist);
        addSong(Song.createSong("Smash Mouth-4", 180), playlist);
        addSong(Song.createSong("Smash Mouth-1", 180), playlist);
        addSong(Song.createSong("Smash Mouth-9", 180), playlist);
        addSong(Song.createSong("Britney Spears-5", 180), playlist);
        addSong(Song.createSong("Britney Spears-15", 180), playlist);
        addSong(Song.createSong("Britney Spears-51", 180), playlist);

        playlist.printPlaylist();

        playlist.play();
    }

    public static void addSong(Song song, Playlist playlist) {
        playlist.addSongToPlaylist(song);
    }

}
