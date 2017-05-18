//
// Generated By:JAX-WS RI IBM 2.1.6 in JDK 6 (JAXB RI IBM JAXB 2.1.10 in JDK 6)
//


package br.com.bradseg.paol.calculoauto.model.vo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for EDadosApoliceVo complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="EDadosApoliceVo">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="cdCategoriaAuto" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdOpcPagto1Parcela" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cdOpcPagtoDemaisParcelas" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="dtFimExtensaoPerimetro" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dtFinalExtPerimetroApolice" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dtInicioExtPerimetroApolice" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dtInicioExtensaoPerimetro" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dtInicioVigenciaApolice" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="isAppInvalidezApolice" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="isAppMorteApolice" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="isBlindagemApolice" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="isCarroceriaApolice" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="isCascoApolice" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="isDanosCorporaisApolice" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="isDanosMateriaisApolice" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="isDanosMoraisApolice" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="isEquipamentoApolice" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="isGarantiaUnicaApolice" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="isKitGasApolice" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="nuApolice" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nuCepApolice" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nuDiasApolice" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nuItemApolice" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="pcAjusteValorVeiculoApolice" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="pcDescontoPromocionalApolice" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="prmAcessorios" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmApp" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmAssistencia" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmBlindagem" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmCarroReserva" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmCarroceria" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmCasco" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmDanosCorporais" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmDanosMateriais" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmDanosMorais" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmDespesasExtraordinarias" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmDiariaParalizacao" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmEquipamentos" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmExtensaoPerimetro" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmExtensaoPerimetroRcf" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmGarantiaUnica" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmKitGas" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmPagoApp" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmPagoAuto" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmPagoRcf" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="prmVidros" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlCustoApolice" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlFranquia" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlFranquiaCarroceria" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlFranquiaEquipamento" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlFranquiaKitGas" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlFranquiaVidros" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlIofApolice" type="{http://www.w3.org/2001/XMLSchema}double" minOccurs="0"/>
 *         &lt;element name="vlTotalAcessorios" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "EDadosApoliceVo", namespace = "http://vo.model.calculoauto.paol.bradseg.com.br", propOrder = {
    "cdCategoriaAuto",
    "cdOpcPagto1Parcela",
    "cdOpcPagtoDemaisParcelas",
    "dtFimExtensaoPerimetro",
    "dtFinalExtPerimetroApolice",
    "dtInicioExtPerimetroApolice",
    "dtInicioExtensaoPerimetro",
    "dtInicioVigenciaApolice",
    "isAppInvalidezApolice",
    "isAppMorteApolice",
    "isBlindagemApolice",
    "isCarroceriaApolice",
    "isCascoApolice",
    "isDanosCorporaisApolice",
    "isDanosMateriaisApolice",
    "isDanosMoraisApolice",
    "isEquipamentoApolice",
    "isGarantiaUnicaApolice",
    "isKitGasApolice",
    "nuApolice",
    "nuCepApolice",
    "nuDiasApolice",
    "nuItemApolice",
    "pcAjusteValorVeiculoApolice",
    "pcDescontoPromocionalApolice",
    "prmAcessorios",
    "prmApp",
    "prmAssistencia",
    "prmBlindagem",
    "prmCarroReserva",
    "prmCarroceria",
    "prmCasco",
    "prmDanosCorporais",
    "prmDanosMateriais",
    "prmDanosMorais",
    "prmDespesasExtraordinarias",
    "prmDiariaParalizacao",
    "prmEquipamentos",
    "prmExtensaoPerimetro",
    "prmExtensaoPerimetroRcf",
    "prmGarantiaUnica",
    "prmKitGas",
    "prmPagoApp",
    "prmPagoAuto",
    "prmPagoRcf",
    "prmVidros",
    "vlCustoApolice",
    "vlFranquia",
    "vlFranquiaCarroceria",
    "vlFranquiaEquipamento",
    "vlFranquiaKitGas",
    "vlFranquiaVidros",
    "vlIofApolice",
    "vlTotalAcessorios"
})
public class EDadosApoliceVo {

    protected Integer cdCategoriaAuto;
    protected Integer cdOpcPagto1Parcela;
    protected Integer cdOpcPagtoDemaisParcelas;
    protected String dtFimExtensaoPerimetro;
    protected String dtFinalExtPerimetroApolice;
    protected String dtInicioExtPerimetroApolice;
    protected String dtInicioExtensaoPerimetro;
    protected String dtInicioVigenciaApolice;
    protected Double isAppInvalidezApolice;
    protected Double isAppMorteApolice;
    protected Double isBlindagemApolice;
    protected Double isCarroceriaApolice;
    protected Double isCascoApolice;
    protected Double isDanosCorporaisApolice;
    protected Double isDanosMateriaisApolice;
    protected Double isDanosMoraisApolice;
    protected Integer isEquipamentoApolice;
    protected Double isGarantiaUnicaApolice;
    protected Double isKitGasApolice;
    protected Integer nuApolice;
    protected Integer nuCepApolice;
    protected Integer nuDiasApolice;
    protected Integer nuItemApolice;
    protected Integer pcAjusteValorVeiculoApolice;
    protected Integer pcDescontoPromocionalApolice;
    protected Double prmAcessorios;
    protected Double prmApp;
    protected Double prmAssistencia;
    protected Double prmBlindagem;
    protected Double prmCarroReserva;
    protected Double prmCarroceria;
    protected Double prmCasco;
    protected Double prmDanosCorporais;
    protected Double prmDanosMateriais;
    protected Double prmDanosMorais;
    protected Double prmDespesasExtraordinarias;
    protected Double prmDiariaParalizacao;
    protected Double prmEquipamentos;
    protected Double prmExtensaoPerimetro;
    protected Double prmExtensaoPerimetroRcf;
    protected Double prmGarantiaUnica;
    protected Double prmKitGas;
    protected Double prmPagoApp;
    protected Double prmPagoAuto;
    protected Double prmPagoRcf;
    protected Double prmVidros;
    protected Double vlCustoApolice;
    protected Double vlFranquia;
    protected Double vlFranquiaCarroceria;
    protected Double vlFranquiaEquipamento;
    protected Double vlFranquiaKitGas;
    protected Double vlFranquiaVidros;
    protected Double vlIofApolice;
    protected Integer vlTotalAcessorios;

    /**
     * Gets the value of the cdCategoriaAuto property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdCategoriaAuto() {
        return cdCategoriaAuto;
    }

    /**
     * Sets the value of the cdCategoriaAuto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdCategoriaAuto(Integer value) {
        this.cdCategoriaAuto = value;
    }

    /**
     * Gets the value of the cdOpcPagto1Parcela property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdOpcPagto1Parcela() {
        return cdOpcPagto1Parcela;
    }

    /**
     * Sets the value of the cdOpcPagto1Parcela property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdOpcPagto1Parcela(Integer value) {
        this.cdOpcPagto1Parcela = value;
    }

    /**
     * Gets the value of the cdOpcPagtoDemaisParcelas property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCdOpcPagtoDemaisParcelas() {
        return cdOpcPagtoDemaisParcelas;
    }

    /**
     * Sets the value of the cdOpcPagtoDemaisParcelas property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCdOpcPagtoDemaisParcelas(Integer value) {
        this.cdOpcPagtoDemaisParcelas = value;
    }

    /**
     * Gets the value of the dtFimExtensaoPerimetro property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtFimExtensaoPerimetro() {
        return dtFimExtensaoPerimetro;
    }

    /**
     * Sets the value of the dtFimExtensaoPerimetro property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtFimExtensaoPerimetro(String value) {
        this.dtFimExtensaoPerimetro = value;
    }

    /**
     * Gets the value of the dtFinalExtPerimetroApolice property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtFinalExtPerimetroApolice() {
        return dtFinalExtPerimetroApolice;
    }

    /**
     * Sets the value of the dtFinalExtPerimetroApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtFinalExtPerimetroApolice(String value) {
        this.dtFinalExtPerimetroApolice = value;
    }

    /**
     * Gets the value of the dtInicioExtPerimetroApolice property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtInicioExtPerimetroApolice() {
        return dtInicioExtPerimetroApolice;
    }

    /**
     * Sets the value of the dtInicioExtPerimetroApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtInicioExtPerimetroApolice(String value) {
        this.dtInicioExtPerimetroApolice = value;
    }

    /**
     * Gets the value of the dtInicioExtensaoPerimetro property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtInicioExtensaoPerimetro() {
        return dtInicioExtensaoPerimetro;
    }

    /**
     * Sets the value of the dtInicioExtensaoPerimetro property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtInicioExtensaoPerimetro(String value) {
        this.dtInicioExtensaoPerimetro = value;
    }

    /**
     * Gets the value of the dtInicioVigenciaApolice property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDtInicioVigenciaApolice() {
        return dtInicioVigenciaApolice;
    }

    /**
     * Sets the value of the dtInicioVigenciaApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDtInicioVigenciaApolice(String value) {
        this.dtInicioVigenciaApolice = value;
    }

    /**
     * Gets the value of the isAppInvalidezApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getIsAppInvalidezApolice() {
        return isAppInvalidezApolice;
    }

    /**
     * Sets the value of the isAppInvalidezApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setIsAppInvalidezApolice(Double value) {
        this.isAppInvalidezApolice = value;
    }

    /**
     * Gets the value of the isAppMorteApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getIsAppMorteApolice() {
        return isAppMorteApolice;
    }

    /**
     * Sets the value of the isAppMorteApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setIsAppMorteApolice(Double value) {
        this.isAppMorteApolice = value;
    }

    /**
     * Gets the value of the isBlindagemApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getIsBlindagemApolice() {
        return isBlindagemApolice;
    }

    /**
     * Sets the value of the isBlindagemApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setIsBlindagemApolice(Double value) {
        this.isBlindagemApolice = value;
    }

    /**
     * Gets the value of the isCarroceriaApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getIsCarroceriaApolice() {
        return isCarroceriaApolice;
    }

    /**
     * Sets the value of the isCarroceriaApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setIsCarroceriaApolice(Double value) {
        this.isCarroceriaApolice = value;
    }

    /**
     * Gets the value of the isCascoApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getIsCascoApolice() {
        return isCascoApolice;
    }

    /**
     * Sets the value of the isCascoApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setIsCascoApolice(Double value) {
        this.isCascoApolice = value;
    }

    /**
     * Gets the value of the isDanosCorporaisApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getIsDanosCorporaisApolice() {
        return isDanosCorporaisApolice;
    }

    /**
     * Sets the value of the isDanosCorporaisApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setIsDanosCorporaisApolice(Double value) {
        this.isDanosCorporaisApolice = value;
    }

    /**
     * Gets the value of the isDanosMateriaisApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getIsDanosMateriaisApolice() {
        return isDanosMateriaisApolice;
    }

    /**
     * Sets the value of the isDanosMateriaisApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setIsDanosMateriaisApolice(Double value) {
        this.isDanosMateriaisApolice = value;
    }

    /**
     * Gets the value of the isDanosMoraisApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getIsDanosMoraisApolice() {
        return isDanosMoraisApolice;
    }

    /**
     * Sets the value of the isDanosMoraisApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setIsDanosMoraisApolice(Double value) {
        this.isDanosMoraisApolice = value;
    }

    /**
     * Gets the value of the isEquipamentoApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getIsEquipamentoApolice() {
        return isEquipamentoApolice;
    }

    /**
     * Sets the value of the isEquipamentoApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setIsEquipamentoApolice(Integer value) {
        this.isEquipamentoApolice = value;
    }

    /**
     * Gets the value of the isGarantiaUnicaApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getIsGarantiaUnicaApolice() {
        return isGarantiaUnicaApolice;
    }

    /**
     * Sets the value of the isGarantiaUnicaApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setIsGarantiaUnicaApolice(Double value) {
        this.isGarantiaUnicaApolice = value;
    }

    /**
     * Gets the value of the isKitGasApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getIsKitGasApolice() {
        return isKitGasApolice;
    }

    /**
     * Sets the value of the isKitGasApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setIsKitGasApolice(Double value) {
        this.isKitGasApolice = value;
    }

    /**
     * Gets the value of the nuApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuApolice() {
        return nuApolice;
    }

    /**
     * Sets the value of the nuApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuApolice(Integer value) {
        this.nuApolice = value;
    }

    /**
     * Gets the value of the nuCepApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuCepApolice() {
        return nuCepApolice;
    }

    /**
     * Sets the value of the nuCepApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuCepApolice(Integer value) {
        this.nuCepApolice = value;
    }

    /**
     * Gets the value of the nuDiasApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuDiasApolice() {
        return nuDiasApolice;
    }

    /**
     * Sets the value of the nuDiasApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuDiasApolice(Integer value) {
        this.nuDiasApolice = value;
    }

    /**
     * Gets the value of the nuItemApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNuItemApolice() {
        return nuItemApolice;
    }

    /**
     * Sets the value of the nuItemApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNuItemApolice(Integer value) {
        this.nuItemApolice = value;
    }

    /**
     * Gets the value of the pcAjusteValorVeiculoApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getPcAjusteValorVeiculoApolice() {
        return pcAjusteValorVeiculoApolice;
    }

    /**
     * Sets the value of the pcAjusteValorVeiculoApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setPcAjusteValorVeiculoApolice(Integer value) {
        this.pcAjusteValorVeiculoApolice = value;
    }

    /**
     * Gets the value of the pcDescontoPromocionalApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getPcDescontoPromocionalApolice() {
        return pcDescontoPromocionalApolice;
    }

    /**
     * Sets the value of the pcDescontoPromocionalApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setPcDescontoPromocionalApolice(Integer value) {
        this.pcDescontoPromocionalApolice = value;
    }

    /**
     * Gets the value of the prmAcessorios property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmAcessorios() {
        return prmAcessorios;
    }

    /**
     * Sets the value of the prmAcessorios property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmAcessorios(Double value) {
        this.prmAcessorios = value;
    }

    /**
     * Gets the value of the prmApp property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmApp() {
        return prmApp;
    }

    /**
     * Sets the value of the prmApp property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmApp(Double value) {
        this.prmApp = value;
    }

    /**
     * Gets the value of the prmAssistencia property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmAssistencia() {
        return prmAssistencia;
    }

    /**
     * Sets the value of the prmAssistencia property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmAssistencia(Double value) {
        this.prmAssistencia = value;
    }

    /**
     * Gets the value of the prmBlindagem property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmBlindagem() {
        return prmBlindagem;
    }

    /**
     * Sets the value of the prmBlindagem property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmBlindagem(Double value) {
        this.prmBlindagem = value;
    }

    /**
     * Gets the value of the prmCarroReserva property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmCarroReserva() {
        return prmCarroReserva;
    }

    /**
     * Sets the value of the prmCarroReserva property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmCarroReserva(Double value) {
        this.prmCarroReserva = value;
    }

    /**
     * Gets the value of the prmCarroceria property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmCarroceria() {
        return prmCarroceria;
    }

    /**
     * Sets the value of the prmCarroceria property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmCarroceria(Double value) {
        this.prmCarroceria = value;
    }

    /**
     * Gets the value of the prmCasco property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmCasco() {
        return prmCasco;
    }

    /**
     * Sets the value of the prmCasco property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmCasco(Double value) {
        this.prmCasco = value;
    }

    /**
     * Gets the value of the prmDanosCorporais property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmDanosCorporais() {
        return prmDanosCorporais;
    }

    /**
     * Sets the value of the prmDanosCorporais property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmDanosCorporais(Double value) {
        this.prmDanosCorporais = value;
    }

    /**
     * Gets the value of the prmDanosMateriais property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmDanosMateriais() {
        return prmDanosMateriais;
    }

    /**
     * Sets the value of the prmDanosMateriais property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmDanosMateriais(Double value) {
        this.prmDanosMateriais = value;
    }

    /**
     * Gets the value of the prmDanosMorais property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmDanosMorais() {
        return prmDanosMorais;
    }

    /**
     * Sets the value of the prmDanosMorais property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmDanosMorais(Double value) {
        this.prmDanosMorais = value;
    }

    /**
     * Gets the value of the prmDespesasExtraordinarias property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmDespesasExtraordinarias() {
        return prmDespesasExtraordinarias;
    }

    /**
     * Sets the value of the prmDespesasExtraordinarias property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmDespesasExtraordinarias(Double value) {
        this.prmDespesasExtraordinarias = value;
    }

    /**
     * Gets the value of the prmDiariaParalizacao property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmDiariaParalizacao() {
        return prmDiariaParalizacao;
    }

    /**
     * Sets the value of the prmDiariaParalizacao property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmDiariaParalizacao(Double value) {
        this.prmDiariaParalizacao = value;
    }

    /**
     * Gets the value of the prmEquipamentos property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmEquipamentos() {
        return prmEquipamentos;
    }

    /**
     * Sets the value of the prmEquipamentos property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmEquipamentos(Double value) {
        this.prmEquipamentos = value;
    }

    /**
     * Gets the value of the prmExtensaoPerimetro property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmExtensaoPerimetro() {
        return prmExtensaoPerimetro;
    }

    /**
     * Sets the value of the prmExtensaoPerimetro property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmExtensaoPerimetro(Double value) {
        this.prmExtensaoPerimetro = value;
    }

    /**
     * Gets the value of the prmExtensaoPerimetroRcf property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmExtensaoPerimetroRcf() {
        return prmExtensaoPerimetroRcf;
    }

    /**
     * Sets the value of the prmExtensaoPerimetroRcf property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmExtensaoPerimetroRcf(Double value) {
        this.prmExtensaoPerimetroRcf = value;
    }

    /**
     * Gets the value of the prmGarantiaUnica property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmGarantiaUnica() {
        return prmGarantiaUnica;
    }

    /**
     * Sets the value of the prmGarantiaUnica property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmGarantiaUnica(Double value) {
        this.prmGarantiaUnica = value;
    }

    /**
     * Gets the value of the prmKitGas property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmKitGas() {
        return prmKitGas;
    }

    /**
     * Sets the value of the prmKitGas property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmKitGas(Double value) {
        this.prmKitGas = value;
    }

    /**
     * Gets the value of the prmPagoApp property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmPagoApp() {
        return prmPagoApp;
    }

    /**
     * Sets the value of the prmPagoApp property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmPagoApp(Double value) {
        this.prmPagoApp = value;
    }

    /**
     * Gets the value of the prmPagoAuto property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmPagoAuto() {
        return prmPagoAuto;
    }

    /**
     * Sets the value of the prmPagoAuto property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmPagoAuto(Double value) {
        this.prmPagoAuto = value;
    }

    /**
     * Gets the value of the prmPagoRcf property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmPagoRcf() {
        return prmPagoRcf;
    }

    /**
     * Sets the value of the prmPagoRcf property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmPagoRcf(Double value) {
        this.prmPagoRcf = value;
    }

    /**
     * Gets the value of the prmVidros property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getPrmVidros() {
        return prmVidros;
    }

    /**
     * Sets the value of the prmVidros property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setPrmVidros(Double value) {
        this.prmVidros = value;
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
     * Gets the value of the vlFranquiaCarroceria property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlFranquiaCarroceria() {
        return vlFranquiaCarroceria;
    }

    /**
     * Sets the value of the vlFranquiaCarroceria property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlFranquiaCarroceria(Double value) {
        this.vlFranquiaCarroceria = value;
    }

    /**
     * Gets the value of the vlFranquiaEquipamento property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlFranquiaEquipamento() {
        return vlFranquiaEquipamento;
    }

    /**
     * Sets the value of the vlFranquiaEquipamento property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlFranquiaEquipamento(Double value) {
        this.vlFranquiaEquipamento = value;
    }

    /**
     * Gets the value of the vlFranquiaKitGas property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlFranquiaKitGas() {
        return vlFranquiaKitGas;
    }

    /**
     * Sets the value of the vlFranquiaKitGas property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlFranquiaKitGas(Double value) {
        this.vlFranquiaKitGas = value;
    }

    /**
     * Gets the value of the vlFranquiaVidros property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlFranquiaVidros() {
        return vlFranquiaVidros;
    }

    /**
     * Sets the value of the vlFranquiaVidros property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlFranquiaVidros(Double value) {
        this.vlFranquiaVidros = value;
    }

    /**
     * Gets the value of the vlIofApolice property.
     * 
     * @return
     *     possible object is
     *     {@link Double }
     *     
     */
    public Double getVlIofApolice() {
        return vlIofApolice;
    }

    /**
     * Sets the value of the vlIofApolice property.
     * 
     * @param value
     *     allowed object is
     *     {@link Double }
     *     
     */
    public void setVlIofApolice(Double value) {
        this.vlIofApolice = value;
    }

    /**
     * Gets the value of the vlTotalAcessorios property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getVlTotalAcessorios() {
        return vlTotalAcessorios;
    }

    /**
     * Sets the value of the vlTotalAcessorios property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setVlTotalAcessorios(Integer value) {
        this.vlTotalAcessorios = value;
    }

}