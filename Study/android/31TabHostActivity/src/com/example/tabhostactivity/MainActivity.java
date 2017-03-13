package com.example.tabhostactivity;

import android.os.Bundle;
import android.app.Activity;
import android.app.TabActivity;
import android.content.Intent;
import android.view.Menu;
import android.widget.TabHost;

public class MainActivity extends TabActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	
		//TabHost 掘扁
		TabHost host = getTabHost();
		
		//widget 积己
		TabHost.TabSpec tabs;
	
		//one 徘 积己
		tabs = host.newTabSpec("tab1");
		tabs.setIndicator("One");
		Intent one = new Intent(getApplicationContext(), OneActivity.class);
		tabs.setContent(one);
		host.addTab(tabs);
		
		//two 徘 积己
		tabs = host.newTabSpec("tab2");
		tabs.setIndicator("Two");
		Intent two = new Intent(getApplicationContext(), TwoActivity.class);
		tabs.setContent(two);
		host.addTab(tabs);
				
		//three 徘 积己
		tabs = host.newTabSpec("tab3");
		tabs.setIndicator("Three");
		Intent three = new Intent(getApplicationContext(), ThreeActivity.class);
		tabs.setContent(three);
		host.addTab(tabs);
	
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
