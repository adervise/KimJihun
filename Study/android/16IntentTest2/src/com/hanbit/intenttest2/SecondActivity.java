package com.hanbit.intenttest2;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Toast;

public class SecondActivity extends Activity implements OnClickListener{

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.second);
		findViewById(R.id.imgButton1).setOnClickListener(this);
		findViewById(R.id.btnSecondClose).setOnClickListener(this);
	}
	
	
	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
		
		if(v.getId()==R.id.imgButton1)
		{
			Toast.makeText(this, "이미지버튼", Toast.LENGTH_SHORT).show();
		}
		else if (v.getId()==R.id.btnSecondClose) 
		{
			finish();
		}
		
		
	}
}