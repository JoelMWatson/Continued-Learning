package com.joelwatson;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;

public class Main {
    public static void main(String[] args) {

        // Lambda Expression
//        DirectoryStream.Filter<Path> filter = p -> Files.isRegularFile(p);

        DirectoryStream.Filter<Path> filter = new DirectoryStream.Filter<>() {
            @Override
            public boolean accept(Path path) throws IOException {
                return (Files.isRegularFile(path));
            }
        };

        Path directory = FileSystems.getDefault().getPath("Examples" + File.separator + "Dir2"); // supports all OS
//        try (DirectoryStream<Path> contents = Files.newDirectoryStream(directory, "*.txt")) {
        try (DirectoryStream<Path> contents = Files.newDirectoryStream(directory, filter)) {
            for (Path file : contents) {
                System.out.println(file.getFileName());
            }
        } catch (IOException | DirectoryIteratorException e) {
            e.printStackTrace();
        }

        // Get file separator
        String separator = File.separator;
        System.out.println(separator);
        separator = FileSystems.getDefault().getSeparator();
        System.out.println(separator);

        // Temp Files
        try {
            Path tempFile = Files.createTempFile("myapp", ".appext");
            System.out.println("Temp file path " + tempFile.toAbsolutePath());
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }

        // Volume name and drive letter
        Iterable<FileStore> stores = FileSystems.getDefault().getFileStores();
        for (FileStore store : stores) {
            System.out.println(store);
            System.out.println(store.name());
        }

        // Drive letters
        Iterable<Path> rootPaths = FileSystems.getDefault().getRootDirectories();
        for (Path path : rootPaths) {
            System.out.println(path);
        }

        // Walking File Tree
        System.out.println("Walking dir2 tree");
        Path dir2Path = FileSystems.getDefault().getPath("Examples", "Dir2");
        try {
            Files.walkFileTree(dir2Path, new PrintNames());
        }catch (IOException e) {
            System.out.println(e.getMessage());
        }

        // Copy Dir/2 to Dir4/Dir2Copy
        Path copyPath = FileSystems.getDefault().getPath("Examples" + File.separator + "Dir4" + File.separator + "Dir2Copy");

        try {
            Files.walkFileTree(dir2Path, new CopyFiles(dir2Path, copyPath));
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }


        File file = new File("/FileTree/file.txt"); // doesn't need to exist until we try to access it
        Path convertedPath = file.toPath();
        System.out.println("ConvertedPath " + convertedPath);

        File parent = new File("/FileTree");
        File resolvedFile = new File(parent, "dir/file.txt");
        System.out.println(resolvedFile.toPath());

        File cwd = new File("").getAbsoluteFile();

        System.out.println("Print Dir2 list() method"); // Could use listFiles() to get array of files
        File dir2File = new File(cwd, "examples/Dir2");
        String[] dir2Content = dir2File.list();
        for (String fileName : dir2Content) {
            System.out.println(fileName);
        }
    }
}
