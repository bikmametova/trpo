//7,5 Описать рекурсивную функцию Fib2(N) целого типа, вычисляющую N-й элемент 
//последовательности чисел Фибоначчи (N — целое число): F1 = F2 = 1, FK = FK–2 + FK–1, 
//K = 3, 4, … .Считать, что номер N не превосходит 20. Для уменьшения количества 
//рекурсивных вызовов по сравнению с функцией Fib1 (см. задание Recur4) создать
//вспомогательный массив для хранения уже вычисленных чисел Фибоначчи 
//и обращаться к нему при выполнении функции Fib2. С помощью функции Fib2 найти 
//пять чисел Фибоначчи с данными номерами
class fibon
{
    public int count = -1;
    public long Fib(long a)
    {
        long num;
        count++;
        if (a == 1) return 1;
        if (a == 0) return 0;
        num = Fib(a - 2) + Fib(a - 1);

        return num;
    }
}
class program
{
    static void Main()
    {
        fibon ob = new fibon();
        int count = 0;
        do
        {
            Console.WriteLine("Введите N-й элемент в последовательности Фибоначчи : ");
            long a = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Ваше число в последовательности : " + ob.Fib(a));
            Console.WriteLine("Количество вызовов рекурсии равно : " + ob.count);
            count++;
        } while (count != 5);
        Console.ReadKey();
    }
}