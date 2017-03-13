package com.hanbit.switchevent;

import android.os.Bundle;
import android.app.Activity;
import android.graphics.Color;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.Switch;
import android.widget.TextView;

public class MainActivity extends Activity implements OnClickListener{

	Button btnOk,btnCancel;
	TextView tv;
	Switch sw;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    
       //각각 책체들의 인스턴스 얻기
       btnOk=(Button)findViewById(R.id.btnOk); 
       btnCancel=(Button)findViewById(R.id.btnCancel);
       tv=(TextView)findViewById(R.id.textView1);
       sw=(Switch)findViewById(R.id.switch1);
       
       btnOk.setOnClickListener(this);
       btnCancel.setOnClickListener(this);
       
       //스위치에 대한 이벤트 핸들러 구련
       sw.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() 
       {
		
			@Override
			public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) 
			{
				// TODO Auto-generated method stub
				Log.i("MyTag","id:"+buttonView.getId());
				Log.i("MyTag","checked"+isChecked);	
			
				if(isChecked)
				{
					tv.setText("스위치 On"	);
				}
				else
				{
					tv.setText("스위치 Off");
				}
	
			}
       });
    
    
    }

	//핸들러
    @Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
    	
    	switch (v.getId()) 
    	{
		case R.id.btnOk:
			
			tv.setText("Ok버튼을 눌렀습니다");
			tv.setTextColor(Color.BLUE);
			break;
			
		case R.id.btnCancel:
			tv.setText("취소하였습니다");
			tv.setTextColor(Color.RED);
			break;

		default:
			break;
		}
		
	}
    
    
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
