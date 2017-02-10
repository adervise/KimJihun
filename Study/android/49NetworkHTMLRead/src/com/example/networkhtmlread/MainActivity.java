package com.example.networkhtmlread;

import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;

import android.os.Bundle;
import android.os.Handler;
import android.app.Activity;
import android.app.ProgressDialog;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends Activity {
	private static final String URL=
			"http://www.naver.com/index.html";
	EditText edit;
	Button btn;
	ProgressDialog dialog;
	Handler handler=new Handler();
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        edit=(EditText)findViewById(R.id.edit);
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
    	edit.setText("");
    	new Thread(){
    		public void run() {
    			final String str=getStringFromURI();
    			
    			handler.post(new Runnable() {
					@Override
					public void run() {
						edit.setText(str);
						dialog.dismiss();
					}
				});
    		}
    	}.start();
    }
    
    public String getStringFromURI()
    {
    	String responseBody=null;
    	try {
			HttpClient httpClient=new DefaultHttpClient();
			HttpGet method=new HttpGet(URL);
			
			ResponseHandler<String> responseHandler=
					new BasicResponseHandler();
			
			responseBody=httpClient.execute(method,
					responseHandler);
		} catch (Exception e) {
			Log.i("MyTag", e.toString());
		}
    	return responseBody;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
