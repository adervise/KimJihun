package com.hanbit.intenttest2;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class FirstActivity extends Activity implements OnClickListener{
	Button btnGoMain,btnClose;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.first);
		
		btnGoMain=(Button)findViewById(R.id.btnGoMain);
		btnClose=(Button)findViewById(R.id.btnFirstClose);
	
		btnGoMain.setOnClickListener(this);
		btnClose.setOnClickListener(this);
	}
	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
		if(v.getId()==R.id.btnGoMain)
		{
			Intent intent=new Intent(this, MainActivity.class);
			this.startActivity(intent);
			//this.finish();
		}else if(v.getId()==R.id.btnFirstClose)
		{
			this.finish();
		}
		
	}
}
