package iseg.utils;

import iseg.app.action.BaseAction;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.ConvolveOp;
import java.awt.image.Kernel;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.swing.ImageIcon;


import com.sun.image.codec.jpeg.ImageFormatException;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class ImageUtil {

	private static String wordIcon = BaseAction.appFolder+"/common/images/word-doc.jpg";
	private static String jpegIcon = BaseAction.appFolder+"/common/images/jpeg-file.png";
	private static String excelIcon = BaseAction.appFolder+"/common/images/excel-doc.jpg";
	private static String pdfIcon = BaseAction.appFolder+"/common/images/pdf-doc.jpg";
	private static String fileIcon = BaseAction.appFolder+"/common/images/file-doc.jpg";
	private static String wordIconBig = BaseAction.appFolder+"/common/images/word-doc-big.jpg";
	private static String excelIconBig = BaseAction.appFolder+"/common/images/excel-doc-big.jpg";
	private static String pdfIconBig = BaseAction.appFolder+"/common/images/pdf-doc-big.jpg";
	private static String fileIconBig = BaseAction.appFolder+"/common/images/file-doc-big.jpg";

	public byte[] getMiniIcon(byte[] imageByteArray, int newWidth, String contentType) {
        ByteArrayOutputStream ous = new ByteArrayOutputStream();
        InputStream ios = null;
		try {
	        byte []buffer = new byte[4096];
	        if (contentType.indexOf("jpeg")>=0){
	        	if (newWidth==75)
	        		ios = new FileInputStream(new File(jpegIcon));
	        	else
	        		return imageByteArray;
	        }else if (contentType.indexOf("word")>=0){
	        	if (newWidth==75)
	        		ios = new FileInputStream(new File(wordIcon));
	        	else
	        		ios = new FileInputStream(new File(wordIconBig));
	        }else if (contentType.indexOf("excel")>=0){
	        	if (newWidth==75)
	        		ios = new FileInputStream(new File(excelIcon));
	        	else
	        		ios = new FileInputStream(new File(excelIconBig));
	        }else if (contentType.indexOf("pdf")>=0){
	        	if (newWidth==75)
	        		ios = new FileInputStream(new File(pdfIcon));
	        	else
	        		ios = new FileInputStream(new File(pdfIconBig));
			}else{
	        	if (newWidth==75)
	        		ios = new FileInputStream(new File(fileIcon));
	        	else
	        		ios = new FileInputStream(new File(fileIconBig));
			}
	        int read = 0;
	        while ( (read = ios.read(buffer)) != -1 ) {
	            ous.write(buffer, 0, read);
	        }
		}catch (Exception e) {
			// TODO: handle exception
	    } finally { 
	        try {
	             if ( ous != null ) 
	                 ous.close();
	        } catch ( IOException e) {
	        }

	        try {
	             if ( ios != null ) 
	                  ios.close();
	        } catch ( IOException e) {
	        }
	    }
	    return ous.toByteArray();
	}
	
	public static void resize(File originalFile, File resizedFile, int newWidth, float quality) throws IOException {

		if (quality < 0 || quality > 1) {
			throw new IllegalArgumentException("Quality has to be between 0 and 1");
		}

		ImageIcon ii = new ImageIcon(originalFile.getCanonicalPath());
		Image i = ii.getImage();
		Image resizedImage = null;

		int iWidth = i.getWidth(null);
		int iHeight = i.getHeight(null);

		if (iWidth > iHeight) {
			resizedImage = i.getScaledInstance(newWidth, (newWidth * iHeight) / iWidth, Image.SCALE_SMOOTH);
		} else {
			resizedImage = i.getScaledInstance((newWidth * iWidth) / iHeight, newWidth, Image.SCALE_SMOOTH);
		}

		// This code ensures that all the pixels in the image are loaded.
		Image temp = new ImageIcon(resizedImage).getImage();

		// Create the buffered image.
		BufferedImage bufferedImage = new BufferedImage(temp.getWidth(null), temp.getHeight(null),
				BufferedImage.TYPE_INT_RGB);

		// Copy image to buffered image.
		Graphics g = bufferedImage.createGraphics();

		// Clear background and paint the image.
		g.setColor(Color.white);
		g.fillRect(0, 0, temp.getWidth(null), temp.getHeight(null));
		g.drawImage(temp, 0, 0, null);
		g.dispose();

		// Soften.
		float softenFactor = 0.05f;
		float[] softenArray = {0, softenFactor, 0, softenFactor, 1-(softenFactor*4), softenFactor, 0, softenFactor, 0};
		Kernel kernel = new Kernel(3, 3, softenArray);
		ConvolveOp cOp = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);
		bufferedImage = cOp.filter(bufferedImage, null);

		// Write the jpeg to a file.
		FileOutputStream out = new FileOutputStream(resizedFile);

		// Encodes image as a JPEG data stream
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);

		JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(bufferedImage);

		param.setQuality(quality, true);

		encoder.setJPEGEncodeParam(param);
		encoder.encode(bufferedImage);
	}

	public static byte[] resize(byte[] imageByteArray, int newWidth, float quality, String contentType) {
        ByteArrayOutputStream ous = new ByteArrayOutputStream();
        InputStream ios = null;
		try {
	        byte []buffer = new byte[4096];
	        if (contentType.indexOf("jpeg")>=0){
		        return resize(imageByteArray, newWidth, quality);
	        }else if (contentType.indexOf("word")>=0){
	        	if (newWidth==75)
	        		ios = new FileInputStream(new File(wordIcon));
	        	else
	        		ios = new FileInputStream(new File(wordIconBig));
	        }else if (contentType.indexOf("excel")>=0){
	        	if (newWidth==75)
	        		ios = new FileInputStream(new File(excelIcon));
	        	else
	        		ios = new FileInputStream(new File(excelIconBig));
	        }else if (contentType.indexOf("pdf")>=0){
	        	if (newWidth==75)
	        		ios = new FileInputStream(new File(pdfIcon));
	        	else
	        		ios = new FileInputStream(new File(pdfIconBig));
			}else{
	        	if (newWidth==75)
	        		ios = new FileInputStream(new File(fileIcon));
	        	else
	        		ios = new FileInputStream(new File(fileIconBig));
			}
	        int read = 0;
	        while ( (read = ios.read(buffer)) != -1 ) {
	            ous.write(buffer, 0, read);
	        }
		}catch (Exception e) {
			// TODO: handle exception
	    } finally { 
	        try {
	             if ( ous != null ) 
	                 ous.close();
	        } catch ( IOException e) {
	        }

	        try {
	             if ( ios != null ) 
	                  ios.close();
	        } catch ( IOException e) {
	        }
	    }
	    return ous.toByteArray();
	}
	
	public static byte[] resize(byte[] imageByteArray, int newWidth, float quality) {
		ByteArrayOutputStream baos = null;
		try {
			if (quality < 0 || quality > 1) {
				throw new IllegalArgumentException("Quality has to be between 0 and 1");
			}

			ImageIcon ii = new ImageIcon(imageByteArray);
			Image i = ii.getImage();
			Image resizedImage = null;

			int iWidth = i.getWidth(null);
			int iHeight = i.getHeight(null);

			if (iWidth > iHeight) {
				resizedImage = i.getScaledInstance(newWidth, (newWidth * iHeight) / iWidth, Image.SCALE_SMOOTH);
			} else {
				resizedImage = i.getScaledInstance((newWidth * iWidth) / iHeight, newWidth, Image.SCALE_SMOOTH);
			}

			// This code ensures that all the pixels in the image are loaded.
			Image temp = new ImageIcon(resizedImage).getImage();

			// Create the buffered image.
			BufferedImage bufferedImage = new BufferedImage(temp.getWidth(null), temp.getHeight(null),
					BufferedImage.TYPE_INT_RGB);

			// Copy image to buffered image.
			Graphics g = bufferedImage.createGraphics();

			// Clear background and paint the image.
			g.setColor(Color.white);
			g.fillRect(0, 0, temp.getWidth(null), temp.getHeight(null));
			g.drawImage(temp, 0, 0, null);
			g.dispose();

			// Soften.
			float softenFactor = 0.05f;
			float[] softenArray = {0, softenFactor, 0, softenFactor, 1-(softenFactor*4), softenFactor, 0, softenFactor, 0};
			Kernel kernel = new Kernel(3, 3, softenArray);
			ConvolveOp cOp = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);
			bufferedImage = cOp.filter(bufferedImage, null);

			baos = new ByteArrayOutputStream();
			// Write the jpeg to a file.
			//FileOutputStream out = new FileOutputStream(resizedFile);

			// Encodes image as a JPEG data stream
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(baos);

			JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(bufferedImage);

			param.setQuality(quality, true);

			encoder.setJPEGEncodeParam(param);
			encoder.encode(bufferedImage);

			return baos.toByteArray();
		} catch (ImageFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if (baos != null){
				try {
					baos.close();
				} catch (IOException e2) {}
			}
		}
		return null;
	}

	// Example usage
	public static void main(String[] args) throws IOException {
		File originalImage = new File("/tmp/DSC01190.JPG");
		resize(originalImage, new File("/tmp/img-resized-450-quality-0.7.jpg"), 600, 0.85f);
		resize(originalImage, new File("/tmp/img-resized-450-quality-1.jpg"), 600, 1f);
	}

} 
