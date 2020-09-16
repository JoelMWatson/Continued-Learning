import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {

    // . = any character
    // ^ = starts with
    // $ = ends with
    // [...] = match any of the set of chars between brackets
    // [^...] = match all that don't match any of the set of chars between brackets
    // (?i) = ignore case
    // (?iu) = ignore case for unicode
    // \\d = match all [0-9]
    // \\D = match all non [0-9]
    // \\s = match white space
    // \\S = match all non white space
    // \\w = match all alphanumeric chars
    // \\W = matches all non alphanumeric chars
    // \\b = matches word bounds (adds a space before and after each word)
    // e{3} = matches 3 e's in a row (or whatever precedes the "{" )
    // e+ = matches 1 or more e's
    // e* = matches 0 or more e's
    // (?e) = lookahead looking for e

    public static void main(String[] args) {
//        String string = "I am a string. Yes I am.";
//        System.out.println(string);
//        System.out.println(string.replaceAll("I", "you"));
//
//        String alpha = "abcdefffF12HHGOIJ99";
//        System.out.println(alpha);
//        System.out.println(alpha.replaceAll(".", "Y"));
//        System.out.println(alpha.replaceAll("^abcde", "Y"));
//        System.out.println(alpha.replaceAll("^IJ99", "Y"));
//
//        System.out.println(alpha.matches("^hello")); // false
//        System.out.println(alpha.matches("^abcde")); // false // matches needs to match the whole word
//        System.out.println(alpha.matches("^abcdefffF12HHGOIJ99")); // true
//
//        System.out.println(alpha.replaceAll("IJ99$", " THE END"));
//
//        System.out.println(alpha.replaceAll("[fHa]", "X"));
//        System.out.println(alpha.replaceAll("[fHa][FG]", "X")); // only replace if followed by F or G
//
//        System.out.println("Harry".replaceAll("[Hh]arry", "Harry")); // Capitalizes first letter

//        String alpha2 = "asppveeecaiieaei1313DFpj$%53dj";
//        System.out.println(alpha2);
////        System.out.println(alpha2.replaceAll("[^ipj]", "X"));
////        System.out.println(alpha2.replaceAll("[abcdef0123]", "X"));
////        System.out.println(alpha2.replaceAll("[a-f0-3]", "X"));
////        System.out.println(alpha2.replaceAll("(?i)[a-f0-3]", "X"));
////
////        System.out.println(alpha2.replaceAll("\\w", "X"));
////        System.out.println(alpha2.replaceAll("\\W", "X"));
//
//        System.out.println(alpha2.replaceAll("^asppve{3}", "X"));
//        System.out.println(alpha2.replaceAll("^asppve+", "X"));
//        System.out.println(alpha2.replaceAll("^asppve*", "X"));

//        StringBuilder htmlText = new StringBuilder("<h1>My Heading</h1>");
//        htmlText.append("<h2>Sub Heading</h2>");
//        htmlText.append("<p>This is a paragraph</p>");
//        htmlText.append("<p>This is another paragraph</p>");
//        htmlText.append("<h2>Summary</h2>");
//        htmlText.append("<p>Summary of something</p>");
//
//
//        String h2Pattern = "<h2>"; // creates string
//        Pattern pattern = Pattern.compile(h2Pattern); // creates pattern looking for above string
//        Matcher matcher = pattern.matcher(htmlText); // creates matcher looking in htmlText for pattern
//        System.out.println(matcher.matches()); // Runs the matcher and finds if there are any matches (like .matches needs to match the whole string)
//
//        matcher.reset(); // matcher can only be used once
//        int count = 0;
//        while (matcher.find()) {
//            count++;
//            System.out.println("Occurances " + count + ": " + matcher.start() + " to " + matcher.end());
//        }
//
//        String h2Group = "(<h2>.*?</h2>)"; // using groups
//        Pattern groupPattern = Pattern.compile(h2Group);
//        Matcher groupMatcher = groupPattern.matcher(htmlText);
//        System.out.println(groupMatcher.matches());
//        groupMatcher.reset();
//        while(groupMatcher.find()) {
//            System.out.println("Occurances " + groupMatcher.group(1));
//        }
//
//        String h2TextGroup = "(<h2>)(.+?)(</h2>)";
//        Pattern pattern1 = Pattern.compile(h2TextGroup);
//        Matcher matcher1 = pattern1.matcher(htmlText);
//
//        while(matcher1.find()) {
//            System.out.println("Occurances " + matcher1.group(2));
//        }

        String tvTest = "tstvtkt";
        String tNotV = "t(?!v)";
        Pattern tNotVPat = Pattern.compile(tNotV);
        Matcher tNotVMat = tNotVPat.matcher(tvTest);

        int count = 0;
        while(tNotVMat.find()) {
            count++;
            System.out.println("Occurances " + count + ": " + tNotVMat.start() + " to " + tNotVMat.end());
        }

        // t(?=v) positive lookahead
    }
}
