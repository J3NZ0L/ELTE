namespace Legidosebb_Dolgozo
{
    internal class Program
    {
        struct dolgozo
        {
            public int kor;
            public int fizetes;
        }
        static void Main(string[] args)
        {   
            int sorokszama = int.Parse(Console.ReadLine());
            dolgozo[] dolgozok = new dolgozo[100];
            for (int i = 0; i < sorokszama; i++)
            {
                string sor=Console.ReadLine();
                dolgozok[i].kor = int.Parse(sor.Split(' ')[0]);
                dolgozok[i].fizetes=int.Parse(sor.Split(' ')[1]);
            }
            int maxindex = 0;
            for( int i=0; i < sorokszama; i++)
            {
                if (dolgozok[i].kor > dolgozok[maxindex].kor)
                {
                    maxindex = i;   
                }   
            }

            Console.WriteLine(dolgozok[maxindex].fizetes);
        }
    }
}