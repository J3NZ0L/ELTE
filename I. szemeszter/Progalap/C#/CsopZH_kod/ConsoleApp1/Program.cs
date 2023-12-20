namespace ConsoleApp1 // Jeney Zoltán - DB7ZTC - MACI csoport
{
    internal class Program
    {
        //1. feladat fuggvenyei
        public static int Osszertek(int ar, int db)
        {
            return ar * db;
        }
        public static int FeltMax(termek[] lista, int hossz) {
            bool van = false;
            int maxind=0;
            int maxert=lista[maxind].ar;
            for (int i = 0; i < hossz; i++)
            {
                if (lista[i].azonosito % 2 != 0)
                {

                } else
                {
                    if (!van)
                    {
                        van= true;
                        maxert = lista[i].ar;
                        maxind = i;
                    } else if (maxert < lista[i].ar){
                        maxert = lista[i].ar;
                        maxind= i;
                    }
                }
                    
                }
            if (van)
            {
                return maxind;
            }
            else
            {
                return -1;
            }

        }
        public static bool Eldontes(termek[] lista, int hossz)
        {
            int i = 0;
            while (i<hossz && lista[i].nev.Count()%2!=0 && lista[i].db % 2 == 1)
            {
                i++;
            }
            return i < hossz;
        }
        //2. feladat fuggvenye(i)
        public static bool T(int i)
        {
            if (i % 2 == 0)
            {
                return true;
            } else
            {
                return false;
            }
        }
        public struct termek
        {
            public string nev;
            public int azonosito;
            public int ar;
            public int db;
        }
        static void Main(string[] args)
        {
            //-------------------------------------------1. feladat--------------------------------------------------

            
                //Beolvasas, deklaralas
                Console.WriteLine("Kerem a bemenetet: ");
                int termekszam = int.Parse(Console.ReadLine()); 
                termek[] termekek=new termek[termekszam];
                for (int i = 0; i < termekszam; i++)
                {
                    string sor=Console.ReadLine();
                    termekek[i].nev = sor.Split(" ")[0];
                    termekek[i].azonosito = int.Parse(sor.Split(" ")[1]);
                    termekek[i].ar = int.Parse(sor.Split(" ")[2]);
                    termekek[i].db = int.Parse(sor.Split(" ")[3]);
                }
                // a) feladat
                Console.WriteLine("\nTermekek osszerteke: \n");
                for (int i = 0; i < termekszam; i++)
                {
                    Console.WriteLine(termekek[i].nev+" "+Osszertek(termekek[i].ar, termekek[i].db));
                }
                //Console.WriteLine();
                Console.WriteLine("\nb) Feladat: Maximalis aru parosadik termek:\n");
                // b) feladat
                if (FeltMax(termekek, termekszam) != -1)
                {
                    Console.WriteLine(termekek[FeltMax(termekek, termekszam)].ar);
            } else
                {
                    Console.WriteLine("Nincs ilyen termek. \n");
                }
            // c) feladat
                Console.WriteLine("\n c) feladat: \n");
                if (Eldontes(termekek, termekszam))
                {
                    Console.WriteLine("Van ilyen termek.");
                } else
                { Console.WriteLine("Nincs ilyen termek."); }
            
            //-------------------------------------------2. feladat--------------------------------------------------
            
            
            Console.WriteLine("#####Masodik feladat######");
            //Beolvasas
            Console.WriteLine("n erteke: ");
            int n;
            n=int.Parse(Console.ReadLine());

            if (n < 0) //Elofeltetel ellenorzes #1
            {
                Console.WriteLine("n erteke nem lehet kisebb mint 0.");
            }
            else
            {
                Console.WriteLine("Az l tomb elemei: ");
                int[] l = new int[n];
                for (int i=0;i<n; i++)
                {
                    l[i] = int.Parse(Console.ReadLine());
                }
            
                //Elofeltetel ellenorzes #2
                bool mindenelempozitiv = true;
                for (int i = 0; i < n; i++)
                {
                    mindenelempozitiv = mindenelempozitiv && (l[i] > 0);
                }

                if (mindenelempozitiv)
                {   

                    int db = 0;
                    for (int i = 0; i < n; i++)
                    {
                        if (T(l[i]))
                        {
                            db++;
                        }
                    }
                    Console.WriteLine(db);
                }
                else
                {
                    Console.WriteLine("A tomb nem minden eleme pozitiv.");
                }
            
            }
            
        }
    }
}

/*
 Bemenet:
7
Trebuchet 20 35000 1
Ülőalkalmatosság 12 1000 16
Űrhajó 42 18000 7
Varázspálca 56 23120 9
Csokoládétorta 30 12000 5
Robotkutya 37 15000 8
Időgép 64 27000 11
 */