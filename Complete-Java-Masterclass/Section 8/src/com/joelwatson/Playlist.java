package com.joelwatson;

import java.util.*;

public class Playlist {

    private String title;
    private ArrayList<Album> library;
    private LinkedList<Song> songs;

    public Playlist() {
        this("Untitled", new ArrayList<Album>(), new LinkedList<Song>());
    }

    public Playlist(String title, ArrayList<Album> library) {
        this(title, library, new LinkedList<Song>());

    }

    public Playlist(String title, ArrayList<Album> library, LinkedList<Song> songs) {
        this.title = title;
        this.library = library;
        this.songs = songs;
    }

    private boolean findSongInLibrary(Song song) {
        Iterator<Album> iterator = this.library.iterator();
        while(iterator.hasNext()) {
            boolean comparison = iterator.next().findSongOnAlbum(song);
            if (comparison) {
                System.out.println("Song " + song.getTitle() + " was found in your album library.");
                return true;
            }
        }
        System.out.println(song.getTitle() + " could not be found in your album library");
        return false;
    }

    public boolean addSongToPlaylist(Song song) {
        boolean songOwned = findSongInLibrary(song);
        if (songOwned) {
            this.songs.add(song);
            System.out.println(song.getTitle() + " was added to the playlist");
            return true;
        }
        System.out.println(song.getTitle() + " was not added to the playlist");
        return false;
    }

    public void printPlaylist() {
        Iterator<Song> iterator = this.songs.iterator();
        while(iterator.hasNext()) {
            System.out.println(iterator.next().getTitle());
        }
    }

    public void printMenu() {
        System.out.println("Available Actions: \nPress ");
        System.out.println("0 - reprint the instructions\n" +
                "1 - print the playlist\n" +
                "2 - skip forward to next song\n" +
                "3 - skip backward to previous song\n" +
                "4 - replay the current song\n" +
                "5 - remove current song\n" +
                "6 - quit");
    }

    public void play() {
        ListIterator<Song> listIterator = this.songs.listIterator();
        Scanner scanner = new Scanner(System.in);
        boolean quit = false;
        boolean forward = true;
        int choice = 0;

        System.out.println("Now Playing: " + listIterator.next().getTitle());

        this.printMenu();
        while (!quit) {
            choice = scanner.nextInt();
            scanner.nextLine();
            switch (choice) {
                case 0:
                    this.printMenu();
                    break;

                case 1:
                    this.printPlaylist();
                    break;

                case 2:
                    // skip forward
                    if (listIterator.hasNext()) {
                        if (!forward) {
                            listIterator.next();
                            forward = true;
                        }
                        System.out.println("Now playing: " + listIterator.next().getTitle());
                    } else {
                        System.out.println("You have reached the end of the playlist");
                    }
                    break;

                case 3:
                    //skip backward
                    if (listIterator.hasPrevious()) {
                        if (forward) {
                            listIterator.previous();
                            forward = false;
                        }
                        System.out.println("Now playing: " + listIterator.previous().getTitle());
                    } else {
                        System.out.println("You have reached the end of the playlist");
                    }
                    break;

                case 4:
                    //repeat song
                    if (listIterator.hasPrevious()) {
                        System.out.println("Replaying current song: " + listIterator.previous().getTitle());
                    }
                    break;

                case 5:
                    //remove song
                    listIterator.remove();
                    if (listIterator.hasNext()) {
                        listIterator.next();
                    } else if (listIterator.hasPrevious()) {
                        listIterator.previous();
                    }
                    break;

                case 6:
                    quit = true;
                    System.out.println("Ending the program");
                    break;
            }
        }
    }

}
