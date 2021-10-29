package bussinesLogic;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import configuration.CSDL;
import entity.HangSua;

public class HangBL {
	private static final SessionFactory factory = CSDL.getFactory();

	public static HangSua docTheoMa(String ma) {
		HangSua hang = null;
		try(Session session = factory.openSession()) {
			hang = session.createQuery("select h from HangSua h where h.maHangSua = :maHang", HangSua.class).setParameter("maHang", ma).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hang;				
	}
	
	public static List<HangSua> danhSachHang(){
		List<HangSua> ds = new ArrayList<HangSua>();
		try (Session session = factory.openSession()){
			ds = session.createQuery("select l from HangSua l",HangSua.class).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}
	
//	public static void main(String[] args) {
//		List<HangSua> ds = danhSachHang();
//		for(HangSua s :ds)
//			System.out.println(s.getTenHangSua());
//	}
}
