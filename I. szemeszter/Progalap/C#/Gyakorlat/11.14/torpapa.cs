internal class Program
{
    private static void Main(string[] args)
    {
        Console.WriteLine("Irja be a torpok szamat!");
        int tsz=int.Parse(Console.ReadLine());
        int[] lista=new int[];
        for (int i=0; i<tsz; i++){
            lista[i]=int.Parse(Console.ReadLine());
        }
        while (i<tsz && lista[i]<80){
            i++;
        }
        bool volte=i<=tsz;
        if (volte){
            Console.WriteLine("Volt 80 kilonal nagyobb drogcsempeszeti kiserlet.")
        }else
        {
            Console.WriteLine("Nem volt 80 kilonal nagyobb drogcsempeszeti kiserlet.")
    }
}