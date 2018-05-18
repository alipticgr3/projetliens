<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\LinksRepository")
 */
class Links
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
     * @ORM\Column(type="string", length=255)
     */
    private $tagline;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $detail;

    /**
     * @ORM\Column(type="text")
     */
    private $url;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $image;

    /**
     * @ORM\Column(type="datetime")
     */
    private $datecreate;

    /**
     * @ORM\Column(type="datetime")
     */
    private $dateupdate;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Categories", inversedBy="links")
     */
    private $idcategory;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Users", inversedBy="links")
     */
    private $iduser;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\LinksKeywords", mappedBy="link")
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

    public function getTagline(): ?string
    {
        return $this->tagline;
    }

    public function setTagline(string $tagline): self
    {
        $this->tagline = $tagline;

        return $this;
    }

    public function getDetail(): ?string
    {
        return $this->detail;
    }

    public function setDetail(?string $detail): self
    {
        $this->detail = $detail;

        return $this;
    }

    public function getUrl(): ?string
    {
        return $this->url;
    }

    public function setUrl(string $url): self
    {
        $this->url = $url;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getDatecreate(): ?\DateTimeInterface
    {
        return $this->datecreate;
    }

    public function setDatecreate(\DateTimeInterface $datecreate): self
    {
        $this->datecreate = $datecreate;

        return $this;
    }

    public function getDateupdate(): ?\DateTimeInterface
    {
        return $this->dateupdate;
    }

    public function setDateupdate(\DateTimeInterface $dateupdate): self
    {
        $this->dateupdate = $dateupdate;

        return $this;
    }

    public function getIdcategory(): ?Categories
    {
        return $this->idcategory;
    }

    public function setIdcategory(?Categories $idcategory): self
    {
        $this->idcategory = $idcategory;

        return $this;
    }

    public function getIduser(): ?Users
    {
        return $this->iduser;
    }

    public function setIduser(?Users $iduser): self
    {
        $this->iduser = $iduser;

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
            $linksKeyword->addLink($this);
        }

        return $this;
    }

    public function removeLinksKeyword(LinksKeywords $linksKeyword): self
    {
        if ($this->linksKeywords->contains($linksKeyword)) {
            $this->linksKeywords->removeElement($linksKeyword);
            $linksKeyword->removeLink($this);
        }

        return $this;
    }
}
