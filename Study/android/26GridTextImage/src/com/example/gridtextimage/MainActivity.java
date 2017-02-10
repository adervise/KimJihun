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
	//GridView 아답터에 등록
	gridView.setAdapter(new ImageAdapter(this));
	
	
	}
	
	//아답터 내부 클래스
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
		
		//생성자
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
				//재사용할 수 있는 이미지뷰가 없을 경유
				imageView = new ImageView(context);
			}
			else
			{
				//재사용할 수 있는 이미지뷰가 있을 경우
				imageView=(ImageView)convertView;
			}
			//이미지뷰 크기와 여백 지정
			imageView.setLayoutParams(new GridView.LayoutParams(80, 80));
			imageView.setScaleType(ScaleType.FIT_CENTER);
			imageView.setPadding(10, 10, 10, 10);
			
			//이미지를 인자로 넘어온 position에 맞게 설정
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
