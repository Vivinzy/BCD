<?php

namespace mini_projeto;

require_once 'oficina.php';

class OrdemServicoDAO {
    private $ordensArray = [];
    private $arquivoJson = 'Model/oficina.json'; 

    public function __construct() {
        $this->carregarArquivo();
    }

private function carregarArquivo() {
        if (file_exists($this->arquivoJson)) {
            $conteudoArquivo = file_get_contents($this->arquivoJson);
            $dadosArquivosEmArray = json_decode($conteudoArquivo, true);

            $this->ordensArray = []; 
            if (is_array($dadosArquivosEmArray)) {
                foreach ($dadosArquivosEmArray as $codOS => $info) {
                    $this->ordensArray[(int)$codOS] = new OrdemServico(
                        // --- MUDANÇA NECESSÁRIA AQUI (Ordem dos parâmetros) ---
                        $info['status'],       // 1. Status
                        $info['observacao'],   // 2. Observacao
                        $info['dataAbertura'], // 3. DataAbertura
                        $info['dataFechamento'], // 4. DataFechamento
                        $info['nomecarro'],     // 5. NomeCarro
                        (int)$info['codOS']    
                    );
                }
            }
        }
    }
   // ...
    private function salvarArquivo() {
        $dadosParaSalvar = [];
        foreach ($this->ordensArray AS $codOS => $os) {
            $dadosParaSalvar[$codOS] = [
                'codOS' => $os->getCodOS(),
                'status' => $os->getStatus(),
                'observacao' => $os->getObservacao(),
                'dataAbertura' => $os->getDataAbertura(),
                'dataFechamento' => $os->getDataFechamento(),
                'nomecarro' => $os->getNomeCarro()
            ];
        }

        $diretorio = dirname($this->arquivoJson);
        if (!is_dir($diretorio)) {
            if (!mkdir($diretorio, 0777, true)) {
                throw new \Exception("Falha ao criar o diretório: " . $diretorio);
            }
        }

        file_put_contents($this->arquivoJson, json_encode($dadosParaSalvar, JSON_PRETTY_PRINT));
    }
// ...

    // CREATE
    public function criarOrdemServico(OrdemServico $os) {
        // Gera um novo Cod_OS único e incrementável
        $codOSsExistentes = array_keys($this->ordensArray);
        $novoCodOS = count($codOSsExistentes) > 0 ? max($codOSsExistentes) + 1 : 1;
        
        $os->setCodOS($novoCodOS);
        $this->ordensArray[$novoCodOS] = $os;
        $this->salvarArquivo();
        return true;
    }

    // READ ALL
    public function lerOrdensServico() {
        return $this->ordensArray;
    }

    // READ ONE (Buscar)
    public function buscarOrdemServico($codOS) {
        return $this->ordensArray[(int)$codOS] ?? null;
    }

    // UPDATE
    public function editarOrdemServico($codOS, $status, $observacao, $dataAbertura, $dataFechamento, $nomecarro) {
        $codOS = (int)$codOS;
        if (isset($this->ordensArray[$codOS])) {
            $os = $this->ordensArray[$codOS];
            $os->setStatus($status)
               ->setObservacao($observacao)
               ->setDataAbertura($dataAbertura)
               ->setDataFechamento($dataFechamento)
               ->setNomeCarro($nomecarro);
               
            $this->salvarArquivo();
            return true;
        }
        return false;
    }

    // DELETE
    public function excluirOrdemServico($codOS) {
        $codOS = (int)$codOS;
        if (isset($this->ordensArray[$codOS])) {
            unset($this->ordensArray[$codOS]);
            $this->salvarArquivo();
            return true;
        }
        return false;
    }
}
?>