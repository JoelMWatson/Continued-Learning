package nestedClasses;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 * Created by dev on 18/09/15.
 */
public class Album {
    private String name;
    private String artist;
    private SongList songs;

    public Album(String name, String artist) {
        this.name = name;
        this.artist = artist;
        this.songs = new SongList();
    }

    private Song findSong(String title) {
        return this.songs.findSongInSongList(title);
    }

    public boolean addSong(String title, double duration) {
        return this.songs.addSongToSongList(title, duration);
    }

    public boolean addToPlayList(int trackNumber, LinkedList<Song> playList) {
        int index = trackNumber - 1;
        if ((index > 0) && (index <= this.songs.size())) {
            playList.add(this.songs.get(index));
            return true;
        }
        System.out.println("This album does not have a track " + trackNumber);
        return false;
    }

    public boolean addToPlayList(String title, LinkedList<Song> playList) {
        Song checkedSong = findSong(title);
        if (checkedSong != null) {
            playList.add(checkedSong);
            return true;
        }
        System.out.println("The song " + title + " is not in this album");
        return false;
    }

    private class SongList {

        private ArrayList<Song> songList;

        public SongList() {
            this(new ArrayList<Song>());
        }

        public SongList(ArrayList<Song> songList) {
            this.songList = songList;
        }

        public ArrayList<Song> getSongList() {
            return songList;
        }

        private Song findSongInSongList(String title) {
            for (Song checkedSong : this.songList) {
                if (checkedSong.getTitle().equals(title)) {
                    return checkedSong;
                }
            }
            return null;
        }

        public boolean addSongToSongList(String title, double duration) {
            if (findSongInSongList(title) == null) {
                this.songList.add(new Song(title, duration));
                return true;
            }
            return false;
        }


        public int size() {
            return this.songList.size();
        }

        public Song get(int index) {
            if (index >= size() || index < 0) {
                return null;
            }
            return this.songList.get(index);
        }
    }
}