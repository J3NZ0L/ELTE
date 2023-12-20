namespace ConsoleApp1
{
    internal class Program
    {
        public struct Iro
        {
            public int id;
            public int db;
        }
            
          
        static void Main(string[] args)
        {
            Console.WriteLine("Adja meg n erteket: ");
            int n=int.Parse(Console.ReadLine());
            Console.WriteLine("Adja meg a tomb elemeit: ");
            Iro[] Irok = new Iro[n];
            string sor;
            for (int i=0; i<n; i++)
            {
                sor = Console.ReadLine();
                Irok[i].id = int.Parse(sor.Split(" ")[0]);
                Irok[i].db = int.Parse(sor.Split(" ")[1]);
            }
            int sum = 0;
            for (int i = 0; i < n; i++)
            {
                if (Irok[i].db <= 4)
                {
                    sum += Irok[i].db;
                }
            }
            Console.WriteLine("A megfelelo konyvek osszege: " + sum);
        }
    }
}