<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CrearCuenta.aspx.cs" Inherits="Meraki.CrearCuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        
        body {
            background-color: #ffffff;
        }
    
        h1 {
            color: #079ea4; 
            font-family: 'Arial', sans-serif; 
            font-size: 2rem; 
            text-align: left; 
            margin-top: 20px; 
            margin-left: 250px;
        }

    </style>    
    <h1>Crear Cuenta</h1>
    <style>
        .camposCrear 
        {
            display: flex;
            align-items: center; 
            margin-bottom: 10px; 
        }

        .labelCrear
        {
            color: #079ea4; 
            font-family: 'Arial', sans-serif; 
            font-size: 1rem; 
            text-align: center; 
            margin-top: 20px; 
            margin-right: 50px !important;
            margin-left: 50px;
            width: 450px;
            text-align: right;
        }
        .textboxCrear
        {
            display:inline-block;
        }
        .btnCrearCuenta
        {
            background-color: #079ea4; 
            color: white; 
            border: none; 
            border-radius: 10px; 
            padding: 10px 20px; 
            font-size: 1rem; 
            font-family: 'Arial', sans-serif; 
            cursor: pointer; 
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); 
            transition: background-color 0.3s ease; 
            text-align: center; 
        }

        .DivBoton 
        {
            margin-left: 450px;
            margin-top: 50px; 
        }
    </style>

<div class="camposCrear">
    <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtNombre_" runat="server" CssClass="textboxCrear"></asp:TextBox>
</div>

<div class="camposCrear">
    <asp:Label ID="lblApellido" runat="server" Text="Apellidos:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtApellido" runat="server" CssClass="textboxCrear"></asp:TextBox>
</div>

<div class="camposCrear">
    <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de nacimiento:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="textboxCrear"></asp:TextBox>
</div>

<div class="camposCrear">
    <asp:Label ID="lblRUN" runat="server" Text="RUN:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtRUN" runat="server" CssClass="textboxCrear"></asp:TextBox>
</div>

<div class="camposCrear">
    <asp:Label ID="lblCorreo" runat="server" Text="Correo Electrónico:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtCorreo" runat="server" CssClass="textboxCrear"></asp:TextBox>
</div>

<div class="camposCrear">
    <asp:Label ID="Contraseña" runat="server" Text="Contraseña" CssClass="labelCrear" ></asp:Label>
    <asp:TextBox ID="txtContraseña" runat="server" CssClass="textboxCrear"></asp:TextBox>
</div>

<div class="camposCrear">
    <asp:Label ID="ConfirmaContra" runat="server" Text="Confirmar Contraseña:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtConfirmaContra" runat="server" CssClass="textboxCrear"></asp:TextBox>
</div>

<div class="DivBoton">
    <asp:Button ID="Button1" runat="server" Text="Crear Cuenta" CssClass="btnCrearCuenta" />

</div>
</asp:Content>

