package com.joelwatson;

import com.joelwatson.model.Artist;
import com.joelwatson.model.Datasource;
import com.joelwatson.model.SongArtist;

import java.util.List;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Datasource datasource = new Datasource();
        if (!datasource.open()) {
            System.out.println("Can't open Datasource");
            return;
        }

        List<Artist> artists = datasource.queryArtists(3);
        if (artists == null) {
            System.out.println("No artists");
            return;
        }

        for (Artist artist : artists) {
            System.out.println("ID: " + artist.getId() + " | Name: " + artist.getName());
        }

        List<String> albumsForArtist = datasource.queryAlbumsForArtist("Carole King", 3);

        for (String album : albumsForArtist) {
            System.out.println(album);
        }

        List<SongArtist> songArtists = datasource.queryArtistsForSong("Go Your Own Way", 3);
        if (songArtists.isEmpty()) {
            System.out.println("No matches for song");
            return;
        }

        for (SongArtist songArtist : songArtists) {
            System.out.println("Name: " + songArtist.getArtistName() + " Album: " + songArtist.getAlbumName() + " Track: " + songArtist.getTrack());
        }

        datasource.querySongMetadata();

        System.out.println("SONGS: " + datasource.getCount(Datasource.TABLE_SONGS));

        datasource.createViewForSongArtists();

        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a song title: ");
        String title = scanner.nextLine();

        songArtists = datasource.querySongInfoView(title);
        if (songArtists.isEmpty()){
            System.out.println("Couldn't find artists for song");
            return;
        }

        for (SongArtist songArtist : songArtists) {
            System.out.printf("Artist: %s | Album: | %s Track: %d\n", songArtist.getArtistName(),
                    songArtist.getAlbumName(), songArtist.getTrack());
        }

        datasource.insertSong("Touch of Grey", "Greatful Dead", "In the Dark", 1);

        datasource.close();
    }
}
