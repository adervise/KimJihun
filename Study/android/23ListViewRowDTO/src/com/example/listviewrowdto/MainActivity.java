package com.example.listviewrowdto;

import java.util.ArrayList;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.ListView;

public class MainActivity extends Activity {

	ListView listView;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		listView=(ListView)findViewById(R.id.listView1);
		
		ArrayList<MyCustomDTO> list = new ArrayList<MyCustomDTO>();
		list.add(new MyCustomDTO(R.drawable.a, "���۸�", "������ ���϶�"));
		list.add(new MyCustomDTO(R.drawable.b, "��Ʈ��", "������ ���϶�"));
		list.add(new MyCustomDTO(R.drawable.c, "�����̴���", "������ ���϶�"));
		list.add(new MyCustomDTO(R.drawable.d, "���̾��", "������ ���϶�"));
		list.add(new MyCustomDTO(R.drawable.e, "��Ÿ��", "����ȭ�� �����ΰ�?"));
		
		MyCustomAdapter adapter = new MyCustomAdapter(getApplicationContext(), R.layout.list_row, list);
		listView.setAdapter(adapter);
		
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
