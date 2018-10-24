package co.com.soundMusic.Seguridad.Perfiles;

import co.com.soundMusic.utilidades.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.dbutils.DbUtils;

/**
 *
 * @author Santiago Medina Pelaez
 */
public class PerfilDaoImpl implements IPerfilDao {

    //Conexion a la base de datos
    private final Connection conexion;
    private Statement stmt;
    private ResultSet rs;
    //Constantes con las querys a la base de datos
    private static final String SELECT_PERFILES;
    private static final String SELECT_PERFIL_POR_ID;
    private static final String INSERT_PERFIL;
    private static final String UPDATE_PERFIL;

    public PerfilDaoImpl(Boolean production) {
        if (production) {
            conexion = DBUtil.getConexion();
        } else {
            conexion = DBUtil.getTestConexion();
        }
        stmt = null;
        rs = null;
    }

    @Override
    public List<Perfil> obtenerPerfiles() {
        List<Perfil> listaPerfiles = new ArrayList<>();
        try {
            stmt = conexion.createStatement();
            rs = stmt.executeQuery(SELECT_PERFILES);

            while (rs.next()) {

                int idPerfil = Integer.parseInt(rs.getString("ID_PERFIL"));
                String nombrePerfil = rs.getString("NOMBRE_PERFIL");

                Perfil perfil = new Perfil(idPerfil, nombrePerfil);
                listaPerfiles.add(perfil);
            }

        } catch (SQLException | NullPointerException ex) {
            System.out.println("Excepción " + ex.getMessage());
            Logger.getLogger(PerfilDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(conexion, stmt, rs);
        }
        return listaPerfiles;
    }

    @Override
    public Perfil obtenerPerfil(int idPerfil) {
        try {
            PreparedStatement ps = conexion.prepareStatement(SELECT_PERFIL_POR_ID);
            ps.setInt(1, idPerfil);
            rs = ps.executeQuery();

            while (rs.next()) {
                String nombrePerfil = rs.getString("NOMBRE_PERFIL");

                Perfil perfil = new Perfil(idPerfil, nombrePerfil);
                return perfil;
            }
        } catch (SQLException | NullPointerException ex) {
            System.out.println("Excepción " + ex.getMessage());
            Logger.getLogger(PerfilDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(conexion, stmt, rs);
        }
        return null;
    }

    @Override
    public void crearPerfil(Perfil perfil) {
        try {
            PreparedStatement ps = conexion.prepareStatement(INSERT_PERFIL);

            ps.setString(1, perfil.getNombrePerfil());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Excepción " + ex.getMessage());
            Logger.getLogger(PerfilDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(conexion, stmt, rs);
        }
    }

    @Override
    public void actualizarPerfil(Perfil perfil) {
        try {
            PreparedStatement ps = conexion.prepareStatement(UPDATE_PERFIL);

            ps.setString(1, perfil.getNombrePerfil());
            ps.setInt(2, perfil.getIdPerfil());
            ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("Excepción " + ex.getMessage());
            Logger.getLogger(PerfilDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(conexion, stmt, rs);
        }
    }

    static {
        SELECT_PERFILES = "SELECT ID_PERFIL, NOMBRE_PERFIL\n"
                + "FROM PERFIL ORDER BY ID_PERFIL";

        SELECT_PERFIL_POR_ID = "SELECT NOMBRE_PERFIL\n"
                + "FROM PERFIL\n"
                + "WHERE ID_PERFIL=?";

        INSERT_PERFIL = "INSERT INTO PERFIL (NOMBRE_PERFIL)\n"
                + "VALUES (?)";

        UPDATE_PERFIL = "UPDATE PERFIL \n"
                + "SET NOMBRE_PERFIL=? \n"
                + "WHERE ID_PERFIL=?";
    }
}
