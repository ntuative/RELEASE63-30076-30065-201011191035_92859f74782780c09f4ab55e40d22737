package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_574:String;
      
      private var var_806:String;
      
      private var var_2199:String;
      
      private var var_1448:String;
      
      private var var_2201:int;
      
      private var var_2202:String;
      
      private var var_2200:int;
      
      private var var_2197:int;
      
      private var var_2198:int;
      
      private var _respectLeft:int;
      
      private var var_640:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_574 = param1.readString();
         this.var_806 = param1.readString();
         this.var_2199 = param1.readString();
         this.var_1448 = param1.readString();
         this.var_2201 = param1.readInteger();
         this.var_2202 = param1.readString();
         this.var_2200 = param1.readInteger();
         this.var_2197 = param1.readInteger();
         this.var_2198 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_640 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_574;
      }
      
      public function get sex() : String
      {
         return this.var_806;
      }
      
      public function get customData() : String
      {
         return this.var_2199;
      }
      
      public function get realName() : String
      {
         return this.var_1448;
      }
      
      public function get tickets() : int
      {
         return this.var_2201;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2202;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2200;
      }
      
      public function get directMail() : int
      {
         return this.var_2197;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2198;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_640;
      }
   }
}
