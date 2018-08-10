<?php
class LanguageLoader
{
    function initialize() {
        $ci =& get_instance();
		//~ $ci->session->sess_destroy();
        $ci->load->helper('language');
        $siteLang = $ci->session->userdata('site_lang');
        if ($siteLang) {
            $ci->lang->load('header',$siteLang);
            $ci->lang->load('login',$siteLang);
            $ci->lang->load('footer',$siteLang);
            $ci->lang->load('menus',$siteLang);
            $ci->lang->load('submenus',$siteLang);
            $ci->lang->load('summary',$siteLang);
            $ci->lang->load('transactions',$siteLang);
            $ci->lang->load('coins',$siteLang);
            $ci->lang->load('accounts',$siteLang);
            $ci->lang->load('projects',$siteLang);
            $ci->lang->load('profiles',$siteLang);
            $ci->lang->load('users',$siteLang);
            $ci->lang->load('associations',$siteLang);
            $ci->lang->load('investor_groups',$siteLang);
            $ci->lang->load('menus_module',$siteLang);
            $ci->lang->load('submenus_module',$siteLang);
            $ci->lang->load('actions',$siteLang);
            $ci->lang->load('change_passwd',$siteLang);
            $ci->lang->load('public_projects',$siteLang);
        } else {
            $ci->lang->load('header','english');
            $ci->lang->load('login','english');
            $ci->lang->load('footer','english');
            $ci->lang->load('menus','english');
            $ci->lang->load('submenus','english');
            $ci->lang->load('summary','english');
            $ci->lang->load('transactions','english');
            $ci->lang->load('coins','english');
            $ci->lang->load('accounts','english');
            $ci->lang->load('projects','english');
            $ci->lang->load('profiles','english');
            $ci->lang->load('users','english');
            $ci->lang->load('associations','english');
            $ci->lang->load('investor_groups','english');
            $ci->lang->load('menus_module','english');
            $ci->lang->load('submenus_module','english');
            $ci->lang->load('actions','english');
            $ci->lang->load('change_passwd','english');
            $ci->lang->load('public_projects','english');
        }
    }
}
