package com.hanbit.login;

import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends Activity implements OnClickListener {

    TextView tv;
    EditText id,pass;
    Button btn;
	
	
	
	@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
   
        tv=(TextView)findViewById(R.id.result);
        id=(EditText)findViewById(R.id.id);
        pass=(EditText)findViewById(R.id.pass);
        btn=(Button)findViewById(R.id.login);
        btn.setOnClickListener(this);
        Log.i("MyTag","버튼,에딧텍스트,텍스트뷰 로그");
	}
	
	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
	
		Log.i("MyTag", "button click");
		tv.setText("ID: "+id.getText()+"\n"+"pass: "+pass.getText());
		
	}
	

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }
    
}
