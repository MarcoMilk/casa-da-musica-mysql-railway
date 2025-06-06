const pool = require('../models/db');

// Página inicial - listar alunos
exports.listarAlunos =  async (req, res) => {
  try {
    const [alunos] = await pool.query('SELECT * FROM alunos');
    res.render('alunos', { alunos });
  } catch (err) {
    console.error(err);
    res.status(500).send('Erro ao listar alunos');

  }
};

// Inserir aluno
exports.inserirAluno = async (req, res) => {
  const {  nome, cpf_cnpj, telefone, email, data_nasc, idade, pcd, sexo, genero, cor, ativo, cpf_cnpj_resp, nome_resp, cep, endereco, numero, bairro, cidade, estado, complemento, obs } = req.body;
  const cepLimpo = cep.replace(/\D/g, ''); // Remove tudo que não for número
   try {
        await pool.query(`INSERT INTO alunos (nome, cpf_cnpj, telefone, email, data_nasc, idade, pcd, sexo, genero, cor, ativo, cpf_cnpj_resp, nome_resp, cep, endereco, numero, bairro, cidade, estado, complemento, obs) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
        [nome, cpf_cnpj, telefone, email, data_nasc, idade, pcd, sexo, genero, cor, ativo, cpf_cnpj_resp, nome_resp, cepLimpo, endereco, numero, bairro, cidade, estado, complemento, obs]);
        res.redirect('/alunos');
    } catch (err) {
        console.error(err);
        res.status(500).send('Erro ao inserir aluno');
    }  

};

// Atualizar aluno
exports.atualizarAluno =  async (req, res) => {
  const { idaluno } = req.params;
  const { nome, cpf_cnpj, telefone, email, data_nasc, idade, sexo, genero, cor, cpf_cnpj_resp, nome_resp, cep, endereco, numero, bairro, cidade, estado, complemento, obs } = req.body;
  const pcd = req.body['edit-pcd']; // O valor será "SIM" ou "NÃO"
  const ativo = req.body['edit-ativo']; // O valor será "SIM" ou "NÃO"
  const cepLimpo = cep.replace(/\D/g, ''); // Remove tudo que não for número
  try {

    await pool.query(`UPDATE alunos SET nome = ?, cpf_cnpj = ?, telefone = ?, email = ?, data_nasc = ?, idade = ?, pcd = ?, sexo = ?, genero = ?, cor = ?, ativo = ?, cpf_cnpj_resp = ?, nome_resp = ?, cep = ?, endereco = ?, numero = ?, bairro = ?, cidade = ?, estado = ?, complemento = ?, obs = ? WHERE idaluno = ?`,
    [nome, cpf_cnpj, telefone, email, data_nasc, idade, pcd, sexo, genero, cor, ativo, cpf_cnpj_resp, nome_resp, cepLimpo, endereco, numero, bairro, cidade, estado, complemento, obs, idaluno]);
    res.redirect('/alunos');

  } catch (err) {
    console.error(err);
    res.status(500).send('Erro ao atualizar aluno');
  }
};

// Excluir aluno
exports.excluirAluno = async (req, res) => {
  const { idaluno } = req.params; 

  try {
    await pool.query(`DELETE FROM alunos WHERE idaluno = ?`, [idaluno]);
    res.redirect('/alunos');
    
  } catch (err) {
    console.error(err);
    res.status(500).send('Erro ao excluir aluno');
  }
};
