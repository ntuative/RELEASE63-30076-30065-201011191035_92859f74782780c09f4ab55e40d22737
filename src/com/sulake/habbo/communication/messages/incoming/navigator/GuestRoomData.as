package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_320:int;
      
      private var var_658:Boolean;
      
      private var var_905:String;
      
      private var _ownerName:String;
      
      private var var_2032:int;
      
      private var var_2131:int;
      
      private var var_2468:int;
      
      private var var_1397:String;
      
      private var var_2471:int;
      
      private var var_2429:Boolean;
      
      private var var_430:int;
      
      private var var_1267:int;
      
      private var var_2469:String;
      
      private var var_741:Array;
      
      private var var_2470:RoomThumbnailData;
      
      private var var_2034:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_741 = new Array();
         super();
         this.var_320 = param1.readInteger();
         this.var_658 = param1.readBoolean();
         this.var_905 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2032 = param1.readInteger();
         this.var_2131 = param1.readInteger();
         this.var_2468 = param1.readInteger();
         this.var_1397 = param1.readString();
         this.var_2471 = param1.readInteger();
         this.var_2429 = param1.readBoolean();
         this.var_430 = param1.readInteger();
         this.var_1267 = param1.readInteger();
         this.var_2469 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_741.push(_loc4_);
            _loc3_++;
         }
         this.var_2470 = new RoomThumbnailData(param1);
         this.var_2034 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_741 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_320;
      }
      
      public function get event() : Boolean
      {
         return this.var_658;
      }
      
      public function get roomName() : String
      {
         return this.var_905;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2032;
      }
      
      public function get userCount() : int
      {
         return this.var_2131;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2468;
      }
      
      public function get description() : String
      {
         return this.var_1397;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2471;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2429;
      }
      
      public function get score() : int
      {
         return this.var_430;
      }
      
      public function get categoryId() : int
      {
         return this.var_1267;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2469;
      }
      
      public function get tags() : Array
      {
         return this.var_741;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2470;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2034;
      }
   }
}
