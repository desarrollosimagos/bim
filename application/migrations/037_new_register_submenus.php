<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_new_register_submenus extends CI_Migration
{
	public function up(){
		
		// Consultamos el id de la acción 'IMPORT_LB'
		$result = $this->db->where('name', 'IMPORT_LB');
        $result = $this->db->get('actions');
        
        if ($result->num_rows() > 0) {
		
			// Armamos los datos del nuevo submenú
			$datos = array(
				'name' => 'Import LB',
				'route' => 'import_lb',
				'menu_id' => 3,
				'action_id' => $result->result()[0]->id,
				'd_create' => date('Y-m-d H:i:s')
			);
			
			// Creamos el nuevo submenú si éste no existe en la tabla 'submenus'
			$result2 = $this->db->where('name', $datos['name']);
			$result2 = $this->db->get('submenus');
			if ($result2->num_rows() == 0) {
				$result2 = $this->db->insert("submenus", $datos);
				$id = $this->db->insert_id();
				return $id;
			}
			
		}
		
	}
	
	public function down(){
		
		// Eliminamos el registro de la acción 'IMPORT_LB'
		$result = $this->db->delete('submenus', array('name' => 'Import LB'));
		return $result;
		
	}
	
}
