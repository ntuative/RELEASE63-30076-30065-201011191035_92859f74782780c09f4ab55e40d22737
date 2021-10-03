package com.sulake.core.window.utils
{
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MouseEventQueue extends GenericEventQueue
   {
       
      
      protected var var_1393:Point;
      
      public function MouseEventQueue(param1:IEventDispatcher)
      {
         super(param1);
         this.var_1393 = new Point();
         var_211.addEventListener(MouseEvent.CLICK,this.mouseEventListener,false);
         var_211.addEventListener(MouseEvent.DOUBLE_CLICK,this.mouseEventListener,false);
         var_211.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseEventListener,false);
         var_211.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseEventListener,false);
         var_211.addEventListener(MouseEvent.MOUSE_UP,this.mouseEventListener,false);
         var_211.addEventListener(MouseEvent.MOUSE_WHEEL,this.mouseEventListener,false);
      }
      
      public function get mousePosition() : Point
      {
         return this.var_1393;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            var_211.removeEventListener(MouseEvent.CLICK,this.mouseEventListener,false);
            var_211.removeEventListener(MouseEvent.DOUBLE_CLICK,this.mouseEventListener,false);
            var_211.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseEventListener,false);
            var_211.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseEventListener,false);
            var_211.removeEventListener(MouseEvent.MOUSE_UP,this.mouseEventListener,false);
            var_211.removeEventListener(MouseEvent.MOUSE_WHEEL,this.mouseEventListener,false);
            super.dispose();
         }
      }
      
      private function mouseEventListener(param1:MouseEvent) : void
      {
         this.var_1393.x = param1.stageX;
         this.var_1393.y = param1.stageY;
         var_400.push(param1);
      }
   }
}