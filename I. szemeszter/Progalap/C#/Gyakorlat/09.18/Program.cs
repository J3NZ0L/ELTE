using System.ComponentModel.Design;

namespace Elagazas_feladatsor
{
    internal class Program
    {
        static void Main(string[] args)
        {


            //-------------------ELAGAZAS
            //-------------------ELAGAZAS


            //1. Akcio

            /*
            Console.WriteLine("Termek eredeti ara:\n");
            int defprice;
            defprice = int.Parse(Console.ReadLine());
            Console.WriteLine("Learazas szazalekban:\n");
            int percent;
            percent = int.Parse(Console.ReadLine());
            float endprice = defprice - defprice*percent / 100;
            Console.WriteLine("Akcios ar:"+endprice+"\n");
            if (percent>50)
            {
                Console.WriteLine("Megeri megvenni az arut\n");
            }
            else
            {
                Console.WriteLine("Nem eri megvenni az arut\n");
            }
            */

            //2. Szignum
            
            /*
             Console.WriteLine("Kerek egy valos szamot\n");
             int n;
             n= int.Parse(Console.ReadLine());
             if (n < 0)
             {
                 Console.WriteLine(-1);
             }
             else if (n > 0)
             {
                 Console.WriteLine(1);
             }
             else { Console.WriteLine(0); }
            */

            //4. Egyenlet1
            
            /*
            Console.WriteLine("A:");
            float a;
            a = float.Parse(Console.ReadLine());
            Console.WriteLine("B:");
            float b;
            b = float.Parse(Console.ReadLine());
            Console.WriteLine("C:");
            float c;
            c = float.Parse(Console.ReadLine());
            if (b*b-4*a*c<0)
            {
                Console.WriteLine("Nincs valos megoldas");
            } 
            else if (b*b-4*a*c>0) {
                Console.WriteLine("x1="+(-b+Math.Sqrt(b*b-4*a*c))/2*a);
                Console.WriteLine("x2="+(+b + Math.Sqrt(b * b - 4 * a * c)) / 2*a);
            } else
            {
                Console.WriteLine("Az egyetlen valos megoldas: "+(-b + Math.Sqrt(b * b - 4 * a * c)) / 2*a);
            }
            */
            
            //7. maximum
            
            /*
            Console.WriteLine("A:");
            int a;
            a= int.Parse(Console.ReadLine());
            Console.WriteLine("B:");
            int b;
            b = int.Parse(Console.ReadLine());
            Console.WriteLine("C:");
            int c;
            c = int.Parse(Console.ReadLine());
            Console.WriteLine("Max=");
            if (a >= b) { 
                if (a >= c)
                {
                    Console.Write("A="+a);
                }
                else 
                {
                    Console.Write("C=" + c);
                }
            }else if (b >= c)
            {
                if (a >= c)
                {
                    Console.Write("B=" + b);
                }
                else
                {
                    Console.Write("B=" + b);
                } 
                 
            } else
            {
                Console.Write("C=" + c);
            }
            */
            
            //8. Udvozles
            
            /*
            Console.WriteLine("Irja be a nevet!");
            string name;
            name = Console.ReadLine();
            Console.WriteLine("Hogyan udvozoljem ont?");
            string greet;
            greet = Console.ReadLine();
            string fullgreet = greet + " " + name+"!";
            Console.WriteLine(fullgreet);
            */
            //10. relacio
            /*
            Console.WriteLine("Kerek ket szamot!");
            Console.WriteLine("A:");
            int a = int. Parse(Console.ReadLine());
       
            Console.WriteLine("B:");
            int b = int.Parse(Console.ReadLine());
            if (a > b) {
                Console.WriteLine("A nagyobb mint B");
            } else if (b > a)
            {
                Console.WriteLine("B nagyobb mint A");
            }
            else
            {
                Console.WriteLine("A egyenlo B-vel");
            }
            */


            //-------------------CIKLUS
            //-------------------CIKLUS

            //1. Faktorialis
            /*
            Console.WriteLine("N:");
            int n = int.Parse(Console.ReadLine());
            int x = 1;
            for (int i=1; i<=n; i++)
            {
                x *= i; 
            }
            Console.WriteLine(x);
            */
            //10. Teglalap
            /*
            for (int i = 1; i<30; i++)
            {
                Console.Write("x");
            }
            Console.Write("\n");
            for (int j = 2; j<39;j++) {
                Console.Write("x");
                for (int i = 2; i<29; i++)
                {
                    Console.Write(" ");
                }
                Console.Write("x\n");
            }
            for (int i = 1; i < 30; i++)
            {
                Console.Write("x");
            }
            Console.WriteLine();
            */
            
            //+Karacsonyfa

            /*
            int koronamagassag = 9;
            int szelesseg = 16;
            for (int i = 0; i < koronamagassag; i++)
            {
                for (int j = 0; j < szelesseg / 2 - i; j++)
                {
                    Console.Write(" ");
                }
                for (int j = szelesseg / 2 - i + 1; j < szelesseg / 2 + i + 1; j++)
                {
                    Console.Write("x");
                }
                for (int j = szelesseg / 2 + i + 1; j < szelesseg; j++)
                {
                    Console.Write(" ");
                }
                Console.WriteLine();
            }
            for (int i = 0; i < 4; i++)
            {
                for (int j = 1; j < szelesseg / 2; j++)
                {
                    Console.Write(" ");
                }
                Console.Write("xx");
                for (int j = szelesseg / 2 + 2; j < szelesseg + 1; j++)
                {
                    Console.Write(" ");
                }
                Console.WriteLine();
            */

            }
        }
    }
}