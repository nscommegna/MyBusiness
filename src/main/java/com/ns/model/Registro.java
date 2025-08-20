package com.ns.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.Date;

@Setter
@Getter
@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "registro")
public class Registro {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Fornitore fornitore;

    @ManyToOne
    private Prodotto prodotto;

    private Double peso;

    private Date data;

    @ManyToOne
    private Cliente cliente;

    @ManyToOne
    private Trasportatore trasportatore;

    private Double prezzoAcquisto;

    private Double prezzoVendita;

    private Double costoTrasporto;

    private Double costoTrasportoIva;

    private String mezzo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Fornitore getFornitore() {
        return fornitore;
    }

    public void setFornitore(Fornitore fornitore) {
        this.fornitore = fornitore;
    }

    public Prodotto getProdotto() {
        return prodotto;
    }

    public void setProdotto(Prodotto prodotto) {
        this.prodotto = prodotto;
    }

    public Double getPeso() {
        return peso;
    }

    public void setPeso(Double peso) {
        this.peso = peso;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Trasportatore getTrasportatore() {
        return trasportatore;
    }


    public Double getPrezzoAcquisto() {
        return prezzoAcquisto;
    }

    public void setPrezzoAcquisto(Double prezzoAcquisto) {
        this.prezzoAcquisto = prezzoAcquisto;
    }

    public Double getPrezzoVendita() {
        return prezzoVendita;
    }

    public void setPrezzoVendita(Double prezzoVendita) {
        this.prezzoVendita = prezzoVendita;
    }

    public Double getCostoTrasporto() {
        return costoTrasporto;
    }

    public void setCostoTrasporto(Double costoTrasporto) {
        this.costoTrasporto = costoTrasporto;
    }

    public Double getCostoTrasportoIva() {
        return costoTrasportoIva;
    }

    public void setCostoTrasportoIva(Double costoTrasportoIva) {
        this.costoTrasportoIva = costoTrasportoIva;
    }

    public void setTrasportatore(Trasportatore trasportatore) {
        this.trasportatore = trasportatore;
    }

    public String getMezzo() {
        return mezzo;
    }

    public void setMezzo(String mezzo) {
        this.mezzo = mezzo;
    }
}
