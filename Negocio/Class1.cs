using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class Cliente
    {
        public string Id { get; set; }
        public string Nombre { get; set; }
        public string Rut {  get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
    }

    public class PersonaNatural : Cliente { }

    public class Empresa : Cliente
    {
        public string RazonSocial { get; set; }
    }

    public class Ticket
    {
        public string Id { get; set; }
        public Cliente Cliente { get; set; }
        public string Producto { get; set; }
        public string Descripcion { get; set; }
        public string Estado { get; set; }
        private DateTime _createdAt {  get; set; } = DateTime.Now;
        public DateTime RetornarCreatedAt() { return _createdAt; }
    }

    public static class TicketController
    {
        public static string Create (Ticket ticket)
        {
            ClienteEntity clienteEntity; // se crea ClienteEntity de acuerdo al tipo de cliente recibido

            if (ticket.Cliente is Empresa empresa)
            {
                clienteEntity = new EmpresaEntity
                {
                    Id = empresa.Id,
                    Nombre = empresa.Nombre,
                    Rut = empresa.Rut,
                    Telefono = empresa.Telefono,
                    Email = empresa.Email,
                    RazonSocial = empresa.RazonSocial
                };
            }
            else if (ticket.Cliente is PersonaNatural personaNatural)
            {
                clienteEntity = new PersonaNaturalEntity
                {
                    Id = personaNatural.Id,
                    Nombre = personaNatural.Nombre,
                    Rut = personaNatural.Rut,
                    Telefono = personaNatural.Telefono,
                    Email = personaNatural.Email
                };
            }
            else
            {
                return "El ticket no pudo ser agregado";
            }

            TicketEntity ticketEntity = new TicketEntity // transforma Ticket(negocio) a TicketEntity (datos)
            {
                Cliente = clienteEntity,
                Producto = ticket.Producto,
                Descripcion = ticket.Descripcion,
                Estado = ticket.Estado
            };

            TicketEntityCollection.ListadoTicket.Add(ticketEntity); //se agrega a la lista en memoria

            return "El ticket fue agregado con éxito";
        }

        public static Ticket Read(string id)
        {
            // Busca el TicketEntity en la lista con Find
            TicketEntity ticketEntity = TicketEntityCollection.ListadoTicket.Find(t =>  t.Id == id);

            if (ticketEntity == null)
            {
                return null;
            }

            // crear Cliente (negocio) según el tipo de ClienteEntity encontrado
            Cliente cliente;

            if (ticketEntity.Cliente is EmpresaEntity empresaEntity)
            {
                cliente = new Empresa
                {
                    Id = empresaEntity.Id,
                    Nombre = empresaEntity.Nombre,
                    Rut = empresaEntity.Rut,
                    Telefono = empresaEntity.Telefono,
                    Email = empresaEntity.Email,
                    RazonSocial = empresaEntity.RazonSocial
                };
            }
            else if (ticketEntity.Cliente is PersonaNaturalEntity personaNaturalEntity)
            {
                cliente = new PersonaNatural
                {
                    Id = personaNaturalEntity.Id,
                    Nombre = personaNaturalEntity.Nombre,
                    Rut = personaNaturalEntity.Rut,
                    Telefono = personaNaturalEntity.Telefono,
                    Email = personaNaturalEntity.Email
                };
            }
            else
            {
                cliente = null;
            }

            // Transformar TicketEntity a Ticket(negocio)
            Ticket ticket = new Ticket
            {
                Id = ticketEntity.Id,
                Cliente = cliente,
                Producto = ticketEntity.Producto,
                Descripcion = ticketEntity.Descripcion,
                Estado = ticketEntity.Estado
            };

            return ticket;
        }

        public static string Update(string id, string producto, string descripcion, string estado, string email, string telefono)
        {
            // Buscar TicketEntity en la lista usando Find
            TicketEntity ticketEntity = TicketEntityCollection.ListadoTicket.Find(t => t.Id == id);

            if (ticketEntity == null)
            {
                return "El ticket no pudo ser actualizado";
            }

            // Actualizar propiedades del ticket
            ticketEntity.Producto = producto;
            ticketEntity.Descripcion = descripcion;
            ticketEntity.Estado = estado;

            // Actualizar propiedades del cliente
            ticketEntity.Cliente.Email = email;
            ticketEntity.Cliente.Telefono = telefono;

            return "El ticket fue actualizado con éxito";
        }

        public static string Delete(string id)
        {
            TicketEntity ticketEntity = TicketEntityCollection.ListadoTicket.Find(t => t.Id==id);

            if (ticketEntity == null)
            {
                return "El ticket no pudo ser eliminado";
            }

            TicketEntityCollection.ListadoTicket.Remove(ticketEntity);

            return "El ticket fue eliminado con éxito";
        }

        public static List<Ticket> ReadAll()
        {
            List<Ticket> listadoTickets = new List<Ticket>();

            // Se recorren todos los registros de la capa de Datos
            foreach (TicketEntity ticketEntity in TicketEntityCollection.ListadoTicket)
            {
                Cliente cliente; // Se crea cliente (negocio) según el tipo de ClienteEntity encontrado

                if (ticketEntity.Cliente is EmpresaEntity empresaEntity)
                {
                    cliente = new Empresa
                    {
                        Id = empresaEntity.Id,
                        Nombre = empresaEntity.Nombre,
                        Rut = empresaEntity.Rut,
                        Telefono = empresaEntity.Telefono,
                        Email = empresaEntity.Email,
                        RazonSocial = empresaEntity.RazonSocial
                    };
                }
                else if (ticketEntity.Cliente is PersonaNaturalEntity personaNaturalEntity)
                {
                    cliente = new PersonaNatural
                    {
                        Id = personaNaturalEntity.Id,
                        Nombre = personaNaturalEntity.Nombre,
                        Rut = personaNaturalEntity.Rut,
                        Telefono = personaNaturalEntity.Telefono,
                        Email = personaNaturalEntity.Email
                    };
                }
                else
                {
                    cliente = null;
                }

                // Transformar TicketEntity a Ticket (negocio)
                Ticket ticket = new Ticket
                {
                    Id = ticketEntity.Id,
                    Cliente = cliente,
                    Producto = ticketEntity.Producto,
                    Descripcion = ticketEntity.Descripcion,
                    Estado = ticketEntity.Estado
                };

                listadoTickets.Add(ticket);
            }

            return listadoTickets;
        }

        public static List<Ticket> Search(string filtro)
        {
            List<Ticket> listadoTickets = new List<Ticket>();

            // se filtra lista de datos por nombre, rut o estado
            List<TicketEntity> ticketsFiltrados = TicketEntityCollection.ListadoTicket.FindAll(t => // Se utiliza ToLower() para que Contains no sea sensible a mayúsculas y minúsculas
            t.Cliente.Nombre.ToLower().Contains(filtro.ToLower()) ||
            t.Cliente.Rut.ToLower().Contains(filtro.ToLower()) ||
            t.Estado.ToLower().Contains(filtro.ToLower()));

            foreach (TicketEntity ticketEntity in ticketsFiltrados)
            {
                Cliente cliente;

                if (ticketEntity.Cliente is EmpresaEntity empresaEntity)
                {
                    cliente = new Empresa
                    {
                        Id = empresaEntity.Id,
                        Nombre = empresaEntity.Nombre,
                        Rut = empresaEntity.Rut,
                        Telefono = empresaEntity.Telefono,
                        Email = empresaEntity.Email,
                        RazonSocial = empresaEntity.RazonSocial
                    };
                }
                else if (ticketEntity.Cliente is PersonaNaturalEntity personaNaturalEntity)
                {
                    cliente = new PersonaNatural
                    {
                        Id = personaNaturalEntity.Id,
                        Nombre = personaNaturalEntity.Nombre,
                        Rut = personaNaturalEntity.Rut,
                        Telefono = personaNaturalEntity.Telefono,
                        Email = personaNaturalEntity.Email
                    };
                }
                else
                {
                    cliente = null;
                }

                Ticket ticket = new Ticket
                {
                    Id = ticketEntity.Id,
                    Cliente = cliente,
                    Producto = ticketEntity.Producto,
                    Descripcion = ticketEntity.Descripcion,
                    Estado = ticketEntity.Estado
                };

                listadoTickets.Add(ticket);
            }

            return listadoTickets ;
        }


    }
}
