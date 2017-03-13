package com.example.cameranvideotest;

import java.util.Set;

import android.os.Bundle;
import android.provider.MediaStore;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.view.Menu;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;

public class MainActivity extends Activity {
	private final static int TAKE_PICTURE=1;//요청 코드
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        findViewById(R.id.button1).setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				//camera-기기에 내장된 카메라 어플을 이용,저장및 취소가 자동으로 처리
				Intent intent=new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
				startActivityForResult(intent, TAKE_PICTURE);				
			}
		});
        
        findViewById(R.id.button2).setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				
				//video-기기에 내장된 카메라 어플을 이용,저장및 취소가 자동으로 처리
				Intent intent=new Intent(MediaStore.ACTION_VIDEO_CAPTURE);
				startActivityForResult(intent, TAKE_PICTURE);	
			}
		});
    }


    @Override
    protected void onActivityResult(int requestCode, 
    		int resultCode, Intent data) {
    	super.onActivityResult(requestCode, resultCode, data);
  
//    	String str="requestCode:"+requestCode+
//    			",resultCode:"+resultCode;
//    	Toast.makeText(this, str, Toast.LENGTH_SHORT).show();
    	
    	//2개의 extra가 넘어온다(data,bitmap-data)
    	//data는 Bitmap 객체이고,bitmap-data는 boolean 이다
    	int size=data.getExtras().size();
    	Set<String> s=data.getExtras().keySet();
    	Toast.makeText(this, s.toString()+">"+size,
    			Toast.LENGTH_SHORT).show();
    	if(requestCode==TAKE_PICTURE)
    	{
    		if(data!=null)
    		{
    			if(data.hasExtra("data"))
    			{
    				ImageView imgView=
    						(ImageView)findViewById(R.id.imageView1);
    				//Thumnail 이미지 ->이것으로 원하는 작업을 한다
    				Bitmap bm=(Bitmap)data.getParcelableExtra("data");
    				imgView.setImageBitmap(bm);    						
    			}
    		}
    	}
    	
    	
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
