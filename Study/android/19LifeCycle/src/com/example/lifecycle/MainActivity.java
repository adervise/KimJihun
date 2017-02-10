package com.example.lifecycle;

import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.Menu;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		Log.i("MyTag","onCreate ȣ��");
		
	}

	@Override
	protected void onStart() {
		// TODO Auto-generated method stub
		Log.i("MyTag","onStart ȣ��");
		super.onStart();
	}

	
	@Override
	protected void onRestart() {
		// TODO Auto-generated method stub
		Log.i("MyTag","onReStart ȣ��");
		super.onRestart();
	}
	
	@Override
	protected void onResume() {
		// TODO Auto-generated method stub
		Log.i("MyTag","Resume ȣ��");
		super.onResume();
	}
	
	@Override
	protected void onPause() {
		// TODO Auto-generated method stub
		Log.i("MyTag","pause ȣ��");
		super.onPause();
	}
	
	@Override
	protected void onDestroy() {
		// TODO Auto-generated method stub
		Log.i("MyTag","Destroy ȣ��");
		super.onDestroy();
	}
	
	
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
