package com.joelwatson;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.attribute.BasicFileAttributes;

public class Main {

    public static void main(String[] args) {
        try {
            Path filePath = FileSystems.getDefault().getPath("Examples", "Dir1/file1.txt");
            long size = Files.size(filePath);
            System.out.println("Size: " + size);
            System.out.println("Last modified: " + Files.getLastModifiedTime(filePath));

            BasicFileAttributes attrs = Files.readAttributes(filePath, BasicFileAttributes.class);
            System.out.println("Size: " + attrs.size());
            System.out.println("Modified: " + attrs.lastModifiedTime());
            System.out.println("Created: " + attrs.creationTime());
            System.out.println("Is directory: " + attrs.isDirectory());
            System.out.println("Is regular file: " + attrs.isRegularFile());

//            Path dirsToCreate = FileSystems.getDefault().getPath("Examples", "Dir2/Dir3/Dir4/Dir5/Dir6");
//            Files.createDirectories(dirsToCreate);

//            Path fileToCreate = FileSystems.getDefault().getPath("Examples", "file2.txt");
//            Files.createFile(fileToCreate);
//
//            Path dirToCreate = FileSystems.getDefault().getPath("Examples", "Dir4");
//            Files.createDirectory(dirToCreate);
//
//            Path fileToDelete = FileSystems.getDefault().getPath("Examples", "Dir1", "file1copy.txt");
//            Files.deleteIfExists(fileToDelete); // This avoids the error that .delete throws

//            Path fileToMove = FileSystems.getDefault().getPath("Examples", "copyFile1.txt");
//            Path destination = FileSystems.getDefault().getPath("Examples", "file1.txt");
//            Files.move(fileToMove, destination); // used to move or rename

//            Path sourceFile = FileSystems.getDefault().getPath("Examples", "file1.txt");
//            Path copyFile = FileSystems.getDefault().getPath("Examples", "copyFile1.txt");
//            Files.copy(sourceFile, copyFile, StandardCopyOption.REPLACE_EXISTING);
//
//            sourceFile = FileSystems.getDefault().getPath("Examples", "Dir1");
//            copyFile = FileSystems.getDefault().getPath("Examples", "Dir4");
//            Files.copy(sourceFile, copyFile, StandardCopyOption.REPLACE_EXISTING); // Copies directory but not inner files

        } catch (IOException e) {
            System.out.println("error: " + e.getMessage());
        }



//        Path path = FileSystems.getDefault().getPath("WorkingDirectoryFile.txt");
//        printFile(path);
//
//        System.out.println();
//
//        Path filePath = Paths.get(".", "files", "SubdirectoryFile.txt");
////        Path filePath = FileSystems.getDefault().getPath("files", "SubdirectoryFile.txt");
//        printFile(filePath);
//
//        System.out.println();
//
//        filePath = Paths.get("C:/Users/Joel/Projects/udemy/Complete-Java-Masterclass/OutThere.txt");
//        printFile(filePath);
//
//        System.out.println();
//
//        filePath = Paths.get(".");
//        System.out.println(filePath.toAbsolutePath().normalize()); // remove trailing . with normalize
//
//        Path path3 = FileSystems.getDefault().getPath("files", "doesnt-exist.txt");
//        System.out.println(path3.toAbsolutePath()); // Doesnt throw error even though the file doesn't exist
//
//        Path path4 = Paths.get("C:/Ham/Bacon/Eggs");
//        System.out.println(path4.toAbsolutePath()); // Doesnt throw error even though the directories dont exist
//
//        filePath = FileSystems.getDefault().getPath("files");
//        System.out.println("Exists = " + Files.exists(filePath)); // true
//        System.out.println("Exists = " + Files.exists(path4)); // false
    }

    // Reads contents of file and outputs on screen
//    private static void printFile(Path path) {
//        try (BufferedReader fileReader = Files.newBufferedReader(path)) {
//            String line;
//            while((line = fileReader.readLine()) != null) {
//                System.out.println(line);
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

}
