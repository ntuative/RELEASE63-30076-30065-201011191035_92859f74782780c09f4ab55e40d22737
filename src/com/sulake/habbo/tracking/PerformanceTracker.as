package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var _connection:IConnection = null;
      
      private var var_152:IHabboConfigurationManager = null;
      
      private var var_501:int = 0;
      
      private var var_431:Number = 0;
      
      private var var_2600:Array;
      
      private var var_1243:String = "";
      
      private var var_1568:String = "";
      
      private var var_2013:String = "";
      
      private var var_2016:String = "";
      
      private var var_1480:Boolean = false;
      
      private var var_1566:GarbageMonitor = null;
      
      private var var_1241:int = 0;
      
      private var var_1565:int = 1000;
      
      private var var_1240:int = 0;
      
      private var var_1563:int = 60;
      
      private var var_1564:int = 0;
      
      private var var_1567:int = 10;
      
      private var var_1242:int = 0;
      
      private var var_2185:Number = 0.15;
      
      private var var_2187:Boolean = true;
      
      private var var_2186:Number = 0;
      
      public function PerformanceTracker()
      {
         this.var_2600 = [];
         super();
         this.var_1568 = Capabilities.version;
         this.var_2013 = Capabilities.os;
         this.var_1480 = Capabilities.isDebugger;
         this.var_1243 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         if(this.var_1243 == null)
         {
            this.var_1243 = "unknown";
         }
         this.var_1566 = new GarbageMonitor();
         this.updateGarbageMonitor();
         this.var_1564 = getTimer();
      }
      
      public function get flashVersion() : String
      {
         return this.var_1568;
      }
      
      public function get averageUpdateInterval() : int
      {
         return this.var_431;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         this.var_1565 = param1;
      }
      
      public function set reportInterval(param1:int) : void
      {
         this.var_1563 = param1;
      }
      
      public function set reportLimit(param1:int) : void
      {
         this.var_1567 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         this.var_152 = param1;
         this.var_1563 = int(this.var_152.getKey("performancetest.interval","60"));
         this.var_1565 = int(this.var_152.getKey("performancetest.slowupdatelimit","1000"));
         this.var_1567 = int(this.var_152.getKey("performancetest.reportlimit","10"));
         this.var_2185 = Number(this.var_152.getKey("performancetest.distribution.deviancelimit.percent","10"));
         this.var_2187 = Boolean(int(this.var_152.getKey("performancetest.distribution.enabled","1")));
      }
      
      public function dispose() : void
      {
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_1566.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            this.var_1566.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = this.updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++this.var_1241;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > this.var_1565)
         {
            ++this.var_1240;
            _loc3_ = true;
         }
         else
         {
            ++this.var_501;
            if(this.var_501 <= 1)
            {
               this.var_431 = param1;
            }
            else
            {
               _loc4_ = Number(this.var_501);
               this.var_431 = this.var_431 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - this.var_1564 > this.var_1563 * 1000 && this.var_1242 < this.var_1567)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / this.var_431);
            _loc5_ = true;
            if(this.var_2187 && this.var_1242 > 0)
            {
               _loc6_ = this.differenceInPercents(this.var_2186,this.var_431);
               if(_loc6_ < this.var_2185)
               {
                  _loc5_ = false;
               }
            }
            this.var_1564 = getTimer();
            if(_loc5_ || _loc3_)
            {
               this.var_2186 = this.var_431;
               if(this.sendReport())
               {
                  ++this.var_1242;
               }
            }
         }
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,this.var_1243,this.var_1568,this.var_2013,this.var_2016,this.var_1480,_loc4_,_loc3_,this.var_1241,this.var_431,this.var_1240);
            this._connection.send(_loc1_);
            this.var_1241 = 0;
            this.var_431 = 0;
            this.var_501 = 0;
            this.var_1240 = 0;
            return true;
         }
         return false;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
   }
}
