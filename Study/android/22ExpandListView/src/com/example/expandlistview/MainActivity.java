package com.example.expandlistview;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.ExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.SimpleExpandableListAdapter;

public class MainActivity extends Activity {

	ExpandableListView listView;
	String []mainData={"색상","과일","언어"};
	String [][]expandData={{"Red","Blue","Green","Yellow"},{"apple","grape","melon","banana"},{"JAVA","Object C","Android","Oracle"}};
	
	@Override
	protected void onCreate(Bundle savedInstanceState) 
	{
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	
		listView=(ExpandableListView)findViewById(R.id.expandListView);
		
		List mainList = new ArrayList();
		List subList = new ArrayList();
		
		for(int i=0; i<mainData.length; i++)
		{
			Map<String, String>dataMap = new HashMap<String, String>();
			dataMap.put("maindata", mainData[i]);
			mainList.add(dataMap);
			
			List child = new ArrayList();
			for(int j=0; j<expandData[i].length; j++)
			{
				Map<String, String>subMap = new HashMap<String, String>();
				subMap.put("subdata", expandData[i][j]);
				child.add(subMap);
			}
		
			subList.add(child);
			//ListView  아답터 연결
			ExpandableListAdapter adapter = new SimpleExpandableListAdapter
					(this, 
					mainList, 
					android.R.layout.simple_expandable_list_item_1, 
					new String[]{"maindata"}, 
					new int[]{android.R.id.text1}, 
					subList, 
					android.R.layout.simple_expandable_list_item_2, 
					new String[]{"subdata"}, 
					new int[]{android.R.id.text2});
			
			listView.setAdapter(adapter);
		}
		
		
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
