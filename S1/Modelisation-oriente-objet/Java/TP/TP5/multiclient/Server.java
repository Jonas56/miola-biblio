package multiclient;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * @author Jonas
 */
public class Server {



    public static void main(String[] args) throws  IOException {
        HashMap<String, String> jokes =new HashMap<>();
        // Jokes
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



        // Client number
        int numClient = 0;

        int port = 1000; // port number
            ServerSocket sersoc = new ServerSocket(port);
            System.out.println("Server Listening on port 1000");
            while (true) {
                Socket soc = sersoc.accept();
                numClient++;
                KnockKnock cl = new KnockKnock(soc, numClient, jokes);
                cl.start();
            }

    }

}
