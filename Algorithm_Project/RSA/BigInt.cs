using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RSA
{
    class BigInt
    {
        //Subtraction Two Big Intgers
        public List<char> Subtraction(List<char> NumberOne, List<char> NumberTwo)
        {
            List<char> Result = new List<char>();
            int Number1_len = NumberOne.Count;
            int Number2_len = NumberTwo.Count;

            if (Number1_len == 0 && Number2_len == 0)
            {
                Result.Add('0');
            }
            else if (Number1_len != 0 && Number2_len == 0)
                Result = NumberOne;
            else if (Number1_len >= Number2_len)
            {
                NumberOne.Reverse();
                NumberTwo.Reverse();

                int Borrow = 0;
                for (int i = 0; i < Number2_len; i++)
                {
                    int Subtraction = ((int)(NumberOne[i] - '0') - (int)(NumberTwo[i] - '0') - Borrow);

                    if (Subtraction < 0)
                    {
                        Subtraction = Subtraction + 10;
                        Borrow = 1;
                    }
                    else
                        Borrow = 0;
                    Result.Add((char)(Subtraction + '0'));
                }

                for (int i = Number2_len; i < Number1_len; i++)
                {
                    int Subtraction = ((int)(NumberOne[i] - '0') - Borrow);

                    if (Subtraction < 0)
                    {
                        Subtraction = Subtraction + 10;
                        Borrow = 1;
                    }
                    else
                        Borrow = 0;
                    Result.Add((char)(Subtraction + '0'));
                }

                Result.Reverse();
                NumberOne.Reverse();
                NumberTwo.Reverse();

            }

            string Answer = new string(Result.ToArray<char>());
            Answer = Answer.TrimStart(new Char[] { '0' });
            if (Answer == "")
                Answer = "0";

            Result = new List<char>(Answer);
            return Result;
        }

        //Add Two Big Intgers
        public List<char> Addition(List<char> a, List<char> b)
        {
            List<char> res;
            int carry = 0;
            List<char> diff;

            if (a.Count > b.Count)
            {
                diff = new List<char>();

                for (int i = 0; i < Math.Abs(a.Count - b.Count); i++)
                {
                    diff.Add('0');
                }
                for (int i = 0; i < b.Count; i++)
                    diff.Add(b.ElementAt(i));
                b.Clear();
                for (int i = 0; i < diff.Count; i++)
                    b.Add(diff.ElementAt(i));

            }
            if (b.Count > a.Count)
            {
                diff = new List<char>();
                for (int i = 0; i < Math.Abs(a.Count - b.Count); i++)
                {
                    diff.Add('0');
                }
                for (int i = 0; i < a.Count; i++)
                    diff.Add(a.ElementAt(i));
                a.Clear();
                for (int i = 0; i < diff.Count; i++)
                    a.Add(diff.ElementAt(i));
            }

            char[] chares = new char[a.Count];
            for (int i = 0; i < a.Count; i++)
            {
                chares[i] = '0';
            }
            for (int i = a.Count - 1; i >= 0; i--)
            {
                int firstdigit = a[i] - '0';
                int seconddigit = b[i] - '0';
                int sum = firstdigit + seconddigit + carry;
                if (sum >= 10)
                {
                    carry = 1;
                    int sres = sum - 10;
                    chares[i] = (char)(sres + '0');
                }
                else
                {
                    carry = 0;
                    chares[i] = (char)(sum + '0');
                }
            }
            if (carry == 1)
            {
                res = new List<char>();
                res.Add('1');
                for (int i = 0; i < chares.Length; i++)
                    res.Add(chares[i]);
            }
            else
            {
                res = new List<char>();
                for (int i = 0; i < chares.Length; i++)
                    res.Add(chares[i]);
            }

            string Answer = new string(res.ToArray<char>());
            Answer = Answer.TrimStart(new Char[] { '0' });
            if (Answer == "")
                Answer = "0";

            res = new List<char>(Answer);

            return res;
        }

        //Multiplication Two Big Intgers
        public List<char> Multiplication(List<char> NumberOne, List<char> NumberTwo)
        {

            MakeEqual(NumberOne, NumberTwo);

            List<char> N1 = new List<char>(NumberOne);
            List<char> N2 = new List<char>(NumberTwo);

            if (NumberOne.Count == 0 && NumberTwo.Count == 0)
            {
                return new List<char>() { '0' };
            }

            if (NumberOne.Count == 1 && NumberTwo.Count == 1)
            {
                int Result = (NumberOne[0] - '0') * (NumberTwo[0] - '0');
                char[] R = Result.ToString().ToCharArray();
                List<char> R1 = R.ToList<char>();
                return R1;
            }

            int CurrentPosition = NumberOne.Count / 2;

            List<char> FirstNumberFirstPart = GetFirstPart(N1, CurrentPosition);
            N1 = new List<char>(NumberOne);
            List<char> FirstNumberSecondPart = GetSecondPart(N1, CurrentPosition);

            List<char> SecondNumberFirstPart = GetFirstPart(N2, CurrentPosition);
            N2 = new List<char>(NumberTwo);
            List<char> SecondNumberSecondPart = GetSecondPart(N2, CurrentPosition);

            List<char> N3 = new List<char>(FirstNumberFirstPart);
            List<char> N4 = new List<char>(SecondNumberFirstPart);

            List<char> Mul1 = Multiplication(N3, N4);

            List<char> N5 = new List<char>(FirstNumberSecondPart);
            List<char> N6 = new List<char>(SecondNumberSecondPart);

            List<char> Mul2 = Multiplication(N5, N6);

            N3 = new List<char>(FirstNumberFirstPart);
            N4 = new List<char>(SecondNumberFirstPart);
            N5 = new List<char>(FirstNumberSecondPart);
            N6 = new List<char>(SecondNumberSecondPart);
            List<char> Mul1_Mul2 = Multiplication(Addition(N3, N5), Addition(N4, N6));

            int pad = NumberOne.Count - CurrentPosition;
            List<char> N7 = new List<char>(Mul1);
            List<char> N8 = new List<char>(Mul2);
            List<char> N9 = new List<char>(Mul1_Mul2);
            return ResultCalculation(N7, N8, N9, pad);
        }

        public List<char> GetFirstPart(List<char> Number, int CurrentPosition)
        {
            return Number.GetRange(0, CurrentPosition);
            //  return Number;
        }

        public List<char> GetSecondPart(List<char> Number, int CurrentPosition)
        {
            return Number.GetRange(CurrentPosition, Number.Count - CurrentPosition);
            // return Number;
        }

        public List<char> ResultCalculation(List<char> Mul1, List<char> Mul2, List<char> Mul1_Mul2, int Pad)
        {
            List<char> Temp1 = Subtraction(Subtraction(new List<char>(Mul1_Mul2), new List<char>(Mul1)), new List<char>(Mul2));
            string T1 = new string(Temp1.ToArray<char>());
            string T2 = T1.PadRight(Temp1.Count + Pad, '0');
            List<char> Temp2 = T2.ToList<char>();
            string T3 = new string(Mul1.ToArray<char>());
            string T4 = T3.PadRight(Mul1.Count + Pad * 2, '0');
            List<char> Temp3 = T4.ToList<char>();
            List<char> Result = Addition(Addition(new List<char>(Temp2), new List<char>(Temp3)), new List<char>(Mul2));
            return Result;
        }

        public void MakeEqual(List<char> NumberOne, List<char> NumberTwo)
        {
            int Number1_len = NumberOne.Count;
            int Number2_len = NumberTwo.Count;

            if (Number1_len < Number2_len)
            {
                NumberOne.Reverse();
                for (int i = 0; i < Number2_len - Number1_len; i++)
                    NumberOne.Add('0');
                NumberOne.Reverse();
            }
            else if (Number1_len > Number2_len)
            {
                NumberTwo.Reverse();
                for (int i = 0; i < Number1_len - Number2_len; i++)
                    NumberTwo.Add('0');
                NumberTwo.Reverse();
            }
        }

        //Divid Two Big Integers
        List<char> C1 = new List<char>() { '1' };
        public string[] Divide(List<char> NumberOne, List<char> NumberTwo)
        {
            string[] Result;

            if (NumberOne.Count < NumberTwo.Count)
            {
                string S = new string(NumberOne.ToArray<char>());
                Result = new string[] { "0", S };
                return Result;
            }
            else if (NumberOne.Count == NumberTwo.Count)
            {
                for (int i = 0; i < NumberTwo.Count; i++)
                {
                    if (NumberOne[i] < NumberTwo[i])
                    {
                        string S = new string(NumberOne.ToArray<char>());
                        return new string[] { "0", S };
                    }
                    else if (NumberOne[i] > NumberTwo[i])
                        break;
                }
            }
            List<char> M1 = Addition(new List<char>(NumberTwo), new List<char>(NumberTwo));
            Result = Divide(NumberOne, M1);
            List<char> D = Addition(new List<char>(Result[0]), new List<char>(Result[0]));
            Result[0] = new string(D.ToArray<char>());

            if (Result[1].Length < NumberTwo.Count)
                return Result;
            else if (Result[1].Length == NumberTwo.Count)
            {
                string Temp = Result[1];

                for (int i = 0; i < NumberTwo.Count; i++)
                {
                    if (Temp[i] < NumberTwo[i])
                        return Result;
                    else if (Temp[i] > NumberTwo[i])
                        break;
                }
                List<char> M2 = Addition(Result[0].ToList<char>(), C1);
                List<char> M3 = Subtraction(Result[1].ToList<char>(), NumberTwo);
                Result[0] = new string(M2.ToArray<char>());
                Result[1] = new string(M3.ToArray<char>());

                return Result;
            }
            else
            {
                List<char> M2 = Addition(Result[0].ToList<char>(), C1);
                List<char> M3 = Subtraction(Result[1].ToList<char>(), NumberTwo);
                Result[0] = new string(M2.ToArray<char>());
                Result[1] = new string(M3.ToArray<char>());
                return Result;
            }
        }

        //Long Division By 2 only
        public List<char> LongDivision(List<char> Divident)
        {
            int Divisor = 2;
            List<char> Result = new List<char>();

            int Index = 0;
            int Temp = (int)(Divident[Index] - '0');
            while (Temp < Divisor && Index + 1 < Divident.Count)
            {
                Temp = Temp * 10 + (int)(Divident[Index + 1] - '0');
                Index++;
            }
            ++Index;

            while (Divident.Count > Index)
            {
                Result.Add((char)(Temp / Divisor + '0'));
                Temp = (Temp % Divisor) * 10 + (int)(Divident[Index] - '0');
                Index++;
            }

            Result.Add((char)(Temp / Divisor + '0'));

            if (Result.Count == 0)
                return new List<char>() { '0' };
            else
                return Result;

        }
        
        //Mod Of Powers
        public List<char> ModOfPower(List<char> NumberOne, List<char> NumberTwo, List<char> Power)
        {
            List<char> R1;

            if (Power[0] == '0')
                return new List<char>() { '1' };

            List<char> Back = LongDivision(new List<char>(Power));

            if ((Power[Power.Count - 1] - '0') % 2 == 0)
            {
                List<char> M1 = ModOfPower(new List<char>(NumberOne), new List<char>(NumberTwo), Back);
                R1 = Multiplication(new List<char>(M1), new List<char>(M1));
            }
            else
            {
                List<char> M3 = ModOfPower(new List<char>(NumberOne), new List<char>(NumberTwo), Back);               
                R1 = Multiplication(new List<char>(M3), new List<char>(M3));
                R1 = Divide(new List<char>(R1), new List<char>(NumberTwo))[1].ToList();
                R1 = Multiplication(R1, NumberOne);
            }
            
            string[] R2 = Divide(R1, NumberTwo);

            return R2[1].ToList<char>();
        }

        //RSA Encryption
        public List<char> RSAEncryption(List<char> M, List<char> N, List<char> E)
        {
           
            List<char> re = ModOfPower(M, N, E);
            return re;
        }

        //RSA Decryption
        public List<char> RSADecryption(List<char> EM, List<char> N, List<char> d)
        {
            
            List<char> re = ModOfPower(EM, N, d);
            return re;
        }
    }
}