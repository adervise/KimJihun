package com.example.threadtest;

import android.os.Bundle;
import android.os.Handler;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.TextView;

public class MainActivity extends Activity {

	int bCount,tCount;
	TextView txtA,txtB;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        txtA=(TextView)findViewById(R.id.textView1);
        txtB=(TextView)findViewById(R.id.textView2);
        findViewById(R.id.button1).setOnClickListener(
        		new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				bCount++;
				txtA.setText("bCount값:"+bCount);
				txtB.setText("tCount값:"+tCount);
			}
		});
        
        //thread 처리
        //방법 1
//        ThreadClass class1=new ThreadClass();
//        class1.setDaemon(true);//메인스레드 종료시 사용자 스레드도 함께 종료
//        class1.start();
        
        //방법 2
//        RunnableClass class1=new RunnableClass();
//        Thread thread=new Thread(class1);
//        thread.setDaemon(true);
//        thread.start();
        
        //방법 3
      HandlerClass class1=new HandlerClass();
      class1.setDaemon(true);//메인스레드 종료시 사용자 스레드도 함께 종료
      class1.start();
    }
    
    //방법 1
    class ThreadClass extends Thread
    {
    	@Override
    	public void run() {
    		while(true)
    		{
    			tCount++;
    			//보조 Thread 내에서는 메인스레드 UI 에 직접적으로 접근할수 없다
    			//txtB.setText("tCount 값:"+tCount);
    			try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    		}
    	}
    }
    
    //방법 2
    class RunnableClass implements Runnable
    {
    	@Override
    	public void run() {
    		while(true)
    		{
    			tCount++;
    			//보조 Thread 내에서는 메인스레드 UI 에 직접적으로 접근할수 없다
    			//txtB.setText("tCount 값:"+tCount);
    			try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    		}	
    	}
    }
    
    //방법 3
    //백그라운드와 포그라운드 스레드 간에 통신을 가능하게 함
    Handler handler=new Handler(){
    	public void handleMessage(android.os.Message msg) {
    		if(msg.what==3){
    			txtB.setText("tCount 값:"+tCount);
    		}
    	};
    };

    class HandlerClass extends Thread
    {
    	@Override
    	public void run() {
    		while(true)
    		{
    			tCount++;
    			//보조 Thread 내에서는 메인스레드 UI 에 직접적으로 접근할수 없다
    			//txtB.setText("tCount 값:"+tCount);
    			
    			handler.sendEmptyMessage(3);//what 에 3 전달됨
    			try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    		}
    	}
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
