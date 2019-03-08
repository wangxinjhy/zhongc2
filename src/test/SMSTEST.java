import com.zy.util.SMSUtil;

import java.io.IOException;

public class SMSTEST {

    public static void  main(String[] args){
        try {
            String s = SMSUtil.postJson("18833011104","666666");
            System.out.println(s);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
