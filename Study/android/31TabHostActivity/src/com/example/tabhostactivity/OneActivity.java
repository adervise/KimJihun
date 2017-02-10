package com.example.tabhostactivity;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ViewFlipper;

public class OneActivity extends Activity implements OnClickListener{
	
	ViewFlipper flipper;
	Button btnPre,btnNext,btnStart,btnStop;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.one);
	
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
	
	

}
