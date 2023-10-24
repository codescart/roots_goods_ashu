package com.codescart.rootgoods

import kotlin.concurrent.thread

import android.util.Log
import android.widget.Toast
import com.google.android.play.core.appupdate.AppUpdateManager
import com.google.android.play.core.appupdate.AppUpdateManagerFactory
import com.google.android.play.core.install.InstallStateUpdatedListener
import com.google.android.play.core.install.model.AppUpdateType.FLEXIBLE
import com.google.android.play.core.install.model.InstallStatus
import com.google.android.play.core.install.model.UpdateAvailability
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private  val channelname = "updatappinapp";
    val isRunning = true
    private lateinit var appUpdateManager: AppUpdateManager
    val MY_REQUEST_CODE = 10
    private val TAG = "MainActivityTag"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,channelname);
        appUpdateManager = AppUpdateManagerFactory.create(this)
        channel.setMethodCallHandler { call, result ->
            if (call.method == "updatemyapp"){
//                Toast.makeText(this, "Ajay Kumar", Toast.LENGTH_SHORT).show()
                checkUpdate()
            }
        }
    }

    private val listener: InstallStateUpdatedListener =
        InstallStateUpdatedListener { installState ->
            if (installState.installStatus() == InstallStatus.DOWNLOADED) {
                // After the update is downloaded, show a notification
                // and request user confirmation to restart the app.
                Log.d(TAG, "inAppUpdateTag" + "An update has been downloaded")
                appUpdateManager.completeUpdate()
                unregisterInstalling()
            }
        }

    private fun unregisterInstalling() {
        appUpdateManager.unregisterListener(listener)
    }


    private fun checkUpdate() {
        // Returns an intent object that you use to check for an update.
        val appUpdateInfoTask = appUpdateManager.appUpdateInfo
        // Checks that the platform will allow the specified type of update.
        Log.d(TAG, "inAppUpdateTag" + "Checking for updates")
        appUpdateInfoTask.addOnSuccessListener { appUpdateInfo ->
            if (appUpdateInfo.updateAvailability() == UpdateAvailability.UPDATE_AVAILABLE
                && appUpdateInfo.isUpdateTypeAllowed(FLEXIBLE)
            ) {
                // Request the update.
                appUpdateManager.registerListener(listener)
                appUpdateManager.startUpdateFlowForResult(
                    // Pass the intent that is returned by 'getAppUpdateInfo()'.
                    appUpdateInfo,
                    // Or 'AppUpdateType.FLEXIBLE' for flexible updates.
                    FLEXIBLE,
                    // The current activity making the update request.
                    this,
                    // Include a request code to later monitor this update request.
                    MY_REQUEST_CODE
                )

                Log.d(TAG, "inAppUpdateTag" + "Update available")
            }
            else {
                appUpdateManager.unregisterListener(listener)
                Log.d(TAG, "inAppUpdateTag" + "No Update available")
            }
        }
    }
    override fun onResume() {
        super.onResume()
        appUpdateManager
            .appUpdateInfo
            .addOnSuccessListener { appUpdateInfo ->
                if (appUpdateInfo.updateAvailability()
                    == UpdateAvailability.DEVELOPER_TRIGGERED_UPDATE_IN_PROGRESS
                ) {
                    // If an in-app update is already running, resume the update.
                    appUpdateManager.startUpdateFlowForResult(
                        appUpdateInfo,
                        FLEXIBLE,
                        this,
                        MY_REQUEST_CODE
                    );
                }
            }
    }
}
