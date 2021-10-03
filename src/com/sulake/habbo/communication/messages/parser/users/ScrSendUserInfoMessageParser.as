package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1750:int = 1;
      
      public static const const_1455:int = 2;
       
      
      private var var_771:String;
      
      private var var_1952:int;
      
      private var var_1946:int;
      
      private var var_1955:int;
      
      private var var_1950:int;
      
      private var var_1949:Boolean;
      
      private var var_1951:Boolean;
      
      private var var_1954:int;
      
      private var var_1947:int;
      
      private var var_1956:Boolean;
      
      private var var_1953:int;
      
      private var var_1948:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_771 = param1.readString();
         this.var_1952 = param1.readInteger();
         this.var_1946 = param1.readInteger();
         this.var_1955 = param1.readInteger();
         this.var_1950 = param1.readInteger();
         this.var_1949 = param1.readBoolean();
         this.var_1951 = param1.readBoolean();
         this.var_1954 = param1.readInteger();
         this.var_1947 = param1.readInteger();
         this.var_1956 = param1.readBoolean();
         this.var_1953 = param1.readInteger();
         this.var_1948 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_771;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_1952;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_1946;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_1955;
      }
      
      public function get responseType() : int
      {
         return this.var_1950;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_1949;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_1951;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_1954;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_1947;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_1956;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_1953;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_1948;
      }
   }
}
