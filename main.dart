import 'dart:convert';

void main() async {
  String variavel_Nome = "gabriel";
  int valor = 2;
  bool VF = true;
  List<String> listaDepalabras = ["AAA", "BBB"];
  print(" ${listaDepalabras[0]} + ${listaDepalabras[1]} ");

  //null-safety
  // ! no final da variavel define que ela nao e null
  String? nome;
  nome = "gabr";
  // print(nome!);
  print(nome);

  // late serve pra que depois q for atribuida uma variavel ela nunca mais seja null
  late String sobrenome;
  sobrenome = "sato";
  print(sobrenome);
  //ERROR
  //sobrenome = null;

  bool sinal = false;
  if (sinal) {
    print("ANDAR");
  } else {
    print("PARAR");
  }

  // SWITCH
  int number = 3;
  switch (number) {
    case 0:
      print(0);
      break;
    case 1:
      print(1);
      break;
    case 2:
      print(2);
      break;
    default:
      print("default");
  }
  Celular celular1 = Celular("Azul", 2, 3, 3);
  Celular celular2 = Celular("red", 4, 6, 6);

  print(celular1.cor);
  print(celular2.tamanho);
  print(celular2.tostring());
  print(celular1.valorDoCelular(1000));

  Carro mercedes = Carro("mercedes");
  Carro gol = Carro("Gol");

  // Nao pode ser declarada aqui
  // gol.valordoCar = 200;

  Filho gabriel = Filho();
  gabriel.falar();

  Pagamento pagamento = PagarComBoleto();
  pagamento.pagar();

  pagamento = PagarComPix();
  pagamento.pagar();

  String name = "GABRIEL";
  //usado com MUITO com API e quando o valor valor nao e garantido que retornara usamos o Future
  Future<String> cepFuture = getCepByName("Rio de janeiro");
  late String cep;

  // PEgando o valor do Future<String>
  // cepFuture.then((result) => print(result));
  // print(cepFuture);

  // por demorar muito e nao conseguir acabar esse processo ocorre um ERRO
  //devido a isso devemos utilizar o async e o await
  // cepFuture.then((result) => cep = result);

  cep = await cepFuture;
  print(cep);

  // Json em dart
  Map<String, String> mapa = {"chave": "valor"};
  print(mapa["chave"]);

  String json = """
                  {
                      "usuario":"firstdevelop@email.com",
                      "senha": 12345,
                      "permissoes": [
                        "owner","admin"
                      ]
                  }
                """;
  print(json);
  Map resultJson = jsonDecode(json);
  print(resultJson["usuario"]);
  print(resultJson["permissoes"][0]);

  // Trandormando em JSON
  // Sempre tranformamos um Map em STring e uma String em Map

  Map map = {
    "nome": "gabriel",
    "pass": 123,
    "permission": ["onwer", "admin"]
  };

  var result = jsonEncode(map);
  print(result);

  //Callabe inteface
  BuscarAlunos buscarAlunos = BuscarAlunos();
  buscarAlunos();
}

class BuscarAlunos {
  void call() => print("GB,BB,BL");


}

Future<String> getCepByName(String name) {
  if (name == "Rio de janeiro") {
    return Future.value("Rio");
  }
  return Future.value("786976987tfvghm");
}

abstract class Pagamento {
  void pagar();
}

class PagarComBoleto implements Pagamento {
  void pagar() {
    print("Pagament com boleto");
  }
}

class PagarComPix implements Pagamento {
  void pagar() {
    print("Pagament com Pix");
  }
}

class Carro {
  final String modelo;
  String _segredo = "Muito dinheiro";

  // variavel privada definimos com _ antes da variavel
  // atribuindo uma variavel privada nao podemos definir ela em outro lugar
  int _valor = 1000;
  int get valordoCar => _valor;
  void setValue(int valor) => _valor = valor;

  Carro(this.modelo);
}

abstract class Pessoa {
  String comunicar();
}

class Pai {
  falar() {
    return "EAI MAN";
  }
}

// Filho herdara algo da classe depois do extends
class Filho extends Pai {}

// DEVE SEGUIR A CLASSE ABSTRATA POR IMPLEMENTAR PESSOA
// devido a isso precisa ter oque a classe implementada pede
class PessoaET implements Pessoa {
  String comunicar() {
    return "Hello";
  }
}

class PessoaNaoET implements Pessoa {
  String comunicar() {
    return "-------";
  }
}

class Celular {
  final String cor;
  final int qtpros;
  final double tamanho;
  final double peso;

  Celular(this.cor, this.qtpros, this.tamanho, this.peso);

  String tostring() {
    return 'C: $cor , P: $peso , Qt: $qtpros , T: $tamanho,';
  }

  int valorDoCelular(int valor) {
    return valor * qtpros;
  }
}
