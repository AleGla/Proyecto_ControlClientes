package web;

import datos.ClienteDAO;
import dominio.Cliente;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String accion = req.getParameter("action");

        if (accion != null) {
            switch (accion) {

                case "editar":
                    this.editarCliente(req, res);
                    break;

                case "eliminar":
                    this.eliminarCliente(req, res);
                    break;

                default:
                    this.accionDefault(req, res);

            }
        } else {
            this.accionDefault(req, res);

        }
    }

    private void accionDefault(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ClienteDAO dao = new ClienteDAO();
        List<Cliente> clientes = dao.listar();
        HttpSession session = req.getSession();
        session.setAttribute("clientes", clientes);
        session.setAttribute("totalClientes", clientes.size());
        session.setAttribute("saldoTotal", totalSaldo(clientes));
        //req.getRequestDispatcher("clientes.jsp").forward(req, res);
        res.sendRedirect("clientes.jsp");
    }

    private double totalSaldo(List<Cliente> c) {

        double saldoTotal = 0;

        for (Cliente cliente : c) {
            saldoTotal += cliente.getSaldo();
        }
        return saldoTotal;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String accion = req.getParameter("action");

        if (accion != null) {
            switch (accion) {

                case "insertar":
                    this.insertarCliente(req, res);
                    break;

                case "modificar":
                    this.modificarCliente(req, res);
                    break;

                default:
                    this.accionDefault(req, res);

            }
        } else {
            this.accionDefault(req, res);
        }
    }

    private void insertarCliente(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String email = req.getParameter("email");
        String telefono = req.getParameter("telefono");
        String saldo = req.getParameter("saldo");

        Cliente c = new Cliente(nombre, apellido, email, telefono, Double.parseDouble(saldo));
        ClienteDAO dao = new ClienteDAO();

        dao.insertar(c);

        this.accionDefault(req, res);

    }

    private void editarCliente(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        int idCliente = Integer.parseInt(req.getParameter("idCliente"));
        Cliente c = new ClienteDAO().buscarCliente(new Cliente(idCliente));
        req.setAttribute("c", c);

        String jspEditar = "/WEB-INF/paginas/cliente/editarCliente.jsp";

        req.getRequestDispatcher(jspEditar).forward(req, res);

    }

    private void modificarCliente(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        int idCliente = Integer.parseInt(req.getParameter("idCliente"));
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String email = req.getParameter("email");
        String telefono = req.getParameter("telefono");
        Double saldo = Double.parseDouble(req.getParameter("saldo"));

        Cliente c = new Cliente(idCliente, nombre, apellido, email, telefono, saldo);
        ClienteDAO dao = new ClienteDAO();
        dao.actualizar(c);

        this.accionDefault(req, res);
    }

    private void eliminarCliente(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        int idCliente = Integer.parseInt(req.getParameter("idCliente"));
        Cliente c = new Cliente(idCliente);
        ClienteDAO dao = new ClienteDAO();

        dao.eliminar(c);

        this.accionDefault(req, res);
    }

}
