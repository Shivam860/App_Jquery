using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using Newtonsoft.Json;

namespace App_Jquery_0908
{
    public partial class Reg : System.Web.UI.Page
    {
        static SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static void Insert(String A, String B , String C)
        {
            con.Open();
            SqlCommand com = new SqlCommand("procuser", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@action", "insert");
            com.Parameters.AddWithValue("@u_name",A);
            com.Parameters.AddWithValue("@u_email", B);
            com.Parameters.AddWithValue("@u_password", C);
            com.ExecuteNonQuery();
            con.Close();
        }

        [WebMethod]
        public static string Get()
        {
            string pp = "";
            con.Open();
            SqlCommand com = new SqlCommand("procuser", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@action", "display");
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            pp = JsonConvert.SerializeObject(dt);
            return pp;
        }
    }
}