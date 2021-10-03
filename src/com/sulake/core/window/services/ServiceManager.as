package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices
   {
       
      
      private var var_2605:uint;
      
      private var var_127:DisplayObject;
      
      private var _windowContext:IWindowContext;
      
      private var var_1030:IMouseDraggingService;
      
      private var var_1032:IMouseScalingService;
      
      private var var_1034:IMouseListenerService;
      
      private var var_1031:IFocusManagerService;
      
      private var var_1029:IToolTipAgentService;
      
      private var var_1033:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2605 = 0;
         this.var_127 = param2;
         this._windowContext = param1;
         this.var_1030 = new WindowMouseDragger(param2);
         this.var_1032 = new WindowMouseScaler(param2);
         this.var_1034 = new WindowMouseListener(param2);
         this.var_1031 = new FocusManager(param2);
         this.var_1029 = new WindowToolTipAgent(param2);
         this.var_1033 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1030 != null)
         {
            this.var_1030.dispose();
            this.var_1030 = null;
         }
         if(this.var_1032 != null)
         {
            this.var_1032.dispose();
            this.var_1032 = null;
         }
         if(this.var_1034 != null)
         {
            this.var_1034.dispose();
            this.var_1034 = null;
         }
         if(this.var_1031 != null)
         {
            this.var_1031.dispose();
            this.var_1031 = null;
         }
         if(this.var_1029 != null)
         {
            this.var_1029.dispose();
            this.var_1029 = null;
         }
         if(this.var_1033 != null)
         {
            this.var_1033.dispose();
            this.var_1033 = null;
         }
         this._windowContext = null;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1030;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1032;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1034;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1031;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1029;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1033;
      }
   }
}
