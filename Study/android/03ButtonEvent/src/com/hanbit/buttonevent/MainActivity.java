package com.hanbit.buttonevent;

import java.text.SimpleDateFormat;
import java.util.Date;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;

public class MainActivity extends Activity implements OnClickListener {

	Button btn;
	SimpleDateFormat sdf;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        sdf=new SimpleDateFormat("yyy-MM-dd HH:mm:ss:");
        
        //�̺�Ʈ ó�� ����
    //1. �̺�Ʈ �ҽ�
    //2. �̺�Ʈ ������ ����(implements OnClickListener)
    //3. �̺�Ʈ �ڵ鷯 ����(�ؿ� @Override public void onClick(View arg0)��κ�)
    //4. �̺�Ʈ �ҽ��� �̺�Ʈ �����ʰ� ������ ��ü ����(btn.setOnClickListener(this);)
    btn=(Button)findViewById(R.id.button1);
    btn.setOnClickListener(this);
    //�ʱⰪ���� ���� �ð��� ��ư �ý�Ʈ�� ��Ÿ������;
    updateTime();
       
    }

    public void updateTime() 
    {
    		btn.setText(sdf.format(new Date()));
	}
    
    //�̺�Ʈ �ڵ鷯
    @Override
    public void onClick(View arg0) {
    	// TODO Auto-generated method stub
    	updateTime();
    	
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
