using System;
using System.Net.Sockets;
using System.Net;
using System.Text;
// check whether all required namespaces are imported
public class SynchronousSocketListener
{

    // Incoming data from the client.  
    public static string data = null;

    public static void StartListening()
    {
        // Data buffer for incoming data.  
        byte[] bytes = new Byte[1024];

        // Establish the local endpoint for the socket.  
        // Dns.GetHostName returns the name of the
        // host running the application.  
        IPHostEntry ipHostInfo = Dns.GetHostEntry(Dns.GetHostName());
        IPAddress ipAddress = ipHostInfo.AddressList[0];
        IPEndPoint localEndPoint = new IPEndPoint(IPAddress.Parse("127.0.0.1"), 10000);

        // Check whether TCP Socket is created correctly
        Socket listener = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

        // Bind the socket to the local endpoint and
        // listen for incoming connections.  
        string fileName = "file.json";
        try
        {
            listener.Bind(localEndPoint);
            listener.Listen(10);

            // Start listening for connections.  
            while (true)
            {
                Console.WriteLine("Waiting for a connection...");
                // Program is suspended while waiting for an incoming connection.  
                Socket handler = listener.Accept();

                // An incoming connection needs to be processed.  
                // check if the varibale is defined or not also even correctly defined
                // byte[] buffer = new byte[];
                int bytesRec = handler.Receive(bytes);
                string data = Encoding.ASCII.GetString(bytes, 0, bytesRec);
                // Console.WriteLine($"Text received : {0}", data);
                string[] dataArr = data.Split(',');
                string name = dataArr[0];
                string intrests = dataArr[1];
                string mail = dataArr[2];
                string jsonData = "{ \"name\": \"" + name + "\", \"intrests\": \"" + intrests + "\", \"mail\": \"" + mail + "\" }";
                Console.WriteLine("Name: {0}", name);
                Console.WriteLine("Intrests: {0}", intrests);
                Console.WriteLine("Email: {0}", mail);
                Console.WriteLine("======================================");
                if (File.Exists(fileName))
                {
                    using (StreamWriter sw = File.AppendText(fileName))
                    {
                        sw.WriteLine(jsonData);
                    }
                }
                else
                {
                    using (StreamWriter sw = File.CreateText(fileName))
                    {
                        sw.WriteLine(jsonData);
                    }
                }
                handler.Shutdown(SocketShutdown.Both);
                handler.Close();
            }

        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }

        Console.WriteLine("\nPress ENTER to continue...");
        Console.Read();

    }
    // check the main function
    public static int Main(String[] args)
    {
        StartListening();
        return 0;
    }
}
