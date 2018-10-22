<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_new_register_actions extends CI_Migration
{
	public function up(){
		
		// Armamos los datos de la nueva acción
		$datos = array(
			'name' => 'IMPORT_LB',
			'class' => 'CImport',
			'route' => 'import_lb',
			'assigned' => 0,
			'd_create' => date('Y-m-d')." ".date("H:i:s")
		);
		
		// Creamos la nueva acción si ésta no existe en la tabla 'actions'
		$result = $this->db->where('name', $datos['name']);
        $result = $this->db->get('actions');
        if ($result->num_rows() == 0) {
            $result = $this->db->insert("actions", $datos);
            $id = $this->db->insert_id();
            return $id;
        }
		
	}
	
	public function down(){
		
		// Eliminamos el registro de la acción 'IMPORT_LB'
		$result = $this->db->delete('actions', array('name' => 'IMPORT_LB'));
		return $result;
		
	}
	
}
