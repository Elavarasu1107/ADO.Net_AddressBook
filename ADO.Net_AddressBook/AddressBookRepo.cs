using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO.Net_AddressBook
{
    internal class AddressBookRepo
    {
        public static string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ADDRESSBOOK_SERVICE;Integrated Security=True;" +
            "Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
        public void AddData(AddressBook_Model model)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            using(connection)
            {
                try
                {
                    SqlCommand command = new SqlCommand("AddContacts", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@FIRST_NAME", model.firstName);
                    command.Parameters.AddWithValue("@LAST_NAME", model.lastName);
                    command.Parameters.AddWithValue("@ADDRESS", model.address);
                    command.Parameters.AddWithValue("@CITY", model.city);
                    command.Parameters.AddWithValue("@STATE", model.state);
                    command.Parameters.AddWithValue("@ZIP_CODE", model.zipCode);
                    command.Parameters.AddWithValue("@PHONE_NUMBER", model.phone);
                    command.Parameters.AddWithValue("@EMAIL", model.email);
                    command.Parameters.AddWithValue("@TYPE", model.type);
                    connection.Open();
                    var result = command.ExecuteNonQuery();
                    connection.Close();
                    Console.WriteLine("Data Added Successfully");
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }
}
