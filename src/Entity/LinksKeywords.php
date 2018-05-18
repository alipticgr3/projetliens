<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\LinksKeywordsRepository")
 */
class LinksKeywords
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Links", inversedBy="linksKeywords")
     */
    private $link;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Keywords", inversedBy="linksKeywords")
     */
    private $keyword;

    public function __construct()
    {
        $this->link = new ArrayCollection();
        $this->keyword = new ArrayCollection();
    }

    public function getId()
    {
        return $this->id;
    }

    /**
     * @return Collection|Links[]
     */
    public function getLink(): Collection
    {
        return $this->link;
    }

    public function addLink(Links $link): self
    {
        if (!$this->link->contains($link)) {
            $this->link[] = $link;
        }

        return $this;
    }

    public function removeLink(Links $link): self
    {
        if ($this->link->contains($link)) {
            $this->link->removeElement($link);
        }

        return $this;
    }

    /**
     * @return Collection|Keywords[]
     */
    public function getKeyword(): Collection
    {
        return $this->keyword;
    }

    public function addKeyword(Keywords $keyword): self
    {
        if (!$this->keyword->contains($keyword)) {
            $this->keyword[] = $keyword;
        }

        return $this;
    }

    public function removeKeyword(Keywords $keyword): self
    {
        if ($this->keyword->contains($keyword)) {
            $this->keyword->removeElement($keyword);
        }

        return $this;
    }
}
