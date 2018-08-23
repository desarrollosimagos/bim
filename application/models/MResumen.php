<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class MResumen extends CI_Model {


    public function __construct() {
       
        parent::__construct();
        $this->load->database();
    }

    //Public method to obtain the transactions
    public function obtener() {
		
		// Almacenamos los ids de los inversores asociados al asesor más su id propio en un array
		$ids = array($this->session->userdata('logged_in')['id']);
		$this->db->where('adviser_id', $this->session->userdata('logged_in')['id']);
        $query_asesor_inversores = $this->db->get('user_relations');
        if ($query_asesor_inversores->num_rows() > 0) {
            foreach($query_asesor_inversores->result() as $relacion){
				$ids[] = $relacion->investor_id;
			}
		}
		
		$this->db->select('f_p.id, f_p.date, f_p.account_id, f_p.type, f_p.description, f_p.reference, f_p.observation, f_p.amount, f_p.status, u.username as usuario, u.name as user_name, c.owner, c.alias, c.number, cn.description as coin, cn.abbreviation as coin_avr, cn.symbol as coin_symbol, cn.decimals as coin_decimals');
		$this->db->from('transactions f_p');
		$this->db->join('users u', 'u.id = f_p.user_id', 'left');
		$this->db->join('accounts c', 'c.id = f_p.account_id');
		$this->db->join('coins cn', 'cn.id = c.coin_id');
		// Si el usuario corresponde al de un administrador o plataforma quitamos el filtro de usuarios
        if($this->session->userdata('logged_in')['profile_id'] != 1 && $this->session->userdata('logged_in')['profile_id'] != 2){
			$this->db->where_in('f_p.user_id', $ids);
		}
		$this->db->order_by("f_p.date", "desc");
        $query = $this->db->get();
        //~ $query = $this->db->get('transactions');

        if ($query->num_rows() > 0)
            return $query->result();
        else
            return $query->result();
            
    }

    // Public method to obtain the transactions by id
    public function capitalPendiente() {
		if($this->session->userdata('logged_in')['profile_id'] != 1 && $this->session->userdata('logged_in')['profile_id'] != 2){
			$this->db->select_sum('amount');
			$this->db->where('status', 'waiting');
			$this->db->where('user_id', $this->session->userdata('logged_in')['id']);
		}else{
			$this->db->select_sum('amount');
			$this->db->where('status', 'waiting');			
		}
        $query = $this->db->get('transactions');
        if ($query->num_rows() > 0)
            return $query->result();
        else
            return $query->result();
            
    }

    // Public method to obtain the transactions by id
    public function capitalDisponible() {
		if($this->session->userdata('logged_in')['profile_id'] != 1 && $this->session->userdata('logged_in')['profile_id'] != 2){
			$this->db->select_sum('amount');
			$this->db->where('status', 'approved');
			$this->db->where('user_id', $this->session->userdata('logged_in')['id']);
		}else{
			$this->db->select_sum('amount');
			$this->db->where('status', 'approved');			
		}
        $query = $this->db->get('transactions');
        if ($query->num_rows() > 0)
            return $query->result();
        else
            return $query->result();
            
    }

    // Public method to obtain the transactions by id
    public function capitalAprobado() {
		
		// Datos de moneda del usuario
		$iso_moneda_usu = $this->session->userdata('logged_in')['coin_iso'];
		
		$capitalAprobado = 0;
		
		$this->db->select('f_p.id, f_p.account_id, f_p.tipo, f_p.amount, f_p.status, cn.description as coin, cn.abbreviation as coin_avr, cn.symbol as coin_symbol');
		$this->db->from('transactions f_p');
		$this->db->join('accounts c', 'c.id = f_p.account_id');
		$this->db->join('coins cn', 'cn.id = c.coin_id');
		if($this->session->userdata('logged_in')['profile_id'] != 1 && $this->session->userdata('logged_in')['profile_id'] != 2){
			$this->db->where('f_p.status', 'approved');
			$this->db->where('f_p.user_id', $this->session->userdata('logged_in')['id']);
		}else{
			$this->db->where('f_p.status', 'approved');
		}
        $query = $this->db->get();
        
        foreach($query->result() as $result){
			if($result->tipo == 'deposit'){
				$capitalAprobado += $result->amount;
			}else{
				$capitalAprobado -= $result->amount;
			}
		}
		
        return $capitalAprobado;
            
    }

    // Public method to obtain the transactions by id
    public function fondos_json() {
		
		$capitalAprobado = 0;
		
		$select = 'u.name, u.alias, u.username, f_p.id, f_p.account_id, f_p.project_id, f_p.user_id, f_p.type, f_p.amount, f_p.real, f_p.rate, f_p.status, f_p.date, ';
		$select .= 'cn.description as coin, cn.abbreviation as coin_avr, cn.symbol as coin_symbol, cn.decimals as coin_decimals, pf.id as perfil_id, pf.name as perfil_name, pj.name as project_name, p_t.type as project_type';
		
		$this->db->select($select);
		$this->db->from('transactions f_p');
		$this->db->join('accounts c', 'c.id = f_p.account_id');
		$this->db->join('coins cn', 'cn.id = c.coin_id');
		$this->db->join('users u', 'u.id = f_p.user_id', 'left');
		$this->db->join('profile pf', 'pf.id = u.profile_id', 'left');
		$this->db->join('projects pj', 'pj.id = f_p.project_id', 'left');
		$this->db->join('project_types p_t', 'p_t.id = pj.type', 'left');
		//~ $this->db->where_in('cn.abbreviation', array('USD','BTC','VEF'));
        $query = $this->db->get();
        
        return $query->result();
            
    }
	
    // Public method to obtain the transactions by id
    public function fondos_json_users() {
		
		// Almacenamos los ids de los inversores asociados al asesor más su id propio en un array
		$ids = array($this->session->userdata('logged_in')['id']);
		$this->db->where('adviser_id', $this->session->userdata('logged_in')['id']);
        $query_asesor_inversores = $this->db->get('user_relations');
        if ($query_asesor_inversores->num_rows() > 0) {
            foreach($query_asesor_inversores->result() as $relacion){
				$ids[] = $relacion->investor_id;
			}
		}
		
		// Consulta a la tabla 'transactions'
		$select = 'u.name, u.alias, u.username, f_p.project_id, f_p.id, f_p.user_id, f_p.account_id, f_p.type, f_p.amount, f_p.status, f_p.date, ';
		$select .= 'cn.description as coin, cn.abbreviation as coin_avr, cn.symbol as coin_symbol';
		
		$this->db->select($select);
		$this->db->from('transactions f_p');
		$this->db->join('accounts c', 'c.id = f_p.account_id');
		$this->db->join('coins cn', 'cn.id = c.coin_id');
		$this->db->join('users u', 'u.id = f_p.user_id', 'left');
		if($this->session->userdata('logged_in')['profile_id'] != 1 && $this->session->userdata('logged_in')['profile_id'] != 2){
			$this->db->where_in('f_p.user_id', $ids);
		}
        $query = $this->db->get();
        
        // Consulta a la tabla 'project_transactions'
        $select2 = 'u.name, u.alias, u.username, p_t.id, p_t.user_id, p_t.account_id, p_t.type, p_t.amount, p_t.status, ';
		$select2 .= 'cn.description as coin, cn.abbreviation as coin_avr, cn.symbol as coin_symbol, p.name as name_p, p.description';
		
		$this->db->select($select2);
		$this->db->from('project_transactions p_t');
		$this->db->join('accounts c', 'c.id = p_t.account_id');
		$this->db->join('coins cn', 'cn.id = c.coin_id');
		$this->db->join('users u', 'u.id = p_t.user_id', 'left');
		$this->db->join('projects p', 'p.id = p_t.project_id');
		if($this->session->userdata('logged_in')['profile_id'] != 1 && $this->session->userdata('logged_in')['profile_id'] != 2){
			$this->db->where_in('p_t.user_id', $ids);
		}
        $query2 = $this->db->get();
        
        return array($query->result(), $query2->result());
            
    }
	
    // Public method to obtain the transactions by project
    public function fondos_json_projects() {
		
		$select = 'u.name, u.alias, u.username, f_p.id, f_p.project_id, f_p.user_id, f_p.account_id, f_p.type, f_p.amount, f_p.status, f_p.date, ';
		$select .= 'cn.description as coin, cn.abbreviation as coin_avr, cn.symbol as coin_symbol, p.name, p.description, p_t.type as project_type';
		
		$this->db->select($select);
		$this->db->from('transactions f_p');
		$this->db->join('accounts c', 'c.id = f_p.account_id');
		$this->db->join('coins cn', 'cn.id = c.coin_id');
		$this->db->join('users u', 'u.id = f_p.user_id', 'left');
		$this->db->join('projects p', 'p.id = f_p.project_id', 'left');
		$this->db->join('project_types p_t', 'p_t.id = p.type', 'left');
		if($this->session->userdata('logged_in')['profile_id'] != 1 && $this->session->userdata('logged_in')['profile_id'] != 2){
			$this->db->where('f_p.user_id', $this->session->userdata('logged_in')['id']);
		}
        $query = $this->db->get();
        
        return $query->result();
            
    }
	
    // Public method to obtain the transactions by project and order it by coin
    public function fondos_json_projects_coin($project_id) {
		
		$select = 'u.name, u.alias, u.username, f_p.id, f_p.project_id, f_p.user_id, f_p.account_id, f_p.type, SUM(f_p.amount) as amount, f_p.status, f_p.date, ';
		$select .= 'cn.description as coin, cn.abbreviation as coin_avr, cn.symbol as coin_symbol, p.name as project_name, p.description, p_t.type as project_type';
		
		$this->db->select($select);
		$this->db->from('transactions f_p');
		$this->db->join('accounts c', 'c.id = f_p.account_id');
		$this->db->join('coins cn', 'cn.id = c.coin_id');
		$this->db->join('users u', 'u.id = f_p.user_id', 'left');
		$this->db->join('projects p', 'p.id = f_p.project_id', 'left');
		$this->db->join('project_types p_t', 'p_t.id = p.type', 'left');
		$this->db->where('f_p.project_id', $project_id);
		$this->db->group_by('cn.description');
        $query = $this->db->get();
        
        return $query->result();
            
    }
	
    // Public method to obtain the transactions by project
    public function fondos_deposito() {
		
		$this->db->select('SUM(amount) as amount');
		$this->db->from('transactions f_p');
		$this->db->where('f_p.type', 'deposit');
		$this->db->where('f_p.project_id !=', 0);
		$this->db->where('f_p.status', 'approved');
        $query = $this->db->get();
        
        return $query->result();
            
    }

    // Public method to obtain the transactions by id
    public function obtenerFondoPersonal($id) {
		
        $this->db->where('id', $id);
        $query = $this->db->get('transactions');
        if ($query->num_rows() > 0)
            return $query->result();
        else
            return $query->result();
            
    }

    // Public method to update a record  
    public function update($datos) {
		
		$result = $this->db->where('id', $datos['id']);
		$result = $this->db->update('transactions', $datos);
		return $result;
        
    }


    // Public method to delete a record
     public function delete($id) {
		 
		$result = $this->db->delete('transactions', array('id' => $id));
		return $result;
       
    }
    

}
?>
