package com.hanbit.checkbox;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.CompoundButton.OnCheckedChangeListener;

public class MainActivity extends Activity implements OnCheckedChangeListener {

	
	CheckBox cb;
	TextView tv;
	ImageView img;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    
    cb=(CheckBox)findViewById(R.id.checkBox1);
    tv=(TextView)findViewById(R.id.textView1);
    img=(ImageView)findViewById(R.id.imageView1);
    
    cb.setOnCheckedChangeListener(this);
    //img.setVisibility(View.INVISIBLE);//처음에는 안보이도록 설정
    
    }


    @Override
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
    	// TODO Auto-generated method stub
    	
    	
    	if(isChecked)
    	{
    		cb.setText("Check In");
    		tv.setText("CheckBox On");
    		//img.setVisibility(View.VISIBLE);
    		img.setImageResource(R.drawable.back);
    	}
    	else
    	{
    		cb.setText("Check Out");
    		tv.setText("CheckBox Off");
    		//img.setVisibility(View.INVISIBLE);
    		img.setImageResource(R.drawable.ssak);
    	}    	
    }
    
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
