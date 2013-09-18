Public Class _Default
    Inherits Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Label3.Text = ""
        Label4.Text = ""




    End Sub

  

    
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Label3.Text = TextBox1.Text
        Label4.Text = TextBox2.Text


    End Sub

 
    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles TextBox1.TextChanged

    End Sub
    



End Class