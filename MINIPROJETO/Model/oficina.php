<?php

namespace mini_projeto;

class OrdemServico {
    private $codOS;
    private $status;
    private $observacao;
    private $dataAbertura;
    private $dataFechamento;
    private $nomecarro;

 public function __construct($status, $observacao, $dataAbertura, $dataFechamento, $nomecarro = null, $codOS = null) {
        $this->codOS = $codOS; 
        $this->status = $status;
        $this->observacao = $observacao;
        $this->dataAbertura = $dataAbertura;
        $this->dataFechamento = $dataFechamento;
        $this->nomecarro = $nomecarro;
    }

    // Getters'
    public function getCodOS() { return $this->codOS; }
    public function getStatus() { return $this->status; }
    public function getObservacao() { return $this->observacao; }
    public function getDataAbertura() { return $this->dataAbertura; }
    public function getDataFechamento() { return $this->dataFechamento; }
    public function getNomeCarro() { return $this->nomecarro; }

    public function setCodOS($codOS) { $this->codOS = $codOS; return $this; }
    public function setStatus($status) { $this->status = $status; return $this; }
    public function setObservacao($observacao) { $this->observacao = $observacao; return $this; }
    public function setDataAbertura($dataAbertura) { $this->dataAbertura = $dataAbertura; return $this; }
    public function setDataFechamento($dataFechamento) { $this->dataFechamento = $dataFechamento; return $this; }
    public function setNomeCarro($nomecarro) { $this->nomecarro = $nomecarro; return $this; }
}