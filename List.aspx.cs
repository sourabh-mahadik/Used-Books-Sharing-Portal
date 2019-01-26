using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;

public partial class List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbl_userid.Text =Session["user_id"].ToString();

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from Authors";

            cn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            AuthorList.DataSource = dr;
            AuthorList.DataTextField = "Name";
            AuthorList.DataValueField = "Name";
            AuthorList.DataBind();


            cn.Close();
        }
    }


    protected void btnUploadFile_Click(object sender, EventArgs e)
    {
        byte[] bytes;
        using (BinaryReader br = new BinaryReader(fileupload1.PostedFile.InputStream))
        {
            bytes = br.ReadBytes(fileupload1.PostedFile.ContentLength);
        }

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        
        SqlCommand cmdInsert = new SqlCommand();
        cmdInsert.Connection = cn;
        cmdInsert.CommandType = CommandType.Text;
        try
        {
            cmdInsert.CommandText = "insert into Books(User_id, Title, Category, No_of_pages, Publication, Original_price, Selling_price, Exchange, Status_book, Pic, Author) values(@User_id,@Title, @Category,@No_of_pages,@Publication,@Original_price,@Selling_price,@Exchange,@Status_book,@Pic,@author)";

            //cmdInsert.CommandType = CommandType.StoredProcedure;
            //cmdInsert.CommandText = "BookInsert";

            cmdInsert.Parameters.AddWithValue("@User_id", lbl_userid.Text);
            cmdInsert.Parameters.AddWithValue("@Title", txt_title.Text);

            cmdInsert.Parameters.AddWithValue("@Category", DropDownList1.SelectedValue);

            cmdInsert.Parameters.AddWithValue("@No_of_pages", txt_no_of_pages.Text);
            cmdInsert.Parameters.AddWithValue("@Publication", txt_publication.Text);

            cmdInsert.Parameters.AddWithValue("@Original_price", txt_oprice.Text);
            cmdInsert.Parameters.AddWithValue("@Selling_price", txt_sprice.Text);

            cmdInsert.Parameters.AddWithValue("@Exchange", rb_exchange.SelectedValue);
            cmdInsert.Parameters.AddWithValue("@Status_book", rbstatus.SelectedValue);

            cmdInsert.Parameters.AddWithValue("@Pic", bytes);
            //cmdInsert.Parameters.AddWithValue("@author", TextBox1.Text);


            cn.Open();
            cmdInsert.ExecuteNonQuery();
        }
        catch(SqlException ex)
        {
            if (ex.Number == 2627)
            {
                Response.Write("The book already exists! Please enter a new book.");
            }
        }

        

        string[] authors = txt_auth.Text.Split(',');
        foreach (string author in authors)
        {
            cmdInsert = cn.CreateCommand();
            cmdInsert.CommandText = "insert into Authors(Name) values (@Name)";
            cmdInsert.Parameters.AddWithValue("@Name", author);
            cmdInsert.ExecuteNonQuery();
        }
        

        SqlCommand cmd_book_auth = new SqlCommand();
        cmd_book_auth.Connection = cn;
        cmd_book_auth.CommandType = CommandType.Text;
        cmd_book_auth.CommandText = "select Book_id from Books where User_id = @User_id and Title = @Title";
        cmd_book_auth.Parameters.AddWithValue("@User_id", lbl_userid.Text);
        cmd_book_auth.Parameters.AddWithValue("@Title", txt_title.Text);

        SqlDataReader drEmps = cmd_book_auth.ExecuteReader();
        int book_id = 0;
        while (drEmps.Read())
        {
            book_id = (int)drEmps["Book_id"];
        }
        drEmps.Close();

        List<int> author_id = new List<int>();
        List<string> author_list = new List<string>(authors);
        foreach(ListItem item in AuthorList.Items)
        {
            if(item.Selected == true)
            {
                author_list.Add(item.ToString());
            }
        }
            

        //SqlDataReader drEmps1 = cmd_book_auth.ExecuteReader();
        foreach (string author in author_list)
        {
            cmd_book_auth = cn.CreateCommand();
            cmd_book_auth.CommandText = "select Author_id from Authors where Name = @authName";
            cmd_book_auth.Parameters.AddWithValue("@authName", author);
            drEmps = cmd_book_auth.ExecuteReader();
            while(drEmps.Read())
            {
                author_id.Add((int)drEmps["Author_id"]);
            }
            drEmps.Close();

        }
        

        foreach(int author in author_id)
        {
            cmd_book_auth = cn.CreateCommand();
            cmd_book_auth.CommandText = "insert into BookAuth values(@Author_id, @Book_id)";

            cmd_book_auth.Parameters.AddWithValue("@Author_id", author);
            cmd_book_auth.Parameters.AddWithValue("@Book_id", book_id);

            cmd_book_auth.ExecuteNonQuery();
        }
        


        cn.Close();



    }





    //protected void btn_Add_Auth_Click(object sender, EventArgs e)
    //{
    //    SqlConnection cn = new SqlConnection();
    //    cn.ConnectionString = @"Data Source=(LocalDb)\MSSqlLocalDb;Initial Catalog=Suraj;Integrated Security=True;Pooling=False";

    //    SqlCommand cmdInsert = new SqlCommand();
    //    cmdInsert.Connection = cn;
    //    cmdInsert.CommandType = CommandType.Text;

    //    cmdInsert.CommandText = "insert into Authors(Name) values (@Name)";

    //    string[] authors = txt_auth.Text.Split(',');
    //    foreach (string author in authors)
    //    {
    //        cmdInsert.Parameters.AddWithValue("@Name", author);
    //    }
        
    //    cn.Open();
    //    cmdInsert.ExecuteNonQuery();
    //    cn.Close();
      
    //}





  
}