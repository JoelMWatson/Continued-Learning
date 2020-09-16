package com.joelwatson;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.*;
import java.util.List;
import java.util.Map;

public class Main {

    // Anatomy of an absolute URI
    // scheme:[//[user[:password]@]host[:port]][/path][?query][#fragment]

    public static void main(String[] args) {
        try {
            // Directly create URL
            URL url = new URL("https://www.flickr.com/services/feeds/photos_public.gne?tags=dogs");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("User-Agent", "Chrome");

            connection.setReadTimeout(15000);
            int responseCode = connection.getResponseCode();
            System.out.println("Code: " + responseCode);

            if(responseCode != 200) {
                System.out.println("Error reading webpage");
                System.out.println(connection.getResponseMessage());
                return;
            }

            BufferedReader input = new BufferedReader(new InputStreamReader(connection.getInputStream()));

            String line = "";
            while((line = input.readLine()) != null) {
                System.out.println(line);
            }
            input.close();

//            urlConnection.setDoOutput(true);
//            urlConnection.connect();
//
////            BufferedReader input = new BufferedReader(new InputStreamReader(url.openStream()));
//
//            Map<String, List<String>> headerFields = urlConnection.getHeaderFields();
//            for (Map.Entry<String, List<String>> entry : headerFields.entrySet()) {
//                String key = entry.getKey();
//                List<String> value = entry.getValue();
//                System.out.println("Key: " + key);
//                for (String string : value) {
//                    System.out.println("Value: " + value);
//                }
//            }


//            // Absolute URI
//            URI uri = new URI("http://username:password@myserver.com:5000/catalogue/phones?os=android#samsung");
//            //  Convert Absolute URI to URL
//            URL url = uri.toURL();
//
//            // Base URI
//            URI baseUri = new URI("http://username:password@myserver.com:5000");
//
//            // Relative URI
//            URI uri1 = new URI("/catalogue/phones?os=android#samsung");
//            URI uri2 = new URI("/catalogue/phones?os=android#iphone");
//            URI uri3 = new URI("/catalogue/phones?os=android#cow");
//
//            // Resolve base URI + relative URI
//            URI resolvedUri1 = baseUri.resolve(uri1);
//            URI resolvedUri2 = baseUri.resolve(uri2);
//            URI resolvedUri3 = baseUri.resolve(uri3);
//
//            // Convert resolvedUri URI to URL
//            URL resolvedUrl1 = resolvedUri1.toURL();
//            URL resolvedUrl2 = resolvedUri2.toURL();
//            URL resolvedUrl3 = resolvedUri3.toURL();
//
//            System.out.println("URL1: " + resolvedUrl1);
//            System.out.println("URL2: " + resolvedUrl2);
//            System.out.println("URL3: " + resolvedUrl3);
//
//            // Converts back to relative URIs
//            URI relativeized1 = baseUri.relativize(resolvedUri1);
//            URI relativeized2 = baseUri.relativize(resolvedUri2);
//            URI relativeized3 = baseUri.relativize(resolvedUri3);
//
//            System.out.println("Scheme: " + uri.getScheme());
//            System.out.println("Scheme-Specific part: " + uri.getSchemeSpecificPart());
//            System.out.println("Authority: " + uri.getAuthority());
//            System.out.println("User info: " + uri.getUserInfo());
//            System.out.println("Host: " + uri.getHost());
//            System.out.println("Port: " + uri.getPort());
//            System.out.println("Path: " + uri.getPath());
//            System.out.println("Query: " + uri.getQuery());
//            System.out.println("Fragment: " + uri.getFragment());

//        } catch (URISyntaxException | MalformedURLException e) {
//            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
