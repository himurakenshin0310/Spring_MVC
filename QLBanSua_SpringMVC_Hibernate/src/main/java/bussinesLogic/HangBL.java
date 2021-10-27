package bussinesLogic;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import configuration.CSDL;
import entity.HangSua;

public class HangBL {
	private static final SessionFactory factory = CSDL.getFactory();

	public static HangSua docTheoMa(String ma) {
		Session session = factory.openSession();
		return session.createQuery("select h from HangSua h where h.maHangSua = :maHang", HangSua.class)
				.setParameter("maHang", ma).getSingleResult();
	}
	
//	public static void main(String[] args) {
//		HangSua hs = docTheoMa("AB");
//	}
}
