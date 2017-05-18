//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for BuscaFipeVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="BuscaFipeVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdCambio" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdCombustivel" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdFabricante" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdUsoVeiculo" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdVeiculo" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="dtInicioVigencia" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="nuAnoModelo" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nuEixos" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nuPortas" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "BuscaFipeVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdCambio",
    "cdCombustivel",
    "cdFabricante",
    "cdUsoVeiculo",
    "cdVeiculo",
    "dtInicioVigencia",
    "nuAnoModelo",
    "nuEixos",
    "nuPortas"
})
public class BuscaFipeVo {

    protected Integer cdCambio;
    protected Integer cdCombustivel;
    protected Integer cdFabricante;
    protected Integer cdUsoVeiculo;
    protected Integer cdVeiculo;
    protected String dtInicioVigencia;
    protected Integer nuAnoModelo;
    protected Integer nuEixos;
    protected Integer nuPortas;

    /**
     * Gets the value of the cdCambio property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdCambio() {
        return cdCambio;
    }

    /**
     * Sets the value of the cdCambio property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdCambio(Integer value) {
        this.cdCambio = value;
    }

    /**
     * Gets the value of the cdCombustivel property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdCombustivel() {
        return cdCombustivel;
    }

    /**
     * Sets the value of the cdCombustivel property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdCombustivel(Integer value) {
        this.cdCombustivel = value;
    }

    /**
     * Gets the value of the cdFabricante property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdFabricante() {
        return cdFabricante;
    }

    /**
     * Sets the value of the cdFabricante property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdFabricante(Integer value) {
        this.cdFabricante = value;
    }

    /**
     * Gets the value of the cdUsoVeiculo property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdUsoVeiculo() {
        return cdUsoVeiculo;
    }

    /**
     * Sets the value of the cdUsoVeiculo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdUsoVeiculo(Integer value) {
        this.cdUsoVeiculo = value;
    }

    /**
     * Gets the value of the cdVeiculo property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdVeiculo() {
        return cdVeiculo;
    }

    /**
     * Sets the value of the cdVeiculo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdVeiculo(Integer value) {
        this.cdVeiculo = value;
    }

    /**
     * Gets the value of the dtInicioVigencia property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtInicioVigencia() {
        return dtInicioVigencia;
    }

    /**
     * Sets the value of the dtInicioVigencia property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtInicioVigencia(String value) {
        this.dtInicioVigencia = value;
    }

    /**
     * Gets the value of the nuAnoModelo property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuAnoModelo() {
        return nuAnoModelo;
    }

    /**
     * Sets the value of the nuAnoModelo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuAnoModelo(Integer value) {
        this.nuAnoModelo = value;
    }

    /**
     * Gets the value of the nuEixos property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuEixos() {
        return nuEixos;
    }

    /**
     * Sets the value of the nuEixos property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuEixos(Integer value) {
        this.nuEixos = value;
    }

    /**
     * Gets the value of the nuPortas property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuPortas() {
        return nuPortas;
    }

    /**
     * Sets the value of the nuPortas property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuPortas(Integer value) {
        this.nuPortas = value;
    }

}
