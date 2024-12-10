<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Meraki.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
    .video_contenedor 
    {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        z-index: -1;
    }

        .video_fondo 
    {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

        body 
    {
        margin: 0;
        background-color: #ffffff;
        overflow-x: hidden;
    }

        .Contenido 
        {
            position: relative;
            z-index: 1; /* Asegura que el contenido esté por encima del video */
            background: white; /* Fondo blanco sólido */
            padding: 50px; /* Espaciado interno */
            border-radius: 10px; /* Bordes redondeados */
            max-width: 850px; /* Ancho máximo del contenedor */
            margin: 20px auto; /* Centra el contenedor horizontal y verticalmente */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); /* Sombra suave */
            
        }
    
        h1 
        {
            color: #079ea4; 
            font-family: 'Arial', sans-serif; 
            font-size: 2rem; 
            text-align: center; 
            margin-top: 20px; 
            margin-left: 80px;
        }

        .camposCrear 
        {
            display: flex;
            align-items: center; 
            margin-bottom: 10px; 
            justify-content: flex-start; /* Alineación horizontal */
            align-items: center; /* Alineación vertical */
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

        .textboxCrear
        {
            display:inline-table;
            width: 450px; /* Ancho */
            height: 20px; /* Alto */
            font-size: 16px; /* Tamaño de la fuente */
            padding: 5px; /* Espaciado interno */
            border: 1px solid #ccc; /* Borde */
            border-radius: 5px; /* Bordes redondeados */
            text-align:center;
            flex-grow: 1; 
            margin-left: 5px

        }

        .btnIniciarSesion
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

        .mensajeError 
        {
            color: red;
            font-weight: bold;
            font-size: 14px;
            background-color: #ffe6e6; /* Fondo rojo claro */
            padding: 5px;
            border-radius: 5px;
            border: 1px solid red;
            vertical-align: top;
            display: inline-block;
            min-height: 20px; /* Reserva el espacio para el mensaje */
            width: 300px; /* Asegura que todos los mensajes tengan el mismo ancho */
            visibility: hidden; /* Esconde los mensajes por defecto */
        }

        .mensajeError.visible 
        {
            visibility: visible; /* Hace visible el mensaje cuando hay error */
        }

        .mensajeTexto 
        {
            color: black; 
            font-weight: bold; 
            font-size: 1.2rem; 
            margin-top: 10px; 
            display: block; 
            text-align: center; 
        }

        .mensajeExito 
        {
        min-height: 20px; /* Reserva espacio */
        width: 300px; /* Asegura un ancho uniforme */
        display: inline-block; /* Mantiene el espacio aunque esté vacío */
        margin-top: 5px;
        text-align: center;
        font-size: 14px;
        font-weight: bold;
        border-radius: 5px;
        margin: 0 auto;
        }

        .mensajeExito 
        {
        visibility: hidden;  
        background-color: #e6ffe6;
        color: green;
        padding: 5px;
        border: 1px solid green;
        }

        .mensajeExito.visible 
        {
        visibility: visible; /* Hace visible el mensaje */
        }
</style>

    <div class="video_contenedor">
        <video class="video_fondo" autoplay muted loop>
        <source src="Fondo_Animado.mp4" type="video/mp4" />
        </video>
    </div>

<div class="Contenido">
   <h1>Iniciar Sesión</h1>

    <asp:Panel ID="pnlLogin" runat="server" DefaultButton="btnIniciarSesion">
    <div class="camposCrear">
        <asp:Label ID="lblUsuario" runat="server" Text="Usuario:" CssClass="labelCrear"></asp:Label>
        <asp:TextBox ID="txtUsuario" runat="server" CssClass="textboxCrear"></asp:TextBox>
        <asp:RequiredFieldValidator 
        ID="Req_Usuario" 
        runat="server" 
        ControlToValidate="txtUsuario"
        CssClass="mensajeError"
        ErrorMessage="Por favor ingrese su usuario.">
    </asp:RequiredFieldValidator>
    </div>

    <div class="camposCrear">
        <asp:Label ID="lblContraseña" runat="server" Text="Contraseña:" CssClass="labelCrear"></asp:Label>
        <asp:TextBox ID="txtContraseña" runat="server" CssClass="textboxCrear" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator 
        ID="Req_Contraseña" 
        runat="server" 
        ControlToValidate="txtContraseña"
        CssClass="mensajeError"
        ErrorMessage="Por favor ingrese su contraseña.">
    </asp:RequiredFieldValidator>
    </div>

    <div class="DivBoton">
        <asp:Button ID="btnIniciarSesion" runat="server" Text="Ingresar" CssClass="btnIniciarSesion" CausesValidation="false" OnClick="btnIniciarSesion_Click" />
    </div>
    </asp:Panel>
    <asp:Label ID="lblMensajeExito2" runat="server"  CssClass="mensajeExito" Visible="false"></asp:Label>
    <asp:Label ID="lblMensajeError2" runat="server" CssClass="mensajeError"  Visible="false"></asp:Label>
</div>
<div class="MensajeResultado">
    <asp:Label ID="Label1" runat="server" CssClass="mensajeExito" Visible="false"></asp:Label>
    <asp:Label ID="Label2" runat="server" CssClass="mensajeError" Visible="false"></asp:Label>
</div>
</asp:Content>
