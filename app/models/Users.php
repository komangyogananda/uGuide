<?php  

class Users extends \Phalcon\Mvc\Model {
   /**      
      *      
      * @var integer 
      * @Primary 
      * @Identity
      * @Column(type = "integer", length = 11, nullable = false)      
   */      

   public $id; 
   /**
      *
      * @var string
      * @Column(type = "string", length = 25, nullable = true)      
   */ 

   public $name; 
   /**
      *
      * @var string
      * @Column(type = "string", length = 50, nullable = true)
   */      

   public $emailid; 
   /**
      *
      * @var integer
      * @Column(type = "integer", length = 11, nullable = true)
   */      

   public $contactNumber; 
   /**
      * Returns table name mapped in the model.
      *
      * @return string
   */      

   public function getSource() {
      return 'users';
   }  
   /**
      * Allows to query a set of records that match the specified conditions
      *
      * @param mixed $parameters
      * @return Users[]
   */ 

   public static function find($parameters = null) { 
      return parent::find($parameters);
   }  
   /**
      * Allows to query the first record that match the specified conditions
      *
      * @param mixed $parameters
      * @return Users
   */   
   
   public static function findFirst($parameters = null) {
      return parent::findFirst($parameters);
   } 
}