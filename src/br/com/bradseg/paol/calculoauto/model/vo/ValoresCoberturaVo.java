//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ValoresCoberturaVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ValoresCoberturaVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="dsCobertura" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="vlFranquia" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlLMI" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlPremioLiquido" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlPremioTarifa" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ValoresCoberturaVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "dsCobertura",
    "vlFranquia",
    "vlLMI",
    "vlPremioLiquido",
    "vlPremioTarifa"
})
public class ValoresCoberturaVo {

    protected String dsCobertura;
    protected Double vlFranquia;
    protected Double vlLMI;
    protected Double vlPremioLiquido;
    protected Double vlPremioTarifa;

    /**
     * Gets the value of the dsCobertura property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDsCobertura() {
        return dsCobertura;
    }

    /**
     * Sets the value of the dsCobertura property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDsCobertura(String value) {
        this.dsCobertura = value;
    }

    /**
     * Gets the value of the vlFranquia property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlFranquia() {
        return vlFranquia;
    }

    /**
     * Sets the value of the vlFranquia property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlFranquia(Double value) {
        this.vlFranquia = value;
    }

    /**
     * Gets the value of the vlLMI property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlLMI() {
        return vlLMI;
    }

    /**
     * Sets the value of the vlLMI property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlLMI(Double value) {
        this.vlLMI = value;
    }

    /**
     * Gets the value of the vlPremioLiquido property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlPremioLiquido() {
        return vlPremioLiquido;
    }

    /**
     * Sets the value of the vlPremioLiquido property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlPremioLiquido(Double value) {
        this.vlPremioLiquido = value;
    }

    /**
     * Gets the value of the vlPremioTarifa property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlPremioTarifa() {
        return vlPremioTarifa;
    }

    /**
     * Sets the value of the vlPremioTarifa property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlPremioTarifa(Double value) {
        this.vlPremioTarifa = value;
    }

}
