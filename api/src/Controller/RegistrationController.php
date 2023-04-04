<?php

namespace App\Controller;

use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class RegistrationController extends AbstractController
{
    /**
     * @Route("/api/register", name="app_register")
     */
    public function register(Request $request, UserPasswordEncoderInterface $userPasswordEncoder, EntityManagerInterface $entityManager): Response
    {
        $user = new User();

        $password = json_decode($request->getContent(), true)['password'];
        $email = json_decode($request->getContent(), true)['email'];

        $user
        ->setEmail($email)
        ->setPassword(
            $userPasswordEncoder->encodePassword(
                $user,
                $password
            )
        );

        $entityManager->persist($user);
        $entityManager->flush();

        return new Response('OK', Response::HTTP_OK);
    }
}
