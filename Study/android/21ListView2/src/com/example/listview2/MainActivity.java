package com.example.listview2;

import java.util.ArrayList;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

public class MainActivity extends Activity {

	ArrayList<String> items;
	ArrayAdapter<String> adapter;
	ListView myListView;
	EditText myEditText;
	Button myButton, myDelButton;
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	
		myListView = (ListView)findViewById(R.id.myListView);
		myButton = (Button)findViewById(R.id.myButton);
		myEditText = (EditText)findViewById(R.id.myEditText);
		myDelButton = (Button)findViewById(R.id.myDelButton);
		
		//����Ÿ ����� ����
		items = new ArrayList<String>();
		items.add("���");
		items.add("�ٳ���");
		items.add("����");
		
		
		
		//��� ����
		//adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1,items);
		
		
		//���ùٿ� ���� ��ư�� �����.
		adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_single_choice,items);
		myListView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
		
		
		
		//ListView�� ��� ���
		myListView.setAdapter(adapter);
		
		//ListView �̺�Ʈ ó��
		myListView.setOnItemClickListener(new OnItemClickListener() 
		{
			@Override
			public void onItemClick(AdapterView<?> arg0, View view, int position,
					long id) 
			{
				String str = "������ ������ ="+items.get(position);
				Toast.makeText(MainActivity.this, str, Toast.LENGTH_SHORT).show();
			}
			
		});
		
		//�̺�Ʈ ó��
		myButton.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				items.add(0, myEditText.getText().toString());
				//�ű� �����Ͱ� ���� ���� ListView ����
				adapter.notifyDataSetChanged();
				myEditText.setText("");
				myEditText.requestFocus();
			}
		});
		
		myDelButton.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
			
				int pos = myListView.getCheckedItemPosition();
				if(pos!= ListView.INVALID_POSITION)
				{
					items.remove(pos);//arraylist���� ����
					myListView.clearChoices();//������ ���� ��ư �ʱ�ȭ
					adapter.notifyDataSetChanged();//listview ���ɤ�
				}
				
				
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
