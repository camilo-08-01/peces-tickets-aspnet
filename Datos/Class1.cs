using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class ClienteEntity
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public string Nombre { get; set; }
        public string Rut { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }

    }

    public class PersonaNaturalEntity : ClienteEntity
    {

    }

    public class EmpresaEntity : ClienteEntity
    {
        public string RazonSocial { get; set; }
    }

    public class TicketEntity
    {
        public string Id { get; set; } = Guid.NewGuid().ToString();
        public ClienteEntity Cliente { get; set; }

        public string Producto { get; set; }
        public string Descripcion { get; set; }
        public string Estado { get; set; }
        private DateTime _createdAt { get; set; } = DateTime.Now;
        public DateTime RetornarCreatedAt()
        {
            return _createdAt;
        }
    }

    public static class TicketEntityCollection
    {
        private static List<TicketEntity> _listadoTickets = new List<TicketEntity>();
        public static List<TicketEntity> ListadoTicket
        {
            get { return _listadoTickets; }
            set { _listadoTickets = value; }
        }
    }
}
