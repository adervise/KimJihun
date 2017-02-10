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
		
		//테이타 저장소 생성
		items = new ArrayList<String>();
		items.add("사과");
		items.add("바나나");
		items.add("포도");
		
		
		
		//어뎁터 생성
		//adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1,items);
		
		
		//선택바에 라디오 버튼이 생긴다.
		adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_single_choice,items);
		myListView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
		
		
		
		//ListView에 어뎁터 등록
		myListView.setAdapter(adapter);
		
		//ListView 이벤트 처리
		myListView.setOnItemClickListener(new OnItemClickListener() 
		{
			@Override
			public void onItemClick(AdapterView<?> arg0, View view, int position,
					long id) 
			{
				String str = "선택한 아이템 ="+items.get(position);
				Toast.makeText(MainActivity.this, str, Toast.LENGTH_SHORT).show();
			}
			
		});
		
		//이벤트 처리
		myButton.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				items.add(0, myEditText.getText().toString());
				//신규 데이터가 있을 경유 ListView 갱신
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
					items.remove(pos);//arraylist에서 제거
					myListView.clearChoices();//선택한 라디오 버튼 초기화
					adapter.notifyDataSetChanged();//listview 갱심ㄴ
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
