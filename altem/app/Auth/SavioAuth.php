<?php

namespace App\Auth;
use Illuminate\Auth\Authenticatable;
use App\Models\Usuario;
use DB;

class SavioAuth
{
    private $usuario;

    public function __construct()
    {
        $this->savioTokenURL = env('SAVIO_TOKEN_URL');
        $this->savioUserURL = env('SAVIO_USER_URL');
    }

    private function getSavioAccessToken($username, $password) {
        // encode password for special chars
        $u = strtoupper( $username );
        $p = rawurlencode( $password );

        $url = "$this->savioTokenURL?username=$u&password=$p&service=moodle_mobile_app";

        $authRequest = $this->file_get_contents_curl( $url );
        $savioResponse = json_decode($authRequest);

        // if the credentials are valid, we get the token, else, we get error
        if( !isset($savioResponse->token) ) {
            return false;
        }

        $this->token = $savioResponse->token;
        return $savioResponse->token;
    }

    private function file_get_contents_curl($url) {
        $ch = curl_init();
    
        curl_setopt($ch, CURLOPT_AUTOREFERER, TRUE);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_ENCODING, 0);
        curl_setopt($ch, CURLOPT_MAXREDIRS, 10);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST , "GET");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
        // dirty fix for SSL
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
    
        $data = curl_exec($ch);
        $info = curl_getinfo($ch);

        if(curl_errno($ch)) {
            logger('Curl error: ' . curl_error($ch));
        }
    
        curl_close($ch);
    
        if ($data === FALSE) {
            logger("curl_exec returned FALSE. Info follows:\n" . print_r($info, TRUE));
        }
    
        return $data;
    }


    public function getSavioUserData($codigo) {

        $usuario = Usuario::find($codigo);
        $token = $usuario->savio_token;

        $authRequest = $this->file_get_contents_curl("$this->savioUserURL?wstoken=$token&wsfunction=core_webservice_get_site_info&moodlewsrestformat=json");
        $savioResponse = json_decode($authRequest);

        // if the token is valid, we get the userid, else, we get error
        if( !isset($savioResponse->username) ) {
            dd($savioResponse->message);
            return;
        }

        $userData = $savioResponse;

        $this->usuario = new Usuario();

        $this->usuario->nombre = $userData->fullname;
        $this->usuario->codigo = $userData->username;
        $this->usuario->correo = "$userData->username@utbvirtual.edu.co";
        $this->usuario->id = $userData->username;

        return $this->usuario;
    }

    public function verificarUsuario($username, $password)
    {

        if (!$username or !$password) {
            dd('Datos de acceso faltantes.', 401);
            return false;
        }

        $token = SavioAuth::getSavioAccessToken($username, $password);

        if( !$token ) {
            return false;
        } else {
            /** We save the user's SAVIO token
             * in order to use it in the future
             * to retreive it's user data 
             * (Name, E-Mail, etc.) that
             * used to be on LDAP
             */
            DB::table('usuarios')
                    ->where('codigo', $username)
                    ->update(['savio_token' => $token]);

            $this->usuario = new Usuario();

            $this->usuario->codigo = $username;
            $this->usuario->password = $password;
            $this->usuario->id = $password;

            return true;
        }
    }

    public function verificarUsuarioById($codigoUtbId)
    {
        $userData = SavioAuth::getSavioUserData($codigoUtbId);
        return $userData;
    }

    public function getUsuario()
    {
        return $this->usuario;
    }


}