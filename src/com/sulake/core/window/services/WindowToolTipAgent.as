package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IToolTipAgentService
   {
       
      
      protected var var_1156:String;
      
      protected var var_252:IToolTipWindow;
      
      protected var var_341:Timer;
      
      protected var var_1155:Point;
      
      protected var var_1157:Point;
      
      protected var var_1395:uint;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         this.var_1157 = new Point();
         this.var_1155 = new Point(20,20);
         this.var_1395 = 500;
         super(param1);
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               this.var_1156 = IInteractiveWindow(param1).toolTipCaption;
               this.var_1395 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               this.var_1156 = param1.caption;
               this.var_1395 = 500;
            }
            _mouse.x = var_127.mouseX;
            _mouse.y = var_127.mouseY;
            getMousePositionRelativeTo(param1,_mouse,this.var_1157);
            if(this.var_1156 != null && this.var_1156 != "")
            {
               if(this.var_341 == null)
               {
                  this.var_341 = new Timer(this.var_1395,1);
                  this.var_341.addEventListener(TimerEvent.TIMER,this.showToolTip);
               }
               this.var_341.reset();
               this.var_341.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(this.var_341 != null)
         {
            this.var_341.stop();
            this.var_341.removeEventListener(TimerEvent.TIMER,this.showToolTip);
            this.var_341 = null;
         }
         this.hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,this.var_1157);
            if(this.var_252 != null && !this.var_252.disposed)
            {
               this.var_252.x = param1 + this.var_1155.x;
               this.var_252.y = param2 + this.var_1155.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_341 != null)
         {
            this.var_341.reset();
         }
         if(_window && true)
         {
            if(this.var_252 == null || this.var_252.disposed)
            {
               this.var_252 = _window.context.create("undefined::ToolTip",this.var_1156,WindowType.const_371,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            this.var_252.x = _loc2_.x + this.var_1157.x + this.var_1155.x;
            this.var_252.y = _loc2_.y + this.var_1157.y + this.var_1155.y;
         }
      }
      
      protected function hideToolTip() : void
      {
         if(this.var_252 != null && !this.var_252.disposed)
         {
            this.var_252.destroy();
            this.var_252 = null;
         }
      }
   }
}
