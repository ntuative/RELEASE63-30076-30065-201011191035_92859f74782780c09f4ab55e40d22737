package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1420:String = "WE_CREATE";
      
      public static const const_1437:String = "WE_CREATED";
      
      public static const const_1453:String = "WE_DESTROY";
      
      public static const const_272:String = "WE_DESTROYED";
      
      public static const const_1388:String = "WE_OPEN";
      
      public static const const_1404:String = "WE_OPENED";
      
      public static const const_1432:String = "WE_CLOSE";
      
      public static const const_1283:String = "WE_CLOSED";
      
      public static const const_1282:String = "WE_FOCUS";
      
      public static const const_275:String = "WE_FOCUSED";
      
      public static const const_1265:String = "WE_UNFOCUS";
      
      public static const const_1434:String = "WE_UNFOCUSED";
      
      public static const const_1441:String = "WE_ACTIVATE";
      
      public static const const_1351:String = "WE_ACTIVATED";
      
      public static const const_1392:String = "WE_DEACTIVATE";
      
      public static const const_1033:String = "WE_DEACTIVATED";
      
      public static const const_438:String = "WE_SELECT";
      
      public static const const_62:String = "WE_SELECTED";
      
      public static const const_645:String = "WE_UNSELECT";
      
      public static const const_789:String = "WE_UNSELECTED";
      
      public static const const_1593:String = "WE_ATTACH";
      
      public static const const_1649:String = "WE_ATTACHED";
      
      public static const const_1698:String = "WE_DETACH";
      
      public static const const_1717:String = "WE_DETACHED";
      
      public static const const_1466:String = "WE_LOCK";
      
      public static const const_1413:String = "WE_LOCKED";
      
      public static const const_1485:String = "WE_UNLOCK";
      
      public static const const_1262:String = "WE_UNLOCKED";
      
      public static const const_652:String = "WE_ENABLE";
      
      public static const const_305:String = "WE_ENABLED";
      
      public static const const_658:String = "WE_DISABLE";
      
      public static const const_223:String = "WE_DISABLED";
      
      public static const const_1293:String = "WE_RELOCATE";
      
      public static const const_312:String = "WE_RELOCATED";
      
      public static const const_1276:String = "WE_RESIZE";
      
      public static const const_45:String = "WE_RESIZED";
      
      public static const const_1290:String = "WE_MINIMIZE";
      
      public static const const_1335:String = "WE_MINIMIZED";
      
      public static const const_1389:String = "WE_MAXIMIZE";
      
      public static const const_1350:String = "WE_MAXIMIZED";
      
      public static const const_1331:String = "WE_RESTORE";
      
      public static const const_1367:String = "WE_RESTORED";
      
      public static const const_1702:String = "WE_ARRANGE";
      
      public static const const_1672:String = "WE_ARRANGED";
      
      public static const const_96:String = "WE_UPDATE";
      
      public static const const_1701:String = "WE_UPDATED";
      
      public static const const_1548:String = "WE_CHILD_RELOCATE";
      
      public static const const_504:String = "WE_CHILD_RELOCATED";
      
      public static const const_1694:String = "WE_CHILD_RESIZE";
      
      public static const const_273:String = "WE_CHILD_RESIZED";
      
      public static const const_1736:String = "WE_CHILD_REMOVE";
      
      public static const const_510:String = "WE_CHILD_REMOVED";
      
      public static const const_1655:String = "WE_PARENT_RELOCATE";
      
      public static const const_1603:String = "WE_PARENT_RELOCATED";
      
      public static const const_1640:String = "WE_PARENT_RESIZE";
      
      public static const const_1449:String = "WE_PARENT_RESIZED";
      
      public static const const_184:String = "WE_OK";
      
      public static const const_734:String = "WE_CANCEL";
      
      public static const const_108:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_400:String = "WE_SCROLL";
      
      public static const const_155:String = "";
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_1853:IWindow;
      
      protected var var_1854:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_1853 = param3;
         this.var_1854 = false;
         super(param1,param4,param5);
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_1853;
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(this._type,this.window,this.related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            this.var_1854 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1854;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
   }
}
