package javabean;

import java.io.Serializable;

import entity.Sua;

public class SuaMua implements Serializable {
	private Sua sua;
	private int slm;

	public SuaMua() {
		super();
	}

	public Sua getSua() {
		return sua;
	}

	public void setSua(Sua sua) {
		this.sua = sua;
	}

	public int getSlm() {
		return slm;
	}

	public void setSlm(int slm) {
		this.slm = slm;
	}
}
