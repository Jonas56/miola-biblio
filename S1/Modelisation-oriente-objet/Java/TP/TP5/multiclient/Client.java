package multiclient;

import java.io.*;
import java.net.Socket;
import java.util.Scanner;

/**
 * @author Jonas
 */
public class Client {
    public static void main(String args[]) throws IOException {

        String hote = "127.0.0.1";
        int port = 1000;
        Socket soc = null;
        try {
            soc = new Socket(hote, port);
            OutputStream flux = soc.getOutputStream(); // flux sortie
            OutputStreamWriter sortie = new OutputStreamWriter(flux); // chqrqcter to byte
            InputStream fluxIn = soc.getInputStream(); // flux entree
            BufferedReader entree = new BufferedReader(new InputStreamReader(fluxIn)); // byte to chqrqcter
            Scanner sc = new Scanner(System.in); // Entree clavier

            while (true) {
                System.out.println("-------Make your choice-------");
                System.out.println("1. Tell");
                System.out.println("2. Learn");
                System.out.println("3. Quit");
                System.out.println("-------------------");
                switch (sc.nextInt()) {
                    case 1 -> {
                        sortie.write("tell\n");
                        sortie.flush();
                        System.out.println("Client : Tell");
                        String reponse = entree.readLine();
                        System.out.println("Server : " + reponse);
                        sortie.write("Who's there\n");
                        sortie.flush();
                        System.out.println("Client : Who's there");
                        reponse = entree.readLine();
                        System.out.println("Server : " + reponse);
                        sortie.write(reponse + " Who ?\n");
                        sortie.flush();
                        System.out.println("Client : " + reponse + " Who ?");
                        System.out.println("Server : " + entree.readLine());
                    }
                    case 2 -> {
                        sortie.write("learn\n");
                        sortie.flush();
                    }
                    case 3 -> {
                        sortie.write("quit\n");
                        sortie.flush();
                        soc.close();
                        System.exit(1);
                    }
                }
            }
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
