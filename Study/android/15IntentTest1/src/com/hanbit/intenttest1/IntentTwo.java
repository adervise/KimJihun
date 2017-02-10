package com.hanbit.intenttest1;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

public class IntentTwo extends Activity {

	TextView tView;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main_two);
	
		tView=(TextView)findViewById(R.id.txtResult);
		
		Intent intent=getIntent();
		//인텐트를 통해서 전달된 데이타
		if(intent.getExtras()==null)
		{
			tView.append("데이타 없이 화면 이동");
		}
		else
		{
			Bundle b = intent.getExtras();
			String msg= b.getString("msg");
			tView.append(msg);
		}
		
	}
	
}
