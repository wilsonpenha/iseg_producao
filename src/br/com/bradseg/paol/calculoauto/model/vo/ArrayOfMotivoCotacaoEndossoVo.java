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
 * <p>Java class for ArrayOfMotivoCotacaoEndossoVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ArrayOfMotivoCotacaoEndossoVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="MotivoCotacaoEndossoVo" type="{http://vo.model.calculoauto.paol.bradseg.com.br}MotivoCotacaoEndossoVo" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ArrayOfMotivoCotacaoEndossoVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "motivoCotacaoEndossoVo"
})
public class ArrayOfMotivoCotacaoEndossoVo {

    @XmlElement(name = "MotivoCotacaoEndossoVo")
    protected List<MotivoCotacaoEndossoVo> motivoCotacaoEndossoVo;

    /**
     * Gets the value of the motivoCotacaoEndossoVo property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the motivoCotacaoEndossoVo property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getMotivoCotacaoEndossoVo().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MotivoCotacaoEndossoVo }
     * 
     * 
     */
    public List<MotivoCotacaoEndossoVo> getMotivoCotacaoEndossoVo() {
        if (motivoCotacaoEndossoVo == null) {
            motivoCotacaoEndossoVo = new ArrayList<MotivoCotacaoEndossoVo>();
        }
        return this.motivoCotacaoEndossoVo;
    }

}