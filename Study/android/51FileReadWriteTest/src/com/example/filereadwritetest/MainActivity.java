package com.example.filereadwritetest;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends Activity {
	EditText edit;
	private final static String NOTES="memo.txt";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        edit=(EditText)findViewById(R.id.edit1);
        findViewById(R.id.button1).setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				finish();
			}
		});
    }
    
    @Override
    protected void onPause() {
    	// back 버튼 누를때 호출-파일 저장
    	Log.i("MyTag","onPause");
    	try {
    		OutputStreamWriter out=
    				new OutputStreamWriter(openFileOutput(NOTES, MODE_PRIVATE));
    		out.write(edit.getText().toString());
    		out.close();
    		
    		Toast.makeText(this, "데이타를 저장합니다", Toast.LENGTH_SHORT).show();
    		/*
    		 * MODE_PRIVATE : 덮어쓰기
    		 * MODE_APPEND : 이어쓰기
    		 */
		} catch (Exception e) {
			// TODO: handle exception
			Log.i("MyTag","예외메세지:"+e.toString());
		}
    	super.onPause();
    }
    
    @Override
    protected void onResume() {
    	//처음 실행하면 호출-파일불러오기
    	Log.i("MyTag","onResume");
    	
    	try {
			InputStream in=openFileInput(NOTES);
			if(in!=null)
			{
				InputStreamReader tmp=new InputStreamReader(in);
				BufferedReader reader=new BufferedReader(tmp);
				String str;
				StringBuffer buf=new StringBuffer();
				while((str=reader.readLine())!=null)
				{
					buf.append(str+"\n");
				}
				in.close();
				edit.setText(buf.toString());
			}
		} catch (Exception e) {
			Log.i("Mytag","읽기 예외:"+e.toString());
		}
    	super.onResume();
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
