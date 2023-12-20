using System.ComponentModel.Design;
using System.Drawing;
using System.Security.Cryptography.X509Certificates;

namespace Rekordok__tombok
{
    internal class Program
    {
        struct p //Siknegyed
        {
            public int x;
            public int y;
        }
        struct Lap //UNO
        {
            public int szam;
            public string szin;
        }
        static void Main(string[] args)
        {
            //Siknegyedes feladat
            /*
            p Pont = new p();
            Console.WriteLine("X erteke: ");
            Pont.x=int.Parse(Console.ReadLine());
            Console.WriteLine("Y erteke: ");
            Pont.y=int.Parse(Console.ReadLine());
            int sn = 0;
            if ((Pont.x!=0) && (Pont.y!=0 )){
                if ((Pont.x > 0) && (Pont.y > 0)) {
                    sn = 1;  
                } else if ((Pont.x > 0) && (Pont.y < 0 ))
                {
                    sn = 4;
                }
                else if ((Pont.x < 0) && (Pont.y > 0))
                {
                    sn = 2;
                }
                else if ((Pont.x < 0) && (Pont.y < 0))
                {
                    sn = 3;
                }
                Console.WriteLine("Siknegyed: ");
                Console.Write(sn);
                Console.WriteLine(".");
                */

            //UNO-s feladat

            /*
            Lap l1 = new Lap();
            Lap l2 = new Lap();

            Console.WriteLine("1. lap szamerteke: ");
            l1.szam = int.Parse(Console.ReadLine());
            Console.WriteLine("1. lap szine: ");
            l1.szin = Console.ReadLine();
            Console.WriteLine("2. lap szamerteke: ");
            l2.szam = int.Parse(Console.ReadLine());
            Console.WriteLine("2. lap szine: ");
            l2.szin = Console.ReadLine();
            if ((l1.szam == l2.szam) || (l1.szin == l2.szin))
            {
                while ((l1.szam == l2.szam) || (l1.szin == l2.szin))
                {
                    Console.WriteLine("Jo kor, johet a kovi");
                    l1.szam = l2.szam;
                    l1.szin = l2.szin;
                    Console.WriteLine("kovi lap szamerteke: ");
                    l2.szam = int.Parse(Console.ReadLine());
                    Console.WriteLine("kovi lap szine: ");
                    l2.szin = Console.ReadLine();
                }
            }
            else
            {
                Console.WriteLine("Jatek vege");
            }

            Console.WriteLine("Jatek vege");
            */

            //Evszakos feladat
            /*
            int honap;
            Console.WriteLine("Irja be a honap sorszamaat!")
            honap = int.Parse(Console.ReadLine());
            if ((honap>=1) && (honap<=12))
            {
                if ((honap>=3) && (honap<=5)) {
                    Console.WriteLine("tavasz");
                } else if ((honap >= 6) && (honap <= 8))
                {
                    Console.WriteLine("nyar");
                } else if ((honap >= 9) && (honap <= 11))
                {
                    Console.WriteLine("osz");
                } else if ((honap >= 12) && (honap <= 2))
                {
                    Console.WriteLine("tel");
                }
            }
            */

            //Taboros
            /*
            string[] Napok = { "Hétfő", "Kedd", "Szerda", "Csütörtök", "Péntek", "Szombat", "Vasárnap" };
            Console.WriteLine("Irja be a tabor kezdonapjat!");
            string kezdonap = Console.ReadLine();
            Console.WriteLine("Irja be a tabor hosszat!");
            int taborhossz = int.Parse(Console.ReadLine());
            int i = 0;
            Console.Write("A tabor ");
            Console.Write(Napok[(Array.IndexOf(Napok, kezdonap) + taborhossz) / 7 ]);
            Console.Write("-n fejezodik be.");
            */

            //Szam -> Betu

            /*
            string[] egyeshelyiert = { "egy", "kettő", "három", "négy", "öt", "hat", "hét", "nyolc", "kilenc", "tíz" };
            string[] masodikhelyiert = { "tizen", "huszon", "harminc", "negyven", "ötven", "hatvan", "hetven", "nyolcvan", "kilencven" };
            string[] kulonnullaveguek = { "tíz", "húsz" };

            int szam, tizes, egyes;
            
            Console.Write("Irjon be egy szamot 1 es 99 kozott: ");
            szam = int.Parse(Console.ReadLine());
            tizes = szam / 10;
            egyes = szam % 10;
            if (tizes!=0)
            {
                if (egyes != 0)
                {
                    Console.WriteLine(masodikhelyiert[tizes - 1] + egyeshelyiert[egyes - 1]);
                } else
                {
                    if (tizes <= 2) {
                        switch (tizes)
                        {
                            case 1: Console.WriteLine("tíz"); break;
                            case 2: Console.WriteLine("húsz"); break;
                        }
                    } else
                    {
                        Console.WriteLine(masodikhelyiert[tizes - 1]);
                    }
                }
            } else { Console.WriteLine(egyeshelyiert[egyes-1]); }  
            */

            //Hazi:

            /*
            int nyaralasnapok =7;
            int[] napikoltseg = { 70, 75, 120, 110, 94, 50, 200 }; //koltseg fejenkent a nyaralas napjain
            int n = 0;

            for (int i = 0; i<= nyaralasnapok-1; i++)
            {
                if (napikoltseg[i]>100) { n++; }
            }
            Console.WriteLine("Napok szama amikor koltseg fejenkent nagyobb volt mint 100 euro:" + n);
            */
        } 
    }
}

           
 

        
