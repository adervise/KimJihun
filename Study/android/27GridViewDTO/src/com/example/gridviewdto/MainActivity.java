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
	
	//GridView�� �� ������
		ArrayList<MyCustomDTO> list = new ArrayList<MyCustomDTO>();
		list.add(new MyCustomDTO(R.drawable.a, "����"));
		list.add(new MyCustomDTO(R.drawable.b, "����"));
		list.add(new MyCustomDTO(R.drawable.c, "�˻�"));
		list.add(new MyCustomDTO(R.drawable.d, "�߰�"));
		list.add(new MyCustomDTO(R.drawable.e, "���"));
		list.add(new MyCustomDTO(R.drawable.f, "����"));
		list.add(new MyCustomDTO(R.drawable.g, "�˶�"));
		
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
