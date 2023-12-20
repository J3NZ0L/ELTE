namespace ConsoleApp1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            /*
            int szepszam = 0;
            int szepszam2 = 1;
            string szepszoveg = "nagyon szep";
            string szepszoveg2 = "nagyon szep";
            string szepszoveg3 = szepszoveg1 + szepszoveg3;
            Console.WriteLine(szepszoveg + " " + csunyaszam);

            int be = int.Parse(Console.ReadLine());

            //1. feladat
            //Bemenet
            Console.WriteLine("Kerem a bemenetet")

            a = int.Parse(Console.ReadLine());
            b = int.Parse(Console.ReadLine());

            //Feladat megoldasa

            int T = a * b;

            //Kiiras

            Console.WriteLine("A terulet: ", T);
            */
            //2. feladat

            Console.WriteLine("Kerem a bemenetet");
            int a;
            int b;
            int c;
            a = int.Parse(Console.ReadLine()); 
            b = int.Parse(Console.ReadLine());
            c = int.Parse(Console.ReadLine());
            bool valasz = false;
            
            if( (a>0) && (b>0) && (c>0))
            {
                if (a*a+b*b==c*c)
                {
                    valasz = true; 
                }else
                {
                    valasz = false;
                }
            };
            if (valasz)
            {
                Console.WriteLine("A haromszog derekszogu");
            }
            else
            {
                Console.WriteLine("A haromszog nem derekszogu");
            }
            




        }
    }
}