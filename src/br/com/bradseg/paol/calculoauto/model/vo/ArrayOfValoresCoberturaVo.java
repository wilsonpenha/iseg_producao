//
// Generated By:JAX-WS RI IBM 2.1.1 in JDK 6 (JAXB RI IBM JAXB 2.1.3 in JDK 1.6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ArrayOfValoresCoberturaVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ArrayOfValoresCoberturaVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="ValoresCoberturaVo" type="{http://vo.model.calculoauto.paol.bradseg.com.br}ValoresCoberturaVo" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ArrayOfValoresCoberturaVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "valoresCoberturaVo"
})
public class ArrayOfValoresCoberturaVo {

    @XmlElement(name = "ValoresCoberturaVo")
    protected List<ValoresCoberturaVo> valoresCoberturaVo;

    /**
     * Gets the value of the valoresCoberturaVo property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the valoresCoberturaVo property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getValoresCoberturaVo().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link ValoresCoberturaVo }
     * 
     * 
     */
    public List<ValoresCoberturaVo> getValoresCoberturaVo() {
        if (valoresCoberturaVo == null) {
            valoresCoberturaVo = new ArrayList<ValoresCoberturaVo>();
        }
        return this.valoresCoberturaVo;
    }

}