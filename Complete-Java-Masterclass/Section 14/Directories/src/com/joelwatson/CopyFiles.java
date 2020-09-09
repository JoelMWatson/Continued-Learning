package com.joelwatson;

import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;

public class CopyFiles extends SimpleFileVisitor<Path> {
    private Path sourceRoot;
    private Path targetRoot;

    public CopyFiles(Path sourceRoot, Path targetRoot) {
        this.sourceRoot = sourceRoot;
        this.targetRoot = targetRoot;
    }

    @Override
    public FileVisitResult visitFileFailed(Path file, IOException exc) throws IOException {
        System.out.println("Error accessing file " + file.toAbsolutePath() + " " + exc.getMessage());
        return FileVisitResult.CONTINUE;
    }

    @Override
    public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
        Path relPath = sourceRoot.relativize(dir);
        System.out.println("RelPath: " + relPath);
        Path copyDir = targetRoot.resolve(relPath);
        System.out.println("Resolved copy path: " + copyDir);

        try {
            Files.copy(dir, copyDir);
        } catch (IOException e) {
            System.out.println(e.getMessage());
            return FileVisitResult.SKIP_SUBTREE;
        }
        return FileVisitResult.CONTINUE;
    }

    @Override
    public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
        Path relPath = sourceRoot.relativize(file);
        System.out.println("RelPath: " + relPath);
        Path copyDir = targetRoot.resolve(relPath);
        System.out.println("Resolved copy path: " + copyDir);

        try {
            Files.copy(file, copyDir);
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        return FileVisitResult.CONTINUE;
    }
}
