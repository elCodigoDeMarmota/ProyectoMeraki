<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PanelControl_Jefatura.aspx.cs" Inherits="Meraki.PanelControl_Jefatura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
            .Contenido 
            {
            position: relative;
            z-index: 1; /* Asegura que el contenido esté por encima del video */
            background: white; /* Fondo blanco sólido */
            padding: 50px; /* Espaciado interno */
            border-radius: 10px; /* Bordes redondeados */
            max-width: 850px; /* Ancho máximo del contenedor */
            margin: 40px auto; /* Centra el contenedor horizontal y verticalmente */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); /* Sombra suave */
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

            .ImagenBoton
            {
                margin-right:80px;
                align-items:center; 
            }
</style>
    <div class="Contenido">
        <asp:ImageButton ID="btnIngresarRegistro" runat="server" CssClass="ImagenBoton"
            ImageUrl="~/IngresarRegistro.png" OnClick="btnIngresarRegistro_Click" />   
        
        <asp:ImageButton ID="btnDashboard" runat="server" CssClass="ImagenBoton"
            ImageUrl="~/Dashboard.png" OnClick="btnDashboard_Click"/>

        <asp:ImageButton ID="btnAdminCuentas" runat="server" CssClass="ImagenBoton"
           ImageUrl="~/AdminCuentas.png" OnClick="btnAdminCuentas_Click" />

    </div>
</asp:Content>
