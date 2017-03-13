package com.example.intentlogin;

import android.net.Uri;
import android.os.Bundle;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.View;
import android.widget.EditText;

public class MainActivity extends Activity {

	EditText edtId, edtPass;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        LayoutInflater inflater=(LayoutInflater)getApplication().getSystemService(LAYOUT_INFLATER_SERVICE);
        View logView=inflater.inflate(R.layout.logform, null);

        edtId=(EditText)logView.findViewById(R.id.editText1);
        edtPass=(EditText)logView.findViewById(R.id.editText2);
        edtId.setTextColor(Color.BLACK);
        edtPass.setTextColor(Color.BLACK);
        
        AlertDialog.Builder aDialog = new AlertDialog.Builder(this);
        aDialog.setTitle("로그인 화면");
        aDialog.setView(logView);
        aDialog.setPositiveButton("확인", new DialogInterface.OnClickListener( ) {
			
			@Override
			public void onClick(DialogInterface dialog, int which) {
				// TODO Auto-generated method stub
				
				Log.i("MyTag", "id"+edtId.getText()+"pass"+edtPass.getText());
			
				if(edtId.getText().toString().equals("angel") && edtPass.getText().toString().equals("1234"))
				{
					disp();
				}
				else
				{
					finish();
				}
			
			
			}
		});
       aDialog.create();
       aDialog.show();
        
        
    }

    public void disp() 
    {
		//명시적 호출
    	/*
    	Intent intent = new Intent(this, BrowAction.class);
		startActivity(intent);
		*/
    	
    	//묵시적 호출 action과 data에 의해 안드로이드가 적당한 어플, 판단 후 실행
    	/*전화하기
    	Intent intent = new Intent();
    	intent.setAction(intent.ACTION_VIEW);
    	intent.setData(Uri.parse("tel:010-8806-6098"));
    	startActivity(intent);
    	*/
    	
    	//지도보기
    	/*Uri uri = Uri.parse("geo:"+"37.555555,125.123456");
    	startActivity(new Intent(Intent.ACTION_VIEW));*/
    	
    	//sms전송
    	/*Intent intent = new Intent(Intent.ACTION_SENDTO, Uri.parse("smsto:010-8806-6098"));
    	startActivity(intent);*/
    	
    	//전화 전송 목록
    	Intent intent = new Intent(Intent.ACTION_PICK);
    	intent.setData(Uri.parse("content://com.android.contacts/data/phones"));
    	startActivity(intent);
    	
    	
    }
    
    

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
