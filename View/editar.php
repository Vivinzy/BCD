<?php 

namespace mini_projeto;

use mini_projeto\ProjetoController;

require_once __DIR__ . '\\..\\Controller\\projeto.php';

$controller = new ProjetoController();
$ordemServico = null;
$codOS = null;


if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['acao'] ?? '') === 'atualizar') {

    $codOS             = $_POST['codOS'] ?? null;
    $status            = $_POST['status'] ?? '';
    $observacao        = $_POST['observacao'] ?? '';
    $dataAbertura      = $_POST['dataAbertura'] ?? '';
    $dataFechamento    = $_POST['dataFechamento'] ?? '';
    $nomecarro         = $_POST['nomecarro'] ?? '';

    if ($codOS) {
        $controller->editar($codOS, $status, $observacao, $dataAbertura, $dataFechamento, $nomecarro);

        header('Location: index.php');
        exit();
    }
}


if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['acao'] ?? '') === 'buscar' && isset($_POST['codOS'])) {
    $codOS = $_POST['codOS'];
    $ordemServico = $controller->buscar($codOS);


    if (!$ordemServico) {

        header('Location: index.php');
        exit();
    }
} elseif (!$ordemServico) {
    header('Location: index.php');
    exit();
}

?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Editar Ordem de Serviço</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; padding: 20px; background-color: #f0f0f5; }
        h1 { color: #333; }
        form { background: #ffffff; padding: 25px; border-radius: 10px; max-width: 400px; margin: 20px 0; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
        
        input[type="text"], input[type="date"], textarea, select {
            width: 100%;
            padding: 12px;
            margin: 8px 0 16px 0;
            display: inline-block;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 16px;
        }
        textarea { resize: vertical; }

        label {
            display: block;
            margin-top: 5px;
            font-weight: bold;
            font-size: 14px;
            color: #555;
        }

        button[type="submit"] {
            padding: 10px 20px;
            background-color: #d1d9ffff; /* Cor primária */
            color: black;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
            margin-top: 10px;
        }
        button[type="submit"]:hover { background-color: #c0c8ffff; }

        a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>Editar Ordem de Serviço <?php echo htmlspecialchars((string) $ordemServico->getCodOS(), ENT_QUOTES, 'UTF-8'); ?></h1>

    <form method="POST">
        <input type="hidden" name="acao" value="atualizar"> 
        
        <input type="hidden" name="codOS" value="<?php echo htmlspecialchars((string) $ordemServico->getCodOS(), ENT_QUOTES, 'UTF-8'); ?>"> 

        <label for="nomecarro">Nome do Carro:</label>
       <textarea name="nomecarro" id="nomecarro" placeholder="Nome do Carro" maxlength="100"><?php echo htmlspecialchars((string) $ordemServico->getNomeCarro(), ENT_QUOTES, 'UTF-8'); ?></textarea>
        
        <label for="status">Status:</label>
        <select name="status" id="status" required>
            <?php $currentStatus = $ordemServico->getStatus(); ?>
            <option value="Aberta" <?php if ($currentStatus === 'Aberta') echo 'selected'; ?>>Aberta</option>
            <option value="Em Andamento" <?php if ($currentStatus === 'Em Andamento') echo 'selected'; ?>>Em Andamento</option>
            <option value="Concluida" <?php if ($currentStatus === 'Concluida') echo 'selected'; ?>>Concluída</option>
            <option value="Cancelada" <?php if ($currentStatus === 'Cancelada') echo 'selected'; ?>>Cancelada</option>
        </select>
        
        <label for="observacao">Observação:</label>
        <textarea name="observacao" id="observacao" placeholder="Detalhes sobre a OS (máx. 100 caracteres)" maxlength="100"><?php echo htmlspecialchars((string) $ordemServico->getObservacao(), ENT_QUOTES, 'UTF-8'); ?></textarea>
        
        <label for="dataAbertura">Data de Abertura:</label>
        <input type="date" name="dataAbertura" id="dataAbertura" value="<?php echo htmlspecialchars((string) $ordemServico->getDataAbertura(), ENT_QUOTES, 'UTF-8'); ?>" required>
        
        <label for="dataFechamento">Data de Fechamento (Opcional):</label>
        <input type="date" name="dataFechamento" id="dataFechamento" value="<?php echo htmlspecialchars((string) $ordemServico->getDataFechamento(), ENT_QUOTES, 'UTF-8'); ?>">
        

        <button type="submit">Salvar Alterações</button>
    </form>
    
    <p><a href="index.php">Voltar para a lista</a></p>
</body>
</html>