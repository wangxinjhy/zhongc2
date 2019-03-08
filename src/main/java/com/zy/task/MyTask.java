package com.zy.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

//定时器的测试
@Component
public class MyTask {

    // 每5s执行一次 45分钟 小时  日期 月份  星期
    //使用定时器，你想让他什么时候执行就可以什么时候执行   你想让他执行几次就执行几次  使用表达式来表达时间
    @Scheduled(cron="0/5 52 * * * 2 ")
    public void test(){
        System.out.println("定时器开始执行!!");
    }


}
