//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for FabricanteVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="FabricanteVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdFabricante" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nmFabricante" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "FabricanteVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdFabricante",
    "nmFabricante"
})
public class FabricanteVo {

    protected Integer cdFabricante;
    protected String nmFabricante;

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
     * Gets the value of the nmFabricante property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNmFabricante() {
        return nmFabricante;
    }

    /**
     * Sets the value of the nmFabricante property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNmFabricante(String value) {
        this.nmFabricante = value;
    }

}
