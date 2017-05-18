package iseg.utils;

import iseg.app.persistence.PObject;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.ArrayUtils;


public class MqUtil {

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
					if(!field.getType().isInterface() && !fieldsToNotCopyList.contains(field.getName())){
						Object prop = PropertyUtils.getProperty(bean, field.getName());
						if (prop instanceof PObject)
							PropertyUtils.setProperty(clone, field.getName(), ((PObject)prop).getId());
						else
							PropertyUtils.setProperty(clone, field.getName(), prop);
					}
				} catch (Exception ex){
					System.out.println(field.getName()+" : "+ex);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return clone;
	}

	public static Class buildMqClass(Class clazz){
		Class mqClass = null;
		try{
			String pobjectName = clazz.getName().replaceAll("iseg.app.model.", "iseg.app.mq.pobjects.mq");
			mqClass = Class.forName(pobjectName);
			return mqClass;
		}catch (Exception e) {
			return mqClass;
		}
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
		try {

			BufferedImage buffi = ImageIO.read(infile);			
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageOutputStream ios = ImageIO.createImageOutputStream(baos);

			Iterator<ImageWriter> writers = ImageIO.getImageWritersByFormatName("jpg");
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
		}

		return null;

	}

}