<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AdminCuentas.aspx.cs" Inherits="Meraki.AdminCuentas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Menú Colapsable</title>
  <link rel="stylesheet" href="styles.css">
<!-- CSS de Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- JavaScript de Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
    .Contenido 
    {
        position: relative;
        z-index: 1; /* Asegura que el contenido esté por encima del video */
        background: white; /* Fondo blanco sólido */
        padding: 0px; /* Espaciado interno */
        border-radius: 10px; /* Bordes redondeados */
        max-width: 1250px; /* Ancho máximo del contenedor */
        margin: 20px auto; /* Centra el contenedor horizontal y verticalmente */
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); /* Sombra suave */
    }
    
    h3 
    {
        color: #079ea4; 
        font-family: 'Arial', sans-serif; 
        font-size: 2rem; 
        text-align: center; 
        margin-top: 20px; 
        padding: 10px;
        
    }

    .labelCrear
    {
        color: #079ea4; 
        font-family: 'Arial', sans-serif; 
        font-size: 1.2rem; 
        text-align: left; 
        margin-top: 20px; 
        margin-left:180px;
        width: 400px;
        font-weight: bold;
    }

    .btnCrearCuenta
    {
        background-color: #079ea4; 
        color: white; 
        border: none; 
        border-radius: 10px; 
        padding: 7px 20px; 
        margin-left:20px;
        font-size: 1rem; 
        font-family: 'Arial', sans-serif; 
        cursor: pointer; 
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); 
        transition: background-color 0.3s ease; 
        text-align: center; 
    }


            .textboxCrear
        {
            display:inline-table;
            width: 400px; /* Ancho */
            height: 35px; /* Alto */
            font-size: 16px; /* Tamaño de la fuente */
            padding: 5px; /* Espaciado interno */
            border: 1px solid #ccc; /* Borde */
            border-radius: 5px; /* Bordes redondeados */
            text-align:center;
            flex-grow: 1; 
            margin-left: 85px

        }

            .camposCrear 
        {
            /*display: flex;*/
            align-items: center; 
            margin-bottom: 10px; 
            justify-content: flex-start; /* Alineación horizontal */
            align-items: center; /* Alineación vertical */
            padding:20px;

        }

 
        .Menu 
        {
            text-decoration: none;
            padding: 10px 20px;
            display: inline-block;
            margin-right: 20px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif  ; 
            background-color: #079ea4;  
            color: white;
            height: 100%;  /*El menú ocupa el 100% del alto de su contenedor */
            overflow-y: auto;  /*Scroll si el contenido del menú es más alto que el contenedor*/ 

        
        }

        .Menu a 
        {
            color: white; /* Hace que el texto de los enlaces sea blanco */
            text-decoration: none; /* Quita el subrayado */
        }

        .Menu a:hover 
        {
            color: #ddd; /* Cambia el color cuando el mouse pasa sobre el enlace */
        }


        .mensajeError
        {
            min-height: 20px; /* Reserva espacio */
            width: 300px; /* Asegura un ancho uniforme */
            display: inline-block; /* Mantiene el espacio aunque esté vacío */
            margin-top: 5px;
            text-align: left;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            align-items: center;
            padding: 5px;
            margin-left: 85px;
        }

        .checkboxMostrarTodo
        {
            color: #079ea4; 
            font-family: 'Arial', sans-serif; 
            font-size: 1.2rem; 
            text-align: left; 
            margin-top: 20px; 
            margin-left:160px;
            width: 400px;
            font-weight: bold;
            padding-left:20px;

        }

        .checkboxMostrarTodo input[type="checkbox"] 
        {
            width: 20px; /* Ancho del CheckBox */
            height: 20px; /* Alto del CheckBox */
            accent-color: #079ea4; /* Color personalizado del CheckBox */
            padding-left:20px;
        }



</style>

<div class="Contenido">
       <h3>Administrar Cuentas</h3>
    <br />
<table style="width: 100%; border-collapse: collapse; table-layout: fixed; padding-top:50px;">
    <tr>
        <!-- Columna 1: Menú -->
        <td style="background-color: #079ea4; padding: 10px; width: 260px; vertical-align: top; padding-top: 50px;">
            <asp:Menu ID="Menu3" runat="server" CssClass="Menu" Orientation="Vertical">
                <Items>
                    <asp:MenuItem Text="○ Lista usuarios registrados" Value="PanelUsuarios" />
                    <asp:MenuItem Text="○ Gestión de roles y permisos" Value="~/Permisos" />
                    <asp:MenuItem Text="○ Gestión de cuentas" Value="~/GestionCuentas" />
                </Items>
            </asp:Menu>
        </td>

        <!-- Columna 2: GridView -->
        <asp:Panel ID="PanelUsuarios" runat="server">
        <td style="padding: 20px; vertical-align: top;">
                <div class="camposCrear">
    <asp:TextBox ID="txtBuscarUsuario" runat="server" CssClass="textboxCrear"></asp:TextBox>
        <asp:Button ID="btnBuscarUsuario" runat="server" Text="Buscar usuario" OnClick="ButtonBuscar_Click" CssClass="btnCrearCuenta" />
        <asp:Label ID="LabelMensajeError" runat="server" CssClass="mensajeError" ></asp:Label>
    <br />
    <asp:CheckBox ID="CheckBoxMostrarTodo" runat="server" Text="Mostrar todas las cuentas registradas" 
    AutoPostBack="True" OnCheckedChanged="CheckBoxMostrarTodos_CheckedChanged" CssClass="checkboxMostrarTodo" />


    </div>
            <asp:GridView ID="GridViewDatosUsuario" runat="server" AutoGenerateColumns="True" Visible="False"
                Style="width: 100%; border: 1px solid #ddd;" />
        </td>
        </asp:Panel>
    </tr>
</table>


      <%--  <table>
        <tr>
        <td colspan="8" style="background-color: #079ea4; padding: 10px; width:250px; height:100%;   display: flex;
  flex-direction: column;">
        <br />
            <asp:Menu ID="Menu3" runat="server" CssClass="Menu" Orientation="Horizontal">
                <Items>
            <asp:MenuItem Text="○ Lista usuarios registrados" NavigateUrl="~/Usuarios" />
            
            <asp:MenuItem Text="○ Gestión de roles y permisos" NavigateUrl="~/Permisos" />
           
            <asp:MenuItem Text="○ Gestión de cuentas" NavigateUrl="~/GestionCuentas" />
        </Items>
            </asp:Menu>   
        
        </td>
        </tr>
        <th>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
         </th>

        </table>--%>

</div>






    
</asp:Content>
