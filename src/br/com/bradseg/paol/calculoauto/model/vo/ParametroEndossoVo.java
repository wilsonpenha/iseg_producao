//
// Generated By:JAX-WS RI IBM 2.1.6 in JDK 6 (JAXB RI IBM JAXB 2.1.10 in JDK 6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ParametroEndossoVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ParametroEndossoVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="dtVersaoDLL" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="nuCpfCnpjCorretor" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nuVersaoDLL" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ParametroEndossoVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "dtVersaoDLL",
    "nuCpfCnpjCorretor",
    "nuVersaoDLL"
})
public class ParametroEndossoVo {

    protected String dtVersaoDLL;
    protected Integer nuCpfCnpjCorretor;
    protected Double nuVersaoDLL;

    /**
     * Gets the value of the dtVersaoDLL property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtVersaoDLL() {
        return dtVersaoDLL;
    }

    /**
     * Sets the value of the dtVersaoDLL property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtVersaoDLL(String value) {
        this.dtVersaoDLL = value;
    }

    /**
     * Gets the value of the nuCpfCnpjCorretor property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuCpfCnpjCorretor() {
        return nuCpfCnpjCorretor;
    }

    /**
     * Sets the value of the nuCpfCnpjCorretor property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuCpfCnpjCorretor(Integer value) {
        this.nuCpfCnpjCorretor = value;
    }

    /**
     * Gets the value of the nuVersaoDLL property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getNuVersaoDLL() {
        return nuVersaoDLL;
    }

    /**
     * Sets the value of the nuVersaoDLL property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setNuVersaoDLL(Double value) {
        this.nuVersaoDLL = value;
    }

}