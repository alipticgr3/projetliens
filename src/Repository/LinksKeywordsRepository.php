<?php

namespace App\Repository;

use App\Entity\LinksKeywords;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method LinksKeywords|null find($id, $lockMode = null, $lockVersion = null)
 * @method LinksKeywords|null findOneBy(array $criteria, array $orderBy = null)
 * @method LinksKeywords[]    findAll()
 * @method LinksKeywords[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class LinksKeywordsRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, LinksKeywords::class);
    }

//    /**
//     * @return LinksKeywords[] Returns an array of LinksKeywords objects
//     */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('l')
            ->andWhere('l.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('l.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?LinksKeywords
    {
        return $this->createQueryBuilder('l')
            ->andWhere('l.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
