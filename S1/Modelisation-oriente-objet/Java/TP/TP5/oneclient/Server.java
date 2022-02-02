package oneclient;

import java.io.*;
import java.net.*;
import java.util.*;


/**
 * @author Jonas
 */
public class Server {


    public static void main(String args[]) throws IOException {

        HashMap<String, String> jokes = new HashMap<>();
        jokes.put("Water", "Water you asking so many questions for, just open up!");
        jokes.put("Candice.", "Candice joke get any worse?");
        jokes.put("Orange ", "Orange you going to let me in?");
        jokes.put("An interrupting cow ", "MOO!");
        jokes.put("Theodore ", "Theodore wasn’t opened so I knocked.");
        jokes.put("Alpaca ", "Alpaca the trunk, you pack the suitcase");
        jokes.put("Needle ", "Needle little help opening the door!");
        jokes.put("Dozen", "Dozen anyone want to let me in?");
        jokes.put("Alec ", "Alectricity. BUZZ!");
        jokes.put("Olive ", "Olive you sooooo much!");

        ArrayList<String> jokeList = new ArrayList<String>(jokes.keySet());
        int l = jokeList.size();
        System.out.println();
        int port = 1000;
        ServerSocket sersoc = new ServerSocket(port);
        System.out.println("Server listening on port " + port);
        while (true) {
            System.out.println("Waiting for a connection");
            Socket soc = sersoc.accept();
            InputStream fluxIn = soc.getInputStream();
            BufferedReader entree = new BufferedReader(new InputStreamReader(fluxIn));
            OutputStream fluxOut = soc.getOutputStream();
            BufferedWriter sortie = new BufferedWriter(new OutputStreamWriter(fluxOut));
            boolean clientHere = true;
            while (clientHere) {

                switch (entree.readLine()) {
                    case "tell" -> {
                        System.out.println("Client  : Tell");
                        System.out.println("Server :  Knock-Knock");
                        sortie.write("Knock-Knock\n");
                        sortie.flush();
                        String reponse = entree.readLine();
                        System.out.println( "Client : "+ reponse);
                        int v = (int) (Math.random() * l);
                        sortie.write(jokeList.get(v) + "\n");
                        sortie.flush();
                        System.out.println("Server : " + jokeList.get(v));
                        reponse = entree.readLine();
                        System.out.println("Client : " + reponse );
                        sortie.write(jokes.get(jokeList.get(v)) + "\n");
                        sortie.flush();
                        System.out.println("Client : " + jokes.get(jokeList.get(v)));
                    }
                    case "quit" -> {
                        System.out.println("Bye...");
                        sortie.flush();
                        clientHere = false;
                    }
                }
            }
            soc.close();
        }
    }
}
