using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";

        SqlCommand cmdInsert = new SqlCommand();
        cmdInsert.Connection = cn;
        cmdInsert.CommandType = CommandType.StoredProcedure;
        cmdInsert.CommandText = "RegisterUser";

        cmdInsert.Parameters.AddWithValue("@User_id", txt_u_name.Text);
        cmdInsert.Parameters.AddWithValue("@Name", txt_name.Text);
        cmdInsert.Parameters.AddWithValue("@Email", txt_email.Text);
        cmdInsert.Parameters.AddWithValue("@Mobileno", txt_mobno.Text);
        cmdInsert.Parameters.AddWithValue("@Password", txt_pwd.Text);
        cmdInsert.Parameters.AddWithValue("@Address", txt_address.Text);
        cmdInsert.Parameters.AddWithValue("@Area", DropDownList1.SelectedValue);


        cn.Open();
        int res =cmdInsert.ExecuteNonQuery();
        cn.Close();

        if(res == 1)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            Label11.Text = "Enter valid Info";
        }
    }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

    }