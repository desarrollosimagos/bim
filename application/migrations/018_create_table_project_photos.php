<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_create_table_project_photos extends CI_Migration
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
				"project_id" => array(
					"type" => "INT",
					"constraint" => 11
				),
				"photo" => array(
					"type" => "VARCHAR",
					"constraint" => 200
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
		
		$this->dbforge->add_key('project_id');  // Establecemos el project_id como key
		
		$this->dbforge->create_table('project_photos', TRUE);
		
	}
	
	public function down(){
		
		// Eliminamos la tabla 'project_photos'
		$this->dbforge->drop_table('project_photos', TRUE);
		
	}
	
}
