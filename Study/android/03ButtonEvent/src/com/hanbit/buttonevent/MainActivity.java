package com.hanbit.buttonevent;

import java.text.SimpleDateFormat;
import java.util.Date;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class MainActivity extends Activity implements OnClickListener {

	Button btn;
	SimpleDateFormat sdf;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        sdf=new SimpleDateFormat("yyy-MM-dd HH:mm:ss:");
        
        //이벤트 처리 과정
    //1. 이벤트 소스
    //2. 이벤트 리스너 구현(implements OnClickListener)
    //3. 이벤트 핸들러 구현(밑에 @Override public void onClick(View arg0)요부분)
    //4. 이벤트 소스와 이벤트 리스너가 구현된 객체 연결(btn.setOnClickListener(this);)
    btn=(Button)findViewById(R.id.button1);
    btn.setOnClickListener(this);
    //초기값으로 현재 시간이 버튼 택스트로 나타나도록;
    updateTime();
       
    }

    public void updateTime() 
    {
    		btn.setText(sdf.format(new Date()));
	}
    
    //이벤트 핸들러
    @Override
    public void onClick(View arg0) {
    	// TODO Auto-generated method stub
    	updateTime();
    	
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
