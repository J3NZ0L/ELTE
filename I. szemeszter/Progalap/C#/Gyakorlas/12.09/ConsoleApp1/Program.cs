namespace ConsoleApp1
{
    internal class Program
    {
        public static bool vane(string elem, string[] S)
        {
            int i = 0;
            while (i <= S.Count())
            {
                i++;
            }
            return i<=S.Count();    
        }
        static void Main(string[] args)
        {
            Console.WriteLine("N:");
            int N = int.Parse(Console.ReadLine());
            Console.WriteLine("M:");
            int M = int.Parse(Console.ReadLine());
            string[] foZH = new string[N];
            string[] javitoZH = new string[M];
            Console.WriteLine("Adja meg a lista elemeit: ");
            List<string> metszetZH = new List<string>();
            for (int i=0; i < N; i++)
            {
                if (vane(javitoZH[i], foZH))
                {
                    metszetZH.Add(javitoZH[i]);
                }
            }
            Console.WriteLine(metszetZH.Count());
        }
    }
}