
package com.kh.wingddy.common.template;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

/**
 * @author user1
 *
 */
public class GenerateSecret {

	public String generateSecret() {
		Random r = new Random();
		int i = r.nextInt(100000);
		Format f = new DecimalFormat("000000");
		String secret = f.format(i);
		
		return secret;
	}
	
}
