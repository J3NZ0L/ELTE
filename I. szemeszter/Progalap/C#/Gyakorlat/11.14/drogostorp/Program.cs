internal class Program
{
    public struct Var{
        public int letszam;
        public int tavolsag;
    }
    private static void Main(string[] args)
    {
        /*
        Console.WriteLine("Irja be a torpok szamat!");
        int tsz=int.Parse(Console.ReadLine());
        int[] lista=new int[tsz];
        for (int i=0; i<tsz; i++){
            lista[i]=int.Parse(Console.ReadLine());
        }
        int j=0;
        while (j<tsz && lista[j]<80){
            j++;
        }
        bool volte=j<tsz;
        if (volte){
            Console.WriteLine("Volt 80 kilonal nagyobb drogcsempeszeti kiserlet.");
        }else
        {
            Console.WriteLine("Nem volt 80 kilonal nagyobb drogcsempeszeti kiserlet.");
        }
        */

        // Ossztermes megszamolas
        /*
        Console.WriteLine("Irja be a torpok szamat!");
        int tsz=int.Parse(Console.ReadLine());
        int[] lista=new int[tsz];
        for (int i=0; i<tsz; i++){
            lista[i]=int.Parse(Console.ReadLine());
        }
        int sum=0;
        for (int i=0; i<tsz; i++){
            sum+=lista[i];
        }
        Console.WriteLine("Ossztermes: "+sum);
        */
        //Megf varak szama javitando
        /*
        Console.WriteLine("Irja be a varak szamat!");
        int vsz=int.Parse(Console.ReadLine());
        Var[] lista=new Var[vsz];
        string s;
        for (int i=0; i<vsz; i++){
            s=Console.ReadLine();
            lista[i].letszam=int.Parse(s.Split(' ')[0]);
            lista[i].tavolsag=int.Parse(s.Split(' ')[1]);
        }
        int megfvarszam=0;
        for (int i=0; i<vsz; i++){
            if ( (lista[i].letszam<=10) && (lista[i].tavolsag>=100)){
                megfvarszam+=1;
            }
        }
        Console.WriteLine("Megfelelo varak szama: "+megfvarszam);
        */

    }
}