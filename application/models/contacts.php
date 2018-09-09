<?php

class Contacts extends CI_Model {
    public $contact_id;
    public $name;
    public $phone_number;
    public $address;
    public $user_id;

    public function insertData($name, $phone_number, $address){
        //to insert data in users table and get the foreign key
        $this->load->model('users');
        $user_id = $this->users->insertDataUsers($phone_number);

        //to insert data in the contacts table
        if($this->checkDatabase($phone_number)){
            $data = array(
                'name' => $name,
                'phone_number' => $phone_number,
                'address' => $address,
                'user_id' => $user_id
            );

            $this->db->insert('contacts', $data);
        }
    }

    //to check the database if the data already exists or not
    public function checkDatabase($phone_number){
        $query = $this->db->get_where('contacts', array('phone_number' => $phone_number));
        if($query->num_rows() == 0)
            return true;
        else
            return false;
    }

    //query for pagination
    public function paginationQuery($limit, $offset){
        $query = $this->db->get('contacts',$limit, $offset);
        return $query->result();
    }

    //get the total number of rows in contacts table for pafination
    public function countRows(){
        $query = $this->db->get('contacts');
        return $query->num_rows();
    }
}