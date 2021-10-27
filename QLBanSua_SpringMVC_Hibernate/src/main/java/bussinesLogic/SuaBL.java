package bussinesLogic;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import configuration.CSDL;
import entity.HangSua;
import entity.Sua;

public class SuaBL {
	private static final SessionFactory factory = CSDL.getFactory();

	private static List<Sua> taoDS(String sql, int index, int soLuongLay) {
		List<Sua> dss = new ArrayList<Sua>();
		Transaction tx = null;
		try (Session sesion = factory.openSession()) {
			tx = sesion.beginTransaction();
			if (index != 0 || soLuongLay != 0)
				dss = sesion.createQuery(sql, Sua.class).setFirstResult(index).setMaxResults(soLuongLay).list();
			else
				dss = sesion.createQuery(sql, Sua.class).list();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return dss;
	}

	public static List<Sua> docTatCa(int index, int soLuongLay) {
		String sql = "select s from Sua s";
		return taoDS(sql, index, soLuongLay);
	}

	public static List<Sua> layHetDS() {
		String sql = "select s from Sua s";
		return taoDS(sql, 0, 0);
	}

	public static Map<Long, Sua> dsBanChay() {
		String sql = "select sum(ct.soLuong) as sl, s from Sua s join s.ctHoadons ct group by s order by sl desc";
		Transaction tx = null;
		Map<Long, Sua> ds = new LinkedHashMap<Long, Sua>();
		try (Session session = factory.openSession()) {
			tx = session.beginTransaction();
			Query query = session.createQuery(sql,Object[].class);
			List<Object[]> lstObj = query.setFirstResult(0).setMaxResults(5).list();
			for(Object[] o : lstObj) {
				Sua s = (Sua) o[1];
				ds.put((Long) o[0], s);
			}
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		return ds;
	}
	
	public static Sua docTheoMa(String ma) {
		String hql = "select s from Sua s join fetch s.hangSua join fetch s.loaiSua where s.maSua = :maSua";
		Sua sua = null;
		try (Session session = factory.openSession()) {
			sua = session.createQuery(hql,Sua.class).setParameter("maSua", ma).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sua;
	}

//	public static void main(String[] args) {		
//		
//	}
}
