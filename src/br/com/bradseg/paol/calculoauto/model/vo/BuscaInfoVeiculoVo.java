//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for BuscaInfoVeiculoVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="BuscaInfoVeiculoVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="anoModelo" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdFabricante" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdVeiculo" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="dtVigencia" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "BuscaInfoVeiculoVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "anoModelo",
    "cdFabricante",
    "cdVeiculo",
    "dtVigencia"
})
public class BuscaInfoVeiculoVo {

    protected Integer anoModelo;
    protected Integer cdFabricante;
    protected Integer cdVeiculo;
    protected String dtVigencia;

    /**
     * Gets the value of the anoModelo property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getAnoModelo() {
        return anoModelo;
    }

    /**
     * Sets the value of the anoModelo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setAnoModelo(Integer value) {
        this.anoModelo = value;
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
     * Gets the value of the dtVigencia property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtVigencia() {
        return dtVigencia;
    }

    /**
     * Sets the value of the dtVigencia property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtVigencia(String value) {
        this.dtVigencia = value;
    }

}
