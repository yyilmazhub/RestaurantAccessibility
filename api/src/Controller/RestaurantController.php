<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Validator\Validator\ValidatorInterface;

use Symfony\Component\Serializer\Exception\NotEncodableValueException;
use Symfony\Component\Serializer\Exception\NotNormalizableValueException;

use Doctrine\Persistence\ManagerRegistry;

use App\Entity\Restaurant;
use App\Entity\Tag;
use App\Entity\TagCategory;


use InfiniteIterator;

class RestaurantController extends AbstractController
{
  /**
   * @Route("/api/restaurants", name="restaurants_show", methods="GET")
   */
  public function index(ManagerRegistry $doctrine, SerializerInterface $serializer): Response
  {
    $repository = $doctrine->getRepository(Restaurant::class);
    try {
      $entries = $repository->findAll();
      
      $restaurants = array_map(function ($entries) {
        $tags = $entries->getTags()->toArray();

        usort($tags, function ($a, $b) {
          $aOrder = $a->getCategory()->getPosition() ? $a->getCategory()->getPosition() : 999;
          $bOrder = $b->getCategory()->getPosition() ? $b->getCategory()->getPosition() : 999;
          return $aOrder - $bOrder;
        });

        return [
            'id' => (string) $entries->getId(),  
            'name' => $entries->getName(),
            'link' => $entries->getLink(),
            'address' => $entries->getAddress(),
            'longitude' => $entries->getLongitude(),
            'latitude' => $entries->getLatitude(),
            'price' => $entries->getPrice(),
            'rate' => $entries->getRate(),
            'images' => $entries->getImages(),
            'tags' => array_map(function ($tags) {
                return [
                    'id' => $tags->getId(),
                    'name' => $tags->getName(),
                    'icon' => $tags->getIcone(),
                ];
            }, $tags)
        ];
      }, $entries);

      $json = $serializer->serialize($restaurants, 'json', [
        'datetime_format' => 'Y-m-d'
      ]);
      return new Response($json, Response::HTTP_OK, [
        'content-type' => 'application/json'
      ]);
    } catch (Throwable $e) {
      return $this->json([
        'errorType' => get_class($e),
        'message' => $e->getMessage()
      ], Response::HTTP_INTERNAL_SERVER_ERROR);
    }
  }

  /**
   * @Route("/api/tagsandcategories", name="tags_and_categories", methods="GET")
   */
  public function getTagsAndCategories(ManagerRegistry $doctrine, SerializerInterface $serializer): Response
  {
    $tagCategoryRepository = $doctrine->getRepository(TagCategory::class);
    $tagRepository = $doctrine->getRepository(Tag::class);

    try {
      $tagCategories = $tagCategoryRepository->findAll();
      $tags = $tagRepository->findAll();

      // for each category, add the tags to json
      $result = array_map(function($category) use ($tags) {
        $tagsForThisCategory = array_filter($tags, function($tag) use ($category) {
          return $tag->getCategory() === $category;
        });

        $tagsForThisCategory = array_map(function($tag) {
          return [
            'id' => $tag->getId(),
            'name' => $tag->getName(),
            'icon' => $tag->getIcone(),
            'image' => $tag->getImage()
          ];
        }, $tagsForThisCategory);

        return [
          'id' => $category->getId(),
          'name' => $category->getName(),
          'order' => $category->getPosition() ? $category->getPosition() : 999,
          'onHomepage' => $category->getOnHomepage(),
          'tags' => $tagsForThisCategory,
          'operation' => $category->getOperation() ? $category->getOperation() : 'and'
        ];
      }, $tagCategories);

      usort($result, function($a, $b) {
        return ($a['order'] - $b['order']);
      });
      
      $result = $serializer->serialize($result, 'json', [
        'datetime_format' => 'Y-m-d'
      ]);

      return new Response($result, Response::HTTP_OK, [
        'content-type' => 'application/json'
      ]);
    } catch (Throwable $e) {
      return $this->json([
        'errorType' => get_class($e),
        'message' => $e->getMessage()
      ], Response::HTTP_INTERNAL_SERVER_ERROR);
    }
  }
}
