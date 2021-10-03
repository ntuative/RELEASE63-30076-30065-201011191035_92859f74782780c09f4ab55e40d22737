package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1659:int;
      
      private var var_681:String;
      
      private var var_2499:int;
      
      private var var_2266:int;
      
      private var var_1658:int;
      
      private var var_2498:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1659 = param1.readInteger();
         this.var_681 = param1.readString();
         this.var_2499 = param1.readInteger();
         this.var_2266 = param1.readInteger();
         this.var_1658 = param1.readInteger();
         this.var_2498 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_681;
      }
      
      public function get level() : int
      {
         return this.var_1659;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2499;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2266;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1658;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2498;
      }
   }
}
