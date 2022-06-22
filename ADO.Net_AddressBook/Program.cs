using System;

namespace ADO.Net_AddressBook
{
    public class Program
    {
        public static void Main(string[] args)
        {
            AddressBookRepo getMethod = new AddressBookRepo();
            Console.WriteLine("Enter 1 to Add Data\n2 to Read Data\nEnter a Number");
            int userInput = Convert.ToInt32(Console.ReadLine());

            switch (userInput)
            {
                case 1:
                    {
                        AddressBook_Model model = new AddressBook_Model();
                        Console.WriteLine("Enter First Name");
                        model.firstName = Console.ReadLine();
                        Console.WriteLine("Enter Last Name");
                        model.lastName = Console.ReadLine();
                        Console.WriteLine("Enter Address ");
                        model.address = Console.ReadLine();
                        Console.WriteLine("Enter City ");
                        model.city = Console.ReadLine();
                        Console.WriteLine("Enter State ");
                        model.state = Console.ReadLine();
                        Console.WriteLine("Enter Zip Code ");
                        model.zipCode = Convert.ToDouble(Console.ReadLine());
                        Console.WriteLine("Enter Phone ");
                        model.phone = Convert.ToDouble(Console.ReadLine());
                        Console.WriteLine("Enter Email ");
                        model.email = Console.ReadLine();
                        Console.WriteLine("Enter Type ");
                        model.type = Console.ReadLine();
                        getMethod.AddData(model);
                        break;
                    }
                case 2:
                    {
                        getMethod.ReadData();
                        break;
                    }
                case 3:
                    {
                        getMethod.UpdateTable();
                        break;
                    }
                default:
                    {
                        Console.WriteLine("Enter a valid Number");
                        break;
                    }
            }
        }
    }
}