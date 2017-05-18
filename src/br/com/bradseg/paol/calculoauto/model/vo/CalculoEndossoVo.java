//
// Generated By:JAX-WS RI IBM 2.1.6 in JDK 6 (JAXB RI IBM JAXB 2.1.10 in JDK 6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for CalculoEndossoVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="CalculoEndossoVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdCindMesaNegocio" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cdRegiao" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="coberturaEndossoVo" type="{http://vo.model.calculoauto.paol.bradseg.com.br}CoberturaEndossoVo" minOccurs="0"/>
 *         &lt;element name="dtBaseCalculo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="flAceitacaoRestrita" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="flReterDevolucao" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="flSucesso" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="listaAlertas" type="{http://vo.model.calculoauto.paol.bradseg.com.br}ArrayOfMensagemAlertaVo" minOccurs="0"/>
 *         &lt;element name="listaClausulas" type="{http://vo.model.calculoauto.paol.bradseg.com.br}ArrayOfClausulasEndossoVo" minOccurs="0"/>
 *         &lt;element name="listaParcelamento" type="{http://vo.model.calculoauto.paol.bradseg.com.br}ArrayOfParcelamentoEndossoVo" minOccurs="0"/>
 *         &lt;element name="mensagemErroVo" type="{http://vo.model.calculoauto.paol.bradseg.com.br}MensagemErroVo" minOccurs="0"/>
 *         &lt;element name="parametroEndossoVo" type="{http://vo.model.calculoauto.paol.bradseg.com.br}ParametroEndossoVo" minOccurs="0"/>
 *         &lt;element name="pcDescontoOnline" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="pcFatorAgravo" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="veiculoEndossoVo" type="{http://vo.model.calculoauto.paol.bradseg.com.br}VeiculoEndossoVo" minOccurs="0"/>
 *         &lt;element name="vlAjuste" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlCustoApolice" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlFatorJuros" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "CalculoEndossoVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdCindMesaNegocio",
    "cdRegiao",
    "coberturaEndossoVo",
    "dtBaseCalculo",
    "flAceitacaoRestrita",
    "flReterDevolucao",
    "flSucesso",
    "listaAlertas",
    "listaClausulas",
    "listaParcelamento",
    "mensagemErroVo",
    "parametroEndossoVo",
    "pcDescontoOnline",
    "pcFatorAgravo",
    "veiculoEndossoVo",
    "vlAjuste",
    "vlCustoApolice",
    "vlFatorJuros"
})
public class CalculoEndossoVo {

    protected String cdCindMesaNegocio;
    protected Integer cdRegiao;
    protected CoberturaEndossoVo coberturaEndossoVo;
    protected String dtBaseCalculo;
    protected String flAceitacaoRestrita;
    protected String flReterDevolucao;
    protected String flSucesso;
    protected ArrayOfMensagemAlertaVo listaAlertas;
    protected ArrayOfClausulasEndossoVo listaClausulas;
    protected ArrayOfParcelamentoEndossoVo listaParcelamento;
    protected MensagemErroVo mensagemErroVo;
    protected ParametroEndossoVo parametroEndossoVo;
    protected Double pcDescontoOnline;
    protected Double pcFatorAgravo;
    protected VeiculoEndossoVo veiculoEndossoVo;
    protected Double vlAjuste;
    protected Double vlCustoApolice;
    protected Double vlFatorJuros;

    /**
     * Gets the value of the cdCindMesaNegocio property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCdCindMesaNegocio() {
        return cdCindMesaNegocio;
    }

    /**
     * Sets the value of the cdCindMesaNegocio property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCdCindMesaNegocio(String value) {
        this.cdCindMesaNegocio = value;
    }

    /**
     * Gets the value of the cdRegiao property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdRegiao() {
        return cdRegiao;
    }

    /**
     * Sets the value of the cdRegiao property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdRegiao(Integer value) {
        this.cdRegiao = value;
    }

    /**
     * Gets the value of the coberturaEndossoVo property.
     * 
     * @return
     *     possible object is
     *     {@link CoberturaEndossoVo }
     *     
     */
    public CoberturaEndossoVo getCoberturaEndossoVo() {
        return coberturaEndossoVo;
    }

    /**
     * Sets the value of the coberturaEndossoVo property.
     * 
     * @param value
     *     allowed object is
     *     {@link CoberturaEndossoVo }
     *     
     */
    public void setCoberturaEndossoVo(CoberturaEndossoVo value) {
        this.coberturaEndossoVo = value;
    }

    /**
     * Gets the value of the dtBaseCalculo property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtBaseCalculo() {
        return dtBaseCalculo;
    }

    /**
     * Sets the value of the dtBaseCalculo property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtBaseCalculo(String value) {
        this.dtBaseCalculo = value;
    }

    /**
     * Gets the value of the flAceitacaoRestrita property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFlAceitacaoRestrita() {
        return flAceitacaoRestrita;
    }

    /**
     * Sets the value of the flAceitacaoRestrita property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFlAceitacaoRestrita(String value) {
        this.flAceitacaoRestrita = value;
    }

    /**
     * Gets the value of the flReterDevolucao property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFlReterDevolucao() {
        return flReterDevolucao;
    }

    /**
     * Sets the value of the flReterDevolucao property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFlReterDevolucao(String value) {
        this.flReterDevolucao = value;
    }

    /**
     * Gets the value of the flSucesso property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFlSucesso() {
        return flSucesso;
    }

    /**
     * Sets the value of the flSucesso property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFlSucesso(String value) {
        this.flSucesso = value;
    }

    /**
     * Gets the value of the listaAlertas property.
     * 
     * @return
     *     possible object is
     *     {@link ArrayOfMensagemAlertaVo }
     *     
     */
    public ArrayOfMensagemAlertaVo getListaAlertas() {
        return listaAlertas;
    }

    /**
     * Sets the value of the listaAlertas property.
     * 
     * @param value
     *     allowed object is
     *     {@link ArrayOfMensagemAlertaVo }
     *     
     */
    public void setListaAlertas(ArrayOfMensagemAlertaVo value) {
        this.listaAlertas = value;
    }

    /**
     * Gets the value of the listaClausulas property.
     * 
     * @return
     *     possible object is
     *     {@link ArrayOfClausulasEndossoVo }
     *     
     */
    public ArrayOfClausulasEndossoVo getListaClausulas() {
        return listaClausulas;
    }

    /**
     * Sets the value of the listaClausulas property.
     * 
     * @param value
     *     allowed object is
     *     {@link ArrayOfClausulasEndossoVo }
     *     
     */
    public void setListaClausulas(ArrayOfClausulasEndossoVo value) {
        this.listaClausulas = value;
    }

    /**
     * Gets the value of the listaParcelamento property.
     * 
     * @return
     *     possible object is
     *     {@link ArrayOfParcelamentoEndossoVo }
     *     
     */
    public ArrayOfParcelamentoEndossoVo getListaParcelamento() {
        return listaParcelamento;
    }

    /**
     * Sets the value of the listaParcelamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link ArrayOfParcelamentoEndossoVo }
     *     
     */
    public void setListaParcelamento(ArrayOfParcelamentoEndossoVo value) {
        this.listaParcelamento = value;
    }

    /**
     * Gets the value of the mensagemErroVo property.
     * 
     * @return
     *     possible object is
     *     {@link MensagemErroVo }
     *     
     */
    public MensagemErroVo getMensagemErroVo() {
        return mensagemErroVo;
    }

    /**
     * Sets the value of the mensagemErroVo property.
     * 
     * @param value
     *     allowed object is
     *     {@link MensagemErroVo }
     *     
     */
    public void setMensagemErroVo(MensagemErroVo value) {
        this.mensagemErroVo = value;
    }

    /**
     * Gets the value of the parametroEndossoVo property.
     * 
     * @return
     *     possible object is
     *     {@link ParametroEndossoVo }
     *     
     */
    public ParametroEndossoVo getParametroEndossoVo() {
        return parametroEndossoVo;
    }

    /**
     * Sets the value of the parametroEndossoVo property.
     * 
     * @param value
     *     allowed object is
     *     {@link ParametroEndossoVo }
     *     
     */
    public void setParametroEndossoVo(ParametroEndossoVo value) {
        this.parametroEndossoVo = value;
    }

    /**
     * Gets the value of the pcDescontoOnline property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPcDescontoOnline() {
        return pcDescontoOnline;
    }

    /**
     * Sets the value of the pcDescontoOnline property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPcDescontoOnline(Double value) {
        this.pcDescontoOnline = value;
    }

    /**
     * Gets the value of the pcFatorAgravo property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPcFatorAgravo() {
        return pcFatorAgravo;
    }

    /**
     * Sets the value of the pcFatorAgravo property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPcFatorAgravo(Double value) {
        this.pcFatorAgravo = value;
    }

    /**
     * Gets the value of the veiculoEndossoVo property.
     * 
     * @return
     *     possible object is
     *     {@link VeiculoEndossoVo }
     *     
     */
    public VeiculoEndossoVo getVeiculoEndossoVo() {
        return veiculoEndossoVo;
    }

    /**
     * Sets the value of the veiculoEndossoVo property.
     * 
     * @param value
     *     allowed object is
     *     {@link VeiculoEndossoVo }
     *     
     */
    public void setVeiculoEndossoVo(VeiculoEndossoVo value) {
        this.veiculoEndossoVo = value;
    }

    /**
     * Gets the value of the vlAjuste property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlAjuste() {
        return vlAjuste;
    }

    /**
     * Sets the value of the vlAjuste property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlAjuste(Double value) {
        this.vlAjuste = value;
    }

    /**
     * Gets the value of the vlCustoApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlCustoApolice() {
        return vlCustoApolice;
    }

    /**
     * Sets the value of the vlCustoApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlCustoApolice(Double value) {
        this.vlCustoApolice = value;
    }

    /**
     * Gets the value of the vlFatorJuros property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlFatorJuros() {
        return vlFatorJuros;
    }

    /**
     * Sets the value of the vlFatorJuros property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlFatorJuros(Double value) {
        this.vlFatorJuros = value;
    }

}