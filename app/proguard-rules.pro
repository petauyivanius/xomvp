-optimizationpasses 5
-dontskipnonpubliclibraryclassmembers
-dontskipnonpubliclibraryclasses
-allowaccessmodification
-repackageclasses ''
-dontpreverify
-verbose

-keepclassmembers class com.ironsource.sdk.controller.IronSourceWebView$JSInterface {
    public *;
}
-keepclassmembers class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}
-keep public class com.google.android.gms.ads.** {
   public *;
}
-keep class com.ironsource.adapters.** { *;
}
-dontwarn com.moat.**
-keep class com.moat.** { public protected private *; }
-dontwarn com.akexorcist.roundcornerprogressbar.TextRoundCornerProgressBar
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
# Keep ADCNative class members unobfuscated
-keepclassmembers class com.adcolony.sdk.ADCNative** {
    *;
 }
# For removing warnings due to lack of Multi-Window support
-dontwarn android.app.Activity
-keep class com.adcolony.sdk.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class android.content.ComponentName.** { *; }
-dontwarn com.adcolony.sdk.**
-dontwarn com.google.android.gms.**
-dontwarn android.content.ComponentName.**
-dontwarn com.applovin.**
-keep class com.applovin.** { *; }
-keep class com.google.android.gms.ads.identifier.** { *; }
-keepclassmembers class com.supersonicads.sdk.controller.SupersonicWebView$JSInterface {
    public *;
}
-keepclassmembers class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}
-keep public class com.google.android.gms.ads.** {
   public *;
}
-keep class com.supersonic.adapters.** { *;
}
-keep class com.startapp.** {
      *;
}
-keepattributes Exceptions, InnerClasses, Signature, Deprecated, SourceFile, LineNumberTable, *Annotation*, EnclosingMethod
-dontwarn android.webkit.JavascriptInterface
-dontwarn com.startapp.**
# For Google Play Services
-keep public class com.google.android.gms.ads.**{
   public *;
}
# For old ads classes
-keep public class com.google.ads.**{
   public *;
}
# For mediation
-keepattributes *Annotation*
# Other required classes for Google Play Services
# Read more at http://developer.android.com/google/play-services/setup.html
-keep class * extends java.util.ListResourceBundle {
   protected Object[][] getContents();
}
-keep public class com.google.android.gms.common.internal.safeparcel.SafeParcelable {
   public static final *** NULL;
}
-keepnames @com.google.android.gms.common.annotation.KeepName class *
-keepclassmembernames class * {
   @com.google.android.gms.common.annotation.KeepName *;
}
-keepnames class * implements android.os.Parcelable {
   public static final ** CREATOR;
}
   # AdFyber Mediation
-keep class com.sponsorpay.mediation.** { *;}
-keepattributes JavascriptInterface
-keep class com.sponsorpay.publisher.mbe.mediation.SPBrandEngageMediationJSInterface {
       void setValue(java.lang.String);
}
-keep class android.webkit.JavascriptInterface
# GreenRobot
-dontwarn de.greenrobot.event.util.**
# RxJava
-dontwarn rx.internal.util.unsafe.**
-keepclassmembers class rx.internal.util.unsafe.*ArrayQueue*Field* {
   long producerIndex;
   long consumerIndex;
}
-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueProducerNodeRef {
   rx.internal.util.atomic.LinkedQueueNode producerNode;
}
-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueConsumerNodeRef {
   rx.internal.util.atomic.LinkedQueueNode consumerNode;
}
-keep class rx.schedulers.Schedulers { public static <methods>; }
-keep class rx.schedulers.ImmediateScheduler { public <methods>; }
-keep class rx.schedulers.TestScheduler { public <methods>; }
-keep class rx.schedulers.Schedulers { public static ** test(); }
# MOAT
-dontwarn com.moat.**
-keep class com.moat.** { public protected private *; }
# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html
# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class nameView to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}
# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable
# If you keep the line number information, uncomment this to
# hide the original source file nameView.
#-renamesourcefileattribute SourceFile
# ClKooook classes
#-keep class com.paket.veepnnew.data.global.models.** { *; }
#-keep class com.paket.veepnnew.domain.global.models.** { *; }
# VPN clients
-keep class com.paket.veepnnew.vpncore.ovpn.NativeUtils
-keep class org.strongswan.android.** { *; }
# Okio
-dontwarn okio.**
-dontwarn com.google.errorprone.annotations.*
-dontwarn okio.**
# Retrofit
-dontwarn com.google.errorprone.annotations.*
-dontwarn okio.**
-dontwarn retrofit2.Platform$Java8
# support
-keep class android.support.v4.** { *; }
-keep public class android.support.v7.widget.** { *; }
-keep public class android.support.v7.internal.widget.** { *; }
-keep public class android.support.v7.internal.view.menu.** { *; }
-keep public class * extends android.support.v4.view.ActionProvider {
    public <init>(android.content.Context);
}
# support-design
-dontwarn android.support.design.**
-keep class android.support.design.** { *; }
-keep interface android.support.design.** { *; }
-keep public class android.support.design.R$* { *; }
# kotlin annotations
-dontwarn kotlin.reflect.jvm.internal.impl.descriptors.CallableDescriptor
-dontwarn kotlin.reflect.jvm.internal.impl.descriptors.ClassDescriptor
-dontwarn kotlin.reflect.jvm.internal.impl.descriptors.ClassifierDescriptorWithTypeParameters
-dontwarn kotlin.reflect.jvm.internal.impl.descriptors.annotations.AnnotationDescriptor
-dontwarn kotlin.reflect.jvm.internal.impl.descriptors.impl.PropertyDescriptorImpl
-dontwarn kotlin.reflect.jvm.internal.impl.loadAndPlay.java.JavaClassFinder
-dontwarn kotlin.reflect.jvm.internal.impl.resolve.OverridingUtil
-dontwarn kotlin.reflect.jvm.internal.impl.types.DescriptorSubstitutor
-dontwarn kotlin.reflect.jvm.internal.impl.types.DescriptorSubstitutor
-dontwarn kotlin.reflect.jvm.internal.impl.types.TypeConstructor
-dontwarn com.yalantis.ucrop**
-keep class com.yalantis.ucrop** { *; }
-keep interface com.yalantis.ucrop** { *; }
# okhttp
-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn javax.annotation.**
-keep class com.squareup.okhttp.** { *; }
-dontwarn com.squareup.okhttp.**
# A resource is loaded with a relative path so the package of this class must be preserved.
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase
# Kotlin coroutines
-keepclassmembernames class kotlinx.** {
    volatile <fields>;
}
-keep class kotlinx.coroutines.experimental.** { *; }
##---------------Begin: proguard configuration for Gson  ----------
# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
-keepattributes Signature
-keep class com.google.gson.** { *; }
-keepclassmembers enum * { *; }
# For using GSON @Expose annotation
-keepattributes *Annotation*
# Gson specific classes
-dontwarn sun.misc.**
#-keep class com.google.gson.stream.** { *; }
# Application classes that will be serialized/deserialized over Gson
-keep class com.google.gson.examples.android.model.** { *; }
# Prevent proguard from stripping interface information from TypeAdapterFactory,
# JsonSerializer, JsonDeserializer instances (so they can be used in @JsonAdapter)
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
# Analytic Amplituda
-keep class com.google.android.gms.ads.** { *; }
-dontwarn okio.**
#Appsflayer
-dontwarn com.android.installreferrerCopy
##---------------End: proguard configuration for Gson  ----------

-dontwarn org.jetbrains.anko.internals.AnkoInternals
-dontwarn androidx.**
-keep class androidx.** { *; }
-keep interface androidx.** { *; }
-keep class CatchDeepLinkActivity

-dontwarn java.awt.**

-keep public class com.google.android.gms.common.internal.safeparcel.SafeParcelable {
    public static final *** NULL;
}

-keepnames class * implements android.os.Parcelable
-keepclassmembers class * implements android.os.Parcelable {
  public static final *** CREATOR;
}

-keep @interface android.support.annotation.Keep
-keep @android.support.annotation.Keep class *
#-keepclasseswithmembers class * {
#  @android.support.annotation.Keep;
#}
#-keepclasseswithmembers class * {
#  @android.support.annotation.Keep;
#}

-keep @interface com.google.android.gms.common.annotation.KeepName
-keepnames @com.google.android.gms.common.annotation.KeepName class *
-keepclassmembernames class * {
  @com.google.android.gms.common.annotation.KeepName * ;
}

#-keep @interface com.google.android.gms.common.util.DynamiteApi
#-keep public @com.google.android.gms.common.util.DynamiteApi class * {
#  public ;
#  public ;
#}

-dontwarn android.security.NetworkSecurityPolicy

-dontwarn com.appsflyer.AFKeystoreWrapper

-keep class com.appsflyer.** { *; }

-keep class org.apache.** { *; }
-keepnames class com.fasterxml.jackson.** { *; }
-keepnames class javax.servlet.** { *; }
-keepnames class org.ietf.jgss.** { *; }
-dontwarn org.apache.**
-dontwarn org.w3c.dom.**

-dontwarn android.support.v4.**-optimizationpasses
-dontskipnonpubliclibraryclassmembers
-dontskipnonpubliclibraryclasses
-allowaccessmodification
-repackageclasses ''
-dontpreverify
-verbose

-keepclassmembers class com.ironsource.sdk.controller.IronSourceWebView$JSInterface {
    public *;
}
-keepclassmembers class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}
-keep public class com.google.android.gms.ads.** {
   public *;
}
-keep class com.ironsource.adapters.** { *;
}
-dontwarn com.moat.**
-keep class com.moat.** { public protected private *; }
-dontwarn com.akexorcist.roundcornerprogressbar.TextRoundCornerProgressBar
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
# Keep ADCNative class members unobfuscated
-keepclassmembers class com.adcolony.sdk.ADCNative** {
    *;
 }
# For removing warnings due to lack of Multi-Window support
-dontwarn android.app.Activity
-keep class com.adcolony.sdk.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class android.content.ComponentName.** { *; }
-dontwarn com.adcolony.sdk.**
-dontwarn com.google.android.gms.**
-dontwarn android.content.ComponentName.**
-dontwarn com.applovin.**
-keep class com.applovin.** { *; }
-keep class com.google.android.gms.ads.identifier.** { *; }
-keepclassmembers class com.supersonicads.sdk.controller.SupersonicWebView$JSInterface {
    public *;
}
-keepclassmembers class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}
-keep public class com.google.android.gms.ads.** {
   public *;
}
-keep class com.supersonic.adapters.** { *;
}
-keep class com.startapp.** {
      *;
}
-keepattributes Exceptions, InnerClasses, Signature, Deprecated, SourceFile, LineNumberTable, *Annotation*, EnclosingMethod
-dontwarn android.webkit.JavascriptInterface
-dontwarn com.startapp.**
# For Google Play Services
-keep public class com.google.android.gms.ads.**{
   public *;
}
# For old ads classes
-keep public class com.google.ads.**{
   public *;
}
# For mediation
-keepattributes *Annotation*
# Other required classes for Google Play Services
# Read more at http://developer.android.com/google/play-services/setup.html
-keep class * extends java.util.ListResourceBundle {
   protected Object[][] getContents();
}
-keep public class com.google.android.gms.common.internal.safeparcel.SafeParcelable {
   public static final *** NULL;
}
-keepnames @com.google.android.gms.common.annotation.KeepName class *
-keepclassmembernames class * {
   @com.google.android.gms.common.annotation.KeepName *;
}
-keepnames class * implements android.os.Parcelable {
   public static final ** CREATOR;
}
   # AdFyber Mediation
-keep class com.sponsorpay.mediation.** { *;}
-keepattributes JavascriptInterface
-keep class com.sponsorpay.publisher.mbe.mediation.SPBrandEngageMediationJSInterface {
       void setValue(java.lang.String);
}
-keep class android.webkit.JavascriptInterface
# GreenRobot
-dontwarn de.greenrobot.event.util.**
# RxJava
-dontwarn rx.internal.util.unsafe.**
-keepclassmembers class rx.internal.util.unsafe.*ArrayQueue*Field* {
   long producerIndex;
   long consumerIndex;
}
-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueProducerNodeRef {
   rx.internal.util.atomic.LinkedQueueNode producerNode;
}
-keepclassmembers class rx.internal.util.unsafe.BaseLinkedQueueConsumerNodeRef {
   rx.internal.util.atomic.LinkedQueueNode consumerNode;
}
-keep class rx.schedulers.Schedulers { public static <methods>; }
-keep class rx.schedulers.ImmediateScheduler { public <methods>; }
-keep class rx.schedulers.TestScheduler { public <methods>; }
-keep class rx.schedulers.Schedulers { public static ** test(); }
# MOAT
-dontwarn com.moat.**
-keep class com.moat.** { public protected private *; }
# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html
# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class nameView to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}
# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable
# If you keep the line number information, uncomment this to
# hide the original source file nameView.
#-renamesourcefileattribute SourceFile
# MyDataBase classes
#-keep class com.paket.veepnnew.data.global.models.** { *; }
#-keep class com.paket.veepnnew.domain.global.models.** { *; }
# VPN clients
-keep class com.paket.veepnnew.vpncore.ovpn.NativeUtils
-keep class org.strongswan.android.** { *; }
# Okio
-dontwarn okio.**
-dontwarn com.google.errorprone.annotations.*
-dontwarn okio.**
# Retrofit
-dontwarn com.google.errorprone.annotations.*
-dontwarn okio.**
-dontwarn retrofit2.Platform$Java8
# support
-keep class android.support.v4.** { *; }
-keep public class android.support.v7.widget.** { *; }
-keep public class android.support.v7.internal.widget.** { *; }
-keep public class android.support.v7.internal.view.menu.** { *; }
-keep public class * extends android.support.v4.view.ActionProvider {
    public <init>(android.content.Context);
}
# support-design
-dontwarn android.support.design.**
-keep class android.support.design.** { *; }
-keep interface android.support.design.** { *; }
-keep public class android.support.design.R$* { *; }
# kotlin annotations
-dontwarn kotlin.reflect.jvm.internal.impl.descriptors.CallableDescriptor
-dontwarn kotlin.reflect.jvm.internal.impl.descriptors.ClassDescriptor
-dontwarn kotlin.reflect.jvm.internal.impl.descriptors.ClassifierDescriptorWithTypeParameters
-dontwarn kotlin.reflect.jvm.internal.impl.descriptors.annotations.AnnotationDescriptor
-dontwarn kotlin.reflect.jvm.internal.impl.descriptors.impl.PropertyDescriptorImpl
-dontwarn kotlin.reflect.jvm.internal.impl.loadAndPlay.java.JavaClassFinder
-dontwarn kotlin.reflect.jvm.internal.impl.resolve.OverridingUtil
-dontwarn kotlin.reflect.jvm.internal.impl.types.DescriptorSubstitutor
-dontwarn kotlin.reflect.jvm.internal.impl.types.DescriptorSubstitutor
-dontwarn kotlin.reflect.jvm.internal.impl.types.TypeConstructor
-dontwarn com.yalantis.ucrop**
-keep class com.yalantis.ucrop** { *; }
-keep interface com.yalantis.ucrop** { *; }
# okhttp
-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn javax.annotation.**
-keep class com.squareup.okhttp.** { *; }
-dontwarn com.squareup.okhttp.**
# A resource is loaded with a relative path so the package of this class must be preserved.
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase
# Kotlin coroutines
-keepclassmembernames class kotlinx.** {
    volatile <fields>;
}
-keep class kotlinx.coroutines.experimental.** { *; }
##---------------Begin: proguard configuration for Gson  ----------
# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
-keepattributes Signature
-keep class com.google.gson.** { *; }
-keepclassmembers enum * { *; }
# For using GSON @Expose annotation
-keepattributes *Annotation*
# Gson specific classes
-dontwarn sun.misc.**
#-keep class com.google.gson.stream.** { *; }
# Application classes that will be serialized/deserialized over Gson
-keep class com.google.gson.examples.android.model.** { *; }
# Prevent proguard from stripping interface information from TypeAdapterFactory,
# JsonSerializer, JsonDeserializer instances (so they can be used in @JsonAdapter)
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
# Analytic Amplituda
-keep class com.google.android.gms.ads.** { *; }
-dontwarn okio.**
#Appsflayer
-dontwarn com.android.installreferrerCopy
##---------------End: proguard configuration for Gson  ----------

-dontwarn org.jetbrains.anko.internals.AnkoInternals
-dontwarn androidx.**
-keep class androidx.** { *; }
-keep interface androidx.** { *; }

-dontwarn java.awt.**

-keep public class com.google.android.gms.common.internal.safeparcel.SafeParcelable {
    public static final *** NULL;
}

-keepnames class * implements android.os.Parcelable
-keepclassmembers class * implements android.os.Parcelable {
  public static final *** CREATOR;
}

-keep @interface android.support.annotation.Keep
-keep @android.support.annotation.Keep class *
#-keepclasseswithmembers class * {
#  @android.support.annotation.Keep;
#}
#-keepclasseswithmembers class * {
#  @android.support.annotation.Keep;
#}

-keep @interface com.google.android.gms.common.annotation.KeepName
-keepnames @com.google.android.gms.common.annotation.KeepName class *
-keepclassmembernames class * {
  @com.google.android.gms.common.annotation.KeepName * ;
}

#-keep @interface com.google.android.gms.common.util.DynamiteApi
#-keep public @com.google.android.gms.common.util.DynamiteApi class * {
#  public ;
#  public ;
#}

-dontwarn android.security.NetworkSecurityPolicy

# Add this global rule
-keepattributes Signature

# This rule will properly ProGuard all the model classes in
# the package com.yourcompany.models. Modify to fit the structure
# of your app.
-keepclassmembers class com.greatpreviews.android.** {
  *;
}



-keep class org.apache.** { *; }
-keepnames class com.fasterxml.jackson.** { *; }
-keepnames class javax.servlet.** { *; }
-keepnames class org.ietf.jgss.** { *; }
-dontwarn org.apache.**
-dontwarn org.w3c.dom.**

-dontwarn android.support.v4.**
-dontwarn com.google.android.gms.**
-keep class * implements java.io.Serializable { *; }
-keep class java.** { *; }