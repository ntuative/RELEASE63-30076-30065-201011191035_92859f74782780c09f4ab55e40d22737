package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_845:BigInteger;
      
      private var var_2232:BigInteger;
      
      private var var_1814:BigInteger;
      
      private var var_2549:BigInteger;
      
      private var var_1380:BigInteger;
      
      private var var_1813:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1380 = param1;
         this.var_1813 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1380.toString() + ",generator: " + this.var_1813.toString() + ",secret: " + param1);
         this.var_845 = new BigInteger();
         this.var_845.fromRadix(param1,param2);
         this.var_2232 = this.var_1813.modPow(this.var_845,this.var_1380);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1814 = new BigInteger();
         this.var_1814.fromRadix(param1,param2);
         this.var_2549 = this.var_1814.modPow(this.var_845,this.var_1380);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2232.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2549.toRadix(param1);
      }
   }
}
