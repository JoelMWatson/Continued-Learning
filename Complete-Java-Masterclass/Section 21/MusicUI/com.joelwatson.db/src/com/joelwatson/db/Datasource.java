package com.joelwatson.db;

import com.joelwatson.common.Album;
import com.joelwatson.common.Artist;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Datasource {

    public static final String DB_NAME = "music.db";
    public static final String CON_STR = "jdbc:sqlite:C:\\Users\\Joel\\Projects\\udemy\\Complete-Java-Masterclass\\Section 19\\MusicUI\\" + DB_NAME;

    public static final String TABLE_ALBUMS = "albums";
    public static final String COL_ALBUM_ID = "_id";
    public static final String COL_ALBUM_NAME = "name";
    public static final String COL_ALBUM_ARTIST = "artist";
    public static final int INDEX_ALBUM_ID = 1;
    public static final int INDEX_ALBUM_NAME = 2;
    public static final int INDEX_ALBUM_ARTIST = 3;


    public static final String TABLE_ARTISTS = "artists";
    public static final String COL_ARTIST_ID = "_id";
    public static final String COL_ARTIST_NAME = "name";
    public static final int INDEX_ARTIST_ID = 1;
    public static final int INDEX_ARTIST_NAME = 2;

    public static final String TABLE_SONGS = "songs";
    public static final String COL_SONG_ID = "_id";
    public static final String COL_SONG_TRACK = "track";
    public static final String COL_SONG_TITLE = "title";
    public static final String COL_SONG_ALBUM = "album";
    public static final int INDEX_SONG_ID = 1;
    public static final int INDEX_SONG_TRACK = 2;
    public static final int INDEX_SONG_TITLE = 3;
    public static final int INDEX_SONG_ALBUM = 4;

    public static final int ORDER_BY_NONE = 1;
    public static final int ORDER_BY_ASC = 2;
    public static final int ORDER_BY_DESC = 3;

    public static final String QUERY_ALBUMS_BY_ARTIST_START =
            "SELECT " + TABLE_ALBUMS + "." + COL_ALBUM_NAME + " FROM " + TABLE_ALBUMS + " INNER JOIN " + TABLE_ARTISTS +
                    " ON " + TABLE_ALBUMS + "." + COL_ALBUM_ARTIST + " = " + TABLE_ARTISTS + "." + COL_ARTIST_ID +
                    " WHERE " + TABLE_ARTISTS + "." + COL_ARTIST_NAME + " = \"";

    public static final String QUERY_ALBUMS_BY_ARTIST_SORT =
            " ORDER BY " + TABLE_ALBUMS + "." + COL_ALBUM_NAME + " COLLATE NOCASE ";

    public static final String QUERY_ARTIST_FOR_SONG_START =
            "SELECT " + TABLE_ARTISTS + "." + COL_ARTIST_NAME + ", " + TABLE_ALBUMS + "." + COL_ALBUM_NAME + ", " +
                    TABLE_SONGS + "." + COL_SONG_TRACK + " FROM " + TABLE_SONGS + " INNER JOIN " + TABLE_ALBUMS +
                    " ON " + TABLE_SONGS + "." + COL_SONG_ALBUM + " = " + TABLE_ALBUMS + "." + COL_ALBUM_ID +
                    " INNER JOIN " + TABLE_ARTISTS + " ON " + TABLE_ALBUMS + "." + COL_ALBUM_ARTIST + " = " +
                    TABLE_ARTISTS + "." + COL_ARTIST_ID + " WHERE " + TABLE_SONGS + "." + COL_SONG_TITLE + " = \"";

    public static final String QUERY_ARTIST_FOR_SONG_SORT =
            " ORDER BY " + TABLE_ARTISTS + "." + COL_ARTIST_NAME + ", " +
                    TABLE_ALBUMS + "." + COL_ALBUM_NAME + " COLLATE NOCASE ";

    public static final String TABLE_ARTIST_SONG_VIEW = "artist_list";

    public static final String CREATE_ARTIST_FOR_SONG_VIEW = "CREATE VIEW IF NOT EXISTS " + TABLE_ARTIST_SONG_VIEW +
            " AS SELECT " + TABLE_ARTISTS + "." + COL_ARTIST_NAME + ", " + TABLE_ALBUMS + "." + COL_ALBUM_NAME +
            " as album, " + TABLE_SONGS + "." + COL_SONG_TRACK + ", " + TABLE_SONGS + "." + COL_SONG_TITLE + " FROM " +
            TABLE_SONGS + " INNER JOIN " + TABLE_ALBUMS + " ON " + TABLE_SONGS + "." + COL_SONG_ALBUM + " = " +
            TABLE_ALBUMS + "." + COL_ALBUM_ID + " INNER JOIN " + TABLE_ARTISTS + " ON " + TABLE_ALBUMS + "." +
            COL_ALBUM_ARTIST + " = " + TABLE_ARTISTS + "." + COL_ARTIST_ID + " ORDER BY " + TABLE_ARTISTS + "." +
            COL_ARTIST_NAME + ", " + TABLE_ALBUMS + "." + COL_ALBUM_NAME + ", " + TABLE_SONGS + "." + COL_SONG_TRACK;

    // Unprotected
    public static final String QUERY_VIEW_SONG_INFO =
            "SELECT " + COL_ARTIST_NAME + ", " + COL_SONG_ALBUM + ", " + COL_SONG_TRACK + " FROM " +
                    TABLE_ARTIST_SONG_VIEW + " WHERE " + COL_SONG_TITLE + " = \"";

    // Protected (Uses prepared statement)
    public static final String QUERY_VIEW_SONG_INFO_PREP =
            "SELECT " + COL_ARTIST_NAME + ", " + COL_SONG_ALBUM + ", " + COL_SONG_TRACK + " FROM " +
                    TABLE_ARTIST_SONG_VIEW + " WHERE " + COL_SONG_TITLE + " = ?";

    public static final String INSERT_ARTIST =
            "INSERT INTO " + TABLE_ARTISTS + " (" + COL_ARTIST_NAME + ") VALUES(?)";

    public static final String INSERT_ALBUM =
            "INSERT INTO " + TABLE_ALBUMS + " (" + COL_ALBUM_NAME + ", " + COL_ALBUM_ARTIST + ") VALUES(?, ?)";

    public static final String INSERT_SONG =
            "INSERT INTO " + TABLE_SONGS + " (" + COL_SONG_TRACK + ", " + COL_SONG_TITLE + ", " + COL_SONG_ALBUM +
                    ") VALUES(?, ?, ?)";

    public static final String QUERY_ARTIST = "SELECT " + COL_ARTIST_ID + " FROM " + TABLE_ARTISTS + " WHERE " +
            COL_ARTIST_NAME + " = ?";

    public static final String QUERY_ALBUM = "SELECT " + COL_ALBUM_ID + " FROM " + TABLE_ALBUMS + " WHERE " +
            COL_ALBUM_NAME + " = ?";

    public static final String QUERY_ITEMS_BY_ARTIST_ID = "SELECT * FROM " + TABLE_ALBUMS + " WHERE " +
            COL_ALBUM_ARTIST + " = ? ORDER BY " + COL_ALBUM_NAME + " COLLATE NOCASE ";

    public static final String UPDATE_ARTIST_NAME = "UPDATE " + TABLE_ARTISTS + " SET " +
            COL_ARTIST_NAME + " = ? WHERE " + COL_ARTIST_ID + " = ?";

    private Connection conn;

    private PreparedStatement querySongInfoView;
    private PreparedStatement insertIntoArtists;
    private PreparedStatement insertIntoAlbums;
    private PreparedStatement insertIntoSongs;
    private PreparedStatement queryArtist;
    private PreparedStatement queryAlbum;
    private PreparedStatement queryAlbumsByArtistId;
    private PreparedStatement updateArtistName;

    private static Datasource instance = new Datasource();

    private Datasource() {
        // Something
    }

    // Singleton Instance
    public static Datasource getInstance() {
        return instance;
    }

    public boolean open() {
        try {
            conn = DriverManager.getConnection(CON_STR);
            querySongInfoView = conn.prepareStatement(QUERY_VIEW_SONG_INFO_PREP);
            insertIntoArtists = conn.prepareStatement(INSERT_ARTIST, Statement.RETURN_GENERATED_KEYS);
            insertIntoAlbums = conn.prepareStatement(INSERT_ALBUM, Statement.RETURN_GENERATED_KEYS);
            insertIntoSongs = conn.prepareStatement(INSERT_SONG);
            queryArtist = conn.prepareStatement(QUERY_ARTIST);
            queryAlbum = conn.prepareStatement(QUERY_ALBUM);
            queryAlbumsByArtistId = conn.prepareStatement(QUERY_ITEMS_BY_ARTIST_ID);
            updateArtistName = conn.prepareStatement(UPDATE_ARTIST_NAME);
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public void close() {
        try {
            if (querySongInfoView != null) {
                querySongInfoView.close();
            }
            if (insertIntoArtists != null) {
                insertIntoArtists.close();
            }
            if (insertIntoAlbums != null) {
                insertIntoAlbums.close();
            }
            if (insertIntoSongs != null) {
                insertIntoSongs.close();
            }
            if (queryArtist != null) {
                queryArtist.close();
            }
            if (queryAlbum != null) {
                queryAlbum.close();
            }
            if (queryAlbumsByArtistId != null) {
                queryAlbumsByArtistId.close();
            }
            if (updateArtistName != null) {
                updateArtistName.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public List<Artist> queryArtists(int sortOrder) {

        StringBuilder sb = new StringBuilder("SELECT * FROM ");
        sb.append(TABLE_ARTISTS);
        if (sortOrder != ORDER_BY_NONE) {
            sb.append(" ORDER BY ");
            sb.append(COL_ARTIST_NAME);
            sb.append(" COLLATE NOCASE ");
            if (sortOrder == ORDER_BY_DESC) {
                sb.append("DESC");
            } else {
                sb.append("ASC");
            }
        }
        try (Statement statement = conn.createStatement();
             ResultSet results = statement.executeQuery(sb.toString())) {

            List<Artist> artists = new ArrayList<>();
            while (results.next()) {

                // Just to slow it down so you can see progress bar
                try {
                    Thread.sleep(20);
                } catch (InterruptedException e) {
                    System.out.println(e.getMessage());
                }

                Artist artist = new Artist();
                artist.setId(results.getInt(COL_ARTIST_ID));
                artist.setName(results.getString(COL_ARTIST_NAME));
                artists.add(artist);
            }

            return artists;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public List<Album> queryAlbumsForArtistId(int id) {
        try {
            queryAlbumsByArtistId.setInt(1, id);
            ResultSet results = queryAlbumsByArtistId.executeQuery();

            List<Album> albums = new ArrayList<>();
            while(results.next()) {
                Album album = new Album();
                album.setId(results.getInt(1));
                album.setName(results.getString(2));
                album.setArtistId(id);
                albums.add(album);
            }
            return albums;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public List<String> queryAlbumsForArtist(String artistName, int sortOrder) {
        StringBuilder sb = new StringBuilder(QUERY_ALBUMS_BY_ARTIST_START);
        sb.append(artistName);
        sb.append("\"");

        if (sortOrder != ORDER_BY_NONE) {
            sb.append(QUERY_ALBUMS_BY_ARTIST_SORT);
            if (sortOrder == ORDER_BY_DESC) {
                sb.append("DESC");
            } else {
                sb.append("ASC");
            }
        }

        try (Statement statement = conn.createStatement();
             ResultSet results = statement.executeQuery(sb.toString())) {

            List<String> albums = new ArrayList<>();
            while (results.next()) {
                albums.add(results.getString(1));
            }
            return albums;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }


    public void querySongMetadata() {
        String sql = "SELECT * FROM " + TABLE_SONGS;

        try (Statement statement = conn.createStatement();
             ResultSet results = statement.executeQuery(sql)) {
            ResultSetMetaData meta = results.getMetaData();
            int numCols = meta.getColumnCount();
            for (int i = 1; i <= numCols; i++) {
                System.out.printf("Column %d in the songs table is named %s\n", i, meta.getColumnName(i));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public int getCount(String table) {
        String sql = "SELECT COUNT(*) as count FROM " + table;
        try (Statement statement = conn.createStatement();
             ResultSet results = statement.executeQuery(sql)) {
            int count = results.getInt("count");
            return count;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return -1;
        }
    }

    public boolean createViewForSongArtists() {
        try (Statement statement = conn.createStatement()) {
            statement.executeQuery(CREATE_ARTIST_FOR_SONG_VIEW);
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public int insertArtist(String name) throws SQLException {
        queryArtist.setString(1, name);

        ResultSet results = queryArtist.executeQuery();
        if (results.next()) {
            return results.getInt(1);
        } else {
            insertIntoArtists.setString(1, name);
            int affectedRows = insertIntoArtists.executeUpdate();
            if (affectedRows != 1) {
                throw new SQLException("Couldn't insert artist");
            }
            ResultSet generatedKeys = insertIntoArtists.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1);
            } else {
                throw new SQLException("Couldn't find artist _id");
            }
        }
    }

    public int insertAlbum(String name, int artistID) throws SQLException {
        queryAlbum.setString(1, name);

        ResultSet results = queryAlbum.executeQuery();
        if (results.next()) {
            return results.getInt(1);
        } else {
            insertIntoAlbums.setString(1, name);
            insertIntoAlbums.setInt(2, artistID);
            int affectedRows = insertIntoAlbums.executeUpdate();
            if (affectedRows != 1) {
                throw new SQLException("Couldn't insert album");
            }
            ResultSet generatedKeys = insertIntoAlbums.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1);
            } else {
                throw new SQLException("Couldn't find album _id");
            }
        }
    }

    public boolean updateArtistName(int id, String name) {
        try {
            updateArtistName.setString(1, name);
            updateArtistName.setInt(2, id);
            int affectedRecords = updateArtistName.executeUpdate();

            return affectedRecords == 1;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public void insertSong(String title, String artist, String album, int track) {
        try {
            // Start new Transaction
            // 1. Turn off auto commit before making any changes
            conn.setAutoCommit(false);

            int artistID = insertArtist(artist); // update not committed
            int albumID = insertAlbum(album, artistID); // update not committed

            insertIntoSongs.setInt(1, track);
            insertIntoSongs.setString(2, title);
            insertIntoSongs.setInt(3, albumID);
            int affectedRows = insertIntoSongs.executeUpdate(); // update not committed

            if (affectedRows == 1) {
                // 2. Manually Commit updates from above statements
                conn.commit();
            } else {
                throw new SQLException("The song insert failed");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            try {
                System.out.println("Rolling back...");
                conn.rollback();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        } finally {
            try {
                System.out.println("Resetting default commit behavior");

                // 3. Turn autocommit back on after finished
                conn.setAutoCommit(true);
            } catch (SQLException exc) {
                System.out.println(exc.getMessage());
            }
        }
    }

}
