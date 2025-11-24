<?php

namespace mini_projeto;

require_once __DIR__ . '\\..\\Controller\\projeto.php';

$controller = new ProjetoController();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $acao = $_POST['acao'] ?? '';
    
    if ($acao === 'criar') {
        $controller->criar(
            $_POST['status'] ?? '',
            $_POST['observacao'] ?? '',
            $_POST['dataAbertura'] ?? '',
            $_POST['dataFechamento'] ?? '',
            $_POST['nomecarro'] ?? ''
        );
    } elseif ($acao === 'deletar') {
        $controller->deletar($_POST['codOS'] ?? null);
    }
}

$ordensServico = $controller->Ler();
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciamento de Ordens de Serviço</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; padding: 20px; background-color: #f0f0f5; }
        h1, h2 { color: #333; }
        /* Formulário de Cadastro */
        form { background-color: #ffffff; padding: 25px; border-radius: 10px; max-width: 600px; margin: 20px 0; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
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
        button[type="submit"].criar {
            background-color: #d1d9ffff; /* Cor primária */
            color: #333;
            height: 45px; 
            padding: 0 25px;
            border: none; 
            border-radius: 6px; 
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
            margin-top: 10px;
        }
        button[type="submit"].criar:hover { background-color: #c0c8ffff; }

        /* Tabela */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 15px 20px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        th {
            background-color: #d1d9ffff; /* Cor do cabeçalho */
            color: #333;
            text-transform: uppercase;
            font-size: 14px;
        }
        tr:nth-child(even) { background-color: #f9f9f9; }
        
        /* Botões de Ações */
        .form-acao {
            display: inline-block !important; 
            margin: 0 5px 0 0;
        }
        button[type="submit"] {
            padding: 8px 15px; 
            border: none; 
            border-radius: 4px; 
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
            color: black;
        }

        /* Botão Excluir */
        .btn-deletar { background-color: #ffb3b3; }
        .btn-deletar:hover { background-color: #ff9999; }

        /* Botão Editar */
        .btn-editar { background-color: #b3d1ff; }
        .btn-editar:hover { background-color: #99c3ff; }
    </style>
</head>
<body>
    <h1>Lançamento de Ordem de Serviço</h1>
    <form method="POST">
        <input type="hidden" name="acao" value="criar">

        <label for="nomecarro">Nome do Carro:</label>
        <input type="text" name="nomecarro" id="nomecarro" required>   
    
        
        <label for="status">Status:</label>
        <select name="status" id="status" required>
            <option value="Aberta">Aberta</option>
            <option value="Em Andamento">Em Andamento</option>
            <option value="Concluida">Concluída</option>
            <option value="Cancelada">Cancelada</option>
        </select>
        
        <label for="observacao">Observação:</label>
        <textarea name="observacao" id="observacao" placeholder="Detalhes sobre a OS (máx. 100 caracteres)" maxlength="100"></textarea>
        
        <label for="dataAbertura">Data de Abertura:</label>
        <input type="date" name="dataAbertura" id="dataAbertura" value="<?php echo date('Y-m-d'); ?>" required>
        
        <label for="dataFechamento">Data de Fechamento (Opcional):</label>
        <input type="date" name="dataFechamento" id="dataFechamento">
        
        <button type="submit" class="criar">Cadastrar Ordem de Serviço</button>
    </form>

    <hr>

    <h2>Ordens de Serviço Registradas</h2>
    <table>
        <thead>
            <tr>
                <th>Cód. OS</th>
                <th>Status</th>
                <th>Observação</th>
                <th>Data Abertura</th>
                <th>Data Fechamento</th>
                <th>Nome do Carro</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <?php 
            $listaOS = is_array($ordensServico) ? $ordensServico : [];
            foreach ($listaOS as $os): 
            ?>
            <tr>
                <td><?php echo htmlspecialchars((string) $os->getCodOS(), ENT_QUOTES, 'UTF-8'); ?></td>
                <td><?php echo htmlspecialchars((string) $os->getStatus(), ENT_QUOTES, 'UTF-8'); ?></td>
                <td><?php echo htmlspecialchars((string) $os->getObservacao(), ENT_QUOTES, 'UTF-8'); ?></td>
                <td><?php echo htmlspecialchars((string) $os->getDataAbertura(), ENT_QUOTES, 'UTF-8'); ?></td>
                <td><?php echo htmlspecialchars((string) $os->getDataFechamento(), ENT_QUOTES, 'UTF-8'); ?></td>
                <td><?php echo htmlspecialchars((string) $os->getNomeCarro(), ENT_QUOTES, 'UTF-8'); ?></td>
                
                <td>
                    <form method="POST" class="form-acao">
                        <input type="hidden" name="acao" value="deletar">
                        <input type="hidden" name="codOS" value="<?php echo htmlspecialchars((string) $os->getCodOS(), ENT_QUOTES, 'UTF-8'); ?>">
                        <button type="submit" class="btn-deletar" onclick="return confirm('Confirma exclusão desta OS?');">Excluir</button>
                    </form>
                    
                    <form method="POST" class="form-acao" action="editar.php">
                        <input type="hidden" name="acao" value="buscar"> 
                        <input type="hidden" name="codOS" value="<?php echo htmlspecialchars((string) $os->getCodOS(), ENT_QUOTES, 'UTF-8'); ?>">
                        <button type="submit" class="btn-editar">Editar</button>
                    </form>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>

