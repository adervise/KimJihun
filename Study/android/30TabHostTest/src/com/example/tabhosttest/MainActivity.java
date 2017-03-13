package com.example.tabhosttest;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;
import android.widget.TabHost;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		TabHost tabs=(TabHost)findViewById(R.id.TabHost1);
		tabs.setup();
		
		//tab 생성
		TabHost.TabSpec spec = tabs.newTabSpec("tag1");
		//tab 을 클릭했을 때 호출되는 뷰 지정
		spec.setContent(R.id.tab1);
		//tab의 택스트 지정
		spec.setIndicator("시계");
		//생성한 탭을 TabHost에 등록
		tabs.addTab(spec);
		
		spec=tabs.newTabSpec("tag2");
		spec.setContent(R.id.tab2);
		spec.setIndicator("사진");
		tabs.addTab(spec);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
