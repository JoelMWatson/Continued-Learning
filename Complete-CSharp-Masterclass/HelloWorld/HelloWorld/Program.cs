using System;

namespace HelloWorld
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Beep();
            Console.WriteLine("Hello World!");

            //byte number = 1;
            //int integer = 20;
            //char character = 'A';
            //bool isWorking = true;
            //float floater = 20.01f;
            //double doubler = 30.02;
            //decimal decimaler = 40.03m;
            //string firstName = "Joel";
            // or you can just use var
            var number = 1;
            var integer = 20;
            var character = 'A';
            var isWorking = true;
            var floater = 20.01f;
            var doubler = 30.02;
            var decimaler = 40.03m;
            var firstName = "Joel";

            Console.WriteLine(isWorking);
            Console.WriteLine(character);
            Console.WriteLine(number);
            Console.WriteLine(integer);
            Console.WriteLine(floater);
            Console.WriteLine(doubler);
            Console.WriteLine(decimaler);
            Console.WriteLine(firstName);


        }
    }
}
