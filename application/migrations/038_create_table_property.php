<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_create_table_property extends CI_Migration
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
				"reference" => array(
					"type" => "VARCHAR",
					"constraint" => 20,
					"null" => FALSE
				),
				"name" => array(
					"type" => "VARCHAR",
					"constraint" => 100,
					"null" => FALSE
				),
				"type" => array(
					"type" => "VARCHAR",
					"constraint" => 20,
					"null" => FALSE
				),
				"description" => array(
					"type" => "VARCHAR",
					"constraint" => 256,
					"null" => FALSE
				),
				"brand" => array(
					"type" => "VARCHAR",
					"constraint" => 50,
					"null" => FALSE
				),
				"responsible" => array(
					"type" => "VARCHAR",
					"constraint" => 50,
					"null" => FALSE
				),
				"departament" => array(
					"type" => "VARCHAR",
					"constraint" => 100,
					"null" => FALSE
				),
				"provider" => array(
					"type" => "VARCHAR",
					"constraint" => 50,
					"null" => FALSE
				),
				"buy_price" => array(
					"type" => "FLOAT",
					"null" => FALSE
				),
				"current_price" => array(
					"type" => "FLOAT",
					"null" => FALSE
				),
				"project_id" => array(
					"type" => "INT",
					"constraint" => 11,
					"null" => TRUE
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
		
		$this->dbforge->add_key('project_id');  // Establecemos la project_id como key
		
		$this->dbforge->create_table('property', TRUE);
		
	}
	
	public function down(){
		
		// Eliminamos la tabla 'property'
		$this->dbforge->drop_table('property', TRUE);
		
	}
	
}
