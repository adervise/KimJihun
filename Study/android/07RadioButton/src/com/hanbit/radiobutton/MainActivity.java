package com.hanbit.radiobutton;

import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.Menu;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

public class MainActivity extends Activity implements android.widget.RadioGroup.OnCheckedChangeListener{

	RadioGroup rg;
	TextView tv;
	
	
	@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    
        rg=(RadioGroup)findViewById(R.id.radioGroup1);
        tv=(TextView)findViewById(R.id.textView1);
        rg.setOnCheckedChangeListener(this);
        
	}


	@Override
	public void onCheckedChanged(RadioGroup group, int checkedId) {
		// TODO Auto-generated method stub
		Log.i("MyTag", "id:"+checkedId);
		RadioButton rb=(RadioButton)findViewById(checkedId);
		tv.setText("앞으로의 Programing 의 대새는"+rb.getText()+"일 것이다!");
		
	}

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
