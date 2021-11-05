<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Entity\Contacto;
use Symfony\Component\HttpFoundation\JsonResponse;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     * @Template("AppBundle:Sitio:home.html.twig")
     */
    public function indexAction(Request $request)
    {
    	return array();
    }
    
    /**
     * @Template("AppBundle:Sitio:component_promociones.html.twig")
     */
    public function promocionesAction(Request $request) {
    
    	$promociones = $this->getDoctrine()->getRepository('AppBundle:Promocion')->find4Site(3);
    	return array('promociones'=>$promociones);
    	
    }
    
    /**
     * @Template("AppBundle:Sitio:component_galeria.html.twig")
     */
    public function galeriaAction(Request $request,$id) {
    	$galeria = $this->getDoctrine()->getRepository('AppBundle:Galeria')->find($id);
    	return array('galeria'=>$galeria);
    }

	/**
     * @Template("AppBundle:Sitio:component_galeria_general.html.twig")
     */
    public function galeriaGeneralAction(Request $request,$id) {
    	$galeria = $this->getDoctrine()->getRepository('AppBundle:Galeria')->find($id);
    	return array('galeria'=>$galeria);
    }
    
    /**
     * @Route("/contacto-ajax",name="contacto-ajax")
     *  @Template("AppBundle:Sitio:home.html.twig")
     */
    public function contactoAjaxAction(Request $request) {
    	$rta = array('ok'=>0,'error'=>0);
    	//$fuente_datos = $request->query; 
    	$fuente_datos = $request->request;
    	$nombre = $fuente_datos->get('nombre','');
    	//$telefono = $fuente_datos->get('telefono','');
    	$email = $fuente_datos->get('email','');
    	$mensaje = $fuente_datos->get('mensaje','');
    	/*$fecha_ingreso = $fuente_datos->get('fecha_ingreso','');
    	$fecha_salida = $fuente_datos->get('fecha_salida','');
    	$cantidad_adultos = $fuente_datos->get('cantidad_adultos','');
    	$cantidad_ninos = $fuente_datos->get('cantidad_ninos','');*/
    	/*try {
    		$fiDate = \DateTime::createFromFormat('d/m/Y',$fecha_ingreso);
    	} catch(\Excepcion $ex) {
    	}
    	try {
    		$fsDate = \DateTime::createFromFormat('d/m/Y',$fecha_salida);
    	} catch(\Excepcion $ex) {
    	}
    	if(!$fiDate) $fiDate = NULL;
    	if(!$fsDate) $fsDate = NULL;*/
    
    	$contacto = new Contacto();
    	$contacto->setNombre($nombre);
    	$contacto->setEmail($email);
    	//$contacto->setTelefono($telefono);
    	$contacto->setMensaje($mensaje);
    	$contacto->setFecha(new \DateTime());
    	//$contacto->setFechaIngreso($fiDate);
    	//$contacto->setFechaSalida($fsDate);
    	//$contacto->setCantidadAdultos($cantidad_adultos);
    	//$contacto->setCantidadNinos($cantidad_ninos);
    	$this->getDoctrine()->getManager()->persist($contacto);
    	$this->getDoctrine()->getManager()->flush();
    
    	try {
    		$asunto = $this->getParameter('asunto_contacto','Contacto desde el sitio');
    		$asunto = str_replace('_nombre_',$nombre,$asunto);
    		$from = $this->getParameter('contacto_from');
    		$to = $this->getParameter('contacto_to');
    		$body = $this->renderView('AppBundle:Sitio:email_contacto.html.twig',
    				array(
    						'nombre' => $nombre,
    						//'telefono' => $telefono,
    						'email' => $email,
    						'mensaje' => $mensaje,
    						//'fecha_ingreso' => $fiDate,
    						//'fecha_salida' => $fsDate,
    						//'cantidad_adultos' => $cantidad_adultos,
    						//'cantidad_ninos' => $cantidad_ninos
    				));

    		$email_reply_to = $email;
    		if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    			$email_reply_to = $from;
    		} 
    		$message = \Swift_Message::newInstance()
    		->setSubject($asunto)
    		->setFrom($from)
    		->setTo($to)
    		->setBody($body,'text/html')
		->setReplyTo($email_reply_to)
    		;
    			
    		$this->get('mailer')->send($message);
    		$rta['ok'] = true;
    			
    	} catch(\Exception $ex) {
    		$rta['error'] = true;
    		//throw $ex;
    		error_log("Imposible enviar email de contacto ".$ex->getMessage());
    	}
    	
    	return new JsonResponse($rta);
    }
}
