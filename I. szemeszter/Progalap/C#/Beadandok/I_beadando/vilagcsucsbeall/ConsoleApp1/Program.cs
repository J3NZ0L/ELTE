namespace ConsoleApp1
{
    internal class Program
    {
        public struct vcsucsrecord
        {
            public int ev;
            public int magassag;
        }
        static void Main(string[] args)
        {
            //Deklaracio
            int vcsucsszam;
            int db;
            string sor;
            //Beolvasas
            vcsucsszam=int.Parse(System.Console.ReadLine());  
            vcsucsrecord[] vcsucsok = new vcsucsrecord[vcsucsszam];
            for (int i = 0; i < vcsucsszam; i++) { 
                sor=System.Console.ReadLine();
                vcsucsok[i].ev = int.Parse(sor.Split(' ')[0]);
                vcsucsok[i].magassag = int.Parse(sor.Split(' ')[1]);
            }
            //Console.WriteLine(vcsucsok[vcsucsszam-1].magassag);
            //Feldolgozas
            db = 0;
            for (int i = 1; i<vcsucsszam; i++)
            {
                if (vcsucsok[i - 1].magassag == vcsucsok[i].magassag)
                {
                    db++;
                }
            }
            //Kiiras
            System.Console.WriteLine(db);
        }
    }
}