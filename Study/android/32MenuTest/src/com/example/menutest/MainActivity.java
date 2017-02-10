package com.example.menutest;



import android.os.Bundle;
import android.app.Activity;
import android.app.ListActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.TextView;

public class MainActivity extends ListActivity {

	
	String[]items = {"한국","미국","캐나다","스페인","이탈리아","독일","이스라엘","호주","보라카이"};
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
	
		//어댑터 클래스 생성
		//저장소의 데이타를 ListView에 매칭 시키는 역할
		ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1,items);
		
		//ListView에 어댑터 등록
		this.setListAdapter(adapter);
	
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
	
		/*
		 public abstract MenuItem add(
		 int item id, int orderm CharSeQuence title)
		 
		 groupId : 메뉴 아이템 그룹지정
		 itemId : 메뉴아이템에 부여된 ID
		 order : 메뉴 아이템이 표시될 순서, 미지정시 Menu.NONE=0
		 title : 메뉴 아이템이 표시될 문자열
		
		 */
		menu.add(Menu.NONE,1,Menu.NONE,"16픽셀");
		menu.add(Menu.NONE,2,Menu.NONE,"24픽셀");
		menu.add(Menu.NONE,3,Menu.NONE,"32픽셀");
		menu.add(Menu.NONE,4,Menu.NONE,"40픽셀");
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
