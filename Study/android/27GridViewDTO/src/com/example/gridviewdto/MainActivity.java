package com.example.gridviewdto;

import java.util.ArrayList;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.GridView;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	
	//GridView에 들어갈 데이터
		ArrayList<MyCustomDTO> list = new ArrayList<MyCustomDTO>();
		list.add(new MyCustomDTO(R.drawable.a, "음악"));
		list.add(new MyCustomDTO(R.drawable.b, "사진"));
		list.add(new MyCustomDTO(R.drawable.c, "검색"));
		list.add(new MyCustomDTO(R.drawable.d, "추가"));
		list.add(new MyCustomDTO(R.drawable.e, "잠금"));
		list.add(new MyCustomDTO(R.drawable.f, "마이"));
		list.add(new MyCustomDTO(R.drawable.g, "알람"));
		
		GridView gridView = (GridView)findViewById(R.id.gridView1);
		MyCustomAdapter adapter = new MyCustomAdapter(getApplicationContext(), R.layout.grid_row, list);
		gridView.setAdapter(adapter);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
