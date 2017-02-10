package com.example.menubyxml;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Toast;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.menu, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// TODO Auto-generated method stub
		
		Toast.makeText(this, item.getTitle(), Toast.LENGTH_SHORT).show();
		
		switch (item.getItemId()) {
		case R.id.korea:
			Toast.makeText(this, "경치좋고 아름다운 도시", Toast.LENGTH_SHORT).show();
			
			break;

		default:
			break;
		}
		
		return true;
	}
	
	
}
