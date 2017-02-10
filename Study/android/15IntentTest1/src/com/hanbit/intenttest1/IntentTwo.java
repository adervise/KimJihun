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
		//����Ʈ�� ���ؼ� ���޵� ����Ÿ
		if(intent.getExtras()==null)
		{
			tView.append("����Ÿ ���� ȭ�� �̵�");
		}
		else
		{
			Bundle b = intent.getExtras();
			String msg= b.getString("msg");
			tView.append(msg);
		}
		
	}
	
}
