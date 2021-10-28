package javabean;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
		dsh.replace(ma, slm);
	}

	public void deleteCart(String ma) {
		dsh.remove(ma);
	}

	public List<SuaMua> danhSachMua() {
		List<SuaMua> ds = new ArrayList<SuaMua>();
		for (String s : dsh.keySet()) {
			SuaMua sua = new SuaMua();
			sua.setSua(SuaBL.docTheoMa(s));
			sua.setSlm(dsh.get(s));
			ds.add(sua);
		}
		return ds;
	}

	public double tongTien() {
		double tt = 0;
		for (SuaMua s : danhSachMua()) {
			tt += s.getSlm() * s.getSua().getDonGia();
		}
		return tt + tax;
	}

	public int tongSpMua() {
		return dsh.size();
	}
	
	public List<Double> thanhTien() {
		List<Double> ds = new ArrayList<>();
		
		for(SuaMua s : danhSachMua()) {
			ds.add((double) (s.getSua().getDonGia()*s.getSlm()));
		}
		return ds;
	}
}
