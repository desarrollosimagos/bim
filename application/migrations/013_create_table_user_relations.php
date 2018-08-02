<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_create_table_user_relations extends CI_Migration
{
	public function up(){
		
		// Creamos la estructura de la nueva tabla usando la clase dbforge de Codeigniter
		$this->dbforge->add_field(
			array(
				"id" => array(
					"type" => "INT",
					"constraint" => 11,
					"unsigned" => TRUE,
					"auto_increment" => TRUE,
					"null" => FALSE
				),
				"adviser_id" => array(
					"type" => "INT",
					"constraint" => 11
				),
				"investor_id" => array(
					"type" => "INT",
					"constraint" => 11
				),
				"d_create" => array(
					"type" => "TIMESTAMP",
					"null" => TRUE
				),
				"d_update" => array(
					"type" => "TIMESTAMP",
					"null" => TRUE
				)
			)
		);
		
		$this->dbforge->add_key('id', TRUE);  // Establecemos el id como primary_key
		
		$this->dbforge->add_key('adviser_id');  // Establecemos el adviser_id como key
		
		$this->dbforge->add_key('investor_id');  // Establecemos el investor_id como key
		
		$this->dbforge->create_table('user_relations', TRUE);
		
	}
	
	public function down(){
		
		// Eliminamos la tabla 'relate_users'
		$this->dbforge->drop_table('user_relations', TRUE);
		
	}
	
}
