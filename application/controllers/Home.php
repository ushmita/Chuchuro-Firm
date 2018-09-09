<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller {
    //public $data;

    public function index(){
        $this->main();
    }

    public function main(){
        $this->load->library('pagination');
        $this->load->helper('url');
        $this->load->model('contacts');

        //get data to insert in the database
        $this->getData();

        $per_page = 3;

        $config['base_url'] = base_url('main');
        //$config['first_url'] = base_url('main/1');
        $config['per_page'] = $per_page;
        $config['total_rows'] = $this->contacts->countRows();

        $data['query'] = $this->contacts->paginationQuery($per_page, $this->uri->segment(2));

        $this->pagination->initialize($config);

        $this->load->view('main',$data);

    }

    public function getData(){
        $data = file_get_contents('http://www.mocky.io/v2/581335f71000004204abaf83');
        $obj = json_decode($data,true);
        foreach($obj as $contacts) {
            foreach($contacts as $value) {
                $name = $value['name'];
                $phone_number = $value['phone_number'];
                $address = $value['address'];

                $this->contacts->insertData($name, $phone_number, $address);
            }
        }
    }
}