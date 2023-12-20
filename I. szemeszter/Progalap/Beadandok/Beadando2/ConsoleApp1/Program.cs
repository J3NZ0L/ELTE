namespace ConsoleApp1 // Jeney Zoltán, DB7ZTC, jeneyzoltan2@gmail.com
{
    internal class Program
    {
        static void Main(string[] args)
        {   
            //Deklaralas
            int N = int.Parse(System.Console.ReadLine()); //itt kell inicializalni is egybol
            bool[] orhelyvektor = new bool[N];
            int[] orzottfalak = new int[N];
            int maxertek;

            //Inicializalas

            orzottfalak[0] = 0;

            maxertek = orzottfalak[0];

            
            //Beolvasas
            for (int i = 0; i < N; i++)
            {
                if (int.Parse(System.Console.ReadLine()) == 1)
                {
                    orhelyvektor[i] = true;
                }
                else {
                    orhelyvektor[i] = false;
                }
            }
            //Feldolgozas
                //Masolas fuggveny szerint
            for (int i=1; i<N; i++)
            {
                if (!(orhelyvektor[i-1] || orhelyvektor[i]))
                {
                    orzottfalak[i] = orzottfalak[i - 1] + 1;
                } else 
                { 
                    orzottfalak[i] = 0;
                }
            }
                //Maximumkivalasztas masolasbol keletkezett tombbol
            for (int i=0; i<N; i++)
            {
                if(orzottfalak[i]>maxertek)
                {
                    maxertek = orzottfalak[i];
                }
            }

            //Kiiras
            System.Console.WriteLine(maxertek);

        }
    }
}