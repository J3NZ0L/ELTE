internal class Program
{
    struct Tanulo {
        public string nev;
        public int magassag;
    }
    private static void Main(string[] args)
    {
        /* E4
        System.Console.WriteLine("Irja be N erteket! ");
        int N=int.Parse(System.Console.ReadLine());
        System.Console.WriteLine("Irja be a helyek ertekeit 0 vegjelig! ");
        bool[] helyek= new bool[N];
        bool input=int.Parse(System.Console.ReadLine());
        int i=0;
        while ((input!='0')&&(i<=N)){
            helyek[i]=input;
            input=System.Console.ReadLine();
        }
        bool van=false;
        while (!(van)&&(i<=N)){
            if (!(helyek[i])){
                van=true;
            } else
            {i+=1;
            }
        };
        System.Console.WriteLine(van ? "Igaz":"Hamis");
        */
        //E5
        /*
        bool sorrendbene;
        Console.WriteLine("Irja be az adatok darabszamat: ");
        int db = int.Parse(Console.ReadLine());
        Tanulo[] Tanulok=new Tanulo[db];
        int magassag;
        string nev;
        Console.WriteLine("Irja be a tomb elemeinek adatait: ");
        for (int i=0; i<=db; i++){
            Tanulok[i].magassag = int.Parse(Console.ReadLine());
            Tanulok[i].nev = Console.ReadLine();
        }
        int i=0;
        while ((i<db-1)&&Tanulok[i].nev[0]<Tanulok[i+1].nev[0]){
            i++;
        }
        if(i == db-1){
            Console.WriteLine("Ok");
        } else
        {
            Console.WriteLine("Nem ok");
        }
        */

        //E2
        Console.WriteLine("Irja be a tomb darabszamat: ");
        int db = int.Parse(Console.ReadLine());
        
        Console.WriteLine("Sorolja fol a tomb elemeit");
        int[] homersekletek=new int[db]; 
        {
        for (int i=0; i<db; i++){
            homersekletek[i]=int.Parse(Console.ReadLine());
        }
        }
        int j=0;
        while ((j<db-1) && (homersekletek[j]<homersekletek[j+1])){
            j++;
        }
        bool novekvoe=j==db-1;
        if (novekvoe){
            Console.WriteLine("Ok");
        } else
        {
            Console.WriteLine("Nem ok");
        }
        
    }
}