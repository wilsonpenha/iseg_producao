//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.wsat.controller.services;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
import br.com.bradseg.paol.calculoauto.model.vo.DetalhamentoCcbVo;


/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="out" type="{http://vo.model.calculoauto.paol.bradseg.com.br}DetalhamentoCcbVo"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "out"
})
@XmlRootElement(name = "detalhamentoCcbResponse")
public class DetalhamentoCcbResponse {

    @XmlElement(required = true)
    protected DetalhamentoCcbVo out;

    /**
     * Gets the value of the out property.
     * 
     * @return
     *     possible object is
     *     {@link DetalhamentoCcbVo }
     *     
     */
    public DetalhamentoCcbVo getOut() {
        return out;
    }

    /**
     * Sets the value of the out property.
     * 
     * @param value
     *     allowed object is
     *     {@link DetalhamentoCcbVo }
     *     
     */
    public void setOut(DetalhamentoCcbVo value) {
        this.out = value;
    }

}
