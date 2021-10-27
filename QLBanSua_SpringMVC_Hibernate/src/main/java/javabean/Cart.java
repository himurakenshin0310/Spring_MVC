package javabean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Locale;

import bussinesLogic.SuaBL;
import entity.Sua;

public class Cart implements Serializable {
	private Hashtable<String, Integer> dsh;
	private final int tax = 19000;

	public int tax() {
		return tax;
	}

	public Cart() {
		dsh = new Hashtable<String, Integer>();
	}

	// key => maSP , value => slm
	public Hashtable<String, Integer> addCart(String ma, int slm) {
		if (dsh.get(ma) == null)
			dsh.put(ma, slm);
		else
			dsh.replace(ma, dsh.get(ma) + slm);
		return dsh;
	}
	
	public void updateCart(String ma, int slm) {
		dsh.replace(ma, dsh.get(ma) + slm);
	}

	public void deleteCart(String ma) {
		dsh.remove(ma);
	}

	public List<Sua> danhSachMua() {
		List<Sua> dsm = new ArrayList<Sua>();
		for (String s : dsh.keySet()) {
			Sua sua = SuaBL.docTheoMa(s);
			dsm.add(sua);
		}
		return dsm;
	}

	public double tongTien() {
		double tt = 0;
		for (Sua s : danhSachMua()) {
			tt += s.getDonGia();
		}
		return tt + tax;
	}

	public int tongSpMua() {
		return dsh.size();
	}
}
