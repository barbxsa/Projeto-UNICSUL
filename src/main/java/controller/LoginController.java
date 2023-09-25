package controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import model.UsuarioDto;

public class LoginController {

	public static boolean validate(UsuarioDto usuarioDto) {
		Boolean resultado = false;
		UsuarioDao usuarioDao = new UsuarioDao();
		Usuario usuario = usuarioDao.obtenerUsuario(usuarioDto.getEmail());
		if (usuario != null) {
			if (usuario.getPass().equalsIgnoreCase(usuarioDto.getPass())) {
				resultado = true;
			}
		}
		// session.setAttribute("String",  usuarioDao.obtenerUsuario(usuarioDto.getEmail()));
		return resultado;
	}
	
	public static String md5(String password) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		md.update(password.getBytes());
		byte[] digest = md.digest();
		return digest.toString();
	}

}
