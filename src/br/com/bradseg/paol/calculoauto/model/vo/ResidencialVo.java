//
// Generated By:JAX-WS RI IBM 2.1.6 in JDK 6 (JAXB RI IBM JAXB 2.1.10 in JDK 6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for ResidencialVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="ResidencialVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="nuApoliceRenovacao" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nuCiaRenovacao" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nuOpcao" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nuSucursalRenovacao" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ResidencialVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "nuApoliceRenovacao",
    "nuCiaRenovacao",
    "nuOpcao",
    "nuSucursalRenovacao"
})
public class ResidencialVo {

    protected Integer nuApoliceRenovacao;
    protected Integer nuCiaRenovacao;
    protected Integer nuOpcao;
    protected Integer nuSucursalRenovacao;

    /**
     * Gets the value of the nuApoliceRenovacao property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuApoliceRenovacao() {
        return nuApoliceRenovacao;
    }

    /**
     * Sets the value of the nuApoliceRenovacao property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuApoliceRenovacao(Integer value) {
        this.nuApoliceRenovacao = value;
    }

    /**
     * Gets the value of the nuCiaRenovacao property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuCiaRenovacao() {
        return nuCiaRenovacao;
    }

    /**
     * Sets the value of the nuCiaRenovacao property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuCiaRenovacao(Integer value) {
        this.nuCiaRenovacao = value;
    }

    /**
     * Gets the value of the nuOpcao property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuOpcao() {
        return nuOpcao;
    }

    /**
     * Sets the value of the nuOpcao property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuOpcao(Integer value) {
        this.nuOpcao = value;
    }

    /**
     * Gets the value of the nuSucursalRenovacao property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuSucursalRenovacao() {
        return nuSucursalRenovacao;
    }

    /**
     * Sets the value of the nuSucursalRenovacao property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuSucursalRenovacao(Integer value) {
        this.nuSucursalRenovacao = value;
    }

}
