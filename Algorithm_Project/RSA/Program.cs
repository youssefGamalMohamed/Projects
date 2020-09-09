using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace RSA
{
    class Program
    {
        static void Main(string[] args)
        {
            // Needed parameters for reading and writing in file(s)  
            FileStream Stream1;
            FileStream Stream2;
            StreamWriter Writer;
            StreamReader Reader;

            BigInt Test;
            Test = new BigInt();

            int LoopNumber;
            string Number1;
            string Number2;
            string Number3;
            string Number4;

            List<char> Result;
            string Answer;

            // Multiply Part
            Stream1 = new FileStream("MultiplyTestCases.txt", FileMode.Open);
            Reader = new StreamReader(Stream1);

            Stream2 = new FileStream("MultiplyOutput.txt", FileMode.OpenOrCreate);
            Writer = new StreamWriter(Stream2);

            Test = new BigInt();

            LoopNumber = int.Parse(Reader.ReadLine());
            Reader.ReadLine();

            for (int i = 0; i < LoopNumber; i++)
            {
                Number1 = Reader.ReadLine();
                Number2 = Reader.ReadLine();
                Reader.ReadLine();

                Result = Test.Multiplication(Number1.ToList<char>(), Number2.ToList<char>());
                Answer = new string(Result.ToArray<char>());
                Answer = Answer.TrimStart(new Char[] { '0' });
                if (Answer == "")
                    Answer = "0";

                Writer.WriteLine(Answer);
                if (i != (LoopNumber - 1))
                    Writer.WriteLine();
            }

            Reader.Close();
            Writer.Close();

            // Add Part
            Stream1 = new FileStream("AddTestCases.txt", FileMode.Open);
            Reader = new StreamReader(Stream1);

            Stream2 = new FileStream("AddOutput.txt", FileMode.OpenOrCreate);
            Writer = new StreamWriter(Stream2);

            LoopNumber = int.Parse(Reader.ReadLine());
            Reader.ReadLine();

            for (int i = 0; i < LoopNumber; i++)
            {
                Number1 = Reader.ReadLine();
                Number2 = Reader.ReadLine();
                Reader.ReadLine();

                Result = Test.Addition(Number1.ToList<char>(), Number2.ToList<char>());
                Answer = new string(Result.ToArray<char>());

                Writer.WriteLine(Answer);
                if (i != (LoopNumber - 1))
                    Writer.WriteLine();
            }

            Reader.Close();
            Writer.Close();

            // Subtract Part
            Stream1 = new FileStream("SubtractTestCases.txt", FileMode.Open);
            Reader = new StreamReader(Stream1);

            Stream2 = new FileStream("SubtractOutput.txt", FileMode.OpenOrCreate);
            Writer = new StreamWriter(Stream2);

            LoopNumber = int.Parse(Reader.ReadLine());
            Reader.ReadLine();

            for (int i = 0; i < LoopNumber; i++)
            {
                Number1 = Reader.ReadLine();
                Number2 = Reader.ReadLine();
                Reader.ReadLine();

                Result = Test.Subtraction(Number1.ToList<char>(), Number2.ToList<char>());
                Answer = new string(Result.ToArray<char>());
                Answer = Answer.TrimStart(new Char[] { '0' });
                if (Answer == "")
                    Answer = "0";


                Writer.WriteLine(Answer);
                if (i != (LoopNumber - 1))
                    Writer.WriteLine();
            }

            Reader.Close();
            Writer.Close();

            //RSA Sample Test Cases 
            Stream1 = new FileStream("SampleRSA.txt", FileMode.Open);
            Reader = new StreamReader(Stream1);

            Stream2 = new FileStream("SampleRSAOutput.txt", FileMode.OpenOrCreate);
            Writer = new StreamWriter(Stream2);

            LoopNumber = int.Parse(Reader.ReadLine());

            for (int i = 0; i < LoopNumber; i++)
            {
                Number1 = Reader.ReadLine();
                Number2 = Reader.ReadLine();
                Number3 = Reader.ReadLine();
                Number4 =  Reader.ReadLine();
                if (Number4 == "0")
                {
                    Result = Test.RSAEncryption(Number3.ToList<char>(), Number1.ToList<char>(), Number2.ToList<char>());
                    Answer = new string(Result.ToArray<char>());
                    Answer = Answer.TrimStart(new Char[] { '0' });
                    if (Answer == "")
                        Answer = "0";
                    Writer.WriteLine(Answer);
                }
                if (Number4 == "1")
                {
                    Result = Test.RSADecryption(Number3.ToList<char>(), Number1.ToList<char>(), Number2.ToList<char>());
                    Answer = new string(Result.ToArray<char>());
                    Answer = Answer.TrimStart(new Char[] { '0' });
                    if (Answer == "")
                        Answer = "0";
                    Writer.WriteLine(Answer);
                }

            }
            Reader.Close();
            Writer.Close();
            
            //RSA Complete Test Cases 
            Stream1 = new FileStream("TestRSA.txt", FileMode.Open);
            Reader = new StreamReader(Stream1);

            Stream2 = new FileStream("TestRSAOutput.txt", FileMode.OpenOrCreate);
            Writer = new StreamWriter(Stream2);

            LoopNumber = int.Parse(Reader.ReadLine());

            for (int i = 0; i < LoopNumber; i++)
            {
                Number1 = Reader.ReadLine();
                Number2 = Reader.ReadLine();
                Number3 = Reader.ReadLine();
                Number4 = Reader.ReadLine();
                
                if (Number4 == "0")
                {
                    int Before = System.Environment.TickCount;
                    Result = Test.RSAEncryption(Number3.ToList<char>(), Number1.ToList<char>(), Number2.ToList<char>());
                    int After = System.Environment.TickCount;
                    int Diffrence = After - Before;
                    Console.WriteLine("Time Of Case #: " + (i+1) + " = " + Diffrence);

                    Answer = new string(Result.ToArray<char>());
                    Answer = Answer.TrimStart(new Char[] { '0' });
                    if (Answer == "")
                        Answer = "0";
                    Writer.WriteLine(Answer);
                }
                if (Number4 == "1")
                {
                    int Before = System.Environment.TickCount;
                    Result = Test.RSADecryption(Number3.ToList<char>(), Number1.ToList<char>(), Number2.ToList<char>());
                    int After = System.Environment.TickCount;
                    int Diffrence = After - Before;
                    Console.WriteLine("Time Of Case #: " + (i + 1) + " = " + Diffrence);

                    Answer = new string(Result.ToArray<char>());
                    Answer = Answer.TrimStart(new Char[] { '0' });
                    if (Answer == "")
                        Answer = "0";
                    Writer.WriteLine(Answer);
                }

            }
            Reader.Close();
            Writer.Close();

            //End of program
        }
    }
}
