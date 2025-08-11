package com.ns.model;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class Mezzo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,updatable = false,name = "id")
	private Long id;
	@Column(nullable = false)
	private String targa;
	
	 @ManyToOne(fetch = FetchType.EAGER)
	 private Trasportatore trasportatore;
	
	 @OneToMany(mappedBy="mezzo")
	 private List<Registro> registri;
	 
	public Mezzo() {
		
	}
	
	
	public Mezzo(String targa) {
		super();
		this.targa = targa;
		
	}


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	  public String getTarga() {
		return targa;
	}


	public void setTarga(String targa) {
		this.targa = targa;
	}


	public Trasportatore getTrasportatore() {
		return trasportatore;
	}


	public void setTrasportatore(Trasportatore trasportatore) {
		this.trasportatore = trasportatore;
	}


	@Override
	    public boolean equals(Object o) {
	        if (this == o) return true;
	        if (!(o instanceof Mezzo )) return false;
	        return id != null && id.equals(((Mezzo) o).getId());
	    }
	    @Override
	    public int hashCode() {
	        return getClass().hashCode();
	    }


	
}
