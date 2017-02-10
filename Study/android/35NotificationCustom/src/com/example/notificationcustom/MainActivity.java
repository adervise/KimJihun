package com.example.notificationcustom;

import android.R.drawable;
import android.os.Bundle;
import android.app.Activity;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.RemoteViews;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		
		Button btnNoti = (Button)findViewById(R.id.btnNoti);
		btnNoti.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
			
				NotificationManager manager = (NotificationManager)getSystemService(Context.NOTIFICATION_SERVICE);
				Notification noti = new Notification(android.R.drawable.stat_notify_error,"fire!!", System.currentTimeMillis());
				//�˸� ���ý� �ڵ� ����
				noti.flags=Notification.FLAG_AUTO_CANCEL;
				Intent intent = new Intent(getApplicationContext(),this.getClass());
				PendingIntent contentIntent=PendingIntent.getActivity(getApplicationContext(), 0, intent, PendingIntent.FLAG_CANCEL_CURRENT);
				//�˸�â�� ���(���1)
				//noti.setLatestEventInfo(getApplicationContext(), "�˶�Ÿ��Ʋ", "�˸�����", contentIntent);
				
				//Ŀ���͸���¡(���2)
				noti.contentView=new RemoteViews(getPackageName(), R.layout.custom);
				noti.contentIntent = contentIntent;
				noti.contentView.setTextViewText(R.id.textView1,"Ŀ���͸���¡ �޼��� �Դϴ�");
				noti.contentView.setImageViewResource(R.id.imageView1, R.drawable.bb);
				noti.defaults += Notification.DEFAULT_SOUND;
				noti.defaults += Notification.DEFAULT_VIBRATE;
			
				//���¹ٿ� �˸����
				manager.notify(1234, noti);
			}
		});
		
		
		
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
