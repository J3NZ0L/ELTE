namespace ConsoleApp1
{
    internal class Program
    {
        public struct Bor
        {
            public int mennyiseg;
            public int ar;
        }
        static void Main(string[] args)
        {
            //Beolvasás
            string sor = Console.ReadLine();
            int evekszama = int.Parse(sor.Split(' ')[0]);
            int K = int.Parse(sor.Split(' ')[1]);
            Bor[] bortomb = new Bor[evekszama];
            for (int i = 0; i < evekszama; i++)
            {
                sor = Console.ReadLine();
                bortomb[i].mennyiseg = int.Parse(sor.Split(' ')[0]);
                bortomb[i].ar = int.Parse(sor.Split(' ')[1]);
            }
            List<int> evek2000 = new List<int>();
            //1. feladat: Kiválogatás
            for (int i = 0; i < evekszama; i++)
            {
                if (bortomb[i].mennyiseg > 2000)
                {
                    evek2000.Add(i);
                }
            }
            evek2000.OrderBy(n => n);
            Console.Write(evek2000.Count+" ");
            if (evek2000.Count > 0)
            {
                for (int i = 0; i< evek2000.Count; i++)
                {
                    Console.Write(evek2000[i]);
                }
            }
                //2. feladat: Eldöntés

                //3. feladat: Kiválogatás

            }
    }
}