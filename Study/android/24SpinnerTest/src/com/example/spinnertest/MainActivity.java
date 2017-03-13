package com.example.spinnertest;

import android.R.anim;
import android.R.string;
import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.TextView;

public class MainActivity extends Activity implements OnItemSelectedListener {

	TextView textView;
	Spinner spinner;
	String [] items = {"한국","미국","캐나다","스페인","이탈리아","독일","이스라엘","호주","보라카이"};
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	
		textView = (TextView)findViewById(R.id.textView1);
		spinner = (Spinner)findViewById(R.id.spinner1);
		
		//이벤트 연결
		spinner.setOnItemSelectedListener(this);
		
		
		//어뎁터 객체 생성
		ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item, items);
		//드롭다운 화면에 표시될 리소스 지정
		adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
	
		//spinner를 adater에 연결
		spinner.setAdapter(adapter);
	
	}

	@Override
	public void onItemSelected(AdapterView<?> parent, View v, int position,
			long id) {
		// TODO Auto-generated method stub
		
		String data = items[position];
		textView.setText(data);
		
	}
	
	@Override
	public void onNothingSelected(AdapterView<?> parent) {
		// TODO Auto-generated method stub
		textView.setText("");
	}
	
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
