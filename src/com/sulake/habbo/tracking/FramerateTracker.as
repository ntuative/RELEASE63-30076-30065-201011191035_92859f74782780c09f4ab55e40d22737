package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class FramerateTracker
   {
       
      
      private var var_1564:int;
      
      private var var_2424:int;
      
      private var var_1092:int;
      
      private var var_431:Number;
      
      private var var_2422:Boolean;
      
      private var var_2423:int;
      
      private var var_1733:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2424 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2423 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2422 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1092;
         var _loc3_:int = getTimer();
         if(this.var_1092 == 1)
         {
            this.var_431 = param1;
            this.var_1564 = _loc3_;
         }
         else
         {
            _loc4_ = Number(this.var_1092);
            this.var_431 = this.var_431 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2422 && _loc3_ - this.var_1564 >= this.var_2424 && this.var_1733 < this.var_2423)
         {
            _loc5_ = 1000 / this.var_431;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1733;
            this.var_1564 = _loc3_;
            this.var_1092 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
