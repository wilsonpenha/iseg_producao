//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CarroceriaVeiculoVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="CarroceriaVeiculoVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="dsCarroceria" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="vlCarroceria" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "CarroceriaVeiculoVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "dsCarroceria",
    "vlCarroceria"
})
public class CarroceriaVeiculoVo {

    protected String dsCarroceria;
    protected Double vlCarroceria;

    /**
     * Gets the value of the dsCarroceria property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDsCarroceria() {
        return dsCarroceria;
    }

    /**
     * Sets the value of the dsCarroceria property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDsCarroceria(String value) {
        this.dsCarroceria = value;
    }

    /**
     * Gets the value of the vlCarroceria property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlCarroceria() {
        return vlCarroceria;
    }

    /**
     * Sets the value of the vlCarroceria property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlCarroceria(Double value) {
        this.vlCarroceria = value;
    }

}
