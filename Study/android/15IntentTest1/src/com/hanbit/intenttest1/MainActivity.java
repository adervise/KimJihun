package com.hanbit.intenttest1;

import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class MainActivity extends Activity implements OnClickListener {


Button btn1, btn2;
	
	@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    
        btn1=(Button)findViewById(R.id.btn1);
        btn2=(Button)findViewById(R.id.btn2);
	
        btn1.setOnClickListener(this);
        btn2.setOnClickListener(this);
        
	}


	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
		Intent intent=null;

		if(v.getId()==R.id.btn1)
		{
			intent= new Intent(this, IntentTwo.class);
		}
		else if(v.getId()==R.id.btn2)
		{
			intent=new Intent(this, IntentTwo.class);
			//데이터 전달
			intent.putExtra("msg", "인텐트를 통해서 전달된 데이타 ");
		}
		startActivity(intent);
	}

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
