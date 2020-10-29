import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  final String texto;
  final Color corTexto;
  final Color cor;
  final Function aoPressionar;
  final bool habilitar;
  final double largura;
  final Widget filho;

  Botao({
    Key key,
    @required this.texto,
    @required this.aoPressionar,
    this.habilitar,
    this.corTexto,
    this.largura,
    this.cor,
    this.filho,
  }) : super(key: key);

  @override
  _BotaoState createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: widget.largura ?? MediaQuery.of(context).size.width,
        height: 50.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                  color: widget.habilitar
                      ? Theme.of(context).primaryColor
                      : Colors.transparent)),
          onPressed: widget.habilitar == true
              ? () {
                  widget.aoPressionar();
                }
              : null,
          highlightColor: Colors.orangeAccent,
          color: widget.cor ?? Theme.of(context).primaryColor,
          textColor: widget.corTexto ?? Colors.white,
          splashColor: widget.cor ?? Theme.of(context).primaryColor,
          disabledColor: Color.fromRGBO(255, 155, 2, 0.3),
          disabledTextColor: Colors.white,
          child: widget.filho ?? Text(widget.texto),
        ));
  }
}

class Login extends StatefulWidget {
  Login({
    Key key,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _email = TextEditingController(text: "");
  var _senha = TextEditingController(text: "");
  final _key = GlobalKey<FormState>();
  bool _botaoPressionado = true;
  bool _verSenha = false;
  int aux = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'SISMAC',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF103a53)),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
                padding: EdgeInsets.fromLTRB(15.0, 170.0, 15.0, 0.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.only(top: 40, right: 20.0, left: 20.0),
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Form(
                                key: _key,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            prefixIcon:
                                                Icon(Icons.alternate_email),
                                            border: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 1.2),
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            labelText: "email",
                                            labelStyle: TextStyle(
                                                color: Colors.blueGrey[300],
                                                fontSize: 18),
                                          ),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                          controller: _email,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "insira seu email por favor!";
                                            } else if (!value.contains('@')) {
                                              return "digite um email válido!";
                                            }
                                          }),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: TextFormField(
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: !_verSenha,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.vpn_key),
                                            suffixIcon: IconButton(
                                                icon: _verSenha
                                                    ? Icon(Icons.visibility)
                                                    : Icon(
                                                        Icons.visibility_off),
                                                onPressed: () {
                                                  setState(() {
                                                    _verSenha = !_verSenha;
                                                  });
                                                }),
                                            border: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(width: 1.2),
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            labelText: "senha",
                                            labelStyle: TextStyle(
                                                color: Colors.blueGrey[300],
                                                fontSize: 18),
                                          ),
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                          controller: _senha,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "insira sua senha por favor!";
                                            }
                                          }),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Botao(
                            habilitar: _botaoPressionado,
                            texto: "Entrar",
                            aoPressionar: () {
                              setState(() {
                                _botaoPressionado = !_botaoPressionado;
                                if (_key.currentState.validate()) {
                                  Navigator.pushNamed(context, '/usuario');
                                }
                                _botaoPressionado = !_botaoPressionado;
                              });
                            }),
                      ),
                      Botao(
                          habilitar: true,
                          cor: Colors.white,
                          corTexto: Color(0xFF103a53),
                          texto: "Cadastrar",
                          aoPressionar: () {
                            setState(() {});
                          }),
                      FlatButton(
                          onPressed: null, child: Text("esqueci a senha"))
                    ]))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.help_outline,
          color: Color(0xFF103a53),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
