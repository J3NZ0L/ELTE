internal class Program
{
    public struct Iro{
        public int Id;
        public int Db;
        
    }

    public struct Felhasznalo{
        public char Id;
        public int belepora, kilepora;
    }

    public static bool vane(int[] lista, int hossz,int elem){
        int i=1;
        while ((i<hossz)&&(lista[i]!=elem)){
            i++;
        }
        return i<hossz;
    }
    private static void Main(string[] args)
    {
        /*
        int n=int.Parse(Console.ReadLine());
        Iro[] irok=new Iro[n];
        int osszeg=0;
        string sor;
        for (int i=0; i<n; i++){
            sor=Console.ReadLine();
            irok[i].Db=int.Parse(sor.Split(" ")[1]);
            if (irok[i].Db<=4){
                osszeg+=irok[i].Db;
            }
        }
        Console.WriteLine("Konyvek szama: "+osszeg);
        */
        /*
        List<Felhasznalo> felhasznalolista = new List<Felhasznalo>();
        int n;
        n = int.Parse(Console.ReadLine());
        for (int i=0; i<n; i++){
            string sor = Console.ReadLine().Split(" ");
            Felhasznalo felhasznalo = new Felhasznalo();
            felhasznalo.Nev = sor[0];
            felhasznalo.belepora = int.Parse(sor[1]);
            felhasznalo.kilepora = int.Parse(sor[2]);
            lista.add(felhasznalo);
        }
        int[] intervallumok = new int[24]; //c# lenullazza a tombot mainen belul
        for (int i=0; i<n; i++){
            for(int j=lista[i].belepora; j<lista[i].kilepora; j++){
                intervallumok[j]++;
            }
        }
        int maxErtek=intervallumok[0];
        for (int i=1; i<24; i++){
            if (maxErtek<intervallumok[i]){
                maxErtek=intervallumok[i];
            }
        }
        int k=0;
        int elso;
        /*
       while( k<n ){
            if (maxErtek == intervallumok[k]){
                Console.WriteLine(k);
                elso=i;
                while(intervallumok[k+1]==maxErtek && k<n){
                    k++;
                }
                if(k!=elso){
                Console.WriteLine(k);
                }
            } else {
                k++;
            }
        }
        
        for (int i=1; i<24; i++){
            if ((maxErtek!= intervallumok[i] && maxErtek == intervallumok[i+1])|| (n == 0 && intervallumok[0] ==maxErtek)){
                Console.WriteLine("Az intervallum eleje: "+i);
            }
            if (maxErtek == intervallumok[i] && maxErtek != intervallumok[i+1]){
                Console.WriteLine(" a vége: "+i);
            }
        }
        */
        /*
        int n=int.Parse(Console.ReadLine());
        int[,] M = new int[n,m];
        for (int i=0; i<n; i++){
            string sor=Console.ReadLine();
            for (int j=0;i<n; j++){
                M[i,j]=int.Parse(sor.Split(" ")[j]);
            }
        }
        int i=0;
        while (i<n && M[i,i]!=0){
            i++;
        }
        bool nullae=i<n;
        */
        int[] l1={1, 2, 3, 5};
        int[] l2={1, 2, 4, 5, 6};
        List<int> l3 = new List<int>();
        int db=0;
        for (int i=0; i<5; i++){
            if (vane(l2, 5 , l1[i])){
                db=db+1;
                l3.Add(l1[i]);
            }
        }
        Console.WriteLine("A halmaz metszetet alkotja: ");
        for (int i=0; i<=l3.Count; i++){
            Console.WriteLine(l3[i]);
        }

    }
}