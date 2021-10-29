package bussinesLogic;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import configuration.CSDL;
import entity.Sua;

public class SearchBL {
	private static final SessionFactory factory = CSDL.getFactory();

	public static List<Sua> timKiem(int page, String word, String maHang, String maLoai) {
		List<Sua> ds = new ArrayList<Sua>();
		String[] key2 = word.split("\\s");
		try (Session session = factory.openSession()) {
			for (String key : key2) {
				if (!key.equals("")) {
					ds = session.createQuery(
							"from Sua s where s.hangSua.maHangSua = :maHang and s.loaiSua.maLoaiSua = :maLoai and s.tenSua like :tenSua",
							Sua.class).setParameter("maHang", maHang).setParameter("maLoai", maLoai)
							.setParameter("tenSua", "%" + key + "%").setFirstResult((page - 1) * 4).setMaxResults(4)
							.list();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds;
	}

	public static int tongSP(int page, String word, String maHang, String maLoai) {
		List<Sua> ds = new ArrayList<Sua>();
		String[] key2 = word.split("\\s");
		try (Session session = factory.openSession()) {
			for (String key : key2) {
				if (!key.equals("")) {
					ds = session.createQuery(
							"from Sua s where s.hangSua.maHangSua = :maHang and s.loaiSua.maLoaiSua = :maLoai and s.tenSua like :tenSua",
							Sua.class).setParameter("maHang", maHang).setParameter("maLoai", maLoai)
							.setParameter("tenSua", "%" + key + "%").list();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ds.size();
	}

//	public static void main(String[] args) {
//		List<Sua> ds = timKiem(1, "a", "AB", "SB");
//		for(Sua s : ds)
//			System.out.println(s.getTenSua());
//	}
}
