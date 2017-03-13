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
	private final static int TAKE_PICTURE=1;//��û �ڵ�
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        findViewById(R.id.button1).setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				//camera-��⿡ ����� ī�޶� ������ �̿�,����� ��Ұ� �ڵ����� ó��
				Intent intent=new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
				startActivityForResult(intent, TAKE_PICTURE);				
			}
		});
        
        findViewById(R.id.button2).setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				
				//video-��⿡ ����� ī�޶� ������ �̿�,����� ��Ұ� �ڵ����� ó��
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
    	
    	//2���� extra�� �Ѿ�´�(data,bitmap-data)
    	//data�� Bitmap ��ü�̰�,bitmap-data�� boolean �̴�
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
    				//Thumnail �̹��� ->�̰����� ���ϴ� �۾��� �Ѵ�
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
