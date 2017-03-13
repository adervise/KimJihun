package com.example.seekbar;


import android.R.color;
import android.R.integer;
import android.os.Bundle;
import android.app.Activity;
import android.graphics.Color;
import android.view.Menu;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.TextView;

public class MainActivity extends Activity implements SeekBar.OnSeekBarChangeListener {

	TextView Redtxt,Bluetxt,Greentxt,Back;
	SeekBar RedBar,BlueBar,GreenBar;
	int r=255, g=0, b=0;

	
	
	
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	
		
		Redtxt = (TextView)findViewById(R.id.textView1);
		RedBar = (SeekBar)findViewById(R.id.seekBar1);
		RedBar.setMax(255);
		RedBar.setProgress(r);
		Redtxt.setText(String.valueOf(r));
		
		
		Bluetxt = (TextView)findViewById(R.id.textView2);
		BlueBar = (SeekBar)findViewById(R.id.seekBar2);
		BlueBar.setMax(255);
		BlueBar.setProgress(g);
		Bluetxt.setText(String.valueOf(g));
		
		Greentxt = (TextView)findViewById(R.id.textView3);
		GreenBar = (SeekBar)findViewById(R.id.seekBar3);
		GreenBar.setMax(255);
		GreenBar.setProgress(g);
		Greentxt.setText(String.valueOf(b));
	
		Back = (TextView)findViewById(R.id.textView4);
		
		
		


		
		RedBar.setOnSeekBarChangeListener(this);
		GreenBar.setOnSeekBarChangeListener(this);
		BlueBar.setOnSeekBarChangeListener(this);
		
	
		/*sBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
			
			@Override
			public void onStopTrackingTouch(SeekBar seekBar) {
				// TODO Auto-generated method stub
				Toast.makeText(getApplicationContext(), "SeekBar Stop!", Toast.LENGTH_SHORT).show();
			}
			
			@Override
			public void onStartTrackingTouch(SeekBar seekBar) {
				// TODO Auto-generated method stub
				Toast.makeText(getApplicationContext(), "SeekBar Start!", Toast.LENGTH_SHORT).show();
			}
			
			@Override
			public void onProgressChanged(SeekBar seekBar, int progress,
					boolean fromUser) {
				// TODO Auto-generated method stub
				//Toast.makeText(getApplicationContext(), "SeekBar Change!", Toast.LENGTH_SHORT).show();
				
				
				tView.setTextColor(Color.rgb(progress, progress, progress));
				tView.setText("¼³Á¤°ª"+String.valueOf(progress));
				
			}
		});*/
	}

	@Override
	public void onProgressChanged(SeekBar seekBar, int progress,
			boolean fromUser) {
		// TODO Auto-generated method stub
		
		if(seekBar==RedBar)
		{
			r=seekBar.getProgress();
			Redtxt.setText(String.valueOf(progress));
		}
		else if(seekBar==GreenBar)
		{
			g=seekBar.getProgress();
			Greentxt.setText(String.valueOf(progress));				
		}
		else if(seekBar==BlueBar)
		{
			b=seekBar.getProgress();
			Bluetxt.setText(String.valueOf(progress));				
		}
		
		Back.setBackgroundColor(Color.rgb(r, g, b));
	}
	
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public void onStartTrackingTouch(SeekBar seekBar) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onStopTrackingTouch(SeekBar seekBar) {
		// TODO Auto-generated method stub
		
	}

}
