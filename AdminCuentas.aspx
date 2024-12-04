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
        max-width: 1050px; /* Ancho máximo del contenedor */
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
        padding: 10px 20px; 
        font-size: 1.5rem; 
        font-family: 'Arial', sans-serif; 
        cursor: pointer; 
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); 
        transition: background-color 0.3s ease; 
        text-align: center; 
    }

    .DivBoton 
    {
        text-align:center;
        margin-top: 50px; 
    }

    .toggle-btn 
    {
  background-color: #444;
  color: white;
  border: none;
  width: 100%;
  padding: 10px;
  cursor: pointer;
}
    .content {
  flex-grow: 1;
  padding: 20px;
  margin-left:270px;
}
    .Menu 
    {
        color: white;
        text-decoration: none;
        padding: 10px 20px;
        display: inline-block;
        margin-right: 20px;
        font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif    
        background-color: teal;  Color de fondo 
        color: white;
        height: 100%;  El menú ocupa el 100% del alto de su contenedor 
        overflow-y: auto;  Scroll si el contenido del menú es más alto que el contenedor 
        
    }

    .Menu a 
    {
            color: white;           /* Color del enlace */
            text-decoration: none;  /* Quitar subrayado */
        }

        .Menu a:hover {
            color: #ddd; /* Color al pasar el mouse */
        }
.offcanvas {
    height: 100%; /* El menú desplegable toma el 100% del alto */
    max-height: 100%; /* Evita que exceda el alto máximo del contenedor */
    box-sizing: border-box;
    overflow-y: auto; /* Habilita scroll si el contenido es muy largo */
}
</style>

<div class="Contenido">
       <h3>Administrar Cuentas</h3>

<table style="width: 100%; border-collapse: collapse; table-layout: fixed; padding-top:50px;">
    <tr>
        <!-- Columna 1: Menú -->
        <td style="background-color: #079ea4; padding: 10px; width: 250px; vertical-align: top; padding-top: 50px;">
            <asp:Menu ID="Menu3" runat="server" CssClass="Menu" Orientation="Vertical">
                <Items>
                    <asp:MenuItem Text="○ Lista usuarios registrados" NavigateUrl="~/Usuarios" />
                    <asp:MenuItem Text="○ Gestión de roles y permisos" NavigateUrl="~/Permisos" />
                    <asp:MenuItem Text="○ Gestión de cuentas" NavigateUrl="~/GestionCuentas" />
                </Items>
            </asp:Menu>
        </td>

        <!-- Columna 2: GridView -->
        <td style="padding: 20px; vertical-align: top;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True" 
                Style="width: 100%; border: 1px solid #ddd;" />
        </td>
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
