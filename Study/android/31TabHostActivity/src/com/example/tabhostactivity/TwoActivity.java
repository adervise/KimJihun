package com.example.tabhostactivity;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TabHost;

public class TwoActivity extends Activity{
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.two);

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
	
	

}
