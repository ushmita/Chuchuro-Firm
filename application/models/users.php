<?php

class Users extends CI_Model {
    public $user_id;
    public $username;
    public $password;

    public function insertDataUsers($phone_number){
        $query = $this->db->get_where('users', array('username' => $phone_number));
        if($query->num_rows() == 0){
            $data = array(
                'username' => $phone_number,
                'password' => 'password'
            );
            $this->db->insert('users', $data);
        }

        //get the user id
        return $this->getUserId($phone_number);
    }
    public function getUserId($username){
        $this->db->select('user_id');
        $query = $this->db->get_where('users', array('username' => $username));
        return $query->row()->user_id;
    }
}