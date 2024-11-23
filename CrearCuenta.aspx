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

        #textboxDV
        {
            width: 20px; /* Ajusta el ancho según sea necesario */
            text-align: center; /* Centra el texto dentro del TextBox */
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

        .mensajeTexto 
        {
            color: black; /* Letra negra */
            font-weight: bold; /* Negrita */
            font-size: 1.2rem; /* Un poco más grande que el tamaño base */
            margin-top: 10px; /* Separación superior */
            display: block; /* Asegura que se muestre en una línea independiente */
            text-align: center; /* Centrar el texto */
        }

    </style>

<div class="camposCrear">
    <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtNombre_" runat="server" CssClass="txtNombre"></asp:TextBox>
    <asp:RequiredFieldValidator
     ID="Req_Nombre" 
     runat="server" CssClass="val"
    ErrorMessage="Este campo es obligatorio" ControlToValidate="txtNombre_">
    </asp:RequiredFieldValidator>
</div>

<div class="camposCrear">
    <asp:Label ID="lblApellido" runat="server" Text="Apellidos:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtApellidos" runat="server" CssClass="textboxCrear"></asp:TextBox>
    <asp:RequiredFieldValidator
     ID="Req_Apellidos" 
     runat="server" CssClass="val"
    ErrorMessage="Este campo es obligatorio" ControlToValidate="txtApellidos">
    </asp:RequiredFieldValidator>

</div>

<div class="camposCrear">
    <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de nacimiento:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="textboxCrear"></asp:TextBox>
    <asp:RequiredFieldValidator
     ID="Req_Fecha_Nacimiento" 
     runat="server" CssClass="val"
    ErrorMessage="Este campo es obligatorio" ControlToValidate="txtFechaNacimiento">
    </asp:RequiredFieldValidator>
</div>

<div class="camposCrear">
    <asp:Label ID="lblRUN" runat="server" Text="RUN:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtRUN" runat="server" CssClass="textboxCrear"></asp:TextBox>
    <asp:Label ID="lblGuion" runat="server" Text="-" ></asp:Label>
    <asp:TextBox ID="txtDV" runat="server"  CssClass="textboxDV" Width="20px" MaxLength="1"></asp:TextBox>
    <asp:RequiredFieldValidator
     ID="Req_RUN" 
     runat="server" CssClass="val"
    ErrorMessage="Este campo es obligatorio" ControlToValidate="txtRUN" >
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator
     ID="Req_DV" 
     runat="server" CssClass="val"
     ControlToValidate="txtDV">
    </asp:RequiredFieldValidator>
</div>


<div class="camposCrear">
    <asp:Label ID="lblCorreo" runat="server" Text="Correo Electrónico:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtCorreo" runat="server" CssClass="textboxCrear"></asp:TextBox>
</div>

<div class="camposCrear">
    <asp:Label ID="Contraseña" runat="server" Text="Contraseña" CssClass="labelCrear" ></asp:Label>
    <asp:TextBox ID="txtContraseña" runat="server" CssClass="textboxCrear" TextMode="Password"></asp:TextBox>
</div>

<div class="camposCrear">
    <asp:Label ID="ConfirmaContra" runat="server" Text="Confirmar Contraseña:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtConfirmaContra" runat="server" CssClass="textboxCrear" TextMode="Password"></asp:TextBox>
</div>

<div class="DivBoton">
    <asp:Button ID="Button1" runat="server" Text="Crear Cuenta" CssClass="btnCrearCuenta" OnClick="btnCrearCuenta_Click" />
</div>

<div class="mensaje">
<asp:Label ID="lblMensaje" runat="server" CssClass="mensajeTexto"></asp:Label>
</div>
</asp:Content>

