package com.hanbit.buttonevent2;

import android.os.Bundle;
import android.app.Activity;
import android.graphics.Color;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends Activity {

	Button btn;
	TextView tv;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    
        btn=(Button)findViewById(R.id.button1);
        tv=(TextView)findViewById(R.id.textView1);
        Log.i("MyTag","��ư��ü����");
        
        //�͸� ���� Ŭ���� ���·� �̺�Ʈ �����ʿ� ����
        btn.setOnClickListener(new View.OnClickListener() 
        {
			
			@Override
			public void onClick(View v) 
			{
				// TODO Auto-generated method stub
				Log.i("MyTag", "button click");
				tv.setText("�ȵ���̵� �������Դϴ�");
				tv.setTextColor(Color.RED);
				tv.setBackgroundColor(Color.YELLOW);
				
			}
		});
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
