﻿using System;
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
            
            var anexo = @"D:\EnviodeEmails\EnviodeEmails\Program.cs";
            System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
            //client.Host = "smtp.gmail.com";
            client.Host = "outlook.office365.com";
            client.Port = 587;
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential("SeuEmail", "SuaSenha");
            MailMessage mail = new MailMessage();
            mail.Sender = new System.Net.Mail.MailAddress("edyfontes@hotmail.com", "ENVIADOR");
            mail.From = new MailAddress("edyfontes@hotmail.com", "ENVIADOR");
            mail.To.Add(new MailAddress("Destinatario", "RECEBEDOR"));
            mail.To.Add(new MailAddress("vinicius.santana@interfile.com.br", "RECEBEDOR"));
            mail.Subject = "Teste email";
            mail.Body = $"Olá, Vini <br/> <p>Segue em anexo arquivo ensinando a enviar e-mail em C# </p>" ;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;

            Attachment anexado = new Attachment(anexo, MediaTypeNames.Application.Octet);
            mail.Attachments.Add(anexado);
            try
            {
                client.Send(mail);
            }
            catch (System.Exception erro)
            {
                Console.WriteLine("Falha!");
            }
            finally
            {
                mail = null;
            }
        }
    }
}
