echo "Sending mail ..."

$From = "mail@mail.com"
$To = "toMail@mail.com"
$Cc = "copyMail@mail.com"
$Subject = "Your subject"
$Body = "Your Body text"

#Cred's for sending
$SMTPServer = "smtp.mail.com"
$SMTPPort = "587"
$username = "mail@mail.com"
$password = "pwd"

#some magic for auth
$secstr = New-Object -TypeName System.Security.SecureString
$password.ToCharArray() | ForEach-Object {$secstr.AppendChar($_)}
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $secstr

Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential $cred

#Write-Host "Your mail has been sent. Press any key to continue ..."
#$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")