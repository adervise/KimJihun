package com.example.listview1;

import android.os.Bundle;
import android.R.string;
import android.app.Activity;
import android.app.ListActivity;
import android.view.Menu;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;

public class MainActivity extends ListActivity {

	TextView selectionView;
	
	String[]items = {"한국","미국","캐나다","스페인","이탈리아","독일","이스라엘","호주","보라카이"};
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		selectionView = (TextView)findViewById(R.id.textview1);
	
		//어댑터 클래스 생성
		//저장소의 데이타를 ListView에 매칭 시키는 역할
		ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1,items);
		
		//ListView에 어댑터 등록
		this.setListAdapter(adapter);
	
	}
	
	@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		
		selectionView.setText(items[position]);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
