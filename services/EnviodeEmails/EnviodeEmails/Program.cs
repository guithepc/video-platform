using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace EnviodeEmails
{
    class Program
    {
        static void Main(string[] args)
        {
            var anexo = @"CaminhoDoc\FirstDoccdf.pdf";
            System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
            client.Host = "outlook.office365.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential("e-mail@hotmail.com", "SENHA");
            MailMessage mail = new MailMessage();
            mail.Sender = new System.Net.Mail.MailAddress("edyfontes@hotmail.com", "ENVIADOR");
            mail.From = new MailAddress("edyfontes@hotmail.com", "UHELT");
            mail.To.Add(new MailAddress("edycontas@gmail.com", "RECEBEDOR"));
            mail.To.Add(new MailAddress("2001arthur.rocha@gmail.com", "RECEBEDOR"));
            mail.To.Add(new MailAddress("vinicius.santana@interfile.com.br", "RECEBEDOR"));
            mail.Subject = "Receituário Médico - ";
            mail.Body = $"Olá, Arthur <br/> <p>Segue em anexo sua receita médica </p>" ;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;

            Attachment anexado = new Attachment(anexo, MediaTypeNames.Application.Octet);
            mail.Attachments.Add(anexado);
            try
            {
                client.Send(mail);
            }
            catch (Exception erro)
            {
                Console.WriteLine($"Falha!... {erro}");
            }
            finally
            {
                mail = null;
            }
        }
    }
}
