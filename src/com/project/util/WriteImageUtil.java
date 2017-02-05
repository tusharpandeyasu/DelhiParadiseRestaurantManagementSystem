
package com.project.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class WriteImageUtil {

	public void writeImg(BufferedInputStream bis, BufferedOutputStream bos) {
		int len = 0;
		try {
			byte[] buffer = new byte[2048];
			while ((len = bis.read(buffer)) > 0) {
				bos.write(buffer, 0, len);
			}
		} catch (FileNotFoundException exception) {
			exception.printStackTrace();
			throw new RuntimeException("FileNotFound");
		} catch (IOException exception) {
			exception.printStackTrace();
			throw new RuntimeException("IOException");
		} finally {
			try {
				if (bos != null) {
					bos.close();
				}
				if (bis != null) {
					bis.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
