package com.hanbit.textview;

import android.os.Bundle;
import android.app.Activity;
import android.graphics.Color;
import android.view.Menu;
import android.widget.TextView;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //activity_main�� �о� �鿩 xml�� ��õ� ��̸�
        //��ü ������ �� MainActivity�� ���
        
        setContentView(R.layout.activity_main);
        
        
        //������ ��ϵ� id�� ���� TextView ��ü ����
        TextView tv1, tv2, tv3;
        tv1 = (TextView)findViewById(R.id.textView1);
        tv2 = (TextView)findViewById(R.id.textView2);
        tv3 = (TextView)findViewById(R.id.textView3);
        
        
        tv1.setTextColor(Color.RED);
        tv2.setTextColor(Color.CYAN);
        tv3.setTextColor(Color.BLACK);
        
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
