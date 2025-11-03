<?php
$conn = new mysqli("localhost", "root", "senaisp", "LOJA");
if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
}

$nome = $_GET['nome'];

//Preparar a declaração
$stmt = $conn->prepare("DELETE FROM PRODUTOS WHERE NOME = ?");
// vincular o parametro 'nome' como um interiro (i)
$stmt->bind_param("i", $nome);

// executar e verificar 
if ($stmt->execute()) {
    echo "Usuario deletado com sucesso.";
} else {
    echo "Erro ao deletar: " . $stmmt->error;
}
echo "<br><a href='listar2.php'>Voltar para a lista</a>";

$stmt->close();
$conn->close();
?>

