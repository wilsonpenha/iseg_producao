//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CarregaAntiFurtoVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="CarregaAntiFurtoVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="dtInicioVigencia" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "CarregaAntiFurtoVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "dtInicioVigencia"
})
public class CarregaAntiFurtoVo {

    protected String dtInicioVigencia;

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

}
