package multiclient;

import java.io.*;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * @author Jonas
 */
public class KnockKnock extends Thread {

    HashMap<String, String> jokes;

    Socket soc;
    int numClient;


    public KnockKnock(Socket soc,int numClient,HashMap<String,String> jokes){
        this.soc = soc;
        this.numClient = numClient;
        this.jokes = jokes;
    }

    @Override
    public void run() {
        System.out.println("Client : " + numClient + "succesfully connected");
        // Jokes list
        ArrayList<String> jokeList = new ArrayList<String>(jokes.keySet());
        int l = jokeList.size();
        try {
            // creation d'un flux E/S
            InputStream fluxIn = soc.getInputStream();
            BufferedReader entree = new BufferedReader(new InputStreamReader(fluxIn));
            OutputStream fluxOut = soc.getOutputStream();
            BufferedWriter sortie = new BufferedWriter(new OutputStreamWriter(fluxOut));
            boolean clientHere = true;
            // Traitement
            while (clientHere) {
                switch (entree.readLine()) {
                    case "tell" -> {
                        System.out.println("Client " + numClient + "  : Tell");
                        System.out.println("Server :  Knock-Knock");
                        sortie.write("Knock-Knock\n");
                        sortie.flush();
                        String reponse = entree.readLine();
                        System.out.println( "Client " + numClient + " : "+ reponse);
                        int v = (int) (Math.random() * l);
                        sortie.write(jokeList.get(v) + "\n");
                        sortie.flush();
                        System.out.println("Server : " + jokeList.get(v));
                        reponse = entree.readLine();
                        System.out.println("Client " + numClient + " : " + reponse );
                        sortie.write(jokes.get(jokeList.get(v)) + "\n");
                        sortie.flush();
                        System.out.println("Client " + numClient + " : " + jokes.get(jokeList.get(v)));
                    }
                    case "quit" -> {
                        System.out.println("Bye...");
                        sortie.flush();
                        clientHere = false;
                    }
                }
            }
        }catch (IOException ex){
        }

    }
}
