package com.hanbit.framelayout2;

import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;

public class MainActivity extends Activity implements OnClickListener {

	Button btn1,btn2,btn3,btn4;
	ImageView img1,img2,img3,img4;
	
	
    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    
    btn1=(Button)findViewById(R.id.btn1);
    btn2=(Button)findViewById(R.id.btn2);
    btn3=(Button)findViewById(R.id.btn3);
    btn4=(Button)findViewById(R.id.btn4);
    
    img1=(ImageView)findViewById(R.id.img1);
    img2=(ImageView)findViewById(R.id.img2);
    img3=(ImageView)findViewById(R.id.img3);
    img4=(ImageView)findViewById(R.id.img4);
    
    btn1.setOnClickListener(this);
    btn2.setOnClickListener(this);
    btn3.setOnClickListener(this);
    btn4.setOnClickListener(this);
    
    Log.i("MyTag","버튼,이미지 생성");
    }

	@Override
	public void onClick(View v) {
		
		Log.i("MyTag", "button click Start");
		switch (v.getId()) {
		
		case R.id.btn1:
			img1.setVisibility(View.VISIBLE);
			img2.setVisibility(View.INVISIBLE);
			img3.setVisibility(View.INVISIBLE);
			img4.setVisibility(View.INVISIBLE);
			break;
			
		case R.id.btn2:
			img1.setVisibility(View.INVISIBLE);
			img2.setVisibility(View.VISIBLE);
			img3.setVisibility(View.INVISIBLE);
			img4.setVisibility(View.INVISIBLE);
			break;
		
		case R.id.btn3:
			img1.setVisibility(View.INVISIBLE);
			img2.setVisibility(View.INVISIBLE);
			img3.setVisibility(View.VISIBLE);
			img4.setVisibility(View.INVISIBLE);
			break;

		default:
			img1.setVisibility(View.INVISIBLE);
			img2.setVisibility(View.INVISIBLE);
			img3.setVisibility(View.INVISIBLE);
			img4.setVisibility(View.VISIBLE);
			break;
			
		}
		
	}
    
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
