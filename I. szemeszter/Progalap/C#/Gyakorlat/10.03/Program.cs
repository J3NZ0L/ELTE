namespace _10._03
{
    internal class Program
    {
        bool isIn(string x, string[] A)
        {
            int i = 0;
            while ((i<=A.Length) && (x != A[i])) 
            {
                i++;
            }
            return i<=A.length;
        }
        struct Kartya
        {
            public string nev;
            public int ertek;
        }
        static void Main(string[] args)
        {
            string[] nevek = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "jumbo", "dama", "kiraly", "asz" };
            int[] szamok= { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11};

            Kartya k1 = new Kartya();
            Kartya k2 = new Kartya();
            Console.WriteLine("K1 ertek:");
            k1.ertek= int.Parse(Console.ReadLine());
            Console.WriteLine("K2 ertek:");
            k2.ertek = int.Parse(Console.ReadLine());
            Console.WriteLine("K1 nev:");
            k1.nev = Console.ReadLine();
            Console.WriteLine("K2 nev:");
            k2.nev =Console.ReadLine();

          //  if (k1.nev nevek)

            Console.WriteLine(k1.ertek+k2.ertek);
        }
    }
}