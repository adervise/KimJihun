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
	
	String[]items = {"�ѱ�","�̱�","ĳ����","������","��Ż����","����","�̽���","ȣ��","����ī��"};
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		selectionView = (TextView)findViewById(R.id.textview1);
	
		//����� Ŭ���� ����
		//������� ����Ÿ�� ListView�� ��Ī ��Ű�� ����
		ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1,items);
		
		//ListView�� ����� ���
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
