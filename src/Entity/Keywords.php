<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\KeywordsRepository")
 */
class Keywords
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $name;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\LinksKeywords", mappedBy="keyword")
     */
    private $linksKeywords;

    public function __construct()
    {
        $this->linksKeywords = new ArrayCollection();
    }

    public function getId()
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection|LinksKeywords[]
     */
    public function getLinksKeywords(): Collection
    {
        return $this->linksKeywords;
    }

    public function addLinksKeyword(LinksKeywords $linksKeyword): self
    {
        if (!$this->linksKeywords->contains($linksKeyword)) {
            $this->linksKeywords[] = $linksKeyword;
            $linksKeyword->addKeyword($this);
        }

        return $this;
    }

    public function removeLinksKeyword(LinksKeywords $linksKeyword): self
    {
        if ($this->linksKeywords->contains($linksKeyword)) {
            $this->linksKeywords->removeElement($linksKeyword);
            $linksKeyword->removeKeyword($this);
        }

        return $this;
    }
}
