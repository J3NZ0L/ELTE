internal class Program
{
    public static bool prime(int x){
        int i=2;
        while ((i<=Math.Sqrt(x))&&!(x % i==0)){
            i++;
        }
        return i>Math.Sqrt(x);
    }   
    private static void Main(string[] args)
    {
        /*
        Ke3. feladat
N nap soran minden delben megmertuk a velencei to homersekletet. Hatarozzunk meg egy szakaszt amikor a homerseklet magasabb volt x foknál de a szakasz elott es utan kisebb.


Spec:
    Be: N∈Z, x∈Z, t[1..N] ∈Z
Ki: van∈L indelso∈Z, indexmasodik∈Z
Ef: -
Uf: van=∃i∈[1..N]:(t[indelso-1]<t[indelso])ÉS ∃j∈[1..N]:(t[j]>t[j+1])
Uf: (van,index1,index2)=KERES(i=1..N,index1,index2∈[1..N],∀j∈[index1..index2]:t[j]>x,∀j∈[1..index1-1]:t[j]<x,∀)
        */
        /*
        int n;
        n=int.Parse(Console.ReadLine());
        int x;
        x=int.Parse(Console.ReadLine());
        //int[] Hom=new int[10];
        int[] Hom={1,2,3,4,5,6,7,5,3,2};
        /*for(int i=1; i<=n;i++) {
            
        }
        
        int indexelso=0;
        int indexutso=11;
        int i=1;
        while ((i<=n)&&(Hom[i]<x)){
            i++;
        }
        indexelso=i;
        while ((i<=n)&&(Hom[i]>x)){
            i++;
        }
        indexutso=i-1;
        Console.WriteLine("Szakasz eleje:" +indexelso);
        Console.WriteLine("Szakasz vege:" +indexutso);
        */

        /*
        Be: k∈ N, v∈ N
Ki: P1∈Z, P2∈Z
Ef: k<v
Uf: (p1,p2)=KERES(i=k..v,prime(i),prime(i+2),Abs(p2-p1))
        Ke2. feladat
        Keressunk ikerprimet kezdetevel (k eleme N) es vegevel (V)
        */
        /*
        int k=int.Parse(Console.ReadLine());
        int v=int.Parse(Console.ReadLine());
        int i=k;
        while ((i<=v-2)&&(!(prime(i)))&&(!(prime(i+2)))){
            i++;
        }
        Console.WriteLine(i+"  "+i+2);

        */
        //Me4. feladat
        //Szamoljuk meg, hany primszam esik adott intervallumba?
        /*
        Be: k∈ N, v∈ N
Ki: P1∈Z, P2∈Z
Ef: k<v
Uf: (p1,p2)=KERES(i=k..v,prime(i),prime(i+2),Abs(p2-p1))
        */
        /*
        int e=1;
        int u=10;
        int db=0;
        for (int i=0;i<=u;i++){
            if prime(i){
                db++;
            }
        }
        Console.WriteLine(db);
        */

        //Matrixbol a legnagyobb elemet valasszuk ki
        /*
        int sorok=int.Parse(Console.ReadLine());
        int oszlopok=int.Parse(Console.ReadLine());
        int[,] magassagok=new int[sorok,oszlopok];
        for (int i=0;i<sorok;i++){
            string s=Console.ReadLine();
            for (int j=0; j<oszlopok;j++){
                magassagok[i,j]=int.Parse(s.split(' ')[j]);
            }
        }
        */
        //Ma2. feladat
        // Egy n szobol allo szovegbol keressuk ki a leghosszabb szot
        /*
        Console.WriteLine("Irja be a mondatban levo szavak szamat:"); 
        int n=Console.ReadLine();
        Console.WriteLine("Irja be a mondatot: ");
        string mondat = Console.ReadLine();
        string[] szavak = mondat.Split(" ");
        int n=szavak.length;
        string szo = szavak[0];
        int maxindex=0;
        for (int i=1; i< szavak.Length; i++){
            if(szavak[i].Length > szo.Length){
                szo = szavak[i];
                index=i;
            }
        }
        */
        //S5. feladat
        /*
        //Adott egy dátum: év + hó + nap számhármassal. Határozzuk meg, hogy az adott nap az év hányadik napja!
    }
    
}
