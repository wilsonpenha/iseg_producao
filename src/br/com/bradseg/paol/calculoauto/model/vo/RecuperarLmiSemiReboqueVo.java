//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for RecuperarLmiSemiReboqueVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="RecuperarLmiSemiReboqueVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdSemiReboque" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="dtVigencia" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="nuAnoModelo" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nuEixos" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "RecuperarLmiSemiReboqueVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdSemiReboque",
    "dtVigencia",
    "nuAnoModelo",
    "nuEixos"
})
public class RecuperarLmiSemiReboqueVo {

    protected Integer cdSemiReboque;
    protected String dtVigencia;
    protected Integer nuAnoModelo;
    protected Integer nuEixos;

    /**
     * Gets the value of the cdSemiReboque property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdSemiReboque() {
        return cdSemiReboque;
    }

    /**
     * Sets the value of the cdSemiReboque property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdSemiReboque(Integer value) {
        this.cdSemiReboque = value;
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

}
