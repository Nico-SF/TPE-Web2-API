<?php
    class AuthApiHelper {
        static function verificarToken($token) {
            $secretKey = 'WEB-2';
        
            list($header, $payload, $signature) = explode('.', $token);
            $data = $header . '.' . $payload;
        
            $decodedSignature = base64_decode(str_replace(['-', '_'], ['+', '/'], $signature));
            $calculatedSignature = hash_hmac('sha256', $data, $secretKey, true);
        
            if (hash_equals($calculatedSignature, $decodedSignature)) {
                // Firma válida
                $payloadData = json_decode(base64_decode($payload));
                return $payloadData->usuario_id;
            } else {
                // Firma inválida.
                return false;
            }
        }
    }
?>