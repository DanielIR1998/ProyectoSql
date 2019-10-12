using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace Proyecto1
{
    public partial class Nombre : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnConexion_Click(object sender, EventArgs e)
        {


            try
            {
                using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection())
                {
                    conn.ConnectionString = "data source=DESKTOP-J8G1AOL\\SQLEXPRESS;Integrated Security=True;Database=Personas;";
                    using (System.Data.SqlClient.SqlCommand command = conn.CreateCommand())
                    {
                        conn.Open();
                        // Create the sample database
                        command.CommandText = "Select * from Nombres";
                        command.CommandType = System.Data.CommandType.Text;
                        this.GvNombre.DataSource = command.ExecuteReader();
                        this.GvNombre.DataBind();
                        conn.Close();
                        liNuevo.Visible = true;
                        liMostrar.Visible = true;
                        liEliminar.Visible = true;
                        formulario.Visible = true;
                        lblId.Visible = true;
                        txtId.Visible = true;
                        btnEliminar.Visible = true;
                        btnNuevo.Visible = true;
                    }
                }



            }
            catch
            {
            }

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            if(txtNombre.Text != "" && txtApellidoPaterno.Text != "" && txtApellidoMaterno.Text != "")
            {

            

            string query = "insert into Nombres(Nombre,ApellidoPaterno,ApellidoMaterno) VALUES(@nombre, @paterno, @materno);";
            SqlConnection conexion = new SqlConnection("data source=DESKTOP-J8G1AOL\\SQLEXPRESS;Integrated Security=True;Database=Personas;");
            conexion.Open();
            SqlCommand comando = new SqlCommand(query, conexion);
            comando.Parameters.AddWithValue("@nombre", txtNombre.Text);
            comando.Parameters.AddWithValue("@paterno", txtApellidoPaterno.Text);
            comando.Parameters.AddWithValue("@materno", txtApellidoMaterno.Text);
            comando.ExecuteNonQuery();
            MessageBox.Show("ingresado");

            }
            else
            {
                MessageBox.Show("Favor de llenar todos los campos");
            }


        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if(txtId.Text != "") { 
            string query = "delete from Nombres where IdNombre = @IdNombre";
            SqlConnection conexion = new SqlConnection("data source=DESKTOP-J8G1AOL\\SQLEXPRESS;Integrated Security=True;Database=Personas;");
            conexion.Open();
            SqlCommand comando = new SqlCommand(query, conexion);
            comando.Parameters.AddWithValue("@IdNombre", txtId.Text);

            comando.ExecuteNonQuery();
            MessageBox.Show("Registro eliminado");
            }
            MessageBox.Show("Favor de llenar el campo vacio");
            
        }
   




    }
}