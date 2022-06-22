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
        public void ReadData()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            using (connection)
            {
                AddressBook_Model model = new AddressBook_Model();
                try
                {
                    string query = "SELECT * FROM ADDRESS_BOOK";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            model.id = reader.GetInt32(0);
                            model.firstName = reader.GetString(1);
                            model.lastName = reader.GetString(2);
                            model.address = reader.GetString(3);
                            model.city = reader.GetString(4);
                            model.state = reader.GetString(5);
                            model.zipCode = reader.GetDouble(6);
                            model.phone = reader.GetDouble(7);
                            model.email = reader.GetString(8);
                            model.type = reader.GetString(9);

                            Console.WriteLine("ID: " + model.id + "\nFirst Name: " + model.firstName + "\nLast Name: " + model.lastName +
                                "\nAddress" + model.address + "\nCity: " + model.city + "\nState:" + model.state + "\nZip Code: " + model.zipCode
                                + "\nPhone: " + model.phone + "\nEmail: " + model.email + "\nType: " + model.type + "\n");
                        }
                    }
                    connection.Close();
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
        public void UpdateTable()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                using (connection)
                {
                    Console.WriteLine("Enter ID");
                    int id = Convert.ToInt32(Console.ReadLine());
                    Console.WriteLine("Enter an Address to Update");
                    string address = Console.ReadLine();
                    SqlCommand command = new SqlCommand("UpdateTable", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ADDRESS", address);
                    command.Parameters.AddWithValue("@ID", id);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                    Console.WriteLine("Data Updated Successfully");
                }
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
        public void DeleteData()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            try
            {
                using (connection)
                {
                    Console.WriteLine("Enter ID");
                    int id = Convert.ToInt32(Console.ReadLine());
                    SqlCommand command = new SqlCommand("DeleteData", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ID", id);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                    Console.WriteLine("Data Deleted Successfully");
                }
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
