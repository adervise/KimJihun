package com.example.menutest;



import android.os.Bundle;
import android.app.Activity;
import android.app.ListActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.TextView;

public class MainActivity extends ListActivity {

	
	String[]items = {"�ѱ�","�̱�","ĳ����","������","��Ż����","����","�̽���","ȣ��","����ī��"};
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
	
		//����� Ŭ���� ����
		//������� ����Ÿ�� ListView�� ��Ī ��Ű�� ����
		ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1,items);
		
		//ListView�� ����� ���
		this.setListAdapter(adapter);
	
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
	
		/*
		 public abstract MenuItem add(
		 int item id, int orderm CharSeQuence title)
		 
		 groupId : �޴� ������ �׷�����
		 itemId : �޴������ۿ� �ο��� ID
		 order : �޴� �������� ǥ�õ� ����, �������� Menu.NONE=0
		 title : �޴� �������� ǥ�õ� ���ڿ�
		
		 */
		menu.add(Menu.NONE,1,Menu.NONE,"16�ȼ�");
		menu.add(Menu.NONE,2,Menu.NONE,"24�ȼ�");
		menu.add(Menu.NONE,3,Menu.NONE,"32�ȼ�");
		menu.add(Menu.NONE,4,Menu.NONE,"40�ȼ�");
		return true;
	}
	
	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// TODO Auto-generated method stub
		
		switch (item.getItemId()) {
		case 1:
			getListView().setDividerHeight(16);
			return true;
		case 2:
			getListView().setDividerHeight(24);
			return true;
		case 3:
			getListView().setDividerHeight(32);
			return true;
		case 4:
			getListView().setDividerHeight(40);
			return true;
		default:
			break;
		}
		return false;
	
	
	
	
	}

}
