<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends MY_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('user_model');
		$this->load->library('form_validation');
		$this->load->helper('form');
	}

	public function index()
	{
		$this->data['temp']='site/user/index.php';
		$this->load->view('site/layoutsub',$this->data);
	}
	public function register()
	{
		$message_success = $this->session->flashdata('message_success');
		$this->data['message_success'] = $message_success;

		$message_fail = $this->session->flashdata('message_fail');
		$this->data['message_fail'] = $message_fail;

		$this->form_validation->set_error_delimiters('<div class="alert alert-danger" role="alert" style="padding:5px;border-bottom:0px;">', '</div>');
		if ($this->input->post()) {
			$this->form_validation->set_rules('name','Fullname','required');
			$this->form_validation->set_rules('email', 'Email', 'required|valid_email|callback_check_email');
			$this->form_validation->set_rules('password','Password','required');
			$this->form_validation->set_rules('re_password','Repeat password','matches[password]');
			$this->form_validation->set_rules('address','Address','required');
			$this->form_validation->set_rules('phone','Phone','required');
			if ($this->form_validation->run()) {
				$password = $this->input->post('password');
				$data = array();
				$data = array(
					'name' => $this->input->post('name'),
					'email' => $this->input->post('email'),
					'password' => md5($password),
					'address' => $this->input->post('address'),
					'phone' => $this->input->post('phone'),
					'created' => date('Y-m-d H:i:s')
					);
				if ($this->user_model->create($data)) {
					$this->session->set_flashdata('message_success', 'Register successfully');
				}else{
					$this->session->set_flashdata('message_fail', 'Fail to register');
				}
				redirect(base_url('user/register'));
			}
		}
		$this->load->view('site/user/register',$this->data);
	}
	function check_email()
	{
		$email = $this->input->post('email');
		$where = array('email'=> $email);
		if ($this->user_model->check_exists($where))
		{
			$this->form_validation->set_message(__FUNCTION__,'User existed');
			return FALSE;
		}
		return TRUE;
	}
	public function login()
	{
		$this->form_validation->set_error_delimiters('<p class="text-center" style="padding:5px;border-bottom:0px;">', '</p>');
		$user = $this->session->userdata('user');
		if(isset($user)) {
			redirect(base_url());
		}
		$message_success = $this->session->flashdata('message_success');
		$this->data['message_success'] = $message_success;

		$message_fail = $this->session->flashdata('message_fail');
		$this->data['message_fail'] = $message_fail;
		if ($this->input->post()) {
			$this->form_validation->set_rules('email', 'Email', 'required|valid_email');
			$this->form_validation->set_rules('password', 'Password', 'required');
			$this->form_validation->set_rules('login', 'login', 'callback_check_login');
			if ($this->form_validation->run())
			{
				$user = $this->get_info_user();
				$this->session->set_userdata('user', $user);
				redirect(base_url('user/login'));
			}
		}
		$this->load->view('site/user/login',$this->data);
	}
	public function check_login()
	{
		$user = $this->get_info_user();
		if($user) {
			return true;
		}
		$this->form_validation->set_message(__FUNCTION__,'Wrong email or password');
		return false;
	}
	public function get_info_user()
	{
		$user = array();
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		$where = array ('email' => $email, 'password' => md5($password));
		$user = $this->user_model->get_info_rule($where);
		return $user;
	}
	public function logout()
	{
		if ($this->session->userdata('user')) {
			$this->session->unset_userdata('user');
		}
		redirect(base_url());
	}
}
