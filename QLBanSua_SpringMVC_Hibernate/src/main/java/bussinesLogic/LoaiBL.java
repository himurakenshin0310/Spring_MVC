package bussinesLogic;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import configuration.CSDL;
import entity.LoaiSua;

public class LoaiBL {
	private static final SessionFactory factory = CSDL.getFactory();
	public static List<LoaiSua> danhLoai(){
		List<LoaiSua> ds = new ArrayList<>();
		try (Session session = factory.openSession()) {
			ds = session.createQuery("select l from LoaiSua l",LoaiSua.class).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}
//	public static void main(String[] args) {
//		List<LoaiSua> ds = danhLoai();
//		for(LoaiSua s : ds)
//			System.out.println(s.getMaLoaiSua());
//	}
}
