<?php

namespace App\Form;

use App\Entity\Links;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AddLinkType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('tagline')
            ->add('detail')
            ->add('url')
            ->add('image')
            //->add('datecreate')
            //->add('dateupdate')
            //->add('idcategory')
            //->add('iduser')
            //->add('linksKeywords')
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Links::class,
        ]);
    }
}
