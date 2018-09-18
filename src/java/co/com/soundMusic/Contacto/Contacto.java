package co.com.soundMusic.Contacto;

/**
 *
 * @author Santiago Medina Pelaez
 */
public class Contacto {

    private int idContacto;
    private String direccion;
    private String barrio;
    private String telefono;
    private String celular;
    private String email;
    private int idCiudad;

    public Contacto() {
    }

    public Contacto(int idContacto, String direccion, String barrio,
            String telefono, String celular, String email, int idCiudad) {
        this.idContacto = idContacto;
        this.direccion = direccion;
        this.barrio = barrio;
        this.telefono = telefono;
        this.celular = celular;
        this.email = email;
        this.idContacto = idContacto;
    }

    public Contacto(String direccion) {
        this.direccion = direccion;
    }

    public int getIdContacto() {
        return idContacto;
    }

    public void setIdContacto(int idContacto) {
        this.idContacto = idContacto;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getBarrio() {
        return barrio;
    }

    public void setBarrio(String barrio) {
        this.barrio = barrio;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdCiudad() {
        return idCiudad;
    }

    public void setIdCiudad(int idCiudad) {
        this.idCiudad = idCiudad;
    }

}
