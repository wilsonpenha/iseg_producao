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
 * <p>Java class for ArrayOfCarroceriaVeiculoVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ArrayOfCarroceriaVeiculoVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="CarroceriaVeiculoVo" type="{http://vo.model.calculoauto.paol.bradseg.com.br}CarroceriaVeiculoVo" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ArrayOfCarroceriaVeiculoVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "carroceriaVeiculoVo"
})
public class ArrayOfCarroceriaVeiculoVo {

    @XmlElement(name = "CarroceriaVeiculoVo")
    protected List<CarroceriaVeiculoVo> carroceriaVeiculoVo;

    /**
     * Gets the value of the carroceriaVeiculoVo property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the carroceriaVeiculoVo property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getCarroceriaVeiculoVo().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link CarroceriaVeiculoVo }
     * 
     * 
     */
    public List<CarroceriaVeiculoVo> getCarroceriaVeiculoVo() {
        if (carroceriaVeiculoVo == null) {
            carroceriaVeiculoVo = new ArrayList<CarroceriaVeiculoVo>();
        }
        return this.carroceriaVeiculoVo;
    }

}
