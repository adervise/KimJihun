package com.hanbit.intenttest2;

import android.os.Bundle;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class MainActivity extends Activity implements OnClickListener{
	Button btnFirst,btnSecond,btnMainClose;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        btnFirst=(Button)findViewById(R.id.btnFirst);
        btnSecond=(Button)findViewById(R.id.btnSecond);
        btnMainClose=(Button)findViewById(R.id.btnMainClose); 
        
        btnFirst.setOnClickListener(this);
        btnSecond.setOnClickListener(this);
        btnMainClose.setOnClickListener(this);        
    }

    @Override
    public void onClick(View v) {
    	// TODO Auto-generated method stub
    	if(v.getId()==R.id.btnFirst)//id�� ��
    	{
    		Intent intent=new Intent(this, FirstActivity.class);
    		intent.setFlags(Intent.FLAG_ACTIVITY_NO_HISTORY);
    		this.startActivity(intent);
    	}else if(v==btnSecond)//�ν��Ͻ��� ��
    	{
    		Intent intent=new Intent(this, SecondActivity.class);
    		this.startActivity(intent);
    	}else if(v==btnMainClose)
    	{
    		this.finish();//����
    	}    	
    }
    

    
    
    //�ڷΰ��� �κ� ��ġ��
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
    	if(keyCode==KeyEvent.KEYCODE_BACK)
    	{
    		new AlertDialog.Builder(this)
    		.setTitle("���� ����")
    		.setMessage("���� �����ұ��?")
    		.setPositiveButton("����",
    				new DialogInterface.OnClickListener() {						
						@Override
						public void onClick(DialogInterface dialog,
								int which) {
								finish();//������
						}
					})
			.setNegativeButton("���", null).show();		
    	}
    	return false;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}