package com.example.handlerthread;

import java.util.Calendar;

import android.os.Bundle;
import android.os.Handler;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;

public class MainActivity extends Activity implements OnClickListener{

	TextView txtDate;
	MyThread thread;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        txtDate=(TextView)findViewById(R.id.textView1);
        thread=new MyThread();
        findViewById(R.id.button1).setOnClickListener(this);
        findViewById(R.id.button2).setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
    	if(v.getId()==R.id.button1)
    	{
    		thread.setDaemon(true);
    		thread.start();
    	}else{
    		finish();
    	}    	
    }
    
    //规过 1
    Handler handler=new Handler(){
    	public void handleMessage(android.os.Message msg) {
    		if(msg.what==1){
    			calendarShow();
    		}
    	};
    };
    
    //规过 2
    Handler handler2=new Handler();
    
    class MyThread extends Thread{
    	@Override
    	public void run() {
    		while(true)
    		{
    			//规过 1
    			//handler.sendEmptyMessage(1);
    			
    			//规过 2
    			handler2.post(new Runnable() {
					
					@Override
					public void run() {
						calendarShow();
					}
				});
    			
    			try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    		}
    	}
    }
    public void calendarShow()
    {
    	Calendar calendar=Calendar.getInstance();
    	int y=calendar.get(Calendar.YEAR);
    	int m=calendar.get(Calendar.MONTH)+1;
    	int d=calendar.get(Calendar.DATE);
    	int h=calendar.get(Calendar.HOUR);
    	int mi=calendar.get(Calendar.MINUTE);
    	int s=calendar.get(Calendar.SECOND);
    	txtDate.setText(y+"斥"+m+"岿"+d+"老 "+h+":"+mi+":"+s);
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
