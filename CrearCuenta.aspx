<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CrearCuenta.aspx.cs" Inherits="Meraki.CrearCuenta" %>
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
    
        h1 {
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

        

        .textboxRUN
        {
            display:flex;
            width: 250px; /* Ancho */
            height: 20px; /* Alto */
            font-size: 16px; /* Tamaño de la fuente */
            padding: 5px; /* Espaciado interno */
            border: 1px solid #ccc; /* Borde */
            border-radius: 5px; /* Bordes redondeados */
            text-align: center; /* Centra el texto dentro del TextBox */
            flex-grow: 1; 

        }

        .textboxDV
        {
            display:flex;
            width: 34px; /* Ajusta el ancho según sea necesario */
            height: 20px; /* Alto */
            text-align: center; /* Centra el texto dentro del TextBox */
            font-size: 16px; /* Tamaño de la fuente */
            padding: 5px; /* Espaciado interno */
            border: 1px solid #ccc; /* Borde */
            border-radius: 5px; /* Bordes redondeados */
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

        .mensajeTexto 
        {
            color: black; 
            font-weight: bold; 
            font-size: 1.2rem; 
            margin-top: 10px; 
            display: block; 
            text-align: center; 
        }

        
        .mensajeError
        {
        min-height: 20px; /* Reserva espacio */
        width: 300px; /* Asegura un ancho uniforme */
        display: inline-block; /* Mantiene el espacio aunque esté vacío */
        margin-top: 5px;
        text-align: center;
        font-size: 14px;
        font-weight: bold;
        border-radius: 5px;
        align-items: center;
        }

        .mensajeError 
        {
        visibility: hidden;/**/ /* Oculta el mensaje pero reserva espacio */
        background-color: #ffe6e6;
        color: red;
        padding: 5px;
        border: 1px solid red;
        margin: 0 auto;
        }

        .mensajeError.visible 
        {
        visibility: visible; /* Hace visible el mensaje cuando hay error */
        }

        .EspacioReservado
        {
            visibility: hidden;
            padding: 5px;
            width: 300px;
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

        .mensajeError2
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
            display: none
        }

    </style>

<div class="video_contenedor">
<video class="video_fondo" autoplay muted loop>
<source src="Fondo_Animado.mp4" type="video/mp4" />
</video>
</div>

<div class="Contenido">
   <h1>Crear Cuenta</h1>
    

    <div class="camposCrear">
        <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="labelCrear"></asp:Label>
        <asp:TextBox ID="txtNombre_" runat="server" CssClass="textboxCrear" ></asp:TextBox>
        <asp:RequiredFieldValidator
         ID="Req_Nombre" 
         runat="server" CssClass="mensajeError"
        ErrorMessage="Este campo es obligatorio" ControlToValidate="txtNombre_">
        </asp:RequiredFieldValidator>
    </div>

    <div class="camposCrear">
        <asp:Label ID="lblApellido" runat="server" Text="Apellidos:" CssClass="labelCrear"></asp:Label>
        <asp:TextBox ID="txtApellidos" runat="server" CssClass="textboxCrear"></asp:TextBox>
        <asp:RequiredFieldValidator
         ID="Req_Apellidos" 
         runat="server" CssClass="mensajeError"
        ErrorMessage="Este campo es obligatorio" ControlToValidate="txtApellidos">
        </asp:RequiredFieldValidator>
    </div>

    <div class="camposCrear">
        <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha de nacimiento:" CssClass="labelCrear"></asp:Label>
        <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="textboxCrear" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator
         ID="Req_Fecha_Nacimiento" 
         runat="server" CssClass="mensajeError"
        ErrorMessage="Este campo es obligatorio" ControlToValidate="txtFechaNacimiento" Type="Date" >
        </asp:RequiredFieldValidator>
    </div>

<div class="camposCrear">
    <asp:Label ID="lblRUN" runat="server" Text="RUN:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtRUN" runat="server" CssClass="textboxRUN"></asp:TextBox>
    <asp:Label ID="lblGuion" runat="server" Text="-"></asp:Label>
    <asp:TextBox ID="txtDV" runat="server" CssClass="textboxDV" MaxLength="1" OnTextChanged="txtDV_TextChanged"></asp:TextBox>

    <!-- CustomValidator para validar ambos campos -->
    <asp:CustomValidator
        ID="CustomVal_RUN_DV" 
        runat="server" 
        CssClass="mensajeError"
        ErrorMessage=""
        OnServerValidate="ValidarRunYDV" 
        Display="Dynamic">
    </asp:CustomValidator>
    <div class="EspacioReservado"> </div> <!-- Espacio reservado -->
</div>


    <div class="camposCrear">
        <asp:Label ID="lblCorreo" runat="server" Text="Correo Electrónico:" CssClass="labelCrear"></asp:Label>
        <asp:TextBox ID="txtCorreo" runat="server" CssClass="textboxCrear"></asp:TextBox>
        <asp:RequiredFieldValidator
         ID="Req_Correo" 
         runat="server" CssClass="mensajeError"
        ErrorMessage="Este campo es obligatorio" ControlToValidate="txtCorreo">
        </asp:RequiredFieldValidator>
    </div>

    <div class="camposCrear">
        <asp:Label ID="Contraseña" runat="server" Text="Contraseña" CssClass="labelCrear" ></asp:Label>
        <asp:TextBox ID="txtContraseña" runat="server" CssClass="textboxCrear" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator
         ID="Req_Contraseña" 
         runat="server" CssClass="mensajeError"
        ErrorMessage="Este campo es obligatorio" ControlToValidate="txtContraseña">
        </asp:RequiredFieldValidator>
    </div>

<div class="camposCrear">
    <asp:Label ID="lblConfirmarContraseña" runat="server" Text="Confirmar Contraseña:" CssClass="labelCrear"></asp:Label>
    <asp:TextBox ID="txtConfirmaContraseña" runat="server" CssClass="textboxCrear" TextMode="Password"></asp:TextBox>
    <div class="EspacioReservado"></div> <!-- Espacio reservado -->
</div>

    <div class="DivBoton">
        <asp:Button ID="btnCrearCuenta" runat="server" Text="Crear Cuenta" CssClass="btnCrearCuenta" OnClick="btnCrearCuenta_Click" CausesValidation="true" />
    </div>

        <asp:Label ID="lblMensajeError2" runat="server" CssClass="mensajeError" ></asp:Label>
        <asp:Label ID="lblMensajeExito2" runat="server" CssClass="mensajeExito" ></asp:Label>

</div>
</asp:Content>

