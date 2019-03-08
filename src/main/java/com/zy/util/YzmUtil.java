package com.zy.util;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

public class YzmUtil {
	
	public static void CreateYZM(HttpServletRequest request,HttpServletResponse response) throws IOException{
	     //定义字符串记录验证码信息
		String  yzm="";
		
		String yzms="1234567980abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
//			    *1 准备画布
			//创建一个缓冲区  作为画布
			BufferedImage  bi=new BufferedImage(100,40, 1);//200宽  60 高  1图片类型		
//			    *2 获取画笔
			Graphics2D  g=(Graphics2D)bi.getGraphics();
//			    *3 绘制背景
			//设置背景颜色
			g.setColor(Color.white);
			g.fillRect(1, 1, 156,40);
//			    *4绘制图案 
			//设置字体
			Font  font=new Font(null, Font.BOLD, 22);//第一个参数  字体样式  第二个参数 加粗/斜体  第三个 字体大小
			g.setFont(font);//把字体和画笔关联
			//写字
			//设置字体颜色
			for (int i = 0; i < 4; i++) {
				//随机下标
				int index=(int)(Math.random()*yzms.length());
				//随机字符			
				char c=yzms.charAt(index);
				yzm+=c;
				//随机颜色
				Color color=getColor();
				g.setColor(color);
				//写字
				g.drawString(c+"", 24*i, 26);//第一次参数  写的内容  第二三个参数是字体的坐标
				//随机线颜色
				color=getColor();
				g.setColor(color);
				//划线
				g.drawLine(0, (int)(Math.random()*28), 160, (int)(Math.random()*28));
				
			}
			//把验证码添加到域中
			System.out.println("验证码："+yzm);
			request.getSession().setAttribute("yzm", yzm);
			//获取response的输出流
			OutputStream out=response.getOutputStream();			
			//通过ImageIO的write方法 把缓冲区中的数据  写到目的文件中
			ImageIO.write(bi, "JPEG", out);
	}
	public static Color  getColor() {
		  int a1=(int)(Math.random()*100+120);
		  int a2=(int)(Math.random()*100+120);
		  int a3=(int)(Math.random()*100+120);
		  return new Color(a1, a2, a3);
		
	}
}
