package com.ns.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Prodotto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,updatable = false,name = "id")
	private Long id;
	@Column(nullable = false)
	private String tipo;

	private String qualita;
	

	@Override
	public String toString() {
		return "Prodotto [id=" + id + ", tipo=" + tipo + ", qualita=" + qualita + "]";
	}
	
	
	
}
