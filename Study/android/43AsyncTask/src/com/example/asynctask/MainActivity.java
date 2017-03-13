package com.example.asynctask;

import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;



// - AsyncTask : �����۾� ��� �� �ϳ��� ��Ƽ������ , ���� UI�� ���� �۾��� ����  ���� ��Ƽ�������� �����ϰ� ���ִ� ����̴�.
// - AsyncTask �� �� Ŭ���� �ȿ��� UI �۾��� �����Ͻ��� ���� ó���ϱ� ������ �����ϴ�.
// - ��뿹 : �ٿ�ε峪 �α��� ��� UI�� ������ ���� ����Ǿ� �ϴ� ���� ���� AsyncTask�� ����Ѵٰ� �� �� �ִ�.
// - AsyncTask �� ���� Ŭ������ �̿��ؼ� �����Ѵ�.


public class MainActivity extends Activity {

	int mValue;
	TextView mText;
	Button btn;
	ProgressDialog mProgess;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		mText=(TextView)findViewById(R.id.textView1);
		btn=(Button)findViewById(R.id.button1);

		btn.setOnClickListener(new OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				new Accumulatetask().execute();
			}
		});


	}

	//AsyncTask ���� Ŭ����
	class Accumulatetask extends AsyncTask<Integer, Integer, Integer>
	{


		/*   onPreExecute() : 
		 doInBackground �޼ҵ尡 ��׶��忡�� ����Ǳ� ������ ȣ��
		   �ʱ�ȭ�ϰų� ��׶��尡 ����Ǳ� ���� ó���� �ڵ���� �̰����� �ָ� �ȴ�.   */
		@Override
		protected void onPreExecute() {
			// TODO Auto-generated method stub
			Log.i("MyTag","onPreExecute");
			mValue = 0 ;
			mProgess=new ProgressDialog(MainActivity.this);
			mProgess.setProgress(ProgressDialog.STYLE_HORIZONTAL);
			mProgess.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
			mProgess.setTitle("Downloading...");
			mProgess.setMessage("Wait....");
			mProgess.setCancelable(false);
			mProgess.setProgress(0);
			mProgess.setButton(DialogInterface.BUTTON_NEUTRAL,
					"Cancel",
					new DialogInterface.OnClickListener() {

				@Override
				public void onClick(DialogInterface dialog, int which) {
					// TODO Auto-generated method stub
					cancel(true);
				}
			});

			mProgess.show();
		}


		/* doInBackground�� ������ �۾��� ��ĥ������ ��׶��忡�� ��� ���� */
		@Override
		protected Integer doInBackground(Integer... params) {
			// TODO Auto-generated method stub
			Log.i("MyTag","doInBackground");

			while(isCancelled()==false)
			{
				mValue++;
				if(mValue<=100)
					publishProgress(mValue);
				else
					break;

				try 
				{
					Thread.sleep(50);
				} 
				catch (InterruptedException e) 
				{
					// TODO: handle exception
					e.printStackTrace();
				}

			}

			return mValue;

		}

		@Override
		protected void onCancelled() {
			// TODO Auto-generated method stub
			Log.i("MyTag","onCancelled");
			mProgess.dismiss();
			super.onCancelled();
		}

		@Override
		protected void onPostExecute(Integer result) {
			// TODO Auto-generated method stub
			Log.i("MyTag","onPostExecute");
			mProgess.dismiss();//â �ݱ�
			super.onPostExecute(result);
		}


		//
		// onProgressUpdate��
		//doInBackground ���� publishProgress�� ȣ���ϸ� ���ڷ� �ѱ䰪�� �޾� ȣ��ȴ�
		

		@Override
		protected void onProgressUpdate(Integer... values) {
			// TODO Auto-generated method stub
			Log.i("MyTag","onProgressUpdate");
			
			//ȭ�� view�� ������ �ݿ�
			mProgess.setProgress(values[0]);
			mText.setText(String.valueOf(values[0]));
		}

	}


	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
