unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Platform;

type
  TfrmMain = class(TForm)
    pnlHeader: TPanel;
    Rectangle1: TRectangle;
    lblMain: TLabel;
    pnlImages: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  ScreenService: IFMXScreenService;

implementation

{$R *.fmx}



procedure TfrmMain.FormResize(Sender: TObject);
var w, h : single;
begin

//************************************************************************
//                 Codigo que venia en la practica
//************************************************************************

 { verificar si hubo un cambio de orientación
 if self.Width > self.Height then
 begin
 // hubo un cambio de orientación a LandScape
 // orientar el panel 1 a la izquierda
 // el panel 2 se ajustará a lo que quede de espacio (Client)
 // dividir el ancho del panel de imagenes en 2 para
 // ajustar el tamaño de ambas imagenes a través de los paneles
 w := pnlImages.Width / 2;
 Panel1.Align := TAlignLayout.Left;
 Panel1.Width := w;
 end
 else if self.Height > self.Width then
 begin
    // hubo un cambio de orientación a Portrait
    // orientar el panel 1 al Tope
    // el panel 2 se ajustará a lo que quede de espacio (Client)
    h := pnlImages.Height / 2;
    Panel1.Align := TAlignLayout.Top;
    Panel1.Height := h;
  end;
         }

//************************************************************************



   // dividimos la altura y el ancho del panel imagenes y lo alamacenamos en las variables
   // h (Height) y w (Width)

   h := pnlImages.Height / 2;
   w := pnlImages.Width / 2;


   // con la sigueente condicion determinamos si existe alguna orientacion
   if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, // if de orientacion
     ScreenService) then
   begin

   // con el siguiente case determinamos en que orientacion se encuentra la pantalla y
   // cambiamos el texto del lblMain con el nombre de la orientacion, y ajustamos los paneles
     case ScreenService.GetScreenOrientation of     // case para determinar la orientacion

       TScreenOrientation.Portrait:
         begin
           lblMain.Text := 'Portrait';

           Panel1.Align := TAlignLayout.Top;
           Panel1.Height := h;

         end;

       TScreenOrientation.Landscape:
         begin
           lblMain.Text := 'Landscape';

           Panel1.Align := TAlignLayout.Left;
           Panel1.Width := w;

         end;

       TScreenOrientation.InvertedPortrait:
         begin
           lblMain.Text := 'InvertedPortTrait';

           Panel2.Align := TAlignLayout.Top;
           Panel2.Height := h;

         end;

       TScreenOrientation.InvertedLandscape:
         begin
           lblMain.Text := 'InvertedLandscape';

           Panel1.Align := TAlignLayout.Right;
           Panel1.Width := w;

         end;
     end;     // End Case Orientacion
  end ; // End Orientacion

 end; // FormResize

 end.
