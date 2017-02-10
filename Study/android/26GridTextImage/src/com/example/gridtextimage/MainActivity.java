package com.example.gridtextimage;

import android.os.Bundle;
import android.app.Activity;
import android.content.Context;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.GridLayout;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;

public class MainActivity extends Activity {

	
	GridView gridView;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	
	gridView=(GridView)findViewById(R.id.gridView1);
	//GridView �ƴ��Ϳ� ���
	gridView.setAdapter(new ImageAdapter(this));
	
	
	}
	
	//�ƴ��� ���� Ŭ����
	private class ImageAdapter extends BaseAdapter
	{
		private Context context;
		private Integer []images={
				R.drawable.a,
				R.drawable.b,
				R.drawable.c,
				R.drawable.d,
				R.drawable.e,
				R.drawable.f,
								};
		
		//������
		public ImageAdapter(Context context)
		{
			this.context=context;
		}
	
		@Override
		public int getCount() {
			// TODO Auto-generated method stub
			return images.length;
		}
		
		@Override
		public Object getItem(int position) {
			// TODO Auto-generated method stub
			return images[position];
		}
		
		@Override
		public long getItemId(int position) {
			// TODO Auto-generated method stub
			return position;
		}
		
		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			// TODO Auto-generated method stub
			ImageView imageView;
			
			if(convertView==null)
			{
				//������ �� �ִ� �̹����䰡 ���� ����
				imageView = new ImageView(context);
			}
			else
			{
				//������ �� �ִ� �̹����䰡 ���� ���
				imageView=(ImageView)convertView;
			}
			//�̹����� ũ��� ���� ����
			imageView.setLayoutParams(new GridView.LayoutParams(80, 80));
			imageView.setScaleType(ScaleType.FIT_CENTER);
			imageView.setPadding(10, 10, 10, 10);
			
			//�̹����� ���ڷ� �Ѿ�� position�� �°� ����
			imageView.setImageResource(images[position]);
			return imageView;
		}
	}
	

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
