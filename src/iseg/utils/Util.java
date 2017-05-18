package iseg.utils;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.ArrayUtils;

public class Util {

	public static String valorExtenso(BigDecimal number){    	
		Extenso valorExtenso = new Extenso(number);

		return valorExtenso.toString();
	}


	public static String valorExtenso(Double number){
		if(number != null){

			Extenso valorExtenso = new Extenso(new BigDecimal(number));

			return valorExtenso.toString();
		}
		return "";
	}

	public static boolean isProxy(Object object){
		return object.getClass().getName().matches("EnhancerByCGLIB");
	}

	public static boolean isInteger(String str){
		try {
			new Integer(str);
			return true;
		} catch (Exception e) {}
		return false;
	}

	public static Object cloneBean(Object bean, String... fieldsToNotCopy){
		Object clone = null;
		List<String>fieldsToNotCopyList = Arrays.asList(fieldsToNotCopy);

		try {
			clone = bean.getClass().newInstance();
			Field[] fields = bean.getClass().getDeclaredFields();
			for(Field field : Arrays.asList(fields)){
				try{
					if(!field.getType().isInterface() && !fieldsToNotCopyList.contains(field.getName())){
						PropertyUtils.setProperty(clone, field.getName(), PropertyUtils.getProperty(bean, field.getName()));
					}
				} catch (Exception ex){}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return clone;
	}

	public static Object cloneBean(Object bean, Class clazz, String... fieldsToNotCopy){
		Object clone = null;
		List<String>fieldsToNotCopyList = Arrays.asList(fieldsToNotCopy);

		try {
			clone = clazz.newInstance();
			Field[] fields = clazz.getDeclaredFields();
			for(Field field : Arrays.asList(fields)){
				try{
					if(!field.getType().isInterface() && !fieldsToNotCopyList.contains(field.getName())){
						PropertyUtils.setProperty(clone, field.getName(), PropertyUtils.getProperty(bean, field.getName()));
					}
				} catch (Exception ex){}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return clone;
	}

	@SuppressWarnings("unchecked")
	public static <K extends Object> K cloneBean(Object bean, Class clazz){
		Object clone = null;
		Object[] fields;

		try {
			clone = clazz.newInstance();
			fields = clazz.getDeclaredFields();
			Class supClass = clazz.getSuperclass();
			while (supClass.getName().indexOf("PObject")==-1){
				fields = ArrayUtils.addAll(fields, supClass.getDeclaredFields());
				supClass = supClass.getSuperclass();
			}
			for(Field field : Arrays.asList((Field[])fields)){
				try{
					if(!field.getType().isInterface()){
						Object prop = PropertyUtils.getProperty(bean, field.getName());
						PropertyUtils.setProperty(clone, field.getName(), prop);
					}
				} catch (Exception ex){
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (K) clone;
	}

	public static void colocaObjetoEmPrimeiroLugarNoArray(int indiceDoObjetoASerTransferido, Object[] array){
		Object objetoASerTransferido = array[indiceDoObjetoASerTransferido];
		int i=indiceDoObjetoASerTransferido;
		while(i!=0){
			array[i] = array[--i];
		}
		array[0] = objetoASerTransferido;
	}
	
	public static byte[] getBytesFromFile(File file) throws IOException {
		InputStream is = new FileInputStream(file);

		long length = file.length();

		/*if (length > Integer.MAX_VALUE) {
			// File is too large
		}*/

		byte[] bytes = new byte[(int)length];

		int offset = 0;
		int numRead = 0;
		while (offset < bytes.length && (numRead=is.read(bytes, offset, bytes.length-offset)) >= 0) {
			offset += numRead;
		}

		if (offset < bytes.length) {
			throw new IOException("Could not completely read file "+file.getName());
		}

		is.close();

		/*Byte[] byteArray = new Byte[(int)length];
		for(int i=0 ; i<bytes.length ; i++){
			byteArray[i] = new Byte(bytes[i]);
		}*/
		//return byteArray;
		return bytes;
	}
	
	public static byte[] compressJpegFile(File infile)	{	
		BufferedImage buffi = null;			
		ByteArrayOutputStream baos = null;
		ImageOutputStream ios = null;
		try {

			buffi = ImageIO.read(infile);			
			baos = new ByteArrayOutputStream();
			ios = ImageIO.createImageOutputStream(baos);

			Iterator<ImageWriter> writers = ImageIO.getImageWritersByFormatName("jpeg");
			ImageWriter writer = writers.next();

			ImageWriteParam param = writer.getDefaultWriteParam();
			param.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
			param.setCompressionQuality(0.5f);

			writer.setOutput(ios);
			writer.write(null, new IIOImage(buffi, null, null), param);

			byte[] data = baos.toByteArray();

			/*Byte[] byteArray = new Byte[(int)data.length];
			for(int i=0 ; i<data.length ; i++){
				byteArray[i] = new Byte(data[i]);
			}*/

			writer.dispose(); 

			//return byteArray;
			return data;
		} catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (buffi != null)
				buffi.flush();
			if (baos != null){
				try {
					baos.close();
				} catch (IOException e2) {}
			}
			if (ios != null){
				try {
					ios.close();
				} catch (IOException e2) {}
			}
			
		}

		return null;

	}
	
	public static Date somarDiaMesAnoData(Date data, Integer dias, Integer meses, Integer anos){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(data);  
		if(dias != null)
			calendar.add( Calendar.DAY_OF_MONTH, dias );
		if(meses != null)
			calendar.add( Calendar.MONTH, meses );
		if(anos != null)
			calendar.add( Calendar.YEAR, anos );
		return calendar.getTime();
	}
	
	public static String formatar( String valor, String mascara ) {
	    
        String dado = "";      
        // remove caracteres nao numericos
        for ( int i = 0; i < valor.length(); i++ )  {
            char c = valor.charAt(i);
            if ( Character.isDigit( c ) ) { dado += c; }
        }
        int indMascara = mascara.length();
        int indCampo = dado.length();

        for ( ; indCampo > 0 && indMascara > 0; ) {
            if ( mascara.charAt( --indMascara ) == '#' ) { indCampo--; }
        }

        String saida = "";
        for ( ; indMascara < mascara.length(); indMascara++ ) {    
            saida += ( ( mascara.charAt( indMascara ) == '#' ) ? dado.charAt( indCampo++ ) : mascara.charAt( indMascara ) );
        }    
        return saida;
    }
	
	public static void main(String[] args){
		try{
//			BolWebserviceUtil fabricante = new BolWebserviceUtil();
			//ArrayOfFabricanteVo listaFabricantes = fabricante.getBolWebserviceUtilHttpPort().recuperaFipeVeiculo(in0, in1, in2)buscaEnderecoPeloCep(in0, in1, in2)getListaFabricantes("", "");
			System.out.print("");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}