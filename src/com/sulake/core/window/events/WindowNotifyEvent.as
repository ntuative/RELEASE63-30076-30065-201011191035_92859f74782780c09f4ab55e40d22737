package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1298:String = "WN_CRETAE";
      
      public static const const_1411:String = "WN_CREATED";
      
      public static const const_1050:String = "WN_DESTROY";
      
      public static const const_971:String = "WN_DESTROYED";
      
      public static const const_980:String = "WN_OPEN";
      
      public static const const_952:String = "WN_OPENED";
      
      public static const const_972:String = "WN_CLOSE";
      
      public static const const_1059:String = "WN_CLOSED";
      
      public static const const_953:String = "WN_FOCUS";
      
      public static const const_941:String = "WN_FOCUSED";
      
      public static const const_920:String = "WN_UNFOCUS";
      
      public static const const_1027:String = "WN_UNFOCUSED";
      
      public static const const_982:String = "WN_ACTIVATE";
      
      public static const const_314:String = "WN_ACTVATED";
      
      public static const const_871:String = "WN_DEACTIVATE";
      
      public static const const_1023:String = "WN_DEACTIVATED";
      
      public static const const_462:String = "WN_SELECT";
      
      public static const const_329:String = "WN_SELECTED";
      
      public static const const_584:String = "WN_UNSELECT";
      
      public static const const_712:String = "WN_UNSELECTED";
      
      public static const const_913:String = "WN_LOCK";
      
      public static const const_949:String = "WN_LOCKED";
      
      public static const const_1028:String = "WN_UNLOCK";
      
      public static const const_875:String = "WN_UNLOCKED";
      
      public static const const_1049:String = "WN_ENABLE";
      
      public static const const_672:String = "WN_ENABLED";
      
      public static const const_929:String = "WN_DISABLE";
      
      public static const const_685:String = "WN_DISABLED";
      
      public static const const_592:String = "WN_RESIZE";
      
      public static const const_173:String = "WN_RESIZED";
      
      public static const const_994:String = "WN_RELOCATE";
      
      public static const const_434:String = "WN_RELOCATED";
      
      public static const const_944:String = "WN_MINIMIZE";
      
      public static const const_1021:String = "WN_MINIMIZED";
      
      public static const const_1018:String = "WN_MAXIMIZE";
      
      public static const const_1076:String = "WN_MAXIMIZED";
      
      public static const const_918:String = "WN_RESTORE";
      
      public static const const_931:String = "WN_RESTORED";
      
      public static const const_1616:String = "WN_ARRANGE";
      
      public static const const_1721:String = "WN_ARRANGED";
      
      public static const const_1685:String = "WN_UPDATE";
      
      public static const const_1687:String = "WN_UPDATED";
      
      public static const const_343:String = "WN_CHILD_ADDED";
      
      public static const const_610:String = "WN_CHILD_REMOVED";
      
      public static const WINDOW_NOTIFY_CHILD_RESIZED:String = "WN_CHILD_RESIZED";
      
      public static const const_304:String = "WN_CHILD_RELOCATED";
      
      public static const const_207:String = "WN_CHILD_ACTIVATED";
      
      public static const const_512:String = "WN_PARENT_ADDED";
      
      public static const const_878:String = "WN_PARENT_REMOVED";
      
      public static const const_394:String = "WN_PARENT_RESIZED";
      
      public static const const_1074:String = "WN_PARENT_RELOCATED";
      
      public static const const_724:String = "WN_PARENT_ACTIVATED";
      
      public static const const_393:String = "WN_STATE_UPDATED";
      
      public static const const_436:String = "WN_STYLE_UPDATED";
      
      public static const const_450:String = "WN_PARAM_UPDATED";
      
      public static const const_1686:String = "";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1853,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
