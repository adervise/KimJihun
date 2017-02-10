package com.example.networkimageread;

import java.io.BufferedInputStream;
import java.io.InputStream;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.entity.BufferedHttpEntity;
import org.apache.http.impl.client.DefaultHttpClient;

import android.os.Bundle;
import android.os.Handler;
import android.app.Activity;
import android.app.ProgressDialog;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class MainActivity extends Activity {

	private static final String IMAGE_URL=
			"http://news.nateimg.co.kr/orgImg/nn/2013/06/17/201306171012233310_1.jpg";
	ImageView imageView1;
	Bitmap img;
	Button btn;
	ProgressDialog dialog;
	Handler handler=new Handler();
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        imageView1=(ImageView)findViewById(R.id.imageView1);
        btn=(Button)findViewById(R.id.button1);
        btn.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				dialog=ProgressDialog.show(MainActivity.this,
						"사이트 접속중...",
						"페이지를 로드하는중입니다..");
				try {
					processData();
				} catch (Exception e) {
					// TODO: handle exception
				}
				
			}
		});
    }

    public void processData()
    {
    	new Thread(){
    		public void run() {
    			img=getRemoteImage(getStreamFromURI());
    			
    			handler.post(new Runnable() {
					@Override
					public void run() {
						imageView1.setImageBitmap(img);
						dialog.dismiss();
					}
				});
    		}
    	}.start();
    }
    
    public Bitmap getRemoteImage(InputStream input)
    {
    	Bitmap bitmap=null;
    	try {
			BufferedInputStream bis=
					new BufferedInputStream(input);
			bitmap=BitmapFactory.decodeStream(bis);
			bis.close();
		} catch (Exception e) {
			Log.i("Mytag",e.toString());
		}
    	return bitmap;
    }
    
    public InputStream getStreamFromURI()
    {
    	InputStream input=null;
    	try {
			HttpClient httpClient=new DefaultHttpClient();
			HttpGet method=new HttpGet(IMAGE_URL);
			
			//응답을 받을 객체 선언
			HttpResponse response=
					(HttpResponse)httpClient.execute(method);
			
			//응답 수신 처리
			HttpEntity entity=response.getEntity();
			BufferedHttpEntity buf=
					new BufferedHttpEntity(entity);
			input=buf.getContent();
		} catch (Exception e) {
			Log.i("MyTag", e.toString());
		}
    	return input;
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
