package com.ns.model;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Entity
public class Trasportatore implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,updatable = false,name = "id")
	private Long id;
	@Column(nullable = false)
	private String nome;
	@Column
	private String mezzi;

	@Transient
	private List<String> mezziList;
	
	public Trasportatore() {
		
	}
	
	
	public Trasportatore(String nome) {
		super();
		this.nome = nome;
	}


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getMezzi() {
		return mezzi;
	}

	public void setMezzi(String mezzi) {
		this.mezzi = mezzi;
	}

	public List<String> getMezziList() {
		return Arrays.asList(this.mezzi.split("#"));
	}

	public void setMezziList(List<String> mezziList) {
		this.mezziList = mezziList;
	}
}
