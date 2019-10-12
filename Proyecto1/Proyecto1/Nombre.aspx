<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nombre.aspx.cs" Inherits="Proyecto1.Nombre" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="Scripts/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script  src="Scripts/jquery-3.3.1.js"></script>
  <script  src="Scripts/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#tabs" ).tabs();
  });

      $(function () {
          $("#sortable").sortable({
              revert: true
          });
          $("#draggable").draggable({
              connectToSortable: "#sortable",
              helper: "clone",
              revert: "invalid"
          });
          $("ul, li").disableSelection();
      });

      function VerificarNombre() {
          var nombre = document.getElementById("lblVerificadorNombre");
          if (document.getElementById("txtNombre").value == "") {
              
              nombre.style.visibility = "visible";
          }
          else {
              nombre.style.visibility = "hidden";
          }
      }

      function VerificarPaterno() {
          var paterno = document.getElementById("lblVerificadorPaterno");
          if (document.getElementById("txtApellidoPaterno").value == "") {

              paterno.style.visibility = "visible";
          }
          else {
              paterno.style.visibility = "hidden";
          }
      }

      function VerificarMaterno() {
          var materno = document.getElementById("lblVerificadorMaterno");
          if (document.getElementById("txtApellidoMaterno").value == "") {

              materno.style.visibility = "visible";
          }
          else {
              materno.style.visibility = "hidden";
              
          }
      }


      $(document).ready(function () {
          var nombre = document.getElementById("lblVerificadorNombre");
          nombre.style.visibility = "hidden";
          var paterno = document.getElementById("lblVerificadorPaterno");
          paterno.style.visibility = "hidden";
          var matenor = document.getElementById("lblVerificadorMaterno");
          matenor.style.visibility = "hidden";
          
      });
      
  </script>

</head>
<body>
    <form id="form2" runat="server">
    <div id="tabs">
  <ul id="sortable">
    <li><a href="#tabs-1" >Conexion</a></li>
    <li id="liMostrar" runat="server" Visible="false" ><a href="#tabs-2"  >Mostrar</a></li>
    <li id="liNuevo" runat="server" Visible="false"><a href="#tabs-3">Nuevo</a></li>
    <li id="liEliminar" runat="server" Visible="false"><a href="#tabs-4">Eliminar</a></li>
  </ul>
  <div id="tabs-1">
    <asp:Button ID="btnConexion" class="btn btn-success" runat="server" OnClick="btnConexion_Click" Text="Conectar" />
  </div>
  <div id="tabs-2">
      
            <asp:GridView ID="GvNombre"  runat="server"  AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None"    >
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                
        </asp:GridView>
           
  </div>
        
  <div id="tabs-3">

 <div id="formulario" runat="server" visible="false" style="text-align:center;display:table-cell;padding-left:500px">
     <div style="background-color:#B89D55">
         <strong>Datos del usuario</strong>
     
     <div style="background-color:#FCD97A">
        <asp:Label ID="lblNombre"  runat="server" Text="Nombre"></asp:Label>
        <asp:TextBox ID="txtNombre" class="form-control" onblur="VerificarNombre()"   Width="250" runat="server"></asp:TextBox>
        <asp:Label ID="lblVerificadorNombre"   runat="server" Text="Este campo es obligatorio" ForeColor="Red" ></asp:Label>
       
        <br />
        <asp:Label ID="lblApellidoPaterno" runat="server"   Text="Apellido paterno"></asp:Label>
        <asp:TextBox ID="txtApellidoPaterno" class="form-control" onblur="VerificarPaterno()" Width="250" runat="server"></asp:TextBox>
       <asp:Label ID="lblVerificadorPaterno"  runat="server" Text="Este campo es obligatorio" ForeColor="Red" ></asp:Label>
        <br />
        <asp:Label ID="lblApellidoMaterno" runat="server" Text="Apellido materno"></asp:Label>
        <asp:TextBox ID="txtApellidoMaterno" class="form-control" onblur="VerificarMaterno()" Width="250" runat="server"></asp:TextBox>
        <asp:Label ID="lblVerificadorMaterno"  runat="server" Text="Este campo es obligatorio" ForeColor="Red" ></asp:Label>
     <br />
     <asp:Button ID="btnNuevo" ValidationGroup="Nuevo"   runat="server" class="btn btn-success"  Visible="false" Text="Nuevo" OnClick="btnNuevo_Click" />
      </div>
         </div>
          </div>
     </div>
        
            
        <div id="tabs-4">
        <asp:Label ID="lblId" runat="server" Text="Id" Visible="false"></asp:Label>
        <asp:TextBox ID="txtId" class="form-control" Width="100"  TextMode="Number" runat="server" Visible="false"></asp:TextBox>
            <br />
            <asp:Button ID="btnEliminar" runat="server"   class="btn btn-danger"   Text="Eliminar" Visible="false" OnClick="btnEliminar_Click" />
        </div>
</div>
   
        <div>
        </div>
    
        
        
        

   

        <br />

        
    </form>
</body>
</html>
