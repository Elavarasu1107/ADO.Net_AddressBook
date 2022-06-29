using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO.Net_AddressBook
{
    public class AddressBook_Model
    {
        public int id { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string address { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public double zipCode { get; set; }
        public double phone { get; set; }
        public string email { get; set; }
        public string type { get; set; }
        
    }
}
