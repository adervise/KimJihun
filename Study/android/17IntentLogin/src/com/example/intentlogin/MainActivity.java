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
        aDialog.setTitle("�α��� ȭ��");
        aDialog.setView(logView);
        aDialog.setPositiveButton("Ȯ��", new DialogInterface.OnClickListener( ) {
			
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
		//����� ȣ��
    	/*
    	Intent intent = new Intent(this, BrowAction.class);
		startActivity(intent);
		*/
    	
    	//������ ȣ�� action�� data�� ���� �ȵ���̵尡 ������ ����, �Ǵ� �� ����
    	/*��ȭ�ϱ�
    	Intent intent = new Intent();
    	intent.setAction(intent.ACTION_VIEW);
    	intent.setData(Uri.parse("tel:010-8806-6098"));
    	startActivity(intent);
    	*/
    	
    	//��������
    	/*Uri uri = Uri.parse("geo:"+"37.555555,125.123456");
    	startActivity(new Intent(Intent.ACTION_VIEW));*/
    	
    	//sms����
    	/*Intent intent = new Intent(Intent.ACTION_SENDTO, Uri.parse("smsto:010-8806-6098"));
    	startActivity(intent);*/
    	
    	//��ȭ ���� ���
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
