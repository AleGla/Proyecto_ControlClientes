package datos;

import dominio.Cliente;
import java.sql.SQLException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;


public class ClienteDAO {

    private static final String PERSISTENCE="clientes";
     private  EntityManagerFactory emf;
     private  EntityManager em;
     
     public ClienteDAO(){
         emf=Persistence.createEntityManagerFactory(PERSISTENCE);
         em=emf.createEntityManager();
     }
     
    public List<Cliente> listar(){
        String hql="SELECT c FROM Cliente c";
        Query query=em.createQuery(hql);
        List<Cliente> c=query.getResultList();
        return c;
    }
    
    public Cliente buscarCliente(Cliente c){
        
       return em.find(Cliente.class, c.getIdCliente());
    
    }
    
    public void insertar(Cliente c){
        try{
            em.getTransaction().begin();
            em.persist(c);
            em.getTransaction().commit();
            System.out.println("SE HA INSERTADO UN REGISTRO");
        
        }catch(Exception ex){
            em.getTransaction().rollback();
            ex.printStackTrace(System.out);
        
        }finally{
            em.close();
        }
        
    }
    
    public void eliminar(Cliente c){
      try{
        em.getTransaction().begin();
        em.remove(em.merge(em.find(Cliente.class, c.getIdCliente())));
        em.getTransaction().commit();
        System.out.println("SE HA ELIMINADO EL REGISTRO");
    }catch(Exception ex){
        em.getTransaction().rollback();
        ex.printStackTrace(System.out);
    
    }finally{
        em.close();
      }
}
 
    public void actualizar(Cliente c){
        try{
            em.getTransaction().begin();
            em.merge(c);
            em.getTransaction().commit();
            System.out.println("SE HA ACTUALIZADO EL REGISTRO");
        
        }catch(Exception ex){
            em.getTransaction().rollback();
            ex.printStackTrace(System.out);
        
        }finally{
            em.close();
        }
    }

}
    

