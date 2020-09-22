VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Mouse Reverse"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "exit"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   735
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   480
      Top             =   2160
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'--------------------------------------------------------------------------------
' Component  : MouseReverse
' Created by : Flex
' Machine    : ALEX
' Date-Time  : 17-6-2005 - 15:35:01
' Description: Reverses the mouse!
'--------------------------------------------------------------------------------
Private Declare Function GetCursorPos Lib "user32" (lpPoint As _
POINTAPI) As Long

Private Type POINTAPI
    x As Long
    y As Long
End Type
Dim a As POINTAPI
Dim b As Long
Dim c As Long

Dim CurX As Long
Dim CurY As Long
Dim Verschil As Long

Private Declare Function SetCursorPos Lib "user32" (ByVal x As Long, ByVal y As Long) As Long





Private Sub Command1_Click()
End
End Sub

Private Sub Form_Load()
    ret = GetCursorPos(a)
    CurX = a.x
    CurY = a.y
End Sub

Private Sub Timer1_Timer()
    On Error Resume Next
    ret = GetCursorPos(a)
    b = a.x
    c = a.y
    
    If b <> CurX Then
        Verschil = b - CurX
        CurX = CurX - Verschil
        If CurX <= 0 Then CurX = 5
        If CurX >= (Screen.Width / Screen.TwipsPerPixelX) Then CurX = (Screen.Width / Screen.TwipsPerPixelX) - 5
    End If
    If c <> CurY Then
        Verschil = c - CurY
        CurY = CurY - Verschil
        If CurY <= 0 Then CurY = 5
        
        If CurY >= (Screen.Height / Screen.TwipsPerPixelY) Then CurY = (Screen.Height / Screen.TwipsPerPixelY) - 5
    End If
    SetCursorPos CurX, CurY
End Sub









