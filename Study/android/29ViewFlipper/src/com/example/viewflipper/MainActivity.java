package com.example.viewflipper;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ViewFlipper;

public class MainActivity extends Activity implements OnClickListener {

	ViewFlipper flipper;
	Button btnPre,btnNext,btnStart,btnStop;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	
		flipper=(ViewFlipper)findViewById(R.id.details);
		btnPre = (Button)findViewById(R.id.btnPrev);
		btnNext = (Button)findViewById(R.id.btnNext);
		btnStart = (Button)findViewById(R.id.btnStart);
		btnStop = (Button)findViewById(R.id.btnStop);
		
		
		btnPre.setOnClickListener(this);
		btnNext.setOnClickListener(this);
		btnStart.setOnClickListener(this);
		btnStop.setOnClickListener(this);
		
	}
	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
		
		if(v==btnPre)
		{
			flipper.showPrevious();
		}
		else if(v==btnNext)
		{
			flipper.showNext();
		}
		else if(v==btnStart)
		{
			flipper.setFlipInterval(500);
			flipper.startFlipping();
		}
		else if(v==btnStop)
		{
			flipper.stopFlipping();
		}
	}


	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
