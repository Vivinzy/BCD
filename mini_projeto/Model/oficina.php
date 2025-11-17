<?php

namespace mini_projeto;

class OrdemServico {
    private $codOS;
    private $codCliente; 
    private $codVeiculo; 
    private $status;
    private $observacao;
    private $dataAbertura;
    private $dataFechamento;

    public function __construct(
        $status, 
        $observacao, 
        $dataAbertura, 
        $dataFechamento, 
        $codCliente,
        $codVeiculo,
        $codOS = null
    ) {
        $this->codOS = $codOS; 
        $this->codCliente = $codCliente;
        $this->codVeiculo = $codVeiculo;
        $this->status = $status;
        $this->observacao = $observacao;
        $this->dataAbertura = $dataAbertura;
        $this->dataFechamento = $dataFechamento;
    }

    // Getters
    public function getCodOS() { return $this->codOS; }
    public function getCodCliente() { return $this->codCliente; } 
    public function getCodVeiculo() {return $this->codVeiculo; }
    public function getStatus() { return $this->status; }
    public function getObservacao() { return $this->observacao; }
    public function getDataAbertura() {return $this->dataAbertura; }
    public function getDataFechamento() {return $this->dataFechamento;}


    // Setters
    public function setCodOS($codOS) { $this->codOS = $codOS; return $this; }
    public function setCodCliente($codCliente) { $this->codCliente = $codCliente; return $this; } 
    public function setCodVeiculo($codVeiculo) { $this->codVeiculo = $codVeiculo;}
    public function setStatus($status) { $this->status = $status; return $this; }
    public function setObservacao($observacao) { $this->observacao = $observacao; return $this; }
    public function setDataAbertura($dataAbertura) { $this->dataAbertura = $dataAbertura; return $this; }
    public function setDataFechamento($dataFechamento) { $this->dataFechamento = $dataFechamento; return $this; }
}
?>