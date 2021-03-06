//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for EVetorComodatoVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="EVetorComodatoVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="anoModelo" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="antiFurto" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="combustivel" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="dtInicioVigencia" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="lmiCasco" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="novaTarifa" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="regiao" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="uso" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="veiculo" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EVetorComodatoVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "anoModelo",
    "antiFurto",
    "combustivel",
    "dtInicioVigencia",
    "lmiCasco",
    "novaTarifa",
    "regiao",
    "uso",
    "veiculo"
})
public class EVetorComodatoVo {

    protected Integer anoModelo;
    protected Integer antiFurto;
    protected Integer combustivel;
    protected String dtInicioVigencia;
    protected Double lmiCasco;
    protected String novaTarifa;
    protected Integer regiao;
    protected Integer uso;
    protected Integer veiculo;

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
     * Gets the value of the antiFurto property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getAntiFurto() {
        return antiFurto;
    }

    /**
     * Sets the value of the antiFurto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setAntiFurto(Integer value) {
        this.antiFurto = value;
    }

    /**
     * Gets the value of the combustivel property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCombustivel() {
        return combustivel;
    }

    /**
     * Sets the value of the combustivel property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCombustivel(Integer value) {
        this.combustivel = value;
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
     * Gets the value of the lmiCasco property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getLmiCasco() {
        return lmiCasco;
    }

    /**
     * Sets the value of the lmiCasco property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setLmiCasco(Double value) {
        this.lmiCasco = value;
    }

    /**
     * Gets the value of the novaTarifa property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNovaTarifa() {
        return novaTarifa;
    }

    /**
     * Sets the value of the novaTarifa property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNovaTarifa(String value) {
        this.novaTarifa = value;
    }

    /**
     * Gets the value of the regiao property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getRegiao() {
        return regiao;
    }

    /**
     * Sets the value of the regiao property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setRegiao(Integer value) {
        this.regiao = value;
    }

    /**
     * Gets the value of the uso property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getUso() {
        return uso;
    }

    /**
     * Sets the value of the uso property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setUso(Integer value) {
        this.uso = value;
    }

    /**
     * Gets the value of the veiculo property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getVeiculo() {
        return veiculo;
    }

    /**
     * Sets the value of the veiculo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setVeiculo(Integer value) {
        this.veiculo = value;
    }

}
