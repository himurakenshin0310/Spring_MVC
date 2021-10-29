package bussinesLogic;

import java.util.List;

import entity.Sua;

public class PaginateBL {
	private static int prodOnePage = 4;

	public static int tongSoTrang() {
		return (int) Math.ceil((double) SuaBL.layHetDS().size() / prodOnePage);
	}

	public static void main(String[] args) {
		System.out.println(tongSoTrang());
	}

	public static List<Sua> phanTrang(int page) {
		return SuaBL.docTatCa((page - 1) * prodOnePage, prodOnePage);		
	}
}
