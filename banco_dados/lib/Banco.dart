import 'package:sqflite/sqflite.dart';
import 'Produto.dart';
import 'package:path/path.dart';
import 'Principal.dart';


class Banco{

  buscarBanco() async{
    final caminhoBanco = await  getDatabasesPath();
    final localBanco = join(caminhoBanco, "banco.db");

    var bancoDados = await openDatabase(
      localBanco,
      version: 1,
      onCreate: (banco, versiaoMaisRecente){
        String sql = "CREATE TABLE produtos(id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR,"
            "marca VARCHAR, preco REAL, validade VARCHAR)";
        banco.execute(sql);
      }
    );

    print("---> "+bancoDados.isOpen.toString());
    return bancoDados;
  }

  salvar(Produto p)async{

    Database banco = await buscarBanco();
    Map<String, dynamic> produto = {
      "nome": p.nome,
      "marca": p.marca,
      "preco": p.preco,
      "validade": p.validade
    };
    int id = await banco.insert("produtos", produto);

    print("Produto salvo com o ID: ${id}");

  }

  getProdutos() async{

    Database banco = await buscarBanco();
    // List produtos = await banco.rawQuery("SELECT * FROM produtos ORDER BY nome asc");
    List produtos = await banco.rawQuery(
        "SELECT * FROM produtos ORDER BY nome asc");
    for(var produto in produtos){
      print(produto["nome"]);
      print(produto["preco"]);
    }


    print(produtos.toString());

  }

  getProduto(int id) async {

    Database banco = await buscarBanco();
    List produto = await banco.query(
      "produtos",
      columns: ["id", "nome", "marca","preco", "validade"],
      where: "id=?",
      whereArgs: [id]
    );
    return produto[0];

  }

  apagarProduto(int id) async {

    Database banco = await buscarBanco();
    int linhasExcluidas = await banco.delete(
      "produtos",
      where: "id = ?",
      whereArgs: [id]
    );
    print("linhas excluídas:" + linhasExcluidas.toString());
  }

  alterarProduto(Produto p) async{

    Database banco = await buscarBanco();
    Map<String, dynamic> dadosDoProduto = {
      "nome": p.nome,
      "marca": p.marca,
      "preco": p.preco,
      "validade": p.validade,
    };
    int numeroMudancas = await banco.update(
      "produtos",
      dadosDoProduto,
      where: "id = ?",
      whereArgs: [p.id]
    );
    print("Quantidade de itens alterados:" + numeroMudancas.toString());

  }



}