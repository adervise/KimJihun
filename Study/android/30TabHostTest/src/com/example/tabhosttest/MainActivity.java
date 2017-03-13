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
		
		//tab ����
		TabHost.TabSpec spec = tabs.newTabSpec("tag1");
		//tab �� Ŭ������ �� ȣ��Ǵ� �� ����
		spec.setContent(R.id.tab1);
		//tab�� �ý�Ʈ ����
		spec.setIndicator("�ð�");
		//������ ���� TabHost�� ���
		tabs.addTab(spec);
		
		spec=tabs.newTabSpec("tag2");
		spec.setContent(R.id.tab2);
		spec.setIndicator("����");
		tabs.addTab(spec);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
